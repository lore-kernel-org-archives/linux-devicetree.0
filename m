From: Sinan Kaya <okaya@codeaurora.org>
Subject: [PATCH V16 0/3] dmaengine: add Qualcomm Technologies HIDMA driver
Date: Mon, 11 Apr 2016 09:34:20 -0400
Message-ID: <1460381663-16765-1-git-send-email-okaya@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: dmaengine@vger.kernel.org, timur@codeaurora.org, devicetree@vger.kernel.org, cov@codeaurora.org, vinod.koul@intel.com, jcm@redhat.com
Cc: shankerd@codeaurora.org, vikrams@codeaurora.org, marc.zyngier@arm.com, mark.rutland@arm.com, eric.auger@linaro.org, agross@codeaurora.org, arnd@arndb.de, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sinan Kaya <okaya@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The Qualcomm Technologies HIDMA device has been designed
to support virtualization technology. The driver has been
divided into two to follow the hardware design.

1. HIDMA Management driver
2. HIDMA Channel driver

Each HIDMA HW consists of multiple channels. These channels
share some set of common parameters. These parameters are
initialized by the management driver during power up.
Same management driver is used for monitoring the execution
of the channels. Management driver can change the performance
behavior dynamically such as bandwidth allocation and
prioritization in the future.

The management driver is executed in host context and
is the main management entity for all channels provided by
the device.

------------------------
What's new
------------------------
- Fix tabs and spaces here and there.
- Cleanup timeout in ISR

------------------------
Git repos
------------------------
QEMU Support
https://www.codeaurora.org/cgit/quic/qemu/qemu/log/?h=v2.5.0-sriov

------------------------
History of Changes
------------------------
dma: qcom_hidma: add support for object hierarchy
Changes from V15: (https://lkml.org/lkml/2016/3/11/619)
* copyright year update

dma: qcom_hidma: implement lower level hardware interface
Changes from V15: (https://lkml.org/lkml/2016/3/11/617)
* remove timeout in interrupt handling
* fixed a couple of spaces and tabs

dma: qcom_hidma: add debugfs hooks
Changes from V15: (https://lkml.org/lkml/2016/3/11/616)
* copyright year update


Sinan Kaya (3):
  dmaengine: qcom_hidma: implement lower level hardware interface
  dmaengine: qcom_hidma: add debugfs hooks
  dmaengine: qcom_hidma: add support for object hierarchy

 Documentation/ABI/testing/sysfs-platform-hidma |   9 +
 drivers/dma/qcom/Makefile                      |   2 +
 drivers/dma/qcom/hidma.c                       |  44 +-
 drivers/dma/qcom/hidma.h                       |  22 +-
 drivers/dma/qcom/hidma_dbg.c                   | 219 ++++++
 drivers/dma/qcom/hidma_ll.c                    | 900 +++++++++++++++++++++++++
 drivers/dma/qcom/hidma_mgmt.c                  | 113 +++-
 7 files changed, 1293 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-hidma
 create mode 100644 drivers/dma/qcom/hidma_dbg.c
 create mode 100644 drivers/dma/qcom/hidma_ll.c

-- 
1.8.2.1
