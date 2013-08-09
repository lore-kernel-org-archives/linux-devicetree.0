Return-Path: <devicetree-owner@vger.kernel.org>
Received: from nbd.name ([46.4.11.11]:33651 "EHLO nbd.name"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1030485Ab3HITRa (ORCPT <rfc822;devicetree@vger.kernel.org>);
	Fri, 9 Aug 2013 15:17:30 -0400
From: John Crispin <blogic@openwrt.org>
Subject: [PATCH V2 1/2] DT: Add documentation for gpio-falcon
Date: Fri,  9 Aug 2013 21:10:18 +0200
Message-Id: <1376075418-29813-1-git-send-email-blogic@openwrt.org>
Sender: devicetree-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>
Cc: Rob Herring <rob.herring@calxeda.com>, John Crispin <blogic@openwrt.org>, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Describe the GPIO banks found on the MIPS based Lantiq Falcon SoC.

Signed-off-by: John Crispin <blogic@openwrt.org>
Cc: linux-mips@linux-mips.org
Cc: devicetree@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
---
Changes in V2:
* fixed a typo
* add a more explicit description

 .../devicetree/bindings/gpio/gpio-falcon.txt       |   27 ++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-falcon.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-falcon.txt b/Documentation/devicetree/bindings/gpio/gpio-falcon.txt
new file mode 100644
index 0000000..40558b5
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-falcon.txt
@@ -0,0 +1,27 @@
+Lantiq Falon SoC GPIO controller bindings
+
+This MIPS based GPON SoC has 5 banks of up to 32 gpios.
+
+Required properties:
+- compatible:
+  - "lantiq,falcon-gpio" for Falcon SoC controllers
+- #gpio-cells : Should be two.
+  - first cell is the pin number
+  - second cell is used to specify optional parameters (unused)
+- gpio-controller : Marks the device node as a GPIO controller
+- reg : Physical base address and length of the controller's registers
+- interrupt-parent: phandle to the IM device node that the irq is routed via
+- interrupts : Specify the IM interrupt number
+- lantiq,bank : The physical GPIO bank that this block is associated with
+
+Example:
+
+	gpio0: gpio@810000 {
+		compatible = "lantiq,falcon-gpio";
+		#gpio-cells = <2>;
+		gpio-controller;
+		reg = <0x810000 0x80>;
+		interrupt-parent = <&icu0>;
+		interrupts = <44>;
+		lantiq,bank = <0>;
+	};
-- 
1.7.10.4

