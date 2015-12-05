From: John Stultz <john.stultz@linaro.org>
Subject: [RFC][PATCH] devicetree: Add DTS file to support the Nexus7 2013 (flo) device.
Date: Fri,  4 Dec 2015 20:36:02 -0800
Message-ID: <1449290162-4485-1-git-send-email-john.stultz@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: John Stultz <john.stultz@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Vinay Simha BN <simhavcs@gmail.com>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds a dts file to support the Nexus7 2013
device. Its based off of the qcom-apq8064-ifc6410.dts
which is similar hardware.

Also includes some comments and context folded in
from Vinay Simha BN <simhavcs@gmail.com>

This is my first DTS submission, so thoughts or feedback
on would be appreciated.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>
Cc: Russell King <linux@arm.linux.org.uk>
Cc: Vinay Simha BN <simhavcs@gmail.com>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: devicetree@vger.kernel.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/qcom-apq8064-nexus7-flo.dts | 306 ++++++++++++++++++++++++++
 arch/arm/boot/dts/qcom-apq8064.dtsi           |   2 +
 3 files changed, 309 insertions(+)
 create mode 100644 arch/arm/boot/dts/qcom-apq8064-nexus7-flo.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 30bbc37..c0f9076a 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -502,6 +502,7 @@ dtb-$(CONFIG_ARCH_PRIMA2) += \
 dtb-$(CONFIG_ARCH_QCOM) += \
 	qcom-apq8064-cm-qs600.dtb \
 	qcom-apq8064-ifc6410.dtb \
+	qcom-apq8064-nexus7-flo.dtb \
 	qcom-apq8074-dragonboard.dtb \
 	qcom-apq8084-ifc6540.dtb \
 	qcom-apq8084-mtp.dtb \
