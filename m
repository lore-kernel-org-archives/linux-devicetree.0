From: John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
Subject: [PATCH 16/16] arm: dts: enable the nand device on the mt7623n nand rfb
Date: Mon, 23 Jan 2017 12:29:35 +0100
Message-ID: <1485170975-51813-17-git-send-email-john@phrozen.org>
References: <1485170975-51813-1-git-send-email-john@phrozen.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1485170975-51813-1-git-send-email-john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Enable the nand device and setup pinmux on the mt7632m rfb with nand
support.

Signed-off-by: John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
---
 arch/arm/boot/dts/mt7623n-rfb-nand.dts |   88 ++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/arm/boot/dts/mt7623n-rfb-nand.dts b/arch/arm/boot/dts/mt7623n-rfb-nand.dts
index 436d51c..9356095 100644
--- a/arch/arm/boot/dts/mt7623n-rfb-nand.dts
+++ b/arch/arm/boot/dts/mt7623n-rfb-nand.dts
@@ -19,3 +19,91 @@
 	model = "MediaTek MT7623N NAND reference board";
 	compatible = "mediatek,mt7623n-rfb-nand", "mediatek,mt7623";
 };
+
+&pio {
+	nand_pins_default: nanddefault {
+		pins_dat {
+			pinmux = <MT7623_PIN_111_MSDC0_DAT7_FUNC_NLD7>,
+				 <MT7623_PIN_112_MSDC0_DAT6_FUNC_NLD6>,
+				 <MT7623_PIN_114_MSDC0_DAT4_FUNC_NLD4>,
+				 <MT7623_PIN_118_MSDC0_DAT3_FUNC_NLD3>,
+				 <MT7623_PIN_121_MSDC0_DAT0_FUNC_NLD0>,
+				 <MT7623_PIN_120_MSDC0_DAT1_FUNC_NLD1>,
+				 <MT7623_PIN_113_MSDC0_DAT5_FUNC_NLD5>,
+				 <MT7623_PIN_115_MSDC0_RSTB_FUNC_NLD8>,
+				 <MT7623_PIN_119_MSDC0_DAT2_FUNC_NLD2>;
+			input-enable;
+			drive-strength = <MTK_DRIVE_8mA>;
+			bias-pull-up;
+		};
+
+		pins_we {
+			pinmux = <MT7623_PIN_117_MSDC0_CLK_FUNC_NWEB>;
+			drive-strength = <MTK_DRIVE_8mA>;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_10>;
+		};
+
+		pins_ale {
+			pinmux = <MT7623_PIN_116_MSDC0_CMD_FUNC_NALE>;
+			drive-strength = <MTK_DRIVE_8mA>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+		};
+	};
+};
+
+&nandc {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&nand_pins_default>;
+	nand@0 {
+		reg = <0>;
+		spare_per_sector = <64>;
+		nand-ecc-mode = "hw";
+		nand-ecc-strength = <12>;
+		nand-ecc-step-size = <1024>;
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "preloader";
+				reg = <0x0 0x40000>;
+			};
+
+			partition@40000 {
+				label = "uboot";
+				reg = <0x40000 0x80000>;
+			};
+
+			partition@C0000 {
+				label = "uboot-env";
+				reg = <0xC0000 0x40000>;
+			};
+
+			partition@140000 {
+				label = "bootimg";
+				reg = <0x140000 0x2000000>;
+			};
+
+			partition@2140000 {
+				label = "recovery";
+				reg = <0x2140000 0x2000000>;
+			};
+
+			partition@4140000 {
+				label = "rootfs";
+				reg = <0x4140000 0x1000000>;
+			};
+
+			partition@5140000 {
+				label = "usrdata";
+				reg = <0x5140000 0x1000000>;
+			};
+		};
+	};
+};
+
+&bch {
+	status = "okay";
+};
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
