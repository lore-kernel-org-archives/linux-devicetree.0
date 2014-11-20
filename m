From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH 0/7] IPQ806X audio clock control driver
Date: Wed, 19 Nov 2014 16:10:38 -0800
Message-ID: <1416442245-21967-1-git-send-email-sboyd@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kenneth Westfield <kwestfie-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rajendra Nayak <rnayak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset adds support for the low power audio subsystem (lpass)
clock controller hardware. I split out the #define patch so that
it can go through the clock tree and the arm-soc tree in parallel
if desired. I'll be adding the apq/msm drivers shortly, but I wanted
to get this out for any feedback while I go and port over that data.

Josh Cartwright (1):
  clk: qcom: Add support for cdiv clocks

Rajendra Nayak (3):
  dt-bindings: Add #defines for IPQ806x lpass clock control
  clk: qcom: ipq: Add lpass clock controller driver
  devicetree: bindings: Document qcom,lcc

Stephen Boyd (3):
  clk: Add __clk_mux_determine_rate_closest
  clk: divider: Make generic for usage elsewhere
  clk: qcom: Add simple regmap based muxes

 .../devicetree/bindings/clock/qcom,lcc.txt         |  21 +
 drivers/clk/clk-divider.c                          | 195 +++++----
 drivers/clk/clk.c                                  |  47 ++-
 drivers/clk/qcom/Kconfig                           |   9 +
 drivers/clk/qcom/Makefile                          |   3 +
 drivers/clk/qcom/clk-cdiv.c                        |  72 ++++
 drivers/clk/qcom/clk-cdiv.h                        |  29 ++
 drivers/clk/qcom/clk-regmap-mux.c                  |  59 +++
 drivers/clk/qcom/clk-regmap-mux.h                  |  29 ++
 drivers/clk/qcom/gcc-ipq806x.c                     |  12 +
 drivers/clk/qcom/lcc-ipq806x.c                     | 456 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-ipq806x.h       |   1 -
 include/dt-bindings/clock/qcom,lcc-ipq806x.h       |  29 ++
 include/linux/clk-provider.h                       |  20 +-
 14 files changed, 894 insertions(+), 88 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,lcc.txt
 create mode 100644 drivers/clk/qcom/clk-cdiv.c
 create mode 100644 drivers/clk/qcom/clk-cdiv.h
 create mode 100644 drivers/clk/qcom/clk-regmap-mux.c
 create mode 100644 drivers/clk/qcom/clk-regmap-mux.h
 create mode 100644 drivers/clk/qcom/lcc-ipq806x.c
 create mode 100644 include/dt-bindings/clock/qcom,lcc-ipq806x.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
