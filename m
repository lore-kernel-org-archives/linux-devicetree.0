From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH 2/2] ARM: dts: vf-colibri: add supply regulators
Date: Mon, 15 Feb 2016 18:14:14 -0800
Message-ID: <1455588854-6996-2-git-send-email-stefan@agner.ch>
References: <1455588854-6996-1-git-send-email-stefan@agner.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1455588854-6996-1-git-send-email-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, kernel@pengutronix.de
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
List-Id: devicetree@vger.kernel.org

Colibri modules need to be powered using the power pins 3V3 and
AVDD. Add fixed regulators which represent this power rails.
Potentially, those power rails could be switched on a carrier
board. A carrier board device tree could add a own regulator with
a GPIO, and reference that regulator in a vin-supply property of
those new module level system regulators.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm/boot/dts/vf-colibri.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/vf-colibri.dtsi b/arch/arm/boot/dts/vf-colibri.dtsi
index ff6f58e..191506a 100644
--- a/arch/arm/boot/dts/vf-colibri.dtsi
+++ b/arch/arm/boot/dts/vf-colibri.dtsi
@@ -48,14 +48,31 @@
 		enable-gpios = <&gpio1 13 GPIO_ACTIVE_HIGH>;
 		status = "disabled";
 	};
+
+	reg_sys_3v3: regulator-sys-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	reg_sys_3v3_avdd: regulator-sys-3v3-avdd {
+		compatible = "regulator-fixed";
+		regulator-name = "AVDD";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
 };
 
 &adc0 {
 	status = "okay";
+	vref-supply = <&reg_sys_3v3_avdd>;
 };
 
 &adc1 {
 	status = "okay";
+	vref-supply = <&reg_sys_3v3_avdd>;
 };
 
 &can0 {
@@ -96,6 +113,7 @@
 
 &fec1 {
 	phy-mode = "rmii";
+	phy-supply = <&reg_sys_3v3>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_fec1>;
 };
-- 
2.7.1
