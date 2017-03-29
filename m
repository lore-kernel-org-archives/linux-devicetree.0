From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH 4/5] ARM: dts: imx7-colibri: remove 1.8V fixed regulator
Date: Wed, 29 Mar 2017 16:21:12 -0700
Message-ID: <20170329232113.19078-4-stefan@agner.ch>
References: <20170329232113.19078-1-stefan@agner.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170329232113.19078-1-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, kernel@pengutronix.de
Cc: fabio.estevam@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
List-Id: devicetree@vger.kernel.org

The ADC is directly supplied by the PMIC 1.8V rail, remove the
superfluous fixed regulator.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm/boot/dts/imx7-colibri.dtsi | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/imx7-colibri.dtsi b/arch/arm/boot/dts/imx7-colibri.dtsi
index cbcab937b905..2d87489f9105 100644
--- a/arch/arm/boot/dts/imx7-colibri.dtsi
+++ b/arch/arm/boot/dts/imx7-colibri.dtsi
@@ -60,13 +60,6 @@
 		regulator-max-microvolt = <3300000>;
 	};
 
-	reg_vref_1v8: regulator-vref-1v8 {
-		compatible = "regulator-fixed";
-		regulator-name = "vref-1v8";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-	};
-
 	sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,name = "imx7-sgtl5000";
@@ -85,11 +78,11 @@
 };
 
 &adc1 {
-	vref-supply = <&reg_vref_1v8>;
+	vref-supply = <&reg_DCDC3>;
 };
 
 &adc2 {
-	vref-supply = <&reg_vref_1v8>;
+	vref-supply = <&reg_DCDC3>;
 };
 
 &cpu0 {
-- 
2.12.1
