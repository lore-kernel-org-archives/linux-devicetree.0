From: Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH 0/4] Introduce drivers/soc and add QCOM GSBI driver
Date: Mon, 21 Apr 2014 00:30:40 -0500
Message-ID: <1398058244-14099-1-git-send-email-agross@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The first patch in this set adds the drivers/soc directory and all the necessary
plumbing.  These changes were discussed at the kernel summit and also were
introduced in an earlier patch set from Santosh Shilimkar.

Reference the following set of patches:
https://lkml.org/lkml/2014/2/28/567

The remaining patches add the QCOM GSBI (General Serial Bus Interface) driver,
device tree binding information for both the GSBI and child node interaction,
and lastly a patch to fix the current MSM serial driver to work correctly with
the GSBI changes.

Before this patch series, serial drivers (UART, I2C, and SPI) were all directly
accessing the overarching mux control settings for the parent GSBI device.  This
leads to unfortunate interactions when you want a UART and I2C device which
share the same GSBI interface.  By moving the serial devices to child nodes of
the GSBI, we can get the right mode setting for the ports and keep the children
from accessing the GSBI directly.

Andy Gross (4):
  soc: Placeholder files for drivers/soc
  soc: qcom: Add GSBI driver
  soc: qcom: Add device tree binding for GSBI
  tty: serial: msm: Remove direct access to GSBI

 .../devicetree/bindings/soc/qcom/qcom,gsbi.txt     |   78 +++++++++++++++
 drivers/Kconfig                                    |    2 +
 drivers/Makefile                                   |    4 +
 drivers/soc/Kconfig                                |    5 +
 drivers/soc/Makefile                               |    5 +
 drivers/soc/qcom/Kconfig                           |   11 +++
 drivers/soc/qcom/Makefile                          |    1 +
 drivers/soc/qcom/qcom_gsbi.c                       |  101 ++++++++++++++++++++
 drivers/tty/serial/msm_serial.c                    |   48 +---------
 drivers/tty/serial/msm_serial.h                    |    5 -
 10 files changed, 209 insertions(+), 51 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,gsbi.txt
 create mode 100644 drivers/soc/Kconfig
 create mode 100644 drivers/soc/Makefile
 create mode 100644 drivers/soc/qcom/Kconfig
 create mode 100644 drivers/soc/qcom/Makefile
 create mode 100644 drivers/soc/qcom/qcom_gsbi.c

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
