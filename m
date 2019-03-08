From: Adam Ford <aford173@gmail.com>
Subject: [PATCH] ARM: dts: imx6qdl: Enable fsl,sec-v4.0-pwrkey
Date: Thu,  7 Mar 2019 19:01:48 -0600
Message-ID: <20190308010148.9000-1-aford173@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Adam Ford <aford173@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The imx6q Technical reference manual shows the interrupt is
available to wake from sleep using the power button. The driver
has been available for quite some time, and other variants of the
i.MX6 have it enabled, so this implements it much like the others.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
index fe17a3405edc..6b3e48d2e5ec 100644
--- a/arch/arm/boot/dts/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/imx6qdl.dtsi
@@ -4,6 +4,7 @@
 // Copyright 2011 Linaro Ltd.
 
 #include <dt-bindings/clock/imx6qdl-clock.h>
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
 / {
@@ -833,6 +834,14 @@
 					status = "disabled";
 				};
 
+				snvs_pwrkey: snvs-powerkey {
+					compatible = "fsl,sec-v4.0-pwrkey";
+					regmap = <&snvs>;
+					interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
+					linux,keycode = <KEY_POWER>;
+					wakeup-source;
+				};
+
 				snvs_lpgpr: snvs-lpgpr {
 					compatible = "fsl,imx6q-snvs-lpgpr";
 				};
-- 
2.17.1
