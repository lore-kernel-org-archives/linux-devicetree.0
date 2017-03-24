From: Jagan Teki <jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 06/15] ARM: dts: imx6ul-[geam|isiot]: Add sai2 node
Date: Fri, 24 Mar 2017 21:48:41 +0530
Message-ID: <1490372330-5611-7-git-send-email-jagan@openedev.com>
References: <1490372330-5611-1-git-send-email-jagan@openedev.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1490372330-5611-1-git-send-email-jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Matteo Lisi <matteo.lisi-4s7YQHO/iPVBDgjK7y7TUQ@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>

Add Synchronous Audio Interface(SAI) node for Engicam GEAM6UL
and Is.IoT MX6UL variant module boards.

Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Matteo Lisi <matteo.lisi-4s7YQHO/iPVBDgjK7y7TUQ@public.gmane.org>
Cc: Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
---
Changes for v2:
- none

 arch/arm/boot/dts/imx6ul-geam.dtsi  | 16 ++++++++++++++++
 arch/arm/boot/dts/imx6ul-isiot.dtsi | 16 ++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/imx6ul-geam.dtsi b/arch/arm/boot/dts/imx6ul-geam.dtsi
index ee5220c..eb94d95 100644
--- a/arch/arm/boot/dts/imx6ul-geam.dtsi
+++ b/arch/arm/boot/dts/imx6ul-geam.dtsi
@@ -172,6 +172,12 @@
 	xnur-gpio = <&gpio1 3 GPIO_ACTIVE_LOW>;
 };
 
+&sai2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai2>;
+	status = "okay";
+};
+
 &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1>;
@@ -328,6 +334,16 @@
 		>;
 	};
 
+	pinctrl_sai2: sai2grp {
+		fsl,pins = <
+			MX6UL_PAD_JTAG_TCK__SAI2_RX_DATA	0x130b0
+			MX6UL_PAD_JTAG_TMS__CCM_CLKO1		0x4001b031
+			MX6UL_PAD_JTAG_TDI__SAI2_TX_BCLK	0x17088
+			MX6UL_PAD_JTAG_TDO__SAI2_TX_SYNC	0x17088
+			MX6UL_PAD_JTAG_TRST_B__SAI2_TX_DATA	0x120b0
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX6UL_PAD_UART1_TX_DATA__UART1_DCE_TX 0x1b0b1
diff --git a/arch/arm/boot/dts/imx6ul-isiot.dtsi b/arch/arm/boot/dts/imx6ul-isiot.dtsi
index 4697a04..ea30380 100644
--- a/arch/arm/boot/dts/imx6ul-isiot.dtsi
+++ b/arch/arm/boot/dts/imx6ul-isiot.dtsi
@@ -91,6 +91,12 @@
 	status = "okay";
 };
 
+&sai2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai2>;
+	status = "okay";
+};
+
 &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1>;
@@ -129,6 +135,16 @@
 		>;
 	};
 
+	pinctrl_sai2: sai2grp {
+		fsl,pins = <
+			MX6UL_PAD_JTAG_TCK__SAI2_RX_DATA	0x130b0
+			MX6UL_PAD_JTAG_TMS__CCM_CLKO1		0x4001b031
+			MX6UL_PAD_JTAG_TDI__SAI2_TX_BCLK	0x17088
+			MX6UL_PAD_JTAG_TDO__SAI2_TX_SYNC	0x17088
+			MX6UL_PAD_JTAG_TRST_B__SAI2_TX_DATA	0x120b0
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX6UL_PAD_UART1_TX_DATA__UART1_DCE_TX 0x1b0b1
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
