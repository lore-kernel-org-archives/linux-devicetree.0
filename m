Return-Path: <SRS0=EY9Q=OF=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr790050.outbound.protection.outlook.com ([40.107.79.50]:24864
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726253AbeKZXBJ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 26 Nov 2018 18:01:09 -0500
From: Lars Povlsen <lars.povlsen@microchip.com>
Subject: [PATCH] mips: gpio: mscc_sgpio: Add DT bindings documentation
Date: Mon, 26 Nov 2018 13:06:23 +0100
Message-ID: <87r2f83uww.fsf@soft-dev15.microsemi.net>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: linus.walleij@linaro.org, Gregory CLEMENT <gregory.clement@bootlin.com>
List-ID: <devicetree@vger.kernel.org>


Hello device tree!

I am submitting this device tree driver binding documentation for review
comments.

The driver is currently implemented on u-boot, but will also eventually
be upstreamed to Linux.

By using a serial interface, the MSCC SIO controller significantly
extends the number of available GPIOs with a minimum number of
additional pins on the device. The primary purpose of the SIO controller
is to connect control signals from SFP modules and to act as an LED
controller.

This add device tree binding documentation for the MSCC serial GPIO
driver.

Signed-off-by: Lars Povlsen <lars.povlsen@microsemi.com>
---
 doc/device-tree-bindings/gpio/mscc_sgpio.txt | 39 ++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 doc/device-tree-bindings/gpio/mscc_sgpio.txt

diff --git a/doc/device-tree-bindings/gpio/mscc_sgpio.txt b/doc/device-tree-bindings/gpio/mscc_sgpio.txt
new file mode 100644
index 0000000000..24e6aa345e
--- /dev/null
+++ b/doc/device-tree-bindings/gpio/mscc_sgpio.txt
@@ -0,0 +1,39 @@
+MSCC Serial GPIO driver
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
+- gpio-ranges: The 4th cell will typically be 32*<sgpio-bitcount>
+
+Optional properties:
+- mscc,sgpio-frequency: The frequency at which the serial bitstream is
+  generated and sampled. Default: 12500000 (Hz).
+- mscc,sgpio-bitcount: The number of bits enabled per
+  port. (1-4). Default: 2.
+- mscc,sgpio-ports: A bitmask (32 bits) of which ports are enabled in
+  the serialized gpio stream. Default: 0xFFFFFFFF.
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
+       gpio-ranges = <&sgpio 0 0 64>; // 32*<sgpio-bitcount>
+       mscc,sgpio-frequency = <12500>;
+       mscc,sgpio-bitcount = <2>;
+       mscc,sgpio-ports = <0x000FFFFF>;
+};
-- 
2.19.1
