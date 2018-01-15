From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: [PATCH] ARM: dts: imx53: use PMIC's TSI pins in adc mode
Date: Mon, 15 Jan 2018 15:28:20 +0100
Message-ID: <20180115142820.31729-1-sebastian.reichel@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sebastian Reichel <sebastian.reichel@collabora.co.uk>
List-Id: devicetree@vger.kernel.org

PPD uses the PMIC's TSI pins in general purpose ADC mode.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
---
 arch/arm/boot/dts/imx53-ppd.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/imx53-ppd.dts b/arch/arm/boot/dts/imx53-ppd.dts
index 123297da43a7..80224fa995f9 100644
--- a/arch/arm/boot/dts/imx53-ppd.dts
+++ b/arch/arm/boot/dts/imx53-ppd.dts
@@ -132,6 +132,14 @@
 		enable-active-high;
 	};
 
+	reg_tsiref: tsiref {
+		compatible = "regulator-fixed";
+		regulator-name = "tsiref";
+		regulator-min-microvolt = <2500000>;
+		regulator-max-microvolt = <2500000>;
+		regulator-always-on;
+	};
+
 	pwm_bl: backlight {
 		compatible = "pwm-backlight";
 		pwms = <&pwm2 0 50000>;
@@ -295,6 +303,9 @@
 		interrupts = <12 0x8>;
 		spi-max-frequency = <1000000>;
 
+		dlg,tsi-as-adc;
+		tsiref-supply = <&reg_tsiref>;
+
 		regulators {
 			buck1_reg: buck1 {
 				regulator-name = "BUCKCORE";
-- 
2.15.1
