From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v2 0/7] Modernize pm8921 with irqdomains, regmap, DT
Date: Mon, 23 Dec 2013 12:45:56 -0800
Message-ID: <1387831563-13535-1-git-send-email-sboyd@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

These patches lay the groundwork for converting the pm8921 sub-devices
to devicetree as well as simplify the API by migrating the core code
to use the regmap API instead of the custom pm8xxx read/write wrapper.

Changes since v1:
 * First 3 cleanup patches dropped because they're applied upstream
 * New regmap read/write helpers
 * New patch for DT match table
 * New binding document

Stephen Boyd (7):
  mfd: Move pm8xxx-irq.c contents into only driver that uses it
  mfd: pm8921: Update for genirq changes
  mfd: pm8921: Migrate to irqdomains
  mfd: ssbi: Add regmap read/write helpers
  mfd: pm8921: Use ssbi regmap
  mfd: pm8921: Add DT match table
  devicetree: bindings: Document PM8921/8058 PMICs

 .../devicetree/bindings/mfd/qcom,pm8xxx.txt        |  63 +++
 drivers/mfd/Kconfig                                |  12 +-
 drivers/mfd/pm8921-core.c                          | 424 ++++++++++++++++++---
 drivers/mfd/pm8xxx-irq.c                           | 371 ------------------
 drivers/mfd/ssbi.c                                 |  13 +
 include/linux/mfd/pm8xxx/irq.h                     |  59 ---
 include/linux/mfd/pm8xxx/pm8921.h                  |  30 --
 include/linux/ssbi.h                               |   3 +
 8 files changed, 449 insertions(+), 526 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/qcom,pm8xxx.txt
 delete mode 100644 drivers/mfd/pm8xxx-irq.c
 delete mode 100644 include/linux/mfd/pm8xxx/irq.h
 delete mode 100644 include/linux/mfd/pm8xxx/pm8921.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
