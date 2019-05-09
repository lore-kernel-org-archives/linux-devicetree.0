Return-Path: <SRS0=z2TU=TJ=pengutronix.de=mfe@kernel.org>
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 15/17] ARCH: arm: dts: imx6qdl-kontron-samx6i: add power management support
Date: Thu,  9 May 2019 17:58:32 +0200
Message-Id: <20190509155834.22838-16-m.felsch@pengutronix.de>
In-Reply-To: <20190509155834.22838-1-m.felsch@pengutronix.de>
References: <20190509155834.22838-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: robh+dt@kernel.org, shawnguo@kernel.org, linux-imx@nxp.com
Cc: Stefan.Nickl@kontron.com, Gilles.Buloz@kontron.com, Michael.Brunner@kontron.com, thomas.schaefer@kontron.com, frieder.schrempf@kontron.de, kernel@pengutronix.de, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Specify the SoC and ARM vin-supply to enable frequency scaling.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi b/arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi
index 7e60142f09c1..3d1cffcd2d89 100644
--- a/arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi
@@ -732,6 +732,18 @@
 	pinctrl-0 = <&pinctrl_pwm4>;
 };
 
+&reg_arm {
+	vin-supply = <&reg_v_core_s0>;
+};
+
+&reg_pu {
+	vin-supply = <&reg_vddsoc_s0>;
+};
+
+&reg_soc {
+	vin-supply = <&reg_vddsoc_s0>;
+};
+
 /* SER0 */
 &uart1 {
 	pinctrl-names = "default";
-- 
2.20.1
