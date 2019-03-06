From: Adam Ford <aford173@gmail.com>
Subject: [PATCH 1/3] ARM: dts: imx6q-logicpd: Shutdown LCD regulator during suspend
Date: Wed,  6 Mar 2019 08:03:59 -0600
Message-ID: <20190306140402.17122-1-aford173@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Adam Ford <aford173@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The LCD power sequencer is very finicky.  The backlight cannot
be driven until after the sequencer is done.  Until now, the
regulators were marked with 'regulator-always-on' to make sure
it came up before the backlight.  This patch allows the LCD
regulators to power down and prevent the backlight from being
used again until the sequencer is ready.  This reduces
standby power consumption by ~100mW.

Fixes: 1c207f911fe9 ("ARM: dts: imx: Add support for Logic
PD i.MX6QD EVM")

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm/boot/dts/imx6q-logicpd.dts b/arch/arm/boot/dts/imx6q-logicpd.dts
index 45eb0b7f75f8..d96ae54be338 100644
--- a/arch/arm/boot/dts/imx6q-logicpd.dts
+++ b/arch/arm/boot/dts/imx6q-logicpd.dts
@@ -21,6 +21,8 @@
 
 	panel-lvds0 {
 		compatible = "okaya,rs800480t-7x0gp";
+		power-supply = <&reg_lcd_reset>;
+		backlight = <&backlight>;
 
 		port {
 			panel_in_lvds0: endpoint {
@@ -38,7 +40,6 @@
 		regulator-max-microvolt = <3300000>;
 		gpio = <&gpio4 17 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
-		regulator-always-on;
 		vin-supply = <&reg_3v3>;
 		startup-delay-us = <500000>;
 	};
@@ -52,7 +53,6 @@
 		regulator-max-microvolt = <3300000>;
 		gpio = <&gpio5 2 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
-		regulator-always-on;
 		vin-supply = <&reg_lcd>;
 	};
 };
-- 
2.17.1
