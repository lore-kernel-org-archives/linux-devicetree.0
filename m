From: Markus Kueffner <kueffner.markus@gmail.com>
Subject: [PATCH v2] ARM: dts: imx6qdl-udoo: Add Pincfgs for OTG
Date: Sat, 13 Apr 2019 15:19:36 +0200
Message-ID: <1555161577-1533-1-git-send-email-kueffner.markus@gmail.com>
References: <20190411065440.GB26817@dragon>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190411065440.GB26817@dragon>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Markus Kueffner <kueffner.markus@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add Pincfgs to enable the i.MX6's OTG feature for UDOO

Signed-off-by: Markus Kueffner <kueffner.markus@gmail.com>
---
Changes in v2:
- put pinctrl_usbotg node after pinctrl_usbh as suggested
- remove unsupported properties from &usbotg

 arch/arm/boot/dts/imx6qdl-udoo.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl-udoo.dtsi b/arch/arm/boot/dts/imx6qdl-udoo.dtsi
index 776bfc7..828dd20 100644
--- a/arch/arm/boot/dts/imx6qdl-udoo.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-udoo.dtsi
@@ -210,6 +210,14 @@
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
 		pinctrl_usdhc3: usdhc3grp {
 			fsl,pins = <
 				MX6QDL_PAD_SD3_CMD__SD3_CMD		0x17059
@@ -287,6 +295,12 @@
 	status = "okay";
 };
 
+&usbotg {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usbotg>;
+	status = "okay";
+};
+
 &usdhc3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_usdhc3>;
-- 
2.1.4
