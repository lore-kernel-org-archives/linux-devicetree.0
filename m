From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH 3/3] ARM64: dts: meson-gxl: add support for the Khadas VIM board
Date: Sat,  4 Mar 2017 22:51:26 +0100
Message-ID: <20170304215126.7020-4-martin.blumenstingl@googlemail.com>
References: <20170304215126.7020-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170304215126.7020-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, afaerber-l3A5Bk7waGM@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, gouwa-GEqbEQZgqepWk0Htik3J/w@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Khadas VIM series consists of two boards which are almost
identical:
They are both using the same GXL S905X SoC, 100Mbit/s ethernet
(through the SoC-internal PHY), 2GB DDR3 memory, a micro-SD card slot,
onboard eMMC, Broadcom based SDIO WIFI, 2x USB A and 1x USB Type-C (the
latter with OTG support). The red LED is driven by PWM_AO_B (which
allows dimming), while the blue LED is managed by the firmware.
The differences are:
- the VIM Pro has a 16GB eMMC module, while the VIM only has 8GB
- the VIM Pro uses an AP6255 a/b/g/n/ac WIFI module, while the VIM comes
  with an AP6212 b/g/n SDIO WIFI module
 (the Vim uses an 8GB eMMC module, while

The boards are based on Amlogic's GXL S905X P212 reference design, which
is why most of the functionality (all MMC controllers and power
sequences, IR remote input, the main UART, ADC and ethernet) is simply
inherited from meson-gxl-s905x-p212.dtsi.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 arch/arm64/boot/dts/amlogic/Makefile               |   1 +
 .../dts/amlogic/meson-gxl-s905x-khadas-vim.dts     | 114 +++++++++++++++++++++
 2 files changed, 115 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 3f94bce33b7f..6a316f863d73 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -7,6 +7,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-vega-s95-meta.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-vega-s95-telos.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-wetek-hub.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-wetek-play2.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-khadas-vim.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-p212.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-p230.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-p231.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
new file mode 100644
index 000000000000..3c8b0b51ef27
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
@@ -0,0 +1,114 @@
+/*
+ * Copyright (c) 2017 Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>.
+ *
+ * SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/input/input.h>
+
+#include "meson-gxl-s905x-p212.dtsi"
+
+/ {
+	compatible = "khadas,vim", "amlogic,s905x", "amlogic,meson-gxl";
+	model = "Khadas VIM";
+
+	adc-keys {
+		compatible = "adc-keys";
+		io-channels = <&saradc 0>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1710000>;
+
+		button-function {
+			label = "Function";
+			linux,code = <KEY_FN>;
+			press-threshold-microvolt = <10000>;
+		};
+	};
+
+	aliases {
+		serial2 = &uart_AO_B;
+	};
+
+	gpio-keys-polled {
+		compatible = "gpio-keys-polled";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		poll-interval = <100>;
+
+		button@0 {
+			label = "power";
+			linux,code = <KEY_POWER>;
+			gpios = <&gpio_ao GPIOAO_2 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	pwmleds {
+		compatible = "pwm-leds";
+
+		power {
+			label = "vim:red:power";
+			pwms = <&pwm_AO_ab 1 7812500 0>;
+			max-brightness = <255>;
+			linux,default-trigger = "default-on";
+		};
+	};
+};
+
+&i2c_A {
+	status = "okay";
+	pinctrl-0 = <&i2c_a_pins>;
+	pinctrl-names = "default";
+};
+
+&i2c_B {
+	status = "okay";
+	pinctrl-0 = <&i2c_b_pins>;
+	pinctrl-names = "default";
+
+	rtc: rtc@51 {
+		/* has to be enabled manually when a battery is connected: */
+		status = "disabled";
+		compatible = "haoyu,hym8563";
+		reg = <0x51>;
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		clock-output-names = "xin32k";
+	};
+};
+
+&ir {
+	linux,rc-map-name = "rc-geekbox";
+};
+
+&pwm_AO_ab {
+	status = "okay";
+	pinctrl-0 = <&pwm_ao_a_3_pins>, <&pwm_ao_b_pins>;
+	pinctrl-names = "default";
+	clocks = <&clkc CLKID_FCLK_DIV4>;
+	clock-names = "clkin0";
+};
+
+&pwm_ef {
+	pinctrl-0 = <&pwm_e_pins>, <&pwm_f_clk_pins>;
+};
+
+&sd_emmc_a {
+	brcmf: bcrmf@1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+	};
+};
+
+/* This is brought out on the Linux_RX (18) and Linux_TX (19) pins: */
+&uart_AO {
+	status = "okay";
+};
+
+/* This is brought out on the UART_RX_AO_B (15) and UART_TX_AO_B (16) pins: */
+&uart_AO_B {
+	status = "okay";
+	pinctrl-0 = <&uart_ao_b_pins>;
+	pinctrl-names = "default";
+};
-- 
2.12.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
