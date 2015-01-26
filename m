From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/4] clk: st: New clock domain
Date: Mon, 26 Jan 2015 11:13:56 +0000
Message-ID: <1422270840-3039-1-git-send-email-lee.jones@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

ST hardware have a bunch of clocks which must not be turned off.
If drivers a) fail to obtain a reference to any of these or b) give
up a previously obtained reference during suspend, the common clk
framework will attempt to turn them off and the hardware will
subsequently die.  The only way to recover from this failure is to
restart.

To avoid either of these two scenarios from catastrophically
disabling the running system we have implemented a clock domain
where clocks are consumed and references are taken, thus preventing
them from being shut down by the framework.

Lee Jones (4):
  ARM: sti: stih407-family: Supply defines for CLOCKGEN A0
  ARM: sti: stih407-family: Provide Clock Domain information
  clk: st: Provide a clock domain
  clk: dt: st: Introduce clock domain documentation

 .../devicetree/bindings/clock/st/st,clk-domain.txt | 34 ++++++++++++
 arch/arm/boot/dts/stih407-family.dtsi              | 13 +++++
 drivers/clk/st/Makefile                            |  2 +-
 drivers/clk/st/clk-domain.c                        | 63 ++++++++++++++++++++++
 include/dt-bindings/clock/stih407-clks.h           |  4 ++
 5 files changed, 115 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/st/st,clk-domain.txt
 create mode 100644 drivers/clk/st/clk-domain.c

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
