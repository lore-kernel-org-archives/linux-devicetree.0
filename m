Return-Path: <devicetree-owner@vger.kernel.org>
Received: from nbd.name ([46.4.11.11]:34547 "EHLO nbd.name"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933971Ab3HHJqH (ORCPT <rfc822;devicetree@vger.kernel.org>);
	Thu, 8 Aug 2013 05:46:07 -0400
From: John Crispin <blogic@openwrt.org>
Subject: [PATCH 1/2] DT: Add documentation for gpio-ralink
Date: Thu,  8 Aug 2013 11:38:52 +0200
Message-Id: <1375954733-30675-1-git-send-email-blogic@openwrt.org>
Sender: devicetree-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>
Cc: Rob Herring <rob.herring@calxeda.com>, John Crispin <blogic@openwrt.org>, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Describe gpio-ralink binding.

Signed-off-by: John Crispin <blogic@openwrt.org>
Cc: linux-mips@linux-mips.org
Cc: devicetree@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
---
 .../devicetree/bindings/gpio/gpio-ralink.txt       |   40 ++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-ralink.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-ralink.txt b/Documentation/devicetree/bindings/gpio/gpio-ralink.txt
new file mode 100644
index 0000000..b4acf02
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-ralink.txt
@@ -0,0 +1,40 @@
+Ralink SoC GPIO controller bindings
+
+Required properties:
+- compatible:
+  - "ralink,rt2880-gpio" for Ralink controllers
+- #gpio-cells : Should be two.
+  - first cell is the pin number
+  - second cell is used to specify optional parameters (unused)
+- gpio-controller : Marks the device node as a GPIO controller
+- reg : Physical base address and length of the controller's registers
+- interrupt-parent: phandle to the INTC device node
+- interrupts : Specify the INTC interrupt number
+- ralink,num-gpios : Specify the number of GPIOs
+- ralink,register-map : The register layout depends on the GPIO bank and actual
+		SoC type. Register offsets need to be in this order.
+		[ INT, EDGE, RENA, FENA, DATA, DIR, POL, SET, RESET, TOGGLE ]
+
+Optional properties:
+- ralink,gpio-base : Specify the GPIO chips base number
+
+Example:
+
+	gpio0: gpio@600 {
+		compatible = "ralink,rt5350-gpio", "ralink,rt2880-gpio";
+
+		#gpio-cells = <2>;
+		gpio-controller;
+
+		reg = <0x600 0x34>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <6>;
+
+		ralink,gpio-base = <0>;
+		ralink,num-gpios = <24>;
+		ralink,register-map = [ 00 04 08 0c
+				20 24 28 2c
+				30 34 ];
+
+	};
-- 
1.7.10.4

