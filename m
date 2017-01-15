From: Jagan Teki <jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 1/2] ARM: dts: imx6ul-isiot: Add eMMC node
Date: Sun, 15 Jan 2017 22:50:11 +0100
Message-ID: <1484517012-13321-1-git-send-email-jagan@openedev.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Matteo Lisi <matteo.lisi-4s7YQHO/iPVBDgjK7y7TUQ@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>

Add usdhc2 node, which is eMMC for Engicam Is.IoT MX6UL modules.

dmesg:
-----
mmc1: SDHCI controller on 2194000.usdhc [2194000.usdhc] using ADMA
mmc1: new DDR MMC card at address 0001
mmcblk1: mmc1:0001 M62704 3.53 GiB

Cc: Matteo Lisi <matteo.lisi-4s7YQHO/iPVBDgjK7y7TUQ@public.gmane.org>
Cc: Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Signed-off-by: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
---
 arch/arm/boot/dts/imx6ul-isiot.dts | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/imx6ul-isiot.dts b/arch/arm/boot/dts/imx6ul-isiot.dts
index 077bc26..acb97bd 100644
--- a/arch/arm/boot/dts/imx6ul-isiot.dts
+++ b/arch/arm/boot/dts/imx6ul-isiot.dts
@@ -76,6 +76,15 @@
 	status = "okay";
 };
 
+&usdhc2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usdhc2>;
+	cd-gpios = <&gpio4 5 GPIO_ACTIVE_LOW>;
+	bus-width = <8>;
+	no-1-8-v;
+	status = "okay";
+};
+
 &iomuxc {
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
@@ -116,4 +125,20 @@
 			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3 0x170f9
 		>;
 	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX6UL_PAD_NAND_RE_B__USDHC2_CLK      0x17070
+			MX6UL_PAD_NAND_WE_B__USDHC2_CMD      0x10070
+			MX6UL_PAD_NAND_DATA00__USDHC2_DATA0  0x17070
+			MX6UL_PAD_NAND_DATA01__USDHC2_DATA1  0x17070
+			MX6UL_PAD_NAND_DATA02__USDHC2_DATA2  0x17070
+			MX6UL_PAD_NAND_DATA03__USDHC2_DATA3  0x17070
+			MX6UL_PAD_NAND_DATA04__USDHC2_DATA4  0x17070
+			MX6UL_PAD_NAND_DATA05__USDHC2_DATA5  0x17070
+			MX6UL_PAD_NAND_DATA06__USDHC2_DATA6  0x17070
+			MX6UL_PAD_NAND_DATA07__USDHC2_DATA7  0x17070
+			MX6UL_PAD_NAND_ALE__USDHC2_RESET_B   0x17070
+		>;
+	};
 };
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
