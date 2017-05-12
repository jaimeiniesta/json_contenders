# JSON - Avro - Thrift - Protobuf - MessagePack Benchmark

## Installation

`brew install protobuf thrift && bundle install`

## Running the Benchmark

`bundle exec ruby benchmark.rb`

## Results

Run in a MacBook Pro 3,3 GHz Interl Core i/, 16 Gb RAM, ruby 2.4.0:

```
Running single report...

AVRO TURF MESSAGING: 0.720352 seconds
AVRO TURF: 0.000876 seconds
THRIFT SERIALIZER: 0.000419 seconds
PROTOBUF: 0.000183 seconds
JSON: 5.6e-05 seconds
MESSAGEPACK: 8.8e-05 seconds

AVRO TURF MESSAGING: 0.000446 seconds
AVRO TURF: 0.000365 seconds
THRIFT SERIALIZER: 0.000233 seconds
PROTOBUF: 4.6e-05 seconds
JSON: 3.6e-05 seconds
MESSAGEPACK: 1.4e-05 seconds

AVRO TURF MESSAGING: 0.000416 seconds
AVRO TURF: 0.000338 seconds
THRIFT SERIALIZER: 0.000224 seconds
PROTOBUF: 5.2e-05 seconds
JSON: 3.3e-05 seconds
MESSAGEPACK: 1.6e-05 seconds

AVRO TURF MESSAGING: 0.00029 seconds
AVRO TURF: 0.000287 seconds
THRIFT SERIALIZER: 0.000221 seconds
PROTOBUF: 3.3e-05 seconds
JSON: 7.1e-05 seconds
MESSAGEPACK: 1.4e-05 seconds

AVRO TURF MESSAGING: 0.000265 seconds
AVRO TURF: 0.000359 seconds
THRIFT SERIALIZER: 0.000353 seconds
PROTOBUF: 7.6e-05 seconds
JSON: 2.5e-05 seconds
MESSAGEPACK: 1.6e-05 seconds


Running multiple report...

Rehearsal ---------------------------------------------------------
avro turf messaging:   13.600000   0.050000  13.650000 ( 14.455181)
avro turf:             13.440000   0.060000  13.500000 ( 14.087168)
thrift serializer:      7.570000   0.020000   7.590000 (  7.908396)
protobuf:               1.480000   0.010000   1.490000 (  1.560216)
json:                   1.200000   0.000000   1.200000 (  1.259629)
messagepack:            0.580000   0.010000   0.590000 (  0.592200)
----------------------------------------------- total: 38.020000sec

                            user     system      total        real
avro turf messaging:   13.770000   0.050000  13.820000 ( 14.285201)
avro turf:             13.470000   0.050000  13.520000 ( 14.118316)
thrift serializer:      7.600000   0.020000   7.620000 (  7.980700)
protobuf:               1.470000   0.010000   1.480000 (  1.569603)
json:                   1.210000   0.010000   1.220000 (  1.276330)
messagepack:            0.530000   0.010000   0.540000 (  0.565596)
```
