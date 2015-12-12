From: John Stultz <john.stultz@linaro.org>
Subject: [PATCH 2/2] devicetree: Add DTS file to support the Nexus7 2013 (flo) device.
Date: Fri, 11 Dec 2015 17:22:07 -0800
Message-ID: <1449883327-7423-2-git-send-email-john.stultz@linaro.org>
References: <1449883327-7423-1-git-send-email-john.stultz@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1449883327-7423-1-git-send-email-john.stultz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: John Stultz <john.stultz@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Vinay Simha BN <simhavcs@gmail.com>, devicetree@vger.kernel.org, Bjorn Andersson <bjorn.andersson@sonymobile.com>
List-Id: devicetree@vger.kernel.org

This patch adds a dts file to support the Nexus7 2013
device. Its based off of the qcom-apq8064-ifc6410.dts
which is similar hardware.

Also includes some comments and context folded in
from Vinay Simha BN <simhavcs@gmail.com>

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>
Cc: Russell King <linux@arm.linux.org.uk>
Cc: Vinay Simha BN <simhavcs@gmail.com>
Cc: devicetree@vger.kernel.org
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
v2: Included Bjorn's feedback. Patch applies against -next.

 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts | 276 +++++++++++++++++++++
 2 files changed, 277 insertions(+)
 create mode 100644 arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 0fe130e..2148c62 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -510,6 +510,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
 	qcom-apq8064-cm-qs600.dtb \
 	qcom-apq8064-ifc6410.dtb \
 	qcom-apq8064-sony-xperia-yuga.dtb \
+	qcom-apq8064-asus-nexus7-flo.dts \
 	qcom-apq8074-dragonboard.dtb \
 	qcom-apq8084-ifc6540.dtb \
 	qcom-apq8084-mtp.dtb \
diff --git a/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts b/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
new file mode 100644
index 0000000..c535b3f
--- /dev/null
+++ b/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
@@ -0,0 +1,276 @@
+#include "qcom-apq8064-v2.0.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+/ {
+	model = "Asus Nexus7(flo)";
+	compatible = "asus,nexus7-flo", "qcom,apq8064";
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
+	ext_3p3v: regulator-fixed@1 {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-name = "ext_3p3v";
+		regulator-type = "voltage";
+		startup-delay-us = <0>;
+		gpio = <&tlmm_pinmux 77 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		power {
+			label = "Power";
+			gpios = <&tlmm_pinmux 26 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_POWER>;
+			gpio-key,wakeup;
+		};
+		volume_up {
+			label = "Volume Up";
+			gpios = <&pm8921_gpio 4 GPIO_ACTIVE_HIGH>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+		volume_down {
+			label = "Volume Down";
+			gpios = <&pm8921_gpio 38 GPIO_ACTIVE_HIGH>;
+			linux,code = <KEY_VOLUMEDOWN>;
+		};
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
+				s1 {
+					regulator-always-on;
+					regulator-min-microvolt = <1225000>;
+					regulator-max-microvolt = <1225000>;
+					qcom,switch-mode-frequency = <3200000>;
+					bias-pull-down;
+				};
+
+				/* msm otg HSUSB_VDDCX */
+				s3 {
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
+				s4 {
+					regulator-min-microvolt	= <1800000>;
+					regulator-max-microvolt	= <1800000>;
+					qcom,switch-mode-frequency = <3200000>;
+					regulator-always-on;
+				};
+
+				s7 {
+					regulator-min-microvolt = <1300000>;
+					regulator-max-microvolt = <1300000>;
+					qcom,switch-mode-frequency = <3200000>;
+				};
+
+				/* mipi_dsi.1-dsi1_pll_vdda */
+				l2 {
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1200000>;
+				};
+
+				/* msm_otg-HSUSB_3p3 */
+				l3 {
+					regulator-min-microvolt = <3075000>;
+					regulator-max-microvolt = <3075000>;
+					bias-pull-down;
+				};
+
+				/* msm_otg-HSUSB_1p8 */
+				l4 {
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					bias-pull-down;
+				};
+
+				/* msm_sdcc.1-sdc_vdd */
+				l5 {
+					regulator-min-microvolt = <2950000>;
+					regulator-max-microvolt = <2950000>;
+					regulator-always-on;
+					bias-pull-down;
+				};
+
+				l6 {
+					regulator-min-microvolt = <2950000>;
+					regulator-max-microvolt = <2950000>;
+				};
+
+				/* mipi_dsi.1-dsi1_avdd */
+				l11 {
+					regulator-min-microvolt = <3000000>;
+					regulator-max-microvolt = <3000000>;
+					bias-pull-down;
+				};
+
+				/* pwm_power for backlight */
+				l17 {
+					regulator-min-microvolt = <3000000>;
+					regulator-max-microvolt = <3600000>;
+					bias-pull-down;
+				};
+
+				/* camera, qdsp6 */
+				l23 {
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					bias-pull-down;
+				};
+
+				/*
+				 * tabla2x-slim-CDC_VDDA_A_1P2V
+				 * tabla2x-slim-VDDD_CDC_D
+				 */
+				l25 {
+					regulator-min-microvolt = <1250000>;
+					regulator-max-microvolt = <1250000>;
+					bias-pull-down;
+				};
+
+				lvs1 {
+					bias-pull-down;
+				};
+
+				lvs4 {
+					bias-pull-down;
+				};
+
+				lvs5 {
+					bias-pull-down;
+				};
+
+				lvs6 {
+					bias-pull-down;
+				};
+				/*
+				 * mipi_dsi.1-dsi1_vddio
+				 * pil_riva-pll_vdd
+				 */
+				lvs7 {
+					bias-pull-down;
+				};
+			};
+		};
+
+		gsbi@16200000 {
+			status = "okay";
+			qcom,mode = <GSBI_PROT_I2C>;
+			i2c@16280000 {
+				status = "okay";
+				clock-frequency = <200000>;
+				pinctrl-0 = <&i2c3_pins>;
+				pinctrl-names = "default";
+
+				trackpad@10 {
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
+				eeprom@52 {
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
+		phy@12500000 {
+			status		= "okay";
+			vddcx-supply	= <&pm8921_s3>;
+			v3p3-supply	= <&pm8921_l3>;
+			v1p8-supply	= <&pm8921_l4>;
+		};
+
+		gadget@12500000 {
+			status = "okay";
+		};
+
+		/* OTG */
+		usb@12500000 {
+			status = "okay";
+		};
+
+		amba {
+			/* eMMC */
+			sdcc@12400000 {
+				status = "okay";
+				vmmc-supply = <&pm8921_l5>;
+				vqmmc-supply = <&pm8921_s4>;
+			};
+		};
+	};
+};
-- 
1.9.1
