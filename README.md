# SODIBus Protobuf Definitions

Protobuf Definitions for SODIBus

# Architecture

## Cluster

*  New Node A started with --join option will send ClusterPacketNodeInfo to target node B, node B will response a ClusterPacketNodeInfoBatch, including all known nodes, including B, node B will also forward the ClusterPacketNodeInfo to other nodes.

* Node A establish connections to all other nodes, and all other nodes establish a new connection to Node A.

* Upon Node-to-Node connection is established, source Node will send all **local** callee informations with ClusterPacketCalleeInfoBatch, and ClusterPacketCalleeInfo/Remove for future callee Add/Remove.

* Invocation / Result will use connections created above

# Packet Format

SODIBus uses Protobuf as messaging format, but Protobuf is not self-delimiting, SODIBus have to defines a Packet Format

```plain
+--------------+--------------+--------------+----------------------------+
|     HEAD     |     TYPE     |    LENGTH    |            BODY            |
+-------------------------------------------------------------------------+
|     0xAA     |   Msg Type   |  Body Length |       Protobuf Bytes       |
+-------------------------------------------------------------------------+
|     UInt8    |     UInt8    |    UInt32    |       Variable Length      |
+--------------+--------------+--------------+----------------------------+
```

# Packet Type

## Node-Client

* 1 = Handshake

* 2 = Ready

* 3 = CallerSend

* 4 = CallerRecv

* 5 = CalleeRecv

* 6 = CalleeSend

## Node-Node

* 101 = NodeInfo

* 102 = NodeInfoBatch

* 103 = CalleeInfo

* 104 = CalleeInfoBatch

* 105 = CalleeRemove

* 106 = Invocation

* 107 = Result
