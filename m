From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCH] ARM: dts: imx51: add support for Ka-Ro electronics TX51 modules
Date: Wed, 20 Jan 2016 13:23:39 +0100
Message-ID: <1453292619-3560-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
List-Id: devicetree@vger.kernel.org

The TX51-8xxx module series is a System On Module manufactured by
  Ka-Ro electronics GmbH with the following characteristics:
  Processor    Freescale i.MX515
                 up to 800 MHz (commercial)
                 up to 600 MHz (industrial)
  RAM          128/256MB mobile DDR-SDRAM
  ROM          128MB NAND Flash
  RTC          DS1339 Real Time Clock
  Power supply Single 3.1V to 5.5V
  Size         26mm SO-DIMM
  Temp. Range  0=C2=B0C..70=C2=B0C (-40=C2=B0C..85=C2=B0C)

Signed-off-by: Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
---
 arch/arm/boot/dts/Makefile       |   3 +-
 arch/arm/boot/dts/imx51-tx51.dts | 749 +++++++++++++++++++++++++++++++=
++++++++
 2 files changed, 751 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/imx51-tx51.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index a4a6d70..ea70f34 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -277,7 +277,8 @@ dtb-$(CONFIG_SOC_IMX51) +=3D \
 	imx51-babbage.dtb \
 	imx51-digi-connectcore-jsk.dtb \
 	imx51-eukrea-mbimxsd51-baseboard.dtb \
-	imx51-ts4800.dtb
+	imx51-ts4800.dtb \
+	imx51-tx51.dtb
 dtb-$(CONFIG_SOC_IMX53) +=3D \
 	imx53-ard.dtb \
 	imx53-m53evk.dtb \
