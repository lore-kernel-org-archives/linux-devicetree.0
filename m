Return-Path: <SRS0=p57L=RX=vger.kernel.org=devicetree-owner@kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:46718 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726846AbfCTToQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 20 Mar 2019 15:44:16 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] ARM: dts: rskrza1: Add I2C support
Date: Wed, 20 Mar 2019 20:44:09 +0100
Message-Id: <20190320194410.14870-2-geert+renesas@glider.be>
In-Reply-To: <20190320194410.14870-1-geert+renesas@glider.be>
References: <20190320194410.14870-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Chris Brandt <chris.brandt@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

Enable the I2C bus, and add the following devices:
  - Two CAT9554 port expanders (8 GPIOs, interrupt not wired by
    default),
  - R1EX24016ASAS0A EEPROM.

The bus also contains a MAX9856 Audio Codec, which is not yet supported.

All devices (incl. the audio codec) are documented to support an I2C bus
running at 400 kHz.

Pinctrl is based on the RZ/A BSP.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Pending acceptance of the DT binding patches documenting the
"onnn,cat9554" and "renesas,r1ex24016" compatible values.
---
 arch/arm/boot/dts/r7s72100-rskrza1.dts | 33 ++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100-rskrza1.dts b/arch/arm/boot/dts/r7s72100-rskrza1.dts
index 8ee44a100e9a44c4..60e80ecbbf6826bc 100644
--- a/arch/arm/boot/dts/r7s72100-rskrza1.dts
+++ b/arch/arm/boot/dts/r7s72100-rskrza1.dts
@@ -47,6 +47,34 @@
 	clock-frequency = <13330000>;
 };
 
+&i2c3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c3_pins>;
+	status = "okay";
+
+	clock-frequency = <400000>;
+
+	io_expander1: gpio@20 {
+		compatible = "onnn,cat9554";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	io_expander2: gpio@21 {
+		compatible = "onnn,cat9554";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	eeprom@50 {
+		compatible = "renesas,r1ex24016", "atmel,24c16";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
+};
+
 &usb_x1_clk {
 	clock-frequency = <48000000>;
 };
@@ -56,6 +84,11 @@
 };
 
 &pinctrl {
+	/* RIIC ch3 (Port Expander, EEPROM (MAC Addr), Audio Codec) */
+	i2c3_pins: i2c3 {
+		pinmux = <RZA1_PINMUX(1, 6, 1)>,	/* RIIC3SCL */
+			 <RZA1_PINMUX(1, 7, 1)>;	/* RIIC3SDA */
+	};
 
 	/* Serial Console */
 	scif2_pins: serial2 {
-- 
2.17.1
