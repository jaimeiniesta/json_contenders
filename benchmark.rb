require "benchmark"
require "avro_turf"
require "avro_turf/messaging"
require "msgpack"
require "google/protobuf"
require "./proto/order_pb.rb"
require "./thrift/order.rb"
require "./sparsam/gen-ruby/order_constants.rb"

class RandomOrder
  def attributes
    {
     "a" => rand(10_000),
     "b" => rand(10_000),
     "c" => rand(10_000),
     "d" => rand(10_000),
     "e" => rand(10_000),
     "f" => rand(10_000),
     "g" => rand(10_000),
     "h" => rand(10_000),
     "i" => rand(10_000),
     "j" => rand(10_000),
     "k" => rand(10_000),
     "l" => rand(10_000),
     "m" => rand(10_000),
     "n" => rand(10_000),
     "o" => rand(10_000).to_s
   }
  end

  # Protobuf requires symbol keys for the attributes
  def symbol_attributes
    attributes.map {|k, v| [k.to_sym, v]}.to_h
  end
end

class Benchmarker
  attr_reader :avro, :avro_messaging, :thrift_serializer

  def initialize(avro:, avro_messaging:, thrift_serializer:)
    @avro                       = avro
    @avro_messaging             = avro_messaging
    @thrift_serializer          = thrift_serializer
  end

  def single_report
    puts "\n\nRunning single report...\n"

    5.times do
      order = RandomOrder.new

      # AVRO TURF MESSAGING
      start = Time.now
      avro_messaging.encode(order.attributes, schema_name: "order")
      finish = Time.now
      puts "AVRO TURF MESSAGING: #{finish - start} seconds"

      # AVRO TURF
      start = Time.now
      avro.encode(order.attributes, schema_name: "order")
      finish = Time.now
      puts "AVRO TURF: #{finish - start} seconds"

      # THRIFT
      start = Time.now
      thrift_serializer.serialize(Thrift::Order.new(order.symbol_attributes))
      finish = Time.now
      puts "THRIFT SERIALIZER: #{finish - start} seconds"

      # SPARSAM COMPACT
      start = Time.now
      Sparsam::Order.new(order.symbol_attributes).serialize(Sparsam::CompactProtocol)
      finish = Time.now
      puts "SPARSAM COMPACT SERIALIZER: #{finish - start} seconds"

      # SPARSAM BINARY
      start = Time.now
      Sparsam::Order.new(order.symbol_attributes).serialize(Sparsam::BinaryProtocol)
      finish = Time.now
      puts "SPARSAM BINARY SERIALIZER: #{finish - start} seconds"

      # PROTOBUF
      start = Time.now
      ProtoOrder.encode(ProtoOrder.new(order.symbol_attributes))
      finish = Time.now
      puts "PROTOBUF: #{finish - start} seconds"

      # JSON
      start = Time.now
      order.attributes.to_json
      finish = Time.now
      puts "JSON: #{finish - start} seconds"

      # MESSAGEPACK
      start = Time.now
      MessagePack.pack(order.attributes)
      finish = Time.now
      puts "MESSAGEPACK: #{finish - start} seconds\n\n"
    end
  end

  def multiple_report
    n = 100_000

    puts "\n\nRunning multiple report (#{n} times each)...\n"

    Benchmark.bmbm do |x|
      x.report("avro turf messaging: ") { n.times { avro_messaging.encode(RandomOrder.new.attributes, schema_name: "order") } }
      x.report("avro turf: ") { n.times { avro.encode(RandomOrder.new.attributes, schema_name: "order") } }
      x.report("thrift serializer: ") { n.times { thrift_serializer.serialize(Thrift::Order.new(RandomOrder.new.symbol_attributes)) } }
      x.report("sparsam compact serializer: ") { n.times { Sparsam::Order.new(RandomOrder.new.symbol_attributes).serialize(Sparsam::CompactProtocol) } }
      x.report("sparsam binary serializer: ") { n.times { Sparsam::Order.new(RandomOrder.new.symbol_attributes).serialize(Sparsam::BinaryProtocol) } }
      x.report("protobuf: ") { n.times { ProtoOrder.encode(ProtoOrder.new(RandomOrder.new.symbol_attributes)) } }
      x.report("json: ") { n.times { RandomOrder.new.attributes.to_json } }
      x.report("messagepack: ") { n.times { MessagePack.pack(RandomOrder.new.attributes) } }
    end
  end
end

bench = Benchmarker.new(avro: AvroTurf.new(schemas_path: "./avro_schemas/"),
                        avro_messaging: AvroTurf::Messaging.new(registry_url: "https://jaimeiniesta:avro@avro-schema-registry.salsify.com/",
                                                                schemas_path: "./avro_schemas/"),
                        thrift_serializer: Thrift::Serializer.new)

bench.single_report
bench.multiple_report