diff --git a/arch/arm/boot/dts/qcom-apq8064-nexus7-flo.dts b/arch/arm/boot/dts/qcom-apq8064-nexus7-flo.dts
new file mode 100644
index 0000000..5183d18
--- /dev/null
+++ b/arch/arm/boot/dts/qcom-apq8064-nexus7-flo.dts
@@ -0,0 +1,306 @@
+#include "qcom-apq8064-v2.0.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+/ {
+	model = "Qualcomm APQ8064/Nexus7(flo)";
+	compatible = "qcom,apq8064-nexus7-flo", "qcom,apq8064";
+
+	aliases {
+		serial0 = &gsbi7_serial;
+		serial1 = &gsbi6_serial;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	soc {
+		rpm@108000 {
+			regulators {
+				vdd_l1_l2_l12_l18-supply = <&pm8921_s4>;
+				vin_lvs1_3_6-supply = <&pm8921_s4>;
+				vin_lvs4_5_7-supply = <&pm8921_s4>;
+
+
+				vdd_l24-supply = <&pm8921_s1>;
+				vdd_l25-supply = <&pm8921_s1>;
+				vin_lvs2-supply = <&pm8921_s1>;
+
+				vdd_l26-supply = <&pm8921_s7>;
+				vdd_l27-supply = <&pm8921_s7>;
+				vdd_l28-supply = <&pm8921_s7>;
+
+				vdd_ncp-supply = <&pm8921_l6>;
+
+				/* Buck SMPS */
+				pm8921_s1: s1 {
+					regulator-always-on;
+					regulator-min-microvolt = <1225000>;
+					regulator-max-microvolt = <1225000>;
+					qcom,switch-mode-frequency = <3200000>;
+					bias-pull-down;
+				};
+
+				/* msm otg HSUSB_VDDCX */
+				pm8921_s3: s3 {
+					regulator-min-microvolt = <500000>;
+					regulator-max-microvolt = <1150000>;
+					qcom,switch-mode-frequency = <4800000>;
+				};
+
+				/*
+				 * msm_sdcc.1-sdc-vdd_io
+				 * tabla2x-slim-CDC_VDDA_RX
+				 * tabla2x-slim-CDC_VDDA_TX
+				 * tabla2x-slim-CDC_VDD_CP
+				 * tabla2x-slim-VDDIO_CDC
+				 */
+				pm8921_s4: s4 {
+					regulator-min-microvolt	= <1800000>;
+					regulator-max-microvolt	= <1800000>;
+					qcom,switch-mode-frequency = <3200000>;
+					regulator-always-on;
+				};
+
+				pm8921_s7: s7 {
+					regulator-min-microvolt = <1300000>;
+					regulator-max-microvolt = <1300000>;
+					qcom,switch-mode-frequency = <3200000>;
+				};
+
+				/* mipi_dsi.1-dsi1_pll_vdda */
+				pm8921_l2: l2 {
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1200000>;
+				};
+
+				/* msm_otg-HSUSB_3p3 */
+				pm8921_l3: l3 {
+					regulator-min-microvolt = <3075000>;
+					regulator-max-microvolt = <3075000>;
+					bias-pull-down;
+				};
+
+				/* msm_otg-HSUSB_1p8 */
+				pm8921_l4: l4 {
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					bias-pull-down;
+				};
+
+				/* msm_sdcc.1-sdc_vdd */
+				pm8921_l5: l5 {
+					regulator-min-microvolt = <2950000>;
+					regulator-max-microvolt = <2950000>;
+					regulator-always-on;
+					bias-pull-down;
+				};
+
+				pm8921_l6: l6 {
+					regulator-min-microvolt = <2950000>;
+					regulator-max-microvolt = <2950000>;
+				};
+
+				/* mipi_dsi.1-dsi1_avdd */
+				pm8921_l11: l11 {
+					regulator-min-microvolt = <3000000>;
+					regulator-max-microvolt = <3000000>;
+					bias-pull-down;
+				};
+
+				/* pwm_power for backlight */
+				pm8921_l17: l17 {
+					regulator-min-microvolt = <3000000>;
+					regulator-max-microvolt = <3600000>;
+					bias-pull-down;
+				};
+
+				/* camera, qdsp6 */
+				pm8921_l23: l23 {
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					bias-pull-down;
+				};
+
+				/*
+				 * tabla2x-slim-CDC_VDDA_A_1P2V
+				 * tabla2x-slim-VDDD_CDC_D
+				 */
+				pm8921_l25: l25 {
+					regulator-min-microvolt = <1250000>;
+					regulator-max-microvolt = <1250000>;
+					bias-pull-down;
+				};
+
+				pm8921_lvs1: lvs1 {
+					bias-pull-down;
+				};
+
+				pm8921_lvs4: lvs4 {
+					bias-pull-down;
+				};
+
+				pm8921_lvs5: lvs5 {
+					bias-pull-down;
+				};
+
+				pm8921_lvs6: lvs6 {
+					bias-pull-down;
+				};
+				/*
+				 * mipi_dsi.1-dsi1_vddio
+				 * pil_riva-pll_vdd
+				 */
+				pm8921_lvs7: lvs7 {
+					bias-pull-down;
+				};
+			};
+		};
+
+		ext_3p3v: regulator-fixed@1 {
+			compatible = "regulator-fixed";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-name = "ext_3p3v";
+			regulator-type = "voltage";
+			startup-delay-us = <0>;
+			gpio = <&tlmm_pinmux 77 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+			regulator-boot-on;
+		};
+
+		gsbi3: gsbi@16200000 {
+			status = "okay";
+			qcom,mode = <GSBI_PROT_I2C>;
+			i2c3: i2c@16280000 {
+				status = "okay";
+				clock-frequency = <200000>;
+				pinctrl-0 = <&i2c3_pins>;
+				pinctrl-names = "default";
+
+				trackpad: trackpad@10 {
+					compatible = "elan,ekth3500";
+					reg = <0x10>;
+					interrupt-parent = <&tlmm_pinmux>;
+					interrupts = <6 IRQ_TYPE_EDGE_FALLING>;
+				};
+			};
+		};
+
+
+		gsbi@12440000 {
+			status = "okay";
+			qcom,mode = <GSBI_PROT_I2C>;
+
+			i2c@12460000 {
+				status = "okay";
+				clock-frequency = <200000>;
+				pinctrl-0 = <&i2c1_pins>;
+				pinctrl-names = "default";
+
+				eeprom: eeprom@52 {
+					compatible = "atmel,24c128";
+					reg = <0x52>;
+					pagesize = <32>;
+				};
+			};
+		};
+
+		gsbi@16500000 {
+			status = "ok";
+			qcom,mode = <GSBI_PROT_I2C_UART>;
+
+			serial@16540000 {
+				status = "ok";
+
+				pinctrl-names = "default";
+				pinctrl-0 = <&gsbi6_uart_4pins>;
+			};
+		};
+
+		gsbi@16600000 {
+			status = "ok";
+			qcom,mode = <GSBI_PROT_I2C_UART>;
+			serial@16640000 {
+				status = "ok";
+			};
+		};
+
+		/* OTG */
+		usb1_phy: phy@12500000 {
+			status		= "okay";
+			vddcx-supply	= <&pm8921_s3>;
+			v3p3-supply	= <&pm8921_l3>;
+			v1p8-supply	= <&pm8921_l4>;
+		};
+
+		usb3_phy: phy@12520000 {
+			status		= "okay";
+			vddcx-supply	= <&pm8921_s3>;
+			v3p3-supply	= <&pm8921_l3>;
+			v1p8-supply	= <&pm8921_l23>;
+		};
+
+		usb4_phy: phy@12530000 {
+			status		= "okay";
+			vddcx-supply	= <&pm8921_s3>;
+			v3p3-supply	= <&pm8921_l3>;
+			v1p8-supply	= <&pm8921_l23>;
+		};
+
+		gadget1: gadget@12500000 {
+			status = "okay";
+		};
+
+		/* OTG */
+		usb1: usb@12500000 {
+			status = "okay";
+		};
+
+		usb3: usb@12520000 {
+			status = "okay";
+		};
+
+		usb4: usb@12530000 {
+			status = "okay";
+		};
+
+		amba {
+			/* eMMC */
+			sdcc1: sdcc@12400000 {
+				status = "okay";
+				vmmc-supply = <&pm8921_l5>;
+				vqmmc-supply = <&pm8921_s4>;
+			};
+
+			/* WLAN */
+			sdcc4: sdcc@121c0000 {
+				status = "okay";
+				vmmc-supply = <&ext_3p3v>;
+				vqmmc-supply = <&pm8921_lvs1>;
+			};
+		};
+
+		gpio-keys {
+			compatible = "gpio-keys";
+			power {
+				label = "Power";
+				gpios = <&tlmm_pinmux 26 GPIO_ACTIVE_LOW>;
+				linux,code = <KEY_POWER>;
+				gpio-key,wakeup;
+			};
+			volume_up {
+				label = "Volume Up";
+				gpios = <&pm8921_gpio 4 GPIO_ACTIVE_HIGH>;
+				linux,code = <KEY_VOLUMEUP>;
+			};
+			volume_down {
+				label = "Volume Down";
+				gpios = <&pm8921_gpio 38 GPIO_ACTIVE_HIGH>;
+				linux,code = <KEY_VOLUMEDOWN>;
+			};
+		};
+
+	};
+};
diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index a4c1762..d541438 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -288,6 +288,8 @@
 				clocks = <&gcc GSBI3_QUP_CLK>,
 					 <&gcc GSBI3_H_CLK>;
 				clock-names = "core", "iface";
+				#address-cells = <1>;
+				#size-cells = <0>;
 			};
 		};
 
-- 
1.9.1
