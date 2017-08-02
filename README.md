# JSON - Avro - Thrift - Protobuf - MessagePack - Sparsam Benchmark

## Installation

`brew install protobuf thrift boost && bundle install`

## Running the Benchmark

`bundle exec ruby benchmark.rb`

## Results

Run in a MacBook Pro 3,3 GHz Interl Core i/, 16 Gb RAM, ruby 2.4.0:

```
Running single report...
AVRO TURF MESSAGING: 0.712844 seconds
AVRO TURF: 0.001023 seconds
THRIFT SERIALIZER: 0.000498 seconds
SPARSAM COMPACT SERIALIZER: 0.000169 seconds
SPARSAM BINARY SERIALIZER: 6.0e-05 seconds
PROTOBUF: 0.000181 seconds
JSON: 2.9e-05 seconds
MESSAGEPACK: 4.9e-05 seconds

AVRO TURF MESSAGING: 0.000287 seconds
AVRO TURF: 0.000291 seconds
THRIFT SERIALIZER: 0.000207 seconds
SPARSAM COMPACT SERIALIZER: 6.4e-05 seconds
SPARSAM BINARY SERIALIZER: 7.8e-05 seconds
PROTOBUF: 3.2e-05 seconds
JSON: 2.9e-05 seconds
MESSAGEPACK: 1.5e-05 seconds

AVRO TURF MESSAGING: 0.00025 seconds
AVRO TURF: 0.000239 seconds
THRIFT SERIALIZER: 0.000184 seconds
SPARSAM COMPACT SERIALIZER: 6.0e-05 seconds
SPARSAM BINARY SERIALIZER: 7.4e-05 seconds
PROTOBUF: 2.7e-05 seconds
JSON: 1.9e-05 seconds
MESSAGEPACK: 9.0e-06 seconds

AVRO TURF MESSAGING: 0.00026 seconds
AVRO TURF: 0.000262 seconds
THRIFT SERIALIZER: 0.000158 seconds
SPARSAM COMPACT SERIALIZER: 8.2e-05 seconds
SPARSAM BINARY SERIALIZER: 8.1e-05 seconds
PROTOBUF: 4.0e-05 seconds
JSON: 7.2e-05 seconds
MESSAGEPACK: 1.5e-05 seconds

AVRO TURF MESSAGING: 0.000238 seconds
AVRO TURF: 0.000275 seconds
THRIFT SERIALIZER: 0.000151 seconds
SPARSAM COMPACT SERIALIZER: 6.1e-05 seconds
SPARSAM BINARY SERIALIZER: 5.1e-05 seconds
PROTOBUF: 7.3e-05 seconds
JSON: 2.9e-05 seconds
MESSAGEPACK: 1.9e-05 seconds



Running multiple report (100000 times each)...
Rehearsal ----------------------------------------------------------------
avro turf messaging:          14.160000   0.060000  14.220000 ( 15.148765)
avro turf:                    13.630000   0.070000  13.700000 ( 14.603559)
thrift serializer:             7.720000   0.030000   7.750000 (  8.223082)
sparsam compact serializer:    2.200000   0.010000   2.210000 (  2.295610)
sparsam binary serializer:     2.080000   0.010000   2.090000 (  2.306312)
protobuf:                      1.520000   0.010000   1.530000 (  1.632096)
json:                          1.280000   0.010000   1.290000 (  1.375747)
messagepack:                   0.590000   0.010000   0.600000 (  0.664996)
------------------------------------------------------ total: 43.390000sec

                                   user     system      total        real
avro turf messaging:          14.010000   0.070000  14.080000 ( 15.068156)
avro turf:                    15.690000   0.130000  15.820000 ( 39.500073)
thrift serializer:             6.700000   0.020000   6.720000 (  6.749324)
sparsam compact serializer:    1.780000   0.010000   1.790000 (  1.787321)
sparsam binary serializer:     1.810000   0.000000   1.810000 (  1.823432)
protobuf:                      1.340000   0.010000   1.350000 (  1.350861)
json:                          1.160000   0.000000   1.160000 (  1.179973)
messagepack:                   0.540000   0.010000   0.550000 (  0.552365)
```
