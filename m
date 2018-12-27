Return-Path: <SRS0=S6uY=PE=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr690089.outbound.protection.outlook.com ([40.107.69.89]:57120
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726996AbeL0N17 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 27 Dec 2018 08:27:59 -0500
From: Lars Povlsen <lars.povlsen@microchip.com>
Subject: [PATCH v2] mips: gpio: mscc_sgpio: Add DT bindings documentation
In-Reply-To: <87r2f83uww.fsf@soft-dev15.microsemi.net>
Date: Thu, 27 Dec 2018 14:11:51 +0100
Message-ID: <87zhsr2jxk.fsf@soft-dev15.microsemi.net>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Device Tree <devicetree@vger.kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, Rob Herring <robh+dt@kernel.org>
Cc: Lars Povlsen <lars.povlsen@microchip.com>
List-ID: <devicetree@vger.kernel.org>


    mips: mscc_sgpio: Add DT bindings documentation
    
    This add device tree binding documentation for the MSCC serial GPIO
    driver.
    
v2 changes:
 - Added more device background info
 - Dropped "mscc,sgpio-bitcount" in favour of "ngpios" and "gpio-ranges".
 - Elaborated "mscc,sgpio-ports" explanation


    Signed-off-by: Lars Povlsen <lars.povlsen@microsemi.com>

diff --git a/doc/device-tree-bindings/gpio/mscc_sgpio.txt b/doc/device-tree-bindings/gpio/mscc_sgpio.txt
new file mode 100644
index 0000000000..2db2d277a5
--- /dev/null
+++ b/doc/device-tree-bindings/gpio/mscc_sgpio.txt
@@ -0,0 +1,45 @@
+Microsemi Corporation (MSCC) Serial GPIO driver
+
+The MSCC serial GPIO extends the number or GPIO's on the system by
+means of 4 dedicated pins: one input, one output, one clock and one
+strobe pin. By attaching a number of (external) shift registers, the
+effective GPIO count can be extended by up to 128 GPIO's per
+controller.
+
+Required properties:
+- compatible : "mscc,luton-sgpio" or "mscc,ocelot-sgpio"
+- clock: Reference clock used to generate clock divider setting. See
+  mscc,sgpio-frequency property.
+- reg : Physical base address and length of the controller's registers.
+- #gpio-cells : Should be two. The first cell is the pin number and the
+  second cell is used to specify optional parameters:
+  - bit 0 specifies polarity (0 for normal, 1 for inverted)
+- gpio-controller : Marks the device node as a GPIO controller.
+- gpio-ranges: Standard gpio range(s): phandle, gpio base, pinctrl base
+  and count.
+
+Optional properties:
+- ngpios: Set the number of GPIO's actually used.
+- mscc,sgpio-frequency: The frequency at which the serial bitstream is
+  generated and sampled. Default: 12500000 (Hz).
+- mscc,sgpio-ports: A bitmask (32 bits) of which ports are enabled in
+  the serialized gpio stream. One 'port' will transport from 1 to 4
+  gpio bits. Default: 0xFFFFFFFF.
+
+Typically the pinctrl-0 and pinctrl-names properties will also be
+present to enable the use of the SIO CLK, LD, DI and DO for some
+regular GPIO pins.
+
+Example:
+
+sgpio: gpio@10700f8 {
+       compatible = "mscc,ocelot-sgpio";
+       pinctrl-0 = <&sgpio_pins>;
+       pinctrl-names = "default";
+       reg = <0x10700f8 0x100>;
+       gpio-controller;
+       #gpio-cells = <2>;
+       gpio-ranges = <&sgpio 0 0 64>;
+       mscc,sgpio-frequency = <12500>;
+       mscc,sgpio-ports = <0x000FFFFF>;
+};
