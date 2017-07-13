From: Tirupathi Reddy <tirupath-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH V1]: clk: qcom: support qpnp clock divider configuration
Date: Thu, 13 Jul 2017 17:02:15 +0530
Message-ID: <1499945536-18281-1-git-send-email-tirupath@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tirupathi Reddy <tirupath-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds a new device driver for configuring the clkdiv module
presents on the Qualcomm QPNP PMIC. The driver configures the frequency
of clkdiv outputs. The driver provides callback functions for different
clock operations and register the clkdiv module to clock framework.

Tirupathi Reddy (1):
  clk: qcom: Add qpnp clock divider support

 .../devicetree/bindings/clock/clk-qpnp-div.txt     |  52 +++
 drivers/clk/qcom/Kconfig                           |   9 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-qpnp-div.c                    | 422 +++++++++++++++++++++
 4 files changed, 484 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/clk-qpnp-div.txt
 create mode 100644 drivers/clk/qcom/clk-qpnp-div.c

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
