From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v7 0/5] misc: Add support to Qualcomm FastRPC driver
Date: Fri,  8 Feb 2019 17:11:22 +0000
Message-ID: <20190208171127.24168-1-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, arnd@arndb.de
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org, bkumar@qti.qualcomm.com, linux-arm-msm@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

Thanks for reviewing the v6 here is new version addressing the
comments from v7.
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

Change since v6:
 - really check the reserved field in args for both internal and user side
	invoke, also make sure internal calls set reserved field to 0.
 - remove check for nscalars as the macro will truncate this to max value.

Change since v5 (https://patchwork.kernel.org/cover/10792749/) :
- Fix domain id range check spotted by Thierry
- Add missing dma_unmap_sg spotted by Thierry
- Add refcounting to invoke context, to make sure that we do not free/unmap 
	buffers when dsp is actively using it.
- Rebased on top of char-misc-next branch

Changes since v4(https://patchwork.kernel.org/cover/10779341/) :
- collected acks for DT from Rob.
- Removed unnecessary list safe iteration spotted by Greg KH.
- Removed unnecessary syslog spams.
- Added more checks to input validity.

Changes since v3(https://patchwork.kernel.org/cover/10763343/) :
- removed secured property from dt binding, defer it till we add
	support to secure buffers.
- reword various bits in bindings suggested by Rob Herring

Changes since v2 (https://lkml.org/lkml/2018/12/7/550) :
- removed compat_ioctl specific structures and various cleanups as
  suggested by Greg KH
- replace reg property with label property as suggested by Bjorn
- minor content cleanup in bindings as suggested by Mark Rutland

Changes since RFC:
- moved from char to misc driver as suggested by Greg KH
- updated ioctl data structures as suggested by Arnd.
- cleaned up and reorganized most of the code from RFC review comments.

Srinivas Kandagatla (5):
  misc: dt-bindings: Add Qualcomm Fastrpc bindings
  misc: fastrpc: Add Qualcomm fastrpc basic driver model
  misc: fastrpc: Add support for context Invoke method
  misc: fastrpc: Add support for create remote init process
  misc: fastrpc: Add support for dmabuf exporter

 .../devicetree/bindings/misc/qcom,fastrpc.txt |   78 +
 drivers/misc/Kconfig                          |   10 +
 drivers/misc/Makefile                         |    1 +
 drivers/misc/fastrpc.c                        | 1392 +++++++++++++++++
 include/uapi/misc/fastrpc.h                   |   41 +
 5 files changed, 1522 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/qcom,fastrpc.txt
 create mode 100644 drivers/misc/fastrpc.c
 create mode 100644 include/uapi/misc/fastrpc.h

-- 
2.20.1
