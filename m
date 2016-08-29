From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH 2/3] ARM: dts: imx7-colibri: add basic supply regulators
Date: Sun, 28 Aug 2016 22:13:23 -0700
Message-ID: <20160829051324.2276-2-stefan@agner.ch>
References: <20160829051324.2276-1-stefan@agner.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160829051324.2276-1-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, kernel@pengutronix.de
Cc: max.krummenacher@toradex.com, marcel.ziswiler@toradex.com, fabio.estevam@nxp.com, galak@codeaurora.org, ijc+devicetree@hellion.org.uk, mark.rutland@arm.com, pawel.moll@arm.com, robh+dt@kernel.org, grinberg@compulab.co.il, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
List-Id: devicetree@vger.kernel.org

Colibri modules need to be powered using the power pins 3V3 and
AVDD_AUDIO. Add fixed regulators which represent this power rails.
Potentially, those power rails could be switched on a carrier
board. A carrier board device tree could add a own regulator with
a GPIO, and reference that regulator in a vin-supply property of
those new module level system regulators. This also synchronize
the name of the +3.3V regulator with the one used in the Colibri
VF50/VF61 device tree.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm/boot/dts/imx7-colibri.dtsi | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/imx7-colibri.dtsi b/arch/arm/boot/dts/imx7-colibri.dtsi
index 044b83e..06fb567 100644
--- a/arch/arm/boot/dts/imx7-colibri.dtsi
+++ b/arch/arm/boot/dts/imx7-colibri.dtsi
@@ -46,12 +46,18 @@
 		pwms = <&pwm1 0 5000000>;
 	};
 
-	reg_3p3v: regulator-3p3v {
+	reg_module_3v3: regulator-module-3v3 {
 		compatible = "regulator-fixed";
-		regulator-name = "3P3V";
+		regulator-name = "+V3.3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	reg_module_3v3_avdd: regulator-module-3v3-avdd {
+		compatible = "regulator-fixed";
+		regulator-name = "+V3.3_AVDD_AUDIO";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		regulator-always-on;
 	};
 
 	reg_vref_1v8: regulator-vref-1v8 {
-- 
2.9.0
