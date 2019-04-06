From: Markus Kueffner <kueffner.markus@gmail.com>
Subject: [PATCH] ARM: dts: imx6qdl-udoo: Add Pincfgs for OTG
Date: Sat,  6 Apr 2019 18:00:20 +0200
Message-ID: <1554566420-1008-1-git-send-email-kueffner.markus@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Markus Kueffner <kueffner.markus@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add Pincfgs to enable the i.MX6's OTG feature for UDOO

Signed-off-by: Markus Kueffner <kueffner.markus@gmail.com>
---
 arch/arm/boot/dts/imx6qdl-udoo.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl-udoo.dtsi b/arch/arm/boot/dts/imx6qdl-udoo.dtsi
index 776bfc7..42954ee 100644
--- a/arch/arm/boot/dts/imx6qdl-udoo.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-udoo.dtsi
@@ -221,6 +221,14 @@
 			>;
 		};
 
+		pinctrl_usbotg: usbotg {
+			fsl,pins = <
+				MX6QDL_PAD_GPIO_1__USB_OTG_ID 0x17059
+				MX6QDL_PAD_EIM_D22__USB_OTG_PWR 0x17059
+				MX6QDL_PAD_EIM_D21__USB_OTG_OC 0x17059
+			>;
+		};
+
 		pinctrl_ac97_running: ac97running {
 			fsl,pins = <
 				MX6QDL_PAD_DI0_PIN2__AUD6_TXD		0x1b0b0
@@ -294,6 +302,14 @@
 	status = "okay";
 };
 
+&usbotg {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usbotg>;
+	fsl,power-line-polarity-active-high;
+	fsl,over-current-polarity-active-low;
+	status = "okay";
+};
+
 &audmux {
 	status = "okay";
 };
-- 
2.1.4
