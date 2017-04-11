# SODIBus Protobuf Definitions

Protobuf Definitions for SODIBus

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

* 1 = Handshake

* 2 = Ready

* 3 = CallerSend

* 4 = CallerRecv

* 5 = CalleeRecv

* 6 = CalleeSend
