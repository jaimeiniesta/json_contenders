# JSON - Avro - Protobuf Benchmark

## Installation

`brew install protobuf && bundle install`

## Running the Benchmark

`bundle exec ruby benchmark.rb`

## Results

Run in a MacBook Pro 3,3 GHz Interl Core i/, 16 Gb RAM, ruby 2.4.0:

```
Running single report...

AVRO: 0.001002 seconds
JSON: 3.8e-05 seconds
PROTOBUF: 0.000101 seconds

AVRO: 0.000174 seconds
JSON: 4.1e-05 seconds
PROTOBUF: 1.8e-05 seconds

AVRO: 0.000162 seconds
JSON: 4.2e-05 seconds
PROTOBUF: 1.7e-05 seconds

AVRO: 0.000204 seconds
JSON: 1.8e-05 seconds
PROTOBUF: 1.2e-05 seconds

AVRO: 0.000233 seconds
JSON: 1.4e-05 seconds
PROTOBUF: 1.1e-05 seconds


Running multiple report...

Rehearsal ----------------------------------------------
avro:       12.650000   0.080000  12.730000 ( 12.853671)
json:        1.130000   0.000000   1.130000 (  1.139871)
protobuf:    0.710000   0.010000   0.720000 (  0.718101)
------------------------------------ total: 14.580000sec

                 user     system      total        real
avro:       12.680000   0.060000  12.740000 ( 13.026614)
json:        1.120000   0.010000   1.130000 (  1.125107)
protobuf:    0.760000   0.000000   0.760000 (  0.764443)
```
