#!/bin/bash

protoc -I=. --go_out=go_out/ shared.proto client_packet.proto cluster_packet.proto
