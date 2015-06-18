From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: [PATCH v6 6/6] ARM: dts: vf-colibri: enable NAND flash controller
Date: Fri, 19 Jun 2015 00:58:39 +0200
Message-ID: <1434668319-6651-7-git-send-email-stefan@agner.ch>
References: <1434668319-6651-1-git-send-email-stefan@agner.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434668319-6651-1-git-send-email-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: sebastian-E0PNVn5OA6ohrxcnuTQ+TQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marb-Z4QKGCRq86k@public.gmane.org, aaron-yuhzfaV+M/Wz3Dx2OeFgIA@public.gmane.org, bpringlemeir-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Enable NAND access by adding pinmux and NAND flash controller node
to device tree. The NAND chips currently used on the Colibri VF61
requires 8-bit ECC per 512 byte page, hence specify 32-bit ECC
strength per 2k page size.

Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
---
 arch/arm/boot/dts/vf-colibri.dtsi | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/vf-colibri.dtsi b/arch/arm/boot/dts/vf-colibri.dtsi
index fbef082..c009346 100644
--- a/arch/arm/boot/dts/vf-colibri.dtsi
+++ b/arch/arm/boot/dts/vf-colibri.dtsi
@@ -52,6 +52,19 @@
 	pinctrl-0 = <&pinctrl_i2c0>;
 };
 
+&nfc {
+	assigned-clocks = <&clks VF610_CLK_NFC>;
+	assigned-clock-rates = <33000000>;
+	nand-bus-width = <8>;
+	nand-ecc-mode = "hw";
+	nand-ecc-step-size = <2048>;
+	nand-ecc-strength = <32>;
+	nand-on-flash-bbt;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_nfc_1>;
+	status = "okay";
+};
+
 &pwm0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pwm0>;
@@ -156,6 +169,25 @@
 			>;
 		};
 
+		pinctrl_nfc_1: nfcgrp_1 {
+			fsl,pins = <
+				VF610_PAD_PTD23__NF_IO7		0x28df
+				VF610_PAD_PTD22__NF_IO6		0x28df
+				VF610_PAD_PTD21__NF_IO5		0x28df
+				VF610_PAD_PTD20__NF_IO4		0x28df
+				VF610_PAD_PTD19__NF_IO3		0x28df
+				VF610_PAD_PTD18__NF_IO2		0x28df
+				VF610_PAD_PTD17__NF_IO1		0x28df
+				VF610_PAD_PTD16__NF_IO0		0x28df
+				VF610_PAD_PTB24__NF_WE_B	0x28c2
+				VF610_PAD_PTB25__NF_CE0_B	0x28c2
+				VF610_PAD_PTB27__NF_RE_B	0x28c2
+				VF610_PAD_PTC26__NF_RB_B	0x283d
+				VF610_PAD_PTC27__NF_ALE		0x28c2
+				VF610_PAD_PTC28__NF_CLE		0x28c2
+			>;
+		};
+
 		pinctrl_pwm0: pwm0grp {
 			fsl,pins = <
 				VF610_PAD_PTB0__FTM0_CH0		0x1182
-- 
2.4.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
