From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: [PATCH v13 1/2] ARM: dts: vf610twr: add NAND flash controller peripherial
Date: Wed,  7 Oct 2015 16:58:35 -0700
Message-ID: <1444262316-30588-1-git-send-email-stefan@agner.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sebastian-E0PNVn5OA6ohrxcnuTQ+TQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marb-Z4QKGCRq86k@public.gmane.org, aaron-yuhzfaV+M/Wz3Dx2OeFgIA@public.gmane.org, bpringlemeir-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, albert.aribaud-iEu9NFBzPZE@public.gmane.org, klimov.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Bill Pringlemeir <bpringlemeir-ygJ1pmMJ17cAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds the NAND flash controller (NFC) peripherial. The driver
supports the SLC NAND chips found on Freescale's Vybrid Tower System
Module. The Micron NAND chip on the module needs 4-bit ECC per 512
byte page. Use 24-bit ECC per 2k page, which is supported by the
driver.

Signed-off-by: Bill Pringlemeir <bpringlemeir-ygJ1pmMJ17cAvxtiuMwx3w@public.gmane.org>
Reviewed-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
---
Hi Shawn,

This are the rebased dt changes of the Vybrid MTD NAND driver
patchset. The driver part has recently been merged:
https://lkml.org/lkml/2015/9/2/678

The driver is lined up fo 4.4, I hope those changes make it into
4.4 as well.

Changes since v12:
- Rebased (and fixed merge conflict)
- Fix indent

 arch/arm/boot/dts/vf610-twr.dts | 47 +++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/vfxxx.dtsi    | 11 ++++++++++
 2 files changed, 58 insertions(+)

diff --git a/arch/arm/boot/dts/vf610-twr.dts b/arch/arm/boot/dts/vf610-twr.dts
index 375ab23..5438ee4 100644
--- a/arch/arm/boot/dts/vf610-twr.dts
+++ b/arch/arm/boot/dts/vf610-twr.dts
@@ -237,6 +237,33 @@
 			>;
 		};
 
+		pinctrl_nfc: nfcgrp {
+			fsl,pins = <
+				VF610_PAD_PTD31__NF_IO15	0x28df
+				VF610_PAD_PTD30__NF_IO14	0x28df
+				VF610_PAD_PTD29__NF_IO13	0x28df
+				VF610_PAD_PTD28__NF_IO12	0x28df
+				VF610_PAD_PTD27__NF_IO11	0x28df
+				VF610_PAD_PTD26__NF_IO10	0x28df
+				VF610_PAD_PTD25__NF_IO9		0x28df
+				VF610_PAD_PTD24__NF_IO8		0x28df
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
 				VF610_PAD_PTB0__FTM0_CH0		0x1582
@@ -274,6 +301,26 @@
 	};
 };
 
+&nfc {
+	assigned-clocks = <&clks VF610_CLK_NFC>;
+	assigned-clock-rates = <33000000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_nfc>;
+	status = "okay";
+
+	nand@0 {
+		compatible = "fsl,vf610-nfc-nandcs";
+		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		nand-bus-width = <16>;
+		nand-ecc-mode = "hw";
+		nand-ecc-strength = <24>;
+		nand-ecc-step-size = <2048>;
+		nand-on-flash-bbt;
+	};
+};
+
 &pwm0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pwm0>;
diff --git a/arch/arm/boot/dts/vfxxx.dtsi b/arch/arm/boot/dts/vfxxx.dtsi
index 6865137..6736bae 100644
--- a/arch/arm/boot/dts/vfxxx.dtsi
+++ b/arch/arm/boot/dts/vfxxx.dtsi
@@ -564,6 +564,17 @@
 				status = "disabled";
 			};
 
+			nfc: nand@400e0000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "fsl,vf610-nfc";
+				reg = <0x400e0000 0x4000>;
+				interrupts = <83 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks VF610_CLK_NFC>;
+				clock-names = "nfc";
+				status = "disabled";
+			};
+
 			i2c2: i2c@400e6000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
-- 
2.6.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
