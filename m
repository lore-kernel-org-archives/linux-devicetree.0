From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 10/10] MAINTAINERS: Add entry for Actions Semi Owl SoCs Reset Management Unit
Date: Wed,  1 Aug 2018 09:09:15 +0530
Message-ID: <20180801033915.15880-11-manivannan.sadhasivam@linaro.org>
References: <20180801033915.15880-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180801033915.15880-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: p.zabel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org, afaerber@suse.de, robh+dt@kernel.org, lee.jones@linaro.org, arnd@arndb.de
Cc: linux-clk@vger.kernel.org, liuwei@actions-semi.com, mp-cs@actions-semi.com, 96boards@ucrobotics.com, devicetree@vger.kernel.org, daniel.thompson@linaro.org, amit.kucheria@linaro.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, hzhang@ucrobotics.com, bdong@ucrobotics.com, manivannanece23@gmail.com, thomas.liau@actions-semi.com, jeff.chen@actions-semi.com, pn@denx.de, edgar.righi@lsitec.org.br, sravanhome@gmail.com, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Add entry for Actions Semi Reset Management Unit driver and its
bindings under ARCH_ACTIONS. Currently only S700 and S900 SoCs
of the Owl family are supported.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9c292ef3c210..25934ae77ba6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1146,13 +1146,17 @@ F:	arch/arm64/boot/dts/actions/
 F:	drivers/clk/actions/
 F:	drivers/clocksource/owl-*
 F:	drivers/pinctrl/actions/*
+F:	drivers/reset/reset-owl.c
 F:	drivers/soc/actions/
 F:	include/dt-bindings/power/owl-*
+F:	include/dt-bindings/reset/actions,s700-rmu.h
+F:	include/dt-bindings/reset/actions,s900-rmu.h
 F:	include/linux/soc/actions/
 F:	Documentation/devicetree/bindings/arm/actions.txt
 F:	Documentation/devicetree/bindings/clock/actions,s900-cmu.txt
 F:	Documentation/devicetree/bindings/pinctrl/actions,s900-pinctrl.txt
 F:	Documentation/devicetree/bindings/power/actions,owl-sps.txt
+F:	Documentation/devicetree/bindings/reset/actions,owl-reset.txt
 F:	Documentation/devicetree/bindings/timer/actions,owl-timer.txt
 
 ARM/ADS SPHERE MACHINE SUPPORT
-- 
2.17.1
