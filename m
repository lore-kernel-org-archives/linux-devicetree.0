From: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 02/10] ARM: dts: imx6qdl-apalis: split usdhc1 pinctrl to support 4- and 8-bit
Date: Mon,  7 Aug 2017 12:52:34 +0530
Message-ID: <b13d83ea43d4dac42a27829d038b6531f7af1d8e.1502087184.git.maitysanchayan@gmail.com>
References: <cover.1502087184.git.maitysanchayan@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1502087184.git.maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1502087184.git.maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1502087184.git.maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org, maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Split the pinctrl property for usdhc1 into a 4-bit SD interface
and an extension to 8-bit. This is required to support both 8-bit
and 4-bit interface on usdhc1 as per the carrier board.

Signed-off-by: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/imx6qdl-apalis.dtsi | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl-apalis.dtsi b/arch/arm/boot/dts/imx6qdl-apalis.dtsi
index ba01dd76d887..117dee65f3f7 100644
--- a/arch/arm/boot/dts/imx6qdl-apalis.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-apalis.dtsi
@@ -1,5 +1,5 @@
 /*
- * Copyright 2014-2016 Toradex AG
+ * Copyright 2014-2017 Toradex AG
  * Copyright 2012 Freescale Semiconductor, Inc.
  * Copyright 2011 Linaro Ltd.
  *
@@ -460,7 +460,7 @@
 /* MMC1 */
 &usdhc1 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-0 = <&pinctrl_usdhc1_4bit &pinctrl_usdhc1_8bit>;
 	vqmmc-supply = <&reg_3p3v>;
 	bus-width = <8>;
 	voltage-ranges = <3300 3300>;
@@ -912,7 +912,7 @@
 		>;
 	};
 
-	pinctrl_usdhc1: usdhc1grp {
+	pinctrl_usdhc1_4bit: usdhc1grp_4bit {
 		fsl,pins = <
 			MX6QDL_PAD_SD1_CMD__SD1_CMD    0x17071
 			MX6QDL_PAD_SD1_CLK__SD1_CLK    0x10071
@@ -920,6 +920,11 @@
 			MX6QDL_PAD_SD1_DAT1__SD1_DATA1 0x17071
 			MX6QDL_PAD_SD1_DAT2__SD1_DATA2 0x17071
 			MX6QDL_PAD_SD1_DAT3__SD1_DATA3 0x17071
+		>;
+	};
+
+	pinctrl_usdhc1_8bit: usdhc1grp_8bit {
+		fsl,pins = <
 			MX6QDL_PAD_NANDF_D0__SD1_DATA4 0x17071
 			MX6QDL_PAD_NANDF_D1__SD1_DATA5 0x17071
 			MX6QDL_PAD_NANDF_D2__SD1_DATA6 0x17071
-- 
2.13.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
