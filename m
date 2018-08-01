Return-Path: <SRS0=6n5Z=KQ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39107 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387568AbeHANzL (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 1 Aug 2018 09:55:11 -0400
Received: by mail-wr1-f66.google.com with SMTP id h10-v6so19861535wre.6
        for <devicetree@vger.kernel.org>; Wed, 01 Aug 2018 05:09:40 -0700 (PDT)
From: Peter Mamonov <pmamonov@gmail.com>
Subject: Re: [PATCH v2] ARM: dts: sun8i: Add initial Orangepi Zero Plus 2 H3 support
Date: Wed,  1 Aug 2018 15:09:17 +0300
Message-Id: <20180801120917.14647-1-pmamonov@gmail.com>
In-Reply-To: <20180730115223.14161-1-diego.rondini@kynetics.com>
References: <20180730115223.14161-1-diego.rondini@kynetics.com>
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Peter Mamonov <pmamonov@gmail.com>
List-ID: <devicetree@vger.kernel.org>

Hi,

I was going to send a similar patch to the mailing list and found your
discussion. Please, consider adopting additional stuff from my version:

 - LEDs. See the `leds` node.

 - EHCI/OHCI. I did not check which of the `ehci*`/`ohci*` nodes are relevant, 
 yet I can confirm, that both USB ports from the expansion port are functional.

 - Analog audio. See the `codec` node. I've tested the lineout only.


Regards,
Peter

---
 arch/arm/boot/dts/Makefile                         |   1 +
 .../arm/boot/dts/sun8i-h3-orangepi-zero-plus-2.dts | 189 +++++++++++++++++++++
 2 files changed, 190 insertions(+)
 create mode 100644 arch/arm/boot/dts/sun8i-h3-orangepi-zero-plus-2.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 37a3de7..e887ac8 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1024,6 +1024,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
 	sun8i-h3-orangepi-pc-plus.dtb \
 	sun8i-h3-orangepi-plus.dtb \
 	sun8i-h3-orangepi-plus2e.dtb \
+	sun8i-h3-orangepi-zero-plus-2.dtb \
 	sun8i-r16-bananapi-m2m.dtb \
 	sun8i-r16-nintendo-nes-classic.dtb \
 	sun8i-r16-nintendo-super-nes-classic.dtb \
diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-zero-plus-2.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-zero-plus-2.dts
new file mode 100644
index 0000000..96ba493
--- /dev/null
+++ b/arch/arm/boot/dts/sun8i-h3-orangepi-zero-plus-2.dts
@@ -0,0 +1,189 @@
+/*
+ * Copyright (C) 2015 Chen-Yu Tsai <wens@csie.org>
+ * Copyright (C) 2018 Peter Mamonov <pmamonov@gmail.com>
+ *
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPL or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This file is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License as
+ *     published by the Free Software Foundation; either version 2 of the
+ *     License, or (at your option) any later version.
+ *
+ *     This file is distributed in the hope that it will be useful,
+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *     GNU General Public License for more details.
+ *
+ * Or, alternatively,
+ *
+ *  b) Permission is hereby granted, free of charge, to any person
+ *     obtaining a copy of this software and associated documentation
+ *     files (the "Software"), to deal in the Software without
+ *     restriction, including without limitation the rights to use,
+ *     copy, modify, merge, publish, distribute, sublicense, and/or
+ *     sell copies of the Software, and to permit persons to whom the
+ *     Software is furnished to do so, subject to the following
+ *     conditions:
+ *
+ *     The above copyright notice and this permission notice shall be
+ *     included in all copies or substantial portions of the Software.
+ *
+ *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ *     OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+/dts-v1/;
+#include "sun8i-h3.dtsi"
+#include "sunxi-common-regulators.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+
+/ {
+	model = "Xunlong Orange Pi Zero Plus 2";
+	compatible = "xunlong,orangepi-zero-plus-2", "allwinner,sun8i-h3";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		pwr {
+			label = "opizp2:green:pwr";
+			gpios = <&r_pio 0 10 GPIO_ACTIVE_HIGH>; /* PL10 */
+			default-state = "on";
+		};
+
+		status {
+			label = "opizp2:red:status";
+			gpios = <&pio 0 17 GPIO_ACTIVE_HIGH>; /* PA17 */
+			default-state = "on";
+			linux,default-trigger = "heartbeat";
+		};
+	};
+	wifi_pwrseq: wifi_pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&pio 0 9 GPIO_ACTIVE_LOW>; /* PA9 */
+	};
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pins_a>;
+	status = "okay";
+};
+
+&mmc0 {
+	vmmc-supply = <&reg_vcc3v3>;
+	bus-width = <4>;
+	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
+	status = "okay";
+};
+
+&mmc1 {
+	vmmc-supply = <&reg_vcc3v3>;
+	vqmmc-supply = <&reg_vcc3v3>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	bus-width = <4>;
+	non-removable;
+	status = "okay";
+
+	brcmf: brcmf@1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+		interrupt-parent = <&r_pio>;
+		interrupts = <0 7 IRQ_TYPE_LEVEL_LOW>; /* PL7 / EINT7 */
+		interrupt-names = "host-wake";
+	};
+};
+
+&de {
+	status = "okay";
+};
+
+&hdmi {
+	status = "okay";
+};
+
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&ehci2 {
+	status = "okay";
+};
+
+&ehci3 {
+	status = "okay";
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
+
+&ohci2 {
+	status = "okay";
+};
+
+&ohci3 {
+	status = "okay";
+};
+
+&usb_otg {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&usbphy {
+	usb0_id_det-gpios = <&pio 0 21 GPIO_ACTIVE_HIGH>; /* PG12 */
+	status = "okay";
+};
+
+&codec {
+	allwinner,audio-routing =
+		"Line Out", "LINEOUT",
+		"MIC1", "Mic",
+		"Mic",  "MBIAS";
+	status = "okay";
+};
+
-- 
2.9.1.273.g79ed43c

