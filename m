From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v5 0/5] misc: Add support to Qualcomm FastRPC driver
Date: Fri,  1 Feb 2019 13:09:20 +0000
Message-ID: <20190201130925.27066-1-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, arnd@arndb.de
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org, bkumar@qti.qualcomm.com, linux-arm-msm@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

Thanks for reviewing the v4, here is new version addressing the
comments from v4.
This patchset adds support to Qualcomm FastRPC driver which implements
an IPC (Inter-Processor Communication) mechanism that allows for clients
to transparently make remote method invocations across processor boundaries.

The below diagram depicts invocation of a single method where the client
and objects reside on different processors. An object could expose
multiple methods which can be grouped together and referred to as an
interface.

: ,--------,        ,------,  ,-----------,  ,------,        ,--------,
: |        | method |      |  |           |  |      | method |        |
: | Client |------->| Stub |->| Transport |->| Skel |------->| Object |
: |        |        |      |  |           |  |      |        |        |
: `--------`        `------`  `-----------`  `------`        `--------`

Client:    Linux user mode process that initiates the remote invocation
Stub:      Auto generated code linked in with the user mode process that
           takes care of marshaling parameters
Transport: Involved in carrying an invocation from a client to an
           object. This involves two portions: 1) FastRPC Linux
           kernel driver that receives the remote invocation, queues
           them up and then waits for the response after signaling the
           remote side. 2) Service running on the remote side that
           dequeues the messages from the queue and dispatches them for
           processing.
Skel:      Auto generated code that takes care of un-marshaling
           parameters
Object:    Method implementation

Most of the work is derived from various downstream Qualcomm kernels.
Credits to various Qualcomm authors who have contributed to this code.
Specially Tharun Kumar Merugu <mtharu@codeaurora.org>

TODO:
 - Support INIT_STATIC process
 - Support remote mmap/unmap methods.
 - Handling secure compute context banks.
 - Add secure buffer support

This patchset has been tested on DB410c(msm8916), DB820c (msm8996), SDM845
and QCS404 Qualcomm SoCs with sample apps like matrix multiply, calculator
from Hexagon SDK. You can find more info on how to test this at:
https://github.com/96boards/documentation/wiki/Dragonboard-Hexagon-DSP

Changes since v4(https://patchwork.kernel.org/cover/10779341/) :
- collected acks for DT from Rob.
- Removed unnecessary list safe iteration spotted by Greg KH.
- Removed unnecessary syslog spams.
- Added more checks to input validity.

Srinivas Kandagatla (5):
  misc: dt-bindings: Add Qualcomm Fastrpc bindings
  misc: fastrpc: Add Qualcomm fastrpc basic driver model
  misc: fastrpc: Add support for context Invoke method
  misc: fastrpc: Add support for create remote init process
  misc: fastrpc: Add support for dmabuf exporter

 .../devicetree/bindings/misc/qcom,fastrpc.txt |   78 +
 drivers/misc/Kconfig                          |   10 +
 drivers/misc/Makefile                         |    1 +
 drivers/misc/fastrpc.c                        | 1366 +++++++++++++++++
 include/uapi/misc/fastrpc.h                   |   41 +
 5 files changed, 1496 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/qcom,fastrpc.txt
 create mode 100644 drivers/misc/fastrpc.c
 create mode 100644 include/uapi/misc/fastrpc.h

-- 
2.20.1
