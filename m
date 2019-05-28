From: "Angus Ainslie (Purism)" <angus@akkea.ca>
Subject: [PATCH] arm64: dts: fsl: imx8mq: enable the svns power key
Date: Tue, 28 May 2019 05:44:06 -0700
Message-ID: <20190528124406.29730-1-angus@akkea.ca>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: angus.ainslie@puri.sm
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, "Angus Ainslie (Purism)" <angus@akkea.ca>, Carlo Caione <ccaione@baylibre.com>, =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add the snvs power key.

Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index 45d10d8efd14..5f93fd9662ae 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/power/imx8mq-power.h>
 #include <dt-bindings/reset/imx8mq-reset.h>
 #include <dt-bindings/gpio/gpio.h>
+#include "dt-bindings/input/input.h"
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/thermal/thermal.h>
 #include "imx8mq-pinfunc.h"
@@ -463,6 +464,14 @@
 					interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>,
 						<GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
 				};
+
+				snvs_pwrkey: snvs-powerkey {
+					compatible = "fsl,sec-v4.0-pwrkey";
+					regmap = <&snvs>;
+					interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
+					linux,keycode = <KEY_POWER>;
+					wakeup-source;
+				};
 			};
 
 			clk: clock-controller@30380000 {
-- 
2.17.1
