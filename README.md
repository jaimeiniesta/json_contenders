# JSON - Avro - Protobuf - MessagePack Benchmark

## Installation

`brew install protobuf && bundle install`

## Running the Benchmark

`bundle exec ruby benchmark.rb`

## Results

Run in a MacBook Pro 3,3 GHz Interl Core i/, 16 Gb RAM, ruby 2.4.0:

```
Running single report...

AVRO TURF: 0.001209 seconds
AVRO TURF MESSAGING: 0.559558 seconds
JSON: 4.4e-05 seconds
PROTOBUF: 0.000238 seconds
MESSAGEPACK: 0.000101 seconds

AVRO TURF: 0.000429 seconds
AVRO TURF MESSAGING: 0.000689 seconds
JSON: 5.1e-05 seconds
PROTOBUF: 7.7e-05 seconds
MESSAGEPACK: 2.5e-05 seconds

AVRO TURF: 0.000372 seconds
AVRO TURF MESSAGING: 0.0006 seconds
JSON: 4.7e-05 seconds
PROTOBUF: 7.0e-05 seconds
MESSAGEPACK: 2.4e-05 seconds

AVRO TURF: 0.00065 seconds
AVRO TURF MESSAGING: 0.000515 seconds
JSON: 5.5e-05 seconds
PROTOBUF: 7.4e-05 seconds
MESSAGEPACK: 2.7e-05 seconds

AVRO TURF: 0.000347 seconds
AVRO TURF MESSAGING: 0.000592 seconds
JSON: 4.7e-05 seconds
PROTOBUF: 6.9e-05 seconds
MESSAGEPACK: 2.4e-05 seconds


Running multiple report...

Rehearsal ---------------------------------------------------------
avro turf:             11.340000   0.030000  11.370000 ( 11.395836)
avro turf messaging:   12.480000   0.070000  12.550000 ( 12.734593)
json:                   1.240000   0.010000   1.250000 (  1.264323)
protobuf:               1.500000   0.010000   1.510000 (  1.536831)
messagepack:            0.510000   0.010000   0.520000 (  0.520758)
----------------------------------------------- total: 27.200000sec

                            user     system      total        real
avro turf:             13.680000   0.120000  13.800000 ( 14.400806)
avro turf messaging:   12.390000   0.100000  12.490000 ( 12.557421)
json:                   1.070000   0.010000   1.080000 (  1.090217)
protobuf:               1.320000   0.010000   1.330000 (  1.333429)
messagepack:            0.490000   0.010000   0.500000 (  0.506694)
```
