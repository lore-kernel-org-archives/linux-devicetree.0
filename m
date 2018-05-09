Return-Path: <SRS0=X3x8=H4=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:38637 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965408AbeEIXuz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 9 May 2018 19:50:55 -0400
Received: by mail-wr0-f196.google.com with SMTP id 94-v6so231674wrf.5
        for <devicetree@vger.kernel.org>; Wed, 09 May 2018 16:50:54 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 4/4] ARM: dts: meson8m2: add support for the Tronsmart MXIII Plus
Date: Thu, 10 May 2018 01:50:37 +0200
Message-Id: <20180509235037.5876-5-martin.blumenstingl@googlemail.com>
In-Reply-To: <20180509235037.5876-1-martin.blumenstingl@googlemail.com>
References: <20180509235037.5876-1-martin.blumenstingl@googlemail.com>
Sender: devicetree-owner@vger.kernel.org
To: linux-amlogic@lists.infradead.org, khilman@baylibre.com, carlo@caione.org
Cc: devicetree@vger.kernel.org, balbes-150@yandex.ru, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-ID: <devicetree@vger.kernel.org>

From: Oleg Ivanov <balbes-150@yandex.ru>

The Tronsmart MXIII Plus is an Android TV box which uses the Amlogic
S812 (Meson8m2) SoC. It uses a Realtek RTL8211F RGMII Ethernet PHY as
well as a Ricoh RN5T618 system power controller. It also comes with an
Ampak AP6330 SDIO wifi/Bluetooth combo chip (support for wifi and
Bluetooth is currently not added because the Linux drivers currently
only support one MMC controller and that is used for the SD card).

Signed-off-by: Oleg Ivanov <balbes-150@yandex.ru>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/Makefile                |   3 +-
 arch/arm/boot/dts/meson8m2-mxiii-plus.dts | 244 ++++++++++++++++++++++
 2 files changed, 246 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/meson8m2-mxiii-plus.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 7e2424957809..4300e86049ee 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -312,7 +312,8 @@ dtb-$(CONFIG_ARCH_NPCM7XX) += \
 dtb-$(CONFIG_MACH_MESON6) += \
 	meson6-atv1200.dtb
 dtb-$(CONFIG_MACH_MESON8) += \
-	meson8-minix-neo-x8.dtb
+	meson8-minix-neo-x8.dtb \
+	meson8m2-mxiii-plus.dtb
 dtb-$(CONFIG_ARCH_MMP) += \
 	pxa168-aspenite.dtb \
 	pxa910-dkb.dtb \
diff --git a/arch/arm/boot/dts/meson8m2-mxiii-plus.dts b/arch/arm/boot/dts/meson8m2-mxiii-plus.dts
new file mode 100644
index 000000000000..f5853610b20b
--- /dev/null
+++ b/arch/arm/boot/dts/meson8m2-mxiii-plus.dts
@@ -0,0 +1,244 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2018 Oleg Ivanov <balbes-150@yandex.ru>
+ * Copyright (c) 2018 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
+ */
+
+/dts-v1/;
+
+#include "meson8m2.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+
+/ {
+	model = "Tronsmart MXIII Plus";
+	compatible = "tronsmart,mxiii-plus", "amlogic,meson8m2";
+
+	aliases {
+		ethernet0 = &ethmac;
+		i2c0 = &i2c_AO;
+		serial0 = &uart_AO;
+		serial1 = &uart_A;
+		mmc0 = &sd_card_slot;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory {
+		reg = <0x40000000 0x80000000>;
+	};
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
+	vcc_3v3: regulator-vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+};
+
+&cpu0 {
+	cpu-supply = <&vcck>;
+};
+
+&ethmac {
+	status = "okay";
+
+	pinctrl-0 = <&eth_rgmii_pins>;
+	pinctrl-names = "default";
+
+	phy-handle = <&eth_phy0>;
+	phy-mode = "rgmii";
+
+	amlogic,tx-delay-ns = <4>;
+
+	snps,reset-gpio = <&gpio GPIOH_4 0>;
+	snps,reset-delays-us = <0 10000 1000000>;
+	snps,reset-active-low;
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		eth_phy0: ethernet-phy@0 {
+			/* Realtek RTL8211F (0x001cc916) */
+			reg = <0>;
+		};
+	};
+};
+
+&ir_receiver {
+	status = "okay";
+	pinctrl-0 = <&ir_recv_pins>;
+	pinctrl-names = "default";
+};
+
+&i2c_AO {
+	status = "okay";
+	pinctrl-0 = <&i2c_ao_pins>;
+	pinctrl-names = "default";
+
+	pmic@32 {
+		compatible = "ricoh,rn5t618";
+		reg = <0x32>;
+		system-power-controller;
+
+		regulators {
+			vcck: DCDC1 {
+				regulator-name = "VCCK";
+				regulator-min-microvolt = <825000>;
+				regulator-max-microvolt = <1150000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			DCDC2 {
+				regulator-name = "VDDAO";
+				regulator-min-microvolt = <950000>;
+				regulator-max-microvolt = <1150000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			DCDC3 {
+				regulator-name = "VDD_DDR";
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <1500000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			LDO1 {
+				regulator-name = "VDDIO_AO28";
+				regulator-min-microvolt = <2900000>;
+				regulator-max-microvolt = <2900000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			vddio_ao1v8: LDO2 {
+				regulator-name = "VDDIO_AO18";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			LDO3 {
+				regulator-name = "VCC1V8";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			LDO4 {
+				regulator-name = "VCC2V8";
+				regulator-min-microvolt = <2850000>;
+				regulator-max-microvolt = <2850000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			LDO5 {
+				regulator-name = "AVDD1V8";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			LDORTC1 {
+				regulator-name = "VDD_LDO";
+				regulator-min-microvolt = <2700000>;
+				regulator-max-microvolt = <2700000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			LDORTC2 {
+				regulator-name = "RTC_0V9";
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <900000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
+&saradc {
+	status = "okay";
+	vref-supply = <&vddio_ao1v8>;
+};
+
+&sdio {
+	status = "okay";
+
+	pinctrl-0 = <&sd_b_pins>;
+	pinctrl-names = "default";
+
+	/* SD card */
+	sd_card_slot: slot@1 {
+		compatible = "mmc-slot";
+		reg = <1>;
+		status = "okay";
+
+		bus-width = <4>;
+		no-sdio;
+		cap-mmc-highspeed;
+		cap-sd-highspeed;
+		disable-wp;
+
+		cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_HIGH>;
+		cd-inverted;
+
+		vmmc-supply = <&vcc_3v3>;
+	};
+};
+
+/* connected to the Bluetooth module */
+&uart_A {
+	status = "okay";
+	pinctrl-0 = <&uart_a1_pins>, <&uart_a1_cts_rts_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+};
+
+&uart_AO {
+	status = "okay";
+	pinctrl-0 = <&uart_ao_a_pins>;
+	pinctrl-names = "default";
+};
+
+&usb0 {
+	status = "okay";
+};
+
+&usb1 {
+	status = "okay";
+};
+
+&usb0_phy {
+	status = "okay";
+};
+
+&usb1_phy {
+	status = "okay";
+};
-- 
2.17.0

