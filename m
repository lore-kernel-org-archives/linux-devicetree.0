From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [RFC PATCH 0/6] char: Add support to Qualcomm FastRPC driver
Date: Fri, 30 Nov 2018 10:46:51 +0000
Message-ID: <20181130104657.14875-1-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, gregkh@linuxfoundation.org, arnd@arndb.de
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, bkumar@qti.qualcomm.com, thierry.escande@linaro.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

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

Keeping the first version simple, below are few things are TODO:
 - Support INIT_STATIC process
 - Support remote mmap/unmap methods.
 - Handling secure compute context banks.
 - Add secure buffer support

This patchset has been tested on DB410c(msm8916), DB820c (msm8996), SDM845
Qualcomm SoCs with sample apps like matrix multiply, calculator
from Hexagon SDK.

Thanks,
srini

Srinivas Kandagatla (5):
  char: dt-bindings: Add Qualcomm Fastrpc bindings
  char: fastrpc: Add Qualcomm fastrpc basic driver model
  char: fastrpc: Add support for context Invoke method
  char: fastrpc: Add support for create remote init process
  char: fastrpc: Add support for dmabuf exporter

Thierry Escande (1):
  char: fastrpc: Add support for compat ioctls

 .../devicetree/bindings/char/qcom,fastrpc.txt |   73 +
 drivers/char/Kconfig                          |   10 +
 drivers/char/Makefile                         |    1 +
 drivers/char/fastrpc.c                        | 1749 +++++++++++++++++
 include/uapi/linux/fastrpc.h                  |   82 +
 5 files changed, 1915 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/char/qcom,fastrpc.txt
 create mode 100644 drivers/char/fastrpc.c
 create mode 100644 include/uapi/linux/fastrpc.h

-- 
2.19.2
