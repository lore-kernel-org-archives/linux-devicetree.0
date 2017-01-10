From: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Subject: [PATCH v6 1/2] ARM: dts: at91: add devicetree for the Axentia TSE-850
Date: Tue, 10 Jan 2017 14:18:33 +0100
Message-ID: <1484054314-6244-2-git-send-email-peda@axentia.se>
References: <1484054314-6244-1-git-send-email-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1484054314-6244-1-git-send-email-peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The Axentia TSE-850 is a SAMA5D3-based device designed to generate
FM subcarrier signals.

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/axentia.txt |  19 ++
 MAINTAINERS                                       |   8 +
 arch/arm/boot/dts/Makefile                        |   1 +
 arch/arm/boot/dts/at91-linea.dtsi                 |  49 ++++
 arch/arm/boot/dts/at91-tse850-3.dts               | 274 ++++++++++++++++++++++
 5 files changed, 351 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/axentia.txt
 create mode 100644 arch/arm/boot/dts/at91-linea.dtsi
 create mode 100644 arch/arm/boot/dts/at91-tse850-3.dts

diff --git a/Documentation/devicetree/bindings/arm/axentia.txt b/Documentation/devicetree/bindings/arm/axentia.txt
new file mode 100644
index 000000000000..ea3fb96ae465
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/axentia.txt
@@ -0,0 +1,19 @@
+Device tree bindings for Axentia ARM devices
+============================================
+
+Linea CPU module
+----------------
+
+Required root node properties:
+compatible = "axentia,linea",
+	     "atmel,sama5d31", "atmel,sama5d3", "atmel,sama5";
+and following the rules from atmel-at91.txt for a sama5d31 SoC.
+
+
+TSE-850 v3 board
+----------------
+
+Required root node properties:
+compatible = "axentia,tse850v3", "axentia,linea",
+	     "atmel,sama5d31", "atmel,sama5d3", "atmel,sama5";
+and following the rules from above for the axentia,linea CPU module.
diff --git a/MAINTAINERS b/MAINTAINERS
index 97b78cc5aa51..5c2ea6e9cd7f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2346,6 +2346,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/axentia,*
 F:	sound/soc/atmel/tse850-pcm5142.c
 
+AXENTIA ARM DEVICES
+M:	Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
+L:	linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/arm/axentia.txt
+F:	arch/arm/boot/dts/at91-linea.dtsi
+F:	arch/arm/boot/dts/at91-tse850-3.dts
+
 AZ6007 DVB DRIVER
 M:	Mauro Carvalho Chehab <mchehab-JsYNTwtnfakRB7SZvlqPiA@public.gmane.org>
 M:	Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 9a7375c388a8..7632849866de 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -48,6 +48,7 @@ dtb-$(CONFIG_SOC_SAM_V7) += \
 	at91-kizbox2.dtb \
 	at91-sama5d2_xplained.dtb \
 	at91-sama5d3_xplained.dtb \
+	at91-tse850-3.dtb \
 	sama5d31ek.dtb \
 	sama5d33ek.dtb \
 	sama5d34ek.dtb \