diff --git a/arch/arm/boot/dts/imx51-tx51.dts b/arch/arm/boot/dts/imx51=
-tx51.dts
new file mode 100644
index 0000000..80c5d60
--- /dev/null
+++ b/arch/arm/boot/dts/imx51-tx51.dts
@@ -0,0 +1,749 @@
+/*
+ * Copyright 2012-2014 Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
+ *
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ */
+
+/dts-v1/;
+#include "imx51.dtsi"
+#include <dt-bindings/pwm/pwm.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	model =3D "Ka-Ro electronics TX51 module";
+	compatible =3D "karo,tx51", "fsl,imx51";
+
+	aliases {
+		backlight =3D &backlight;
+		display =3D &display;
+		i2c1 =3D &i2c_gpio;
+		usbotg =3D &usbotg;
+		wlan0 =3D &wlan0;
+	};
+
+	chosen {
+		stdout-path =3D &uart1;
+	};
+
+	backlight: pwm-backlight {
+		compatible =3D "pwm-backlight";
+		pwms =3D <&pwm1 0 500000 PWM_POLARITY_INVERTED>;
+		power-supply =3D <&reg_3v3>;
+		brightness-levels =3D <
+			  0  1  2  3  4  5  6  7  8  9
+			 10 11 12 13 14 15 16 17 18 19
+			 20 21 22 23 24 25 26 27 28 29
+			 30 31 32 33 34 35 36 37 38 39
+			 40 41 42 43 44 45 46 47 48 49
+			 50 51 52 53 54 55 56 57 58 59
+			 60 61 62 63 64 65 66 67 68 69
+			 70 71 72 73 74 75 76 77 78 79
+			 80 81 82 83 84 85 86 87 88 89
+			 90 91 92 93 94 95 96 97 98 99
+			100
+		>;
+		default-brightness-level =3D <50>;
+	};
+
+	clocks {
+		ckih1 {
+			clock-frequency =3D <0>;
+		};
+
+		mclk: clock@0 {
+			compatible =3D "fixed-clock";
+			reg =3D <0>;
+			#clock-cells =3D <0>;
+			clock-output-names =3D "mclk";
+			clock-frequency =3D <26000000>;
+		};
+
+		clk_26M: clock@1 {
+			compatible =3D "fixed-clock";
+			reg =3D <1>;
+			#clock-cells =3D <0>;
+			clock-output-names =3D "clk_26M";
+			clock-frequency =3D <26000000>;
+			gpios =3D <&gpio1 7 GPIO_ACTIVE_HIGH>;
+		};
+
+		wlan_ref_clk: wlan-ref-clk {
+			compatible =3D "ti,wilink-clock";
+			#clock-cells =3D <0>;
+			clock-frequency =3D <38400000>;
+		};
+	};
+
+	display: display@di0 {
+		compatible =3D "fsl,imx-parallel-display";
+		interface-pix-fmt =3D "rgb24";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_ipu_disp0>;
+
+		display-timings {
+			VGA {
+				clock-frequency =3D <25200000>;
+				hactive =3D <640>;
+				vactive =3D <480>;
+				hback-porch =3D <48>;
+				hsync-len =3D <96>;
+				hfront-porch =3D <16>;
+				vback-porch =3D <31>;
+				vsync-len =3D <2>;
+				vfront-porch =3D <12>;
+				hsync-active =3D <0>;
+				vsync-active =3D <0>;
+				de-active =3D <1>;
+				pixelclk-active =3D <0>;
+			};
+
+			ETV570 {
+				clock-frequency =3D <25200000>;
+				hactive =3D <640>;
+				vactive =3D <480>;
+				hback-porch =3D <114>;
+				hsync-len =3D <30>;
+				hfront-porch =3D <16>;
+				vback-porch =3D <32>;
+				vsync-len =3D <3>;
+				vfront-porch =3D <10>;
+				hsync-active =3D <0>;
+				vsync-active =3D <0>;
+				de-active =3D <1>;
+				pixelclk-active =3D <0>;
+			};
+
+			ET0350 {
+				clock-frequency =3D <6413760>;
+				hactive =3D <320>;
+				vactive =3D <240>;
+				hback-porch =3D <34>;
+				hsync-len =3D <34>;
+				hfront-porch =3D <20>;
+				vback-porch =3D <15>;
+				vsync-len =3D <3>;
+				vfront-porch =3D <4>;
+				hsync-active =3D <0>;
+				vsync-active =3D <0>;
+				de-active =3D <1>;
+				pixelclk-active =3D <0>;
+			};
+
+			ET0430 {
+				clock-frequency =3D <9009000>;
+				hactive =3D <480>;
+				vactive =3D <272>;
+				hback-porch =3D <2>;
+				hsync-len =3D <41>;
+				hfront-porch =3D <2>;
+				vback-porch =3D <2>;
+				vsync-len =3D <10>;
+				vfront-porch =3D <2>;
+				hsync-active =3D <0>;
+				vsync-active =3D <0>;
+				de-active =3D <1>;
+				pixelclk-active =3D <1>;
+			};
+
+			ET0500 {
+				clock-frequency =3D <33264000>;
+				hactive =3D <800>;
+				vactive =3D <480>;
+				hback-porch =3D <88>;
+				hsync-len =3D <128>;
+				hfront-porch =3D <40>;
+				vback-porch =3D <33>;
+				vsync-len =3D <2>;
+				vfront-porch =3D <10>;
+				hsync-active =3D <0>;
+				vsync-active =3D <0>;
+				de-active =3D <1>;
+				pixelclk-active =3D <0>;
+			};
+
+			ET0700 { /* same as ET0500 */
+				clock-frequency =3D <33264000>;
+				hactive =3D <800>;
+				vactive =3D <480>;
+				hback-porch =3D <88>;
+				hsync-len =3D <128>;
+				hfront-porch =3D <40>;
+				vback-porch =3D <33>;
+				vsync-len =3D <2>;
+				vfront-porch =3D <10>;
+				hsync-active =3D <0>;
+				vsync-active =3D <0>;
+				de-active =3D <1>;
+				pixelclk-active =3D <0>;
+			};
+
+			ETQ570 {
+				clock-frequency =3D <6596040>;
+				hactive =3D <320>;
+				vactive =3D <240>;
+				hback-porch =3D <38>;
+				hsync-len =3D <30>;
+				hfront-porch =3D <30>;
+				vback-porch =3D <16>;
+				vsync-len =3D <3>;
+				vfront-porch =3D <4>;
+				hsync-active =3D <0>;
+				vsync-active =3D <0>;
+				de-active =3D <1>;
+				pixelclk-active =3D <0>;
+			};
+		};
+
+		port {
+			display0_in: endpoint {
+				remote-endpoint =3D <&ipu_di0_disp0>;
+			};
+		};
+	};
+
+	i2c_gpio: i2c-gpio {
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+		compatible =3D "i2c-gpio";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_i2c_gpio>;
+		gpios =3D <&gpio4 17 0
+			 &gpio4 16 0>;
+		clock-frequency =3D <400000>;
+
+		rtc1: ds1339@68 {
+			compatible =3D "dallas,ds1339";
+			reg =3D <0x68>;
+		};
+	};
+
+	leds {
+		compatible =3D "gpio-leds";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_stk5led>;
+
+		user {
+			label =3D "Heartbeat";
+			gpios =3D <&gpio4 10 0 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger =3D "heartbeat";
+		};
+	};
+
+	regulators {
+		compatible =3D "simple-bus";
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+
+		reg_2v5: regulator@0 {
+			compatible =3D "regulator-fixed";
+			reg =3D <0>;
+			regulator-name =3D "2V5";
+			regulator-min-microvolt =3D <2500000>;
+			regulator-max-microvolt =3D <2500000>;
+			regulator-always-on;
+		};
+
+		reg_3v3: regulator@1 {
+			compatible =3D "regulator-fixed";
+			reg =3D <1>;
+			regulator-name =3D "3V3";
+			regulator-min-microvolt =3D <3300000>;
+			regulator-max-microvolt =3D <3300000>;
+			regulator-always-on;
+		};
+
+		reg_etn_phy: regulator@2 {
+			compatible =3D "regulator-fixed";
+			reg =3D <2>;
+			regulator-name =3D "ETN PHY Power";
+			regulator-min-microvolt =3D <3300000>;
+			regulator-max-microvolt =3D <3300000>;
+			gpio =3D <&gpio1 3 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+			regulator-boot-on;
+			regulator-always-on;
+		};
+
+		reg_lcd_pwr: regulator@5 {
+			compatible =3D "regulator-fixed";
+			reg =3D <5>;
+			regulator-name =3D "LCD POWER";
+			regulator-min-microvolt =3D <3300000>;
+			regulator-max-microvolt =3D <3300000>;
+			gpio =3D <&gpio4 14 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+			regulator-boot-on;
+			regulator-always-on;
+		};
+
+		reg_lcd_reset: regulator@6 {
+			compatible =3D "regulator-fixed";
+			reg =3D <6>;
+			regulator-name =3D "LCD RESET";
+			regulator-min-microvolt =3D <3300000>;
+			regulator-max-microvolt =3D <3300000>;
+			pinctrl-names =3D "default";
+			pinctrl-0 =3D <&pinctrl_lcd_reset>;
+			gpio =3D <&gpio4 13 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+			regulator-boot-on;
+			regulator-always-on;
+		};
+
+		reg_wlan0: regulator@9 {
+			compatible =3D "regulator-fixed";
+			reg =3D <8>;
+			regulator-name =3D "wlan0";
+			regulator-min-microvolt =3D <3300000>;
+			regulator-max-microvolt =3D <3300000>;
+			gpio =3D <&gpio4 15 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+		};
+	};
+
+	sound {
+		compatible =3D "karo,tx51-audio-sgtl5000", "fsl,imx-audio-sgtl5000";
+		model =3D "tx51-audio-sgtl5000";
+		ssi-controller =3D <&ssi1>;
+		audio-codec =3D <&sgtl5000>;
+		audio-routing =3D
+			"MIC_IN", "Mic Jack",
+			"Mic Jack", "Mic Bias",
+			"Headphone Jack", "HP_OUT";
+		/* '1' based port numbers according to datasheet names */
+		mux-int-port =3D <1>;
+		mux-ext-port =3D <3>;
+	};
+
+	usbphy {
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+		compatible =3D "simple-bus";
+
+		usbh1phy: usbphy@0 {
+			compatible =3D "usb-nop-xceiv";
+			reg =3D <0>;
+			clocks =3D <&clk_26M>;
+			clock-names =3D "main_clk";
+		};
+	};
+
+	wlan0: tiwi-ble {
+		compatible =3D "ti,wilink6";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_wlan0>;
+		clocks =3D <&wlan_ref_clk>;
+		clock-names =3D "refclock";
+		interrupt-parent =3D <&gpio1>;
+		interrupts =3D <5 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
+&audmux {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_ssi1>;
+	status =3D "okay";
+};
+
+&ecspi1 {
+	fsl,spi-num-chipselects =3D <2>;
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_ecspi1>;
+	cs-gpios =3D <&gpio4 24 GPIO_ACTIVE_LOW>,
+		   <&gpio4 25 GPIO_ACTIVE_LOW>;
+	status =3D "okay";
+
+	spidev0: spi@0 {
+		compatible =3D "spidev";
+		reg =3D <0>;
+		spi-max-frequency =3D <54000000>;
+	};
+
+	spidev1: spi@1 {
+		compatible =3D "spidev";
+		reg =3D <1>;
+		spi-max-frequency =3D <54000000>;
+	};
+};
+
+&esdhc1 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_esdhc1>;
+	cd-gpios =3D <&gpio3 8 GPIO_ACTIVE_LOW>;
+	fsl,wp-controller;
+	status =3D "okay";
+};
+
+&esdhc2 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_esdhc2 &pinctrl_wlan0>;
+	vmmc-supply =3D <&reg_wlan0>;
+	bus-width =3D <4>;
+	no-1-8-v;
+	fsl,wp-controller;
+	cap-sdio-irq;
+	non-removable;
+	//cd-gpios =3D <&gpio3 6 GPIO_ACTIVE_LOW>;
+	status =3D "okay";
+};
+
+&fec {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_fec>;
+	phy-mode =3D "mii";
+//	phy-handle =3D <&phy0>;
+	local-mac-address =3D [000000000000]; /* will be set by U-Boot */
+	status =3D "okay";
+
+	phy0: ethernet-phy@0 {
+		interrupt-parent =3D <&gpio3>;
+		interrupts =3D <18 0>;
+		device_type =3D "ethernet-phy";
+	};
+};
+
+&ipu {
+	status =3D "okay";
+};
+
+&i2c2 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_i2c2>;
+	status =3D "okay";
+
+	sgtl5000: sgtl5000@0a {
+		compatible =3D "fsl,sgtl5000";
+		reg =3D <0x0a>;
+		clocks =3D <&mclk>;
+		VDDA-supply =3D <&reg_2v5>;
+		VDDIO-supply =3D <&reg_3v3>;
+	};
+
+	polytouch: edt-ft5x06@38 {
+		compatible =3D "edt,edt-ft5x06";
+		reg =3D <0x38>;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_edt_ft5x06>;
+		interrupt-parent =3D <&gpio1>;
+		interrupts =3D <5 0>;
+		reset-gpios =3D <&gpio4 15 GPIO_ACTIVE_LOW>;
+		wake-gpios =3D <&gpio4 9 GPIO_ACTIVE_HIGH>;
+	};
+
+	touchscreen: tsc2007@48 {
+		compatible =3D "ti,tsc2007";
+		reg =3D <0x48>;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_tsc2007>;
+		interrupt-parent =3D <&gpio3>;
+		interrupts =3D <3 0>;
+		gpios =3D <&gpio3 3 GPIO_ACTIVE_LOW>;
+		ti,x-plate-ohms =3D <660>;
+		linux,wakeup;
+	};
+};
+
+&iomuxc {
+	imx51-tx51 {
+		pinctrl_hog: hoggrp {
+			fsl,pins =3D <
+				MX51_PAD_GPIO1_7__GPIO1_7		0x20e0	/* 26MHz osc enable */
+			>;
+		};
+
+		pinctrl_ecspi1: ecspi1grp {
+			fsl,pins =3D <
+				MX51_PAD_CSPI1_SS0__ECSPI1_SS0		0x4
+				MX51_PAD_CSPI1_SS1__ECSPI1_SS1		0x4
+				MX51_PAD_CSPI1_SCLK__ECSPI1_SCLK	0x5
+				MX51_PAD_CSPI1_MOSI__ECSPI1_MOSI	0x85
+				MX51_PAD_CSPI1_MISO__ECSPI1_MISO	0x185
+				MX51_PAD_CSPI1_RDY__ECSPI1_RDY		0x84
+			>;
+		};
+
+		pinctrl_edt_ft5x06: edt-ft5x056grp {
+			fsl,pins =3D <
+				MX51_PAD_GPIO1_5__GPIO1_5		0x20e0	/* Interrupt */
+				MX51_PAD_CSI2_PIXCLK__GPIO4_15		0x20e0	/* Reset */
+				MX51_PAD_CSI2_D12__GPIO4_9		0x20e0	/* Wake */
+			>;
+		};
+
+		pinctrl_esdhc1: esdhc1grp {
+			fsl,pins =3D <
+				MX51_PAD_DISPB2_SER_RS__GPIO3_8 	0x1c0 /* SD1 CD */
+				MX51_PAD_SD1_DATA0__SD1_DATA0		0x20d4
+				MX51_PAD_SD1_DATA1__SD1_DATA1		0x20d4
+				MX51_PAD_SD1_DATA2__SD1_DATA2		0x20d4
+				MX51_PAD_SD1_DATA3__SD1_DATA3		0x20d4
+				MX51_PAD_SD1_CMD__SD1_CMD		0x400020d4
+				MX51_PAD_SD1_CLK__SD1_CLK		0x2004
+			>;
+		};
+
+		pinctrl_esdhc2: esdhc2grp {
+			fsl,pins =3D <
+				MX51_PAD_DISPB2_SER_DIO__GPIO3_6	0x1c0 /* SD2 CD */
+				MX51_PAD_SD2_DATA0__SD2_DATA0		0x20d4
+				MX51_PAD_SD2_DATA1__SD2_DATA1		0x20d4
+				MX51_PAD_SD2_DATA2__SD2_DATA2		0x20d4
+				MX51_PAD_SD2_DATA3__SD2_DATA3		0x20d4
+				MX51_PAD_SD2_CMD__SD2_CMD		0x400020d4
+				MX51_PAD_SD2_CLK__SD2_CLK		0x2004
+			>;
+		};
+
+		pinctrl_fec: fecgrp {
+			fsl,pins =3D <
+				MX51_PAD_EIM_A20__GPIO2_14		0x20e4	/* PHY reset */
+				MX51_PAD_GPIO1_3__GPIO1_3		0x20e4	/* PHY power */
+				MX51_PAD_NANDF_CS3__FEC_MDC		0x2004
+				MX51_PAD_EIM_EB2__FEC_MDIO		0x0005
+				MX51_PAD_NANDF_RB3__FEC_RX_CLK		0x2000
+				MX51_PAD_NANDF_D11__FEC_RX_DV		0x2000
+				MX51_PAD_NANDF_D9__FEC_RDATA0		0x2000
+				MX51_PAD_EIM_EB3__FEC_RDATA1		0x0001
+				MX51_PAD_EIM_CS2__FEC_RDATA2		0x0001
+				MX51_PAD_EIM_CS3__FEC_RDATA3		0x0001
+				MX51_PAD_EIM_CS4__FEC_RX_ER		0x0001
+				MX51_PAD_NANDF_RDY_INT__FEC_TX_CLK	0x2000
+				MX51_PAD_NANDF_CS7__FEC_TX_EN		0x2004
+				MX51_PAD_NANDF_D8__FEC_TDATA0		0x2004
+				MX51_PAD_NANDF_CS4__FEC_TDATA1		0x2004
+				MX51_PAD_NANDF_CS5__FEC_TDATA2		0x2004
+				MX51_PAD_NANDF_CS6__FEC_TDATA3		0x2004
+				MX51_PAD_NANDF_RB2__FEC_COL		0x2000
+				MX51_PAD_EIM_CS5__FEC_CRS		0x0005
+				MX51_PAD_NANDF_CS2__GPIO3_18		0x20e4
+			>;
+		};
+
+		pinctrl_i2c2: ipu-i2c2grp {
+			fsl,pins =3D <
+				 MX51_PAD_EIM_D27__I2C2_SCL		0x40000004
+				 MX51_PAD_EIM_D24__I2C2_SDA		0x40000004
+			>;
+		};
+
+		pinctrl_i2c_gpio: ipu-i2c-gpiogrp {
+			fsl,pins =3D <
+				 MX51_PAD_I2C1_CLK__GPIO4_16		0x40000004
+				 MX51_PAD_I2C1_DAT__GPIO4_17		0x40000004
+			>;
+		};
+
+		pinctrl_ipu_disp0: ipu-disp0grp {
+			fsl,pins =3D <
+				MX51_PAD_DISP1_DAT0__DISP1_DAT0		0x5
+				MX51_PAD_DISP1_DAT1__DISP1_DAT1		0x5
+				MX51_PAD_DISP1_DAT2__DISP1_DAT2		0x5
+				MX51_PAD_DISP1_DAT3__DISP1_DAT3		0x5
+				MX51_PAD_DISP1_DAT4__DISP1_DAT4		0x5
+				MX51_PAD_DISP1_DAT5__DISP1_DAT5		0x5
+				MX51_PAD_DISP1_DAT6__DISP1_DAT6		0x5
+				MX51_PAD_DISP1_DAT7__DISP1_DAT7		0x5
+				MX51_PAD_DISP1_DAT8__DISP1_DAT8		0x5
+				MX51_PAD_DISP1_DAT9__DISP1_DAT9		0x5
+				MX51_PAD_DISP1_DAT10__DISP1_DAT10	0x5
+				MX51_PAD_DISP1_DAT11__DISP1_DAT11	0x5
+				MX51_PAD_DISP1_DAT12__DISP1_DAT12	0x5
+				MX51_PAD_DISP1_DAT13__DISP1_DAT13	0x5
+				MX51_PAD_DISP1_DAT14__DISP1_DAT14	0x5
+				MX51_PAD_DISP1_DAT15__DISP1_DAT15	0x5
+				MX51_PAD_DISP1_DAT16__DISP1_DAT16	0x5
+				MX51_PAD_DISP1_DAT17__DISP1_DAT17	0x5
+				MX51_PAD_DISP1_DAT18__DISP1_DAT18	0x5
+				MX51_PAD_DISP1_DAT19__DISP1_DAT19	0x5
+				MX51_PAD_DISP1_DAT20__DISP1_DAT20	0x5
+				MX51_PAD_DISP1_DAT21__DISP1_DAT21	0x5
+				MX51_PAD_DISP1_DAT22__DISP1_DAT22	0x5
+				MX51_PAD_DISP1_DAT23__DISP1_DAT23	0x5
+				MX51_PAD_DI1_PIN2__DI1_PIN2		0x5 /* HSYNC */
+				MX51_PAD_DI1_PIN3__DI1_PIN3		0x5 /* VSYNC */
+			>;
+		};
+
+		pinctrl_kpp: kppgrp-1 {
+			fsl,pins =3D <
+				MX51_PAD_KEY_ROW0__KEY_ROW0		0xe0
+				MX51_PAD_KEY_ROW1__KEY_ROW1		0xe0
+				MX51_PAD_KEY_ROW2__KEY_ROW2		0xe0
+				MX51_PAD_KEY_ROW3__KEY_ROW3		0xe0
+				MX51_PAD_KEY_COL0__KEY_COL0		0xe8
+				MX51_PAD_KEY_COL1__KEY_COL1		0xe8
+				MX51_PAD_KEY_COL2__KEY_COL2		0xe8
+				MX51_PAD_KEY_COL3__KEY_COL3		0xe8
+				MX51_PAD_KEY_COL4__KEY_COL4		0xe8
+				MX51_PAD_KEY_COL5__KEY_COL5		0xe8
+			>;
+		};
+
+		pinctrl_lcd_pwr: lcd-pwrgrp {
+			fsl,pins =3D <
+				MX51_PAD_CSI2_HSYNC__GPIO4_14		0x4
+			>;
+		};
+
+		pinctrl_lcd_reset: lcd-resetgrp {
+			fsl,pins =3D <
+				MX51_PAD_CSI2_VSYNC__GPIO4_13		0x4
+			>;
+		};
+
+		pinctrl_pwm1: pwm1grp {
+			fsl,pins =3D <
+				MX51_PAD_GPIO1_2__PWM1_PWMO		0xf4
+			>;
+		};
+
+		pinctrl_ssi1: ssi1grp {
+			fsl,pins =3D <
+				MX51_PAD_AUD3_BB_RXD__AUD3_RXD		0x5
+				MX51_PAD_AUD3_BB_TXD__AUD3_TXD		0x5
+				MX51_PAD_AUD3_BB_CK__AUD3_TXC		0x5
+				MX51_PAD_AUD3_BB_FS__AUD3_TXFS		0x5
+			>;
+		};
+
+		pinctrl_ssi2: ssi2grp {
+			fsl,pins =3D <
+				MX51_PAD_EIM_D29__AUD6_RXD		0x5
+				MX51_PAD_EIM_D28__AUD6_TXD		0x5
+				MX51_PAD_EIM_D30__AUD6_TXC		0x5
+				MX51_PAD_EIM_D31__AUD6_TXFS		0x5
+			>;
+		};
+
+		pinctrl_stk5led: stk5ledgrp {
+			fsl,pins =3D <
+				MX51_PAD_CSI2_D13__GPIO4_10		0x20e4
+			>;
+		};
+
+		pinctrl_tsc2007: tsc2007grp {
+			fsl,pins =3D <
+				MX51_PAD_DI1_D0_CS__GPIO3_3		0xc0	/* Pen-Down Interrupt */
+			>;
+		};
+
+		pinctrl_uart1: uart1grp {
+			fsl,pins =3D <
+				MX51_PAD_UART1_RXD__UART1_RXD		0xc1
+				MX51_PAD_UART1_TXD__UART1_TXD		0xc5
+				MX51_PAD_UART1_RTS__UART1_RTS		0xc1
+				MX51_PAD_UART1_CTS__UART1_CTS		0xc5
+			>;
+		};
+
+		pinctrl_uart2: uart2grp {
+			fsl,pins =3D <
+				MX51_PAD_UART2_RXD__UART2_RXD		0xc1
+				MX51_PAD_UART2_TXD__UART2_TXD		0xc5
+				MX51_PAD_EIM_D26__UART2_RTS		0xc1
+				MX51_PAD_EIM_D25__UART2_CTS		0xc5
+			>;
+		};
+
+		pinctrl_uart3: uart3grp {
+			fsl,pins =3D <
+				MX51_PAD_UART3_RXD__UART3_RXD		0xc1
+				MX51_PAD_UART3_TXD__UART3_TXD		0xc5
+				MX51_PAD_EIM_D18__UART3_RTS		0xc1
+				MX51_PAD_EIM_D17__UART3_CTS		0xc5
+			>;
+		};
+
+		pinctrl_wlan0: wlan0grp {
+			fsl,pins =3D <
+				MX51_PAD_CSI2_PIXCLK__GPIO4_15		0x04 /* WL_EN */
+				MX51_PAD_GPIO1_5__GPIO1_5		0xf0 /* WL_IRQ */
+			>;
+		};
+	};
+};
+
+&ipu_di0_disp0 {
+	remote-endpoint =3D <&display0_in>;
+};
+
+&kpp {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_kpp>;
+	linux,keymap =3D <	/* sample keymap */
+		MATRIX_KEY(0, 0, KEY_POWER)
+		MATRIX_KEY(0, 1, KEY_KP0)
+		MATRIX_KEY(0, 2, KEY_KP1)
+		MATRIX_KEY(0, 3, KEY_KP2)
+		MATRIX_KEY(1, 0, KEY_KP3)
+		MATRIX_KEY(1, 1, KEY_KP4)
+		MATRIX_KEY(1, 2, KEY_KP5)
+		MATRIX_KEY(1, 3, KEY_KP6)
+		MATRIX_KEY(2, 0, KEY_KP7)
+		MATRIX_KEY(2, 1, KEY_KP8)
+		MATRIX_KEY(2, 2, KEY_KP9)
+	>;
+	status =3D "okay";
+};
+
+&nfc {
+	nand-bus-width =3D <8>;
+	nand-ecc-mode =3D "hw";
+	nand-on-flash-bbt;
+	status =3D "okay";
+};
+
+&pwm1 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_pwm1>;
+};
+
+&ssi1 {
+	fsl,mode =3D "i2s-slave";
+	codec-handle =3D <&sgtl5000>;
+	status =3D "okay";
+};
+
+&ssi2 {
+	status =3D "disabled";
+};
+
+&uart1 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_uart1>;
+	fsl,uart-has-rtscts;
+	status =3D "okay";
+};
+
+&uart2 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_uart2>;
+	fsl,uart-has-rtscts;
+	status =3D "okay";
+};
+
+&uart3 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_uart3>;
+	fsl,uart-has-rtscts;
+	status =3D "okay";
+};
+
+&usbh1 {
+	phy_type =3D "ulpi";
+	fsl,usphy =3D <&usbh1phy>;
+	disable-over-current;
+	status =3D "okay";
+};
+
+&usbotg {
+	dr_mode =3D "peripheral";
+	phy_type =3D "utmi_wide";
+	disable-over-current;
+	status =3D "okay";
+};
--=20
2.1.4
