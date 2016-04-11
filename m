From: Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH V17 0/3] dmaengine: add Qualcomm Technologies HIDMA driver
Date: Mon, 11 Apr 2016 10:21:10 -0400
Message-ID: <1460384473-5775-1-git-send-email-okaya@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: shankerd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, vikrams-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, eric.auger-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
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
- fix merge conflict introduced in v16

------------------------
Git repos
------------------------
QEMU Support
https://www.codeaurora.org/cgit/quic/qemu/qemu/log/?h=v2.5.0-sriov

------------------------
History of Changes
------------------------
dma: qcom_hidma: implement lower level hardware interface
Changes from V16:
(https://www.mail-archive.com/linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg1119709.html)
* correct the merge conflict in IRQ handler by moving the while
loop to the correct place

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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
