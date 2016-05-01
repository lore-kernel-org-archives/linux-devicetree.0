From: Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH V18 0/3] dmaengine: add Qualcomm Technologies HIDMA driver
Date: Sun,  1 May 2016 00:25:25 -0400
Message-ID: <1462076728-14367-1-git-send-email-okaya@codeaurora.org>
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
- Get rid of hidma_ll_resume function
- Rename hidma_ll_pause to hidma_ll_disable
- Remove tx_status_list and attach the err_code and err_info to the TRE
- Create a hidma_handle_tre_completion function to make error path and
  success path common.
- More style corrections


Sinan Kaya (3):
  dmaengine: qcom_hidma: implement lower level hardware interface
  dmaengine: qcom_hidma: add debugfs hooks
  dmaengine: qcom_hidma: add support for object hierarchy

 Documentation/ABI/testing/sysfs-platform-hidma |   9 +
 drivers/dma/qcom/Makefile                      |   2 +
 drivers/dma/qcom/hidma.c                       |  52 +-
 drivers/dma/qcom/hidma.h                       |  40 +-
 drivers/dma/qcom/hidma_dbg.c                   | 217 ++++++
 drivers/dma/qcom/hidma_ll.c                    | 872 +++++++++++++++++++++++++
 drivers/dma/qcom/hidma_mgmt.c                  | 113 +++-
 7 files changed, 1274 insertions(+), 31 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-hidma
 create mode 100644 drivers/dma/qcom/hidma_dbg.c
 create mode 100644 drivers/dma/qcom/hidma_ll.c

-- 
1.8.2.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
