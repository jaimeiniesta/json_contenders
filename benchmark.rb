require "benchmark"
require "avro_turf"
require "google/protobuf"
require "./proto/order_pb.rb"

class RandomOrder
  def attributes
    {
     a: rand(10_000),
     b: rand(10_000),
     c: rand(10_000),
     d: rand(10_000),
     e: rand(10_000),
     f: rand(10_000),
     g: rand(10_000),
     h: rand(10_000),
     i: rand(10_000),
     j: rand(10_000),
     k: rand(10_000),
     l: rand(10_000),
     m: rand(10_000),
     n: rand(10_000),
     o: rand(10_000).to_s
    }
  end
end

class Benchmarker
  def single_report
    puts "\n\nRunning single report...\n"

    5.times do
      order = RandomOrder.new

      start = Time.now
      avro.encode(order.attributes, schema_name: "order")
      finish = Time.now
      puts "AVRO: #{finish - start} seconds"

      start = Time.now
      order.attributes.to_json
      finish = Time.now
      puts "JSON: #{finish - start} seconds"

      start = Time.now
      ProtoOrder.encode(ProtoOrder.new(order.attributes))
      finish = Time.now
      puts "PROTOBUF: #{finish - start} seconds\n\n"
    end
  end

  def multiple_report
    puts "\n\nRunning multiple report...\n"

    n = 100_000

    Benchmark.bmbm do |x|
      x.report("avro: ") { n.times { avro.encode(RandomOrder.new.attributes, schema_name: "order") } }
      x.report("json: ") { n.times { RandomOrder.new.attributes.to_json } }
      x.report("protobuf: ") { n.times { ProtoOrder.encode(ProtoOrder.new(RandomOrder.new.attributes)) } }
    end
  end

  private

  def avro
    @avro ||= AvroTurf.new(schemas_path: "./avro_schemas/")
  end
end

Benchmarker.new.single_report
Benchmarker.new.multiple_report
