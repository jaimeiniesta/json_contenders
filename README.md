# JSON - Avro - Thrift - Protobuf - MessagePack Benchmark

## Installation

`brew install protobuf thrift && bundle install`

## Running the Benchmark

`bundle exec ruby benchmark.rb`

## Results

Run in a MacBook Pro 3,3 GHz Interl Core i/, 16 Gb RAM, ruby 2.4.0:

```
Running single report...

AVRO TURF: 0.001045 seconds
AVRO TURF MESSAGING: 0.781019 seconds
THRIFT SERIALIZER: 0.000403 seconds
JSON: 5.4e-05 seconds
PROTOBUF: 0.000203 seconds
MESSAGEPACK: 9.3e-05 seconds

AVRO TURF: 0.000477 seconds
AVRO TURF MESSAGING: 0.000373 seconds
THRIFT SERIALIZER: 0.000233 seconds
JSON: 4.9e-05 seconds
PROTOBUF: 0.000105 seconds
MESSAGEPACK: 2.3e-05 seconds

AVRO TURF: 0.000401 seconds
AVRO TURF MESSAGING: 0.000515 seconds
THRIFT SERIALIZER: 0.000313 seconds
JSON: 6.6e-05 seconds
PROTOBUF: 0.000105 seconds
MESSAGEPACK: 4.0e-05 seconds

AVRO TURF: 0.000455 seconds
AVRO TURF MESSAGING: 0.000393 seconds
THRIFT SERIALIZER: 0.000343 seconds
JSON: 3.9e-05 seconds
PROTOBUF: 0.000116 seconds
MESSAGEPACK: 5.5e-05 seconds

AVRO TURF: 0.000404 seconds
AVRO TURF MESSAGING: 0.000448 seconds
THRIFT SERIALIZER: 0.000287 seconds
JSON: 5.2e-05 seconds
PROTOBUF: 0.000122 seconds
MESSAGEPACK: 2.4e-05 seconds


Running multiple report...

Rehearsal ---------------------------------------------------------
avro turf:             12.120000   0.040000  12.160000 ( 12.210709)
avro turf messaging:   12.590000   0.050000  12.640000 ( 12.696688)
thrift serializer:      6.900000   0.020000   6.920000 (  6.956309)
json:                   1.130000   0.010000   1.140000 (  1.148837)
protobuf:               1.400000   0.010000   1.410000 (  1.406455)
messagepack:            0.510000   0.000000   0.510000 (  0.517526)
----------------------------------------------- total: 34.780000sec

                            user     system      total        real
avro turf:             12.110000   0.050000  12.160000 ( 12.216747)
avro turf messaging:   12.700000   0.050000  12.750000 ( 12.829448)
thrift serializer:      6.890000   0.020000   6.910000 (  6.954681)
json:                   1.130000   0.010000   1.140000 (  1.148290)
protobuf:               1.400000   0.010000   1.410000 (  1.418337)
messagepack:            0.510000   0.000000   0.510000 (  0.520540)
```