diff --git a/arch/arm/boot/dts/at91-linea.dtsi b/arch/arm/boot/dts/at91-linea.dtsi
new file mode 100644
index 000000000000..0721c8472509
--- /dev/null
+++ b/arch/arm/boot/dts/at91-linea.dtsi
@@ -0,0 +1,49 @@
+/*
+ * at91-linea.dtsi - Device Tree Include file for the Axentia Linea Module.
+ *
+ * Copyright (C) 2017 Axentia Technologies AB
+ *
+ * Author: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
+ *
+ * Licensed under GPLv2 or later.
+ */
+
+#include "sama5d31.dtsi"
+
+/ {
+	compatible = "axentia,linea",
+		     "atmel,sama5d31", "atmel,sama5d3", "atmel,sama5";
+
+	memory {
+		reg = <0x20000000 0x4000000>;
+	};
+};
+
+&slow_xtal {
+	clock-frequency = <32768>;
+};
+
+&main_xtal {
+	clock-frequency = <12000000>;
+};
+
+&i2c0 {
+	status = "okay";
+
+	eeprom@51 {
+		compatible = "st,24c64";
+		reg = <0x51>;
+		pagesize = <32>;
+	};
+};
+
+&nand0 {
+	status = "okay";
+
+	nand-bus-width = <8>;
+	nand-ecc-mode = "hw";
+	atmel,has-pmecc;
+	atmel,pmecc-cap = <4>;
+	atmel,pmecc-sector-size = <512>;
+	nand-on-flash-bbt;
+};
diff --git a/arch/arm/boot/dts/at91-tse850-3.dts b/arch/arm/boot/dts/at91-tse850-3.dts
new file mode 100644
index 000000000000..669a2c6bdefc
--- /dev/null
+++ b/arch/arm/boot/dts/at91-tse850-3.dts
@@ -0,0 +1,274 @@
+/*
+ * at91-tse850-3.dts - Device Tree file for the Axentia TSE-850 3.0 board
+ *
+ * Copyright (C) 2017 Axentia Technologies AB
+ *
+ * Author: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
+ *
+ * Licensed under GPLv2 or later.
+ */
+/dts-v1/;
+#include <dt-bindings/pwm/pwm.h>
+#include "at91-linea.dtsi"
+
+/ {
+	model = "Axentia TSE-850 3.0";
+	compatible = "axentia,tse850v3", "axentia,linea",
+		     "atmel,sama5d31", "atmel,sama5d3", "atmel,sama5";
+
+	ahb {
+		apb {
+			pinctrl@fffff200 {
+				tse850 {
+					pinctrl_usba_vbus: usba-vbus {
+						atmel,pins =
+							<AT91_PIOC 31
+							 AT91_PERIPH_GPIO
+							 AT91_PINCTRL_DEGLITCH>;
+					};
+				};
+			};
+
+			watchdog@fffffe40 {
+				status = "okay";
+			};
+		};
+	};
+
+	sck: oscillator {
+		compatible = "fixed-clock";
+
+		#clock-cells = <0>;
+		clock-frequency = <16000000>;
+		clock-output-names = "sck";
+	};
+
+	reg_3v3: regulator {
+		compatible = "regulator-fixed";
+
+		regulator-name = "3v3-supply";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	ana: reg-ana {
+		compatible = "pwm-regulator";
+
+		regulator-name = "ANA";
+
+		pwms = <&pwm0 2 1000 PWM_POLARITY_INVERTED>;
+		pwm-dutycycle-unit = <1000>;
+		pwm-dutycycle-range = <100 1000>;
+
+		regulator-min-microvolt = <2000000>;
+		regulator-max-microvolt = <20000000>;
+		regulator-ramp-delay = <1000>;
+	};
+
+	sound {
+		compatible = "axentia,tse850-pcm5142";
+
+		axentia,cpu-dai = <&ssc0>;
+		axentia,audio-codec = <&pcm5142>;
+
+		axentia,add-gpios = <&pioA 8 GPIO_ACTIVE_LOW>;
+		axentia,loop1-gpios = <&pioA 10 GPIO_ACTIVE_LOW>;
+		axentia,loop2-gpios = <&pioA 11 GPIO_ACTIVE_LOW>;
+
+		axentia,ana-supply = <&ana>;
+	};
+
+	dac: dpot-dac {
+		compatible = "dpot-dac";
+		vref-supply = <&reg_3v3>;
+		io-channels = <&dpot 0>;
+		io-channel-names = "dpot";
+		#io-channel-cells = <1>;
+	};
+
+	envelope-detector {
+		compatible = "axentia,tse850-envelope-detector";
+		io-channels = <&dac 0>;
+		io-channel-names = "dac";
+
+		interrupt-parent = <&pioA>;
+		interrupts = <3 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "comp";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		ch1-red {
+			label = "ch-1:red";
+			gpios = <&pioA 23 GPIO_ACTIVE_LOW>;
+		};
+		ch1-green {
+			label = "ch-1:green";
+			gpios = <&pioA 22 GPIO_ACTIVE_LOW>;
+		};
+		ch2-red {
+			label = "ch-2:red";
+			gpios = <&pioA 21 GPIO_ACTIVE_LOW>;
+		};
+		ch2-green {
+			label = "ch-2:green";
+			gpios = <&pioA 20 GPIO_ACTIVE_LOW>;
+		};
+		data-red {
+			label = "data:red";
+			gpios = <&pioA 19 GPIO_ACTIVE_LOW>;
+		};
+		data-green {
+			label = "data:green";
+			gpios = <&pioA 18 GPIO_ACTIVE_LOW>;
+		};
+		alarm-red {
+			label = "alarm:red";
+			gpios = <&pioA 17 GPIO_ACTIVE_LOW>;
+		};
+		alarm-green {
+			label = "alarm:green";
+			gpios = <&pioA 16 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
+
+&nand0 {
+	at91bootstrap@0 {
+		label = "at91bootstrap";
+		reg = <0x0 0x40000>;
+	};
+
+	barebox@40000 {
+		label = "bootloader";
+		reg = <0x40000 0x60000>;
+	};
+
+	bareboxenv@c0000 {
+		label = "bareboxenv";
+		reg = <0xc0000 0x40000>;
+	};
+
+	bareboxenv2@100000 {
+		label = "bareboxenv2";
+		reg = <0x100000 0x40000>;
+	};
+
+	oftree@180000 {
+		label = "oftree";
+		reg = <0x180000 0x20000>;
+	};
+
+	kernel@200000 {
+		label = "kernel";
+		reg = <0x200000 0x500000>;
+	};
+
+	rootfs@800000 {
+		label = "rootfs";
+		reg = <0x800000 0x0f800000>;
+	};
+
+	ovlfs@10000000 {
+		label = "ovlfs";
+		reg = <0x10000000 0x10000000>;
+	};
+};
+
+&ssc0 {
+	#sound-dai-cells = <0>;
+
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+
+	jc42@18 {
+		compatible = "nxp,se97b", "jedec,jc-42.4-temp";
+		reg = <0x18>;
+	};
+
+	dpot: mcp4651-104@28 {
+		compatible = "microchip,mcp4651-104";
+		reg = <0x28>;
+		#io-channel-cells = <1>;
+	};
+
+	pcm5142: pcm5142@4c {
+		compatible = "ti,pcm5142";
+
+		reg = <0x4c>;
+
+		AVDD-supply = <&reg_3v3>;
+		DVDD-supply = <&reg_3v3>;
+		CPVDD-supply = <&reg_3v3>;
+
+		clocks = <&sck>;
+
+		pll-in = <3>;
+		pll-out = <6>;
+	};
+
+	eeprom@50 {
+		compatible = "nxp,24c02";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
+};
+
+&usart0 {
+	status = "okay";
+
+	atmel,use-dma-rx;
+};
+
+&pwm0 {
+	status = "okay";
+
+	pinctrl-0 = <&pinctrl_pwm0_pwml2_1>;
+	pinctrl-names = "default";
+};
+
+&macb1 {
+	status = "okay";
+
+	phy-mode = "rgmii";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	phy0: ethernet-phy@3 {
+		reg = <3>;
+
+		interrupt-parent = <&pioE>;
+		interrupts = <31 IRQ_TYPE_EDGE_FALLING>;
+	};
+};
+
+&usb0 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usba_vbus>;
+	atmel,vbus-gpio = <&pioC 31 GPIO_ACTIVE_HIGH>;
+};
+
+&usb1 {
+	status = "okay";
+
+	num-ports = <1>;
+	atmel,vbus-gpio = <&pioD 29 GPIO_ACTIVE_HIGH>;
+	atmel,oc-gpio = <&pioC 15 GPIO_ACTIVE_LOW>;
+};
+
+&usb2 {
+	status = "okay";
+};
+
+&dbgu {
+	status = "okay";
+
+	dmas = <0>, <0>;	/*  Do not use DMA for dbgu */
+};
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
