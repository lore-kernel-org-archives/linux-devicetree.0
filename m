From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH 2/8] ARM: dts: imx6q-apalis-eval: add carrier board 3.3V supply
Date: Mon,  9 Jul 2018 17:48:42 +0200
Message-ID: <20180709154848.5401-2-stefan@agner.ch>
References: <20180709154848.5401-1-stefan@agner.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180709154848.5401-1-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, s.hauer@pengutronix.de
Cc: kernel@pengutronix.de, fabio.estevam@nxp.com, linux-imx@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, marcel.ziswiler@toradex.com, max.krummenacher@toradex.com, maitysanchayan@gmail.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
List-Id: devicetree@vger.kernel.org

Add the 3.3V main supply on the carrier board. Currently as a fixed
supply since not all consumer are modeled yet. This gets also rid of
some missing supply warnings.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm/boot/dts/imx6q-apalis-eval.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/imx6q-apalis-eval.dts b/arch/arm/boot/dts/imx6q-apalis-eval.dts
index 621d9709effa..707ac9a46115 100644
--- a/arch/arm/boot/dts/imx6q-apalis-eval.dts
+++ b/arch/arm/boot/dts/imx6q-apalis-eval.dts
@@ -113,6 +113,7 @@
 		 */
 		compatible = "edt,et057090dhu";
 		backlight = <&backlight>;
+		power-supply = <&reg_3v3_sw>;
 
 		port {
 			lcd_panel_in: endpoint {
@@ -131,19 +132,30 @@
 		enable-active-high;
 		status = "okay";
 	};
+
+	reg_3v3_sw: regulator-3v3-sw {
+		compatible = "regulator-fixed";
+		regulator-name = "3.3V_SW";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
 };
 
 &backlight {
 	brightness-levels = <0 127 191 223 239 247 251 255>;
 	default-brightness-level = <1>;
+	power-supply = <&reg_3v3_sw>;
 	status = "okay";
 };
 
 &can1 {
+	xceiver-supply = <&reg_3v3_sw>;
 	status = "okay";
 };
 
 &can2 {
+	xceiver-supply = <&reg_3v3_sw>;
 	status = "okay";
 };
 
-- 
2.18.0
