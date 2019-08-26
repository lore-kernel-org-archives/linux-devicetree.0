From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
Subject: [PATCH 01/12] ARM: dts: imx7d: cl-som-imx7 imx7d-sbc-imx7: move USB
Date: Mon, 26 Aug 2019 16:37:49 +0100
Message-ID: <20190826153800.35400-1-git@andred.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>, Ilya Ledvich <ilya@compulab.co.il>, Igor Grinberg <grinberg@compulab.co.il>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Whether and which USB port is enabled and how they
are powered is a function of the carrier board, not
of the SoM. Different carrier boards can have different
ports enabled / wired up, and power them differently;
so this should really move into the respective DTS.

Do so and update the USB power supply to reflect
the actual situation on the sbc-imx7 carrier board.

Signed-off-by: André Draszik <git@andred.net>
Cc: Ilya Ledvich <ilya@compulab.co.il>
Cc: Igor Grinberg <grinberg@compulab.co.il>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm/boot/dts/imx7d-cl-som-imx7.dts | 24 ------------------------
 arch/arm/boot/dts/imx7d-sbc-imx7.dts    | 13 +++++++++++++
 2 files changed, 13 insertions(+), 24 deletions(-)

diff --git a/arch/arm/boot/dts/imx7d-cl-som-imx7.dts b/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
index 62d5e9a4a781..6f7e85cf0c28 100644
--- a/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
+++ b/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
@@ -22,15 +22,6 @@
 		device_type = "memory";
 		reg = <0x80000000 0x10000000>; /* 256 MB - minimal configuration */
 	};
-
-	reg_usb_otg1_vbus: regulator-vbus {
-		compatible = "regulator-fixed";
-		regulator-name = "usb_otg1_vbus";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio1 5 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-	};
 };
 
 &cpu0 {
@@ -193,13 +184,6 @@
 	status = "okay";
 };
 
-&usbotg1 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_usbotg1>;
-	vbus-supply = <&reg_usb_otg1_vbus>;
-	status = "okay";
-};
-
 &usdhc3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_usdhc3>;
@@ -278,11 +262,3 @@
 		>;
 	};
 };
-
-&iomuxc_lpsr {
-	pinctrl_usbotg1: usbotg1grp {
-		fsl,pins = <
-			MX7D_PAD_LPSR_GPIO1_IO05__GPIO1_IO5	0x14 /* OTG PWREN */
-		>;
-	};
-};
diff --git a/arch/arm/boot/dts/imx7d-sbc-imx7.dts b/arch/arm/boot/dts/imx7d-sbc-imx7.dts
index f8a868552707..aab646903de3 100644
--- a/arch/arm/boot/dts/imx7d-sbc-imx7.dts
+++ b/arch/arm/boot/dts/imx7d-sbc-imx7.dts
@@ -15,6 +15,14 @@
 / {
 	model = "CompuLab SBC-iMX7";
 	compatible = "compulab,sbc-imx7", "compulab,cl-som-imx7", "fsl,imx7d";
+
+	reg_usb_vbus: regulator-usb-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usb_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
 };
 
 &usdhc1 {
@@ -26,6 +34,11 @@
 	status = "okay";
 };
 
+&&usbotg1 {
+	vbus-supply = <&reg_usb_vbus>;
+	status = "okay";
+};
+
 &iomuxc {
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <
-- 
2.23.0.rc1
