From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 4/4] arm: dts: Common Black/White Beaglebone DTS using quirks
Date: Wed, 18 Feb 2015 16:59:36 +0200
Message-ID: <1424271576-1952-5-git-send-email-pantelis.antoniou@konsulko.com>
References: <1424271576-1952-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424271576-1952-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

A common DTS for both beaglebone white/black, using DT quirks
for board selection at runtime.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 arch/arm/boot/dts/Makefile            |   3 +-
 arch/arm/boot/dts/am335x-bone-all.dts | 157 ++++++++++++++++++++++++++++++++++
 2 files changed, 159 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/am335x-bone-all.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index e8ce368..fade89b 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -359,7 +359,8 @@ dtb-$(CONFIG_SOC_AM33XX) += am335x-base0033.dtb \
 	am335x-evmsk.dtb \
 	am335x-nano.dtb \
 	am335x-pepper.dtb \
-	am335x-lxm.dtb
+	am335x-lxm.dtb \
+	am335x-bone-all.dtb
 dtb-$(CONFIG_ARCH_OMAP4) += omap4-duovero-parlor.dtb \
 	omap4-panda.dtb \
 	omap4-panda-a4.dtb \
diff --git a/arch/arm/boot/dts/am335x-bone-all.dts b/arch/arm/boot/dts/am335x-bone-all.dts
new file mode 100644
index 0000000..1f96903
--- /dev/null
+++ b/arch/arm/boot/dts/am335x-bone-all.dts
@@ -0,0 +1,157 @@
+/*
+ */
+/dts-v1/;
+
+#include "am33xx.dtsi"
+#include "am335x-bone-common.dtsi"
+
+/* XXX boneblack */
+
+/ {
+	model = "TI AM335x BeagleBone White/Black";
+	compatible = "ti,am335x-bone", "ti,am33xx";
+
+	beaglebone-quirks {
+		compatible = "ti,am33xx-bone-quirk";
+		status = "okay";
+
+		revs {
+			white {
+				board-id = "A335BONE";
+				board-apply = <&bonewhite>;
+			};
+			black {
+				board-id = "A335BNLT";
+				board-apply = <&boneblack>;
+				options {
+					no-emmc = <0 &black_enable_emmc>;
+					no-hdmi = <0 &black_enable_hdmi>;
+				};
+			};
+		};
+
+		overlays {
+			bonewhite: bonewhite {
+				fragment@0 {
+					target = <&ldo3_reg>;
+					__overlay__ {
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <3300000>;
+						regulator-always-on;
+					};
+				};
+				fragment@1 {
+					target = <&mmc1>;
+					__overlay__ {
+						vmmc-supply = <&ldo3_reg>;
+					};
+				};
+				fragment@2 {
+					target = <&sham>;
+					__overlay__ {
+						status = "okay";
+					};
+				};
+				fragment@3 {
+					target = <&aes>;
+					__overlay__ {
+						status = "okay";
+					};
+				};
+			};
+
+			boneblack: boneblack {
+				fragment@0 {
+					target = <&ldo3_reg>;
+					__overlay__ {
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <1800000>;
+						regulator-always-on;
+					};
+				};
+				fragment@1 {
+					target = <&mmc1>;
+					__overlay__ {
+						vmmc-supply = <&vmmcsd_fixed>;
+					};
+				};
+				fragment@6 {
+					target = <&rtc>;
+					__overlay__ {
+						system-power-controller;
+					};
+				};
+			};
+
+			black_enable_hdmi: black_hdmi {
+				fragment@0 {
+					target = <&am33xx_pinmux>;
+					__overlay__ {
+						nxp_hdmi_bonelt_pins: nxp_hdmi_bonelt_pins {
+							pinctrl-single,pins = <
+								0x1b0 0x03      /* xdma_event_intr0, OMAP_MUX_MODE3 | AM33XX_PIN_OUTPUT */
+								0xa0 0x08       /* lcd_data0.lcd_data0, OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT | AM33XX_PULL_DISA */
+								0xa4 0x08       /* lcd_data1.lcd_data1, OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT | AM33XX_PULL_DISA */
+								0xa8 0x08       /* lcd_data2.lcd_data2, OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT | AM33XX_PULL_DISA */
+								0xac 0x08       /* lcd_data3.lcd_data3, OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT | AM33XX_PULL_DISA */
+								0xb0 0x08       /* lcd_data4.lcd_data4, OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT | AM33XX_PULL_DISA */
+								0xb4 0x08       /* lcd_data5.lcd_data5, OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT | AM33XX_PULL_DISA */
+								0xb8 0x08       /* lcd_data6.lcd_data6, OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT | AM33XX_PULL_DISA */
+								0xbc 0x08       /* lcd_data7.lcd_data7, OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT | AM33XX_PULL_DISA */
+								0xc0 0x08       /* lcd_data8.lcd_data8, OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT | AM33XX_PULL_DISA */
+								0xc4 0x08       /* lcd_data9.lcd_data9, OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT | AM33XX_PULL_DISA */
+								0xc8 0x08       /* lcd_data10.lcd_data10, OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT | AM33XX_PULL_DISA */
+								0xcc 0x08       /* lcd_data11.lcd_data11, OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT | AM33XX_PULL_DISA */
+								0xd0 0x08       /* lcd_data12.lcd_data12, OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT | AM33XX_PULL_DISA */
+								0xd4 0x08       /* lcd_data13.lcd_data13, OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT | AM33XX_PULL_DISA */
+								0xd8 0x08       /* lcd_data14.lcd_data14, OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT | AM33XX_PULL_DISA */
+								0xdc 0x08       /* lcd_data15.lcd_data15, OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT | AM33XX_PULL_DISA */
+								0xe0 0x00       /* lcd_vsync.lcd_vsync, OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT */
+								0xe4 0x00       /* lcd_hsync.lcd_hsync, OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT */
+								0xe8 0x00       /* lcd_pclk.lcd_pclk, OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT */
+								0xec 0x00       /* lcd_ac_bias_en.lcd_ac_bias_en, OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT */
+							>;
+						};
+						nxp_hdmi_bonelt_off_pins: nxp_hdmi_bonelt_off_pins {
+							pinctrl-single,pins = <
+								0x1b0 0x03      /* xdma_event_intr0, OMAP_MUX_MODE3 | AM33XX_PIN_OUTPUT */
+							>;
+						};
+					};
+				};
+				fragment@1 {
+					target-path = "/";
+					__overlay__ {
+						hdmi {
+							compatible = "ti,tilcdc,slave";
+							i2c = <&i2c0>;
+							pinctrl-names = "default", "off";
+							pinctrl-0 = <&nxp_hdmi_bonelt_pins>;
+							pinctrl-1 = <&nxp_hdmi_bonelt_off_pins>;
+							status = "okay";
+						};
+					};
+				};
+				fragment@2 {
+					target = <&lcdc>;
+					__overlay__ {
+						status = "okay";
+					};
+				};
+			};
+
+			black_enable_emmc: black_emmc {
+				fragment@0 {
+					target = <&mmc2>;
+					__overlay__ {
+						vmmc-supply = <&vmmcsd_fixed>;
+						pinctrl-names = "default";
+						pinctrl-0 = <&emmc_pins>;
+						bus-width = <8>;
+						status = "okay";
+					};
+				};
+			};
+		};
+	};
+};
-- 
1.7.12

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
