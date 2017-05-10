require "benchmark"
require "avro_turf"
require "avro_turf/messaging"
require "msgpack"
require "google/protobuf"
require "./proto/order_pb.rb"

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
  attr_reader :avro, :avro_messaging

  def initialize(avro:, avro_messaging:)
    @avro           = avro
    @avro_messaging = avro_messaging
  end

  def single_report
    puts "\n\nRunning single report...\n"

    5.times do
      order = RandomOrder.new

      # AVRO TURF
      start = Time.now
      avro.encode(order.attributes, schema_name: "order")
      finish = Time.now
      puts "AVRO TURF: #{finish - start} seconds"

      # AVRO TURF MESSAGING
      start = Time.now
      avro_messaging.encode(order.attributes, schema_name: "order")
      finish = Time.now
      puts "AVRO TURF MESSAGING: #{finish - start} seconds"

      # JSON
      start = Time.now
      order.attributes.to_json
      finish = Time.now
      puts "JSON: #{finish - start} seconds"

      # PROTOBUF
      start = Time.now
      ProtoOrder.encode(ProtoOrder.new(order.symbol_attributes))
      finish = Time.now
      puts "PROTOBUF: #{finish - start} seconds"

      # MESSAGEPACK
      start = Time.now
      MessagePack.pack(order.attributes)
      finish = Time.now
      puts "MESSAGEPACK: #{finish - start} seconds\n\n"
    end
  end

  def multiple_report
    puts "\n\nRunning multiple report...\n"

    n = 100_000

    Benchmark.bmbm do |x|
      x.report("avro turf: ") { n.times { avro.encode(RandomOrder.new.attributes, schema_name: "order") } }
      x.report("avro turf messaging: ") { n.times { avro_messaging.encode(RandomOrder.new.attributes, schema_name: "order") } }
      x.report("json: ") { n.times { RandomOrder.new.attributes.to_json } }
      x.report("protobuf: ") { n.times { ProtoOrder.encode(ProtoOrder.new(RandomOrder.new.symbol_attributes)) } }
      x.report("messagepack: ") { n.times { MessagePack.pack(RandomOrder.new.attributes) } }
    end
  end
end

bench = Benchmarker.new(avro: AvroTurf.new(schemas_path: "./avro_schemas/"),
                        avro_messaging: AvroTurf::Messaging.new(registry_url: "https://jaimeiniesta:avro@avro-schema-registry.salsify.com/",
                                                                schemas_path: "./avro_schemas/"))

bench.single_report
bench.multiple_report
