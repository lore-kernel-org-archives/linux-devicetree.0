Return-Path: <SRS0=+6fA=MW=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:53758 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727132AbeJKCqy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 10 Oct 2018 22:46:54 -0400
From: Marek Vasut <marex@denx.de>
Subject: [PATCH] dt-bindings: gpio: altera-fpga-mgr: Add Altera FPGA manager GPIO bindings
Date: Wed, 10 Oct 2018 21:23:15 +0200
Message-Id: <20181010192315.26163-1-marex@denx.de>
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>, Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
List-ID: <devicetree@vger.kernel.org>

Add DT bindings for the GPI / GPO block in the Altera SoCFPGA FPGA manager.
The GPIO block in the FPGA manager has two 32bit registers, one for setting
32 GPOs and another one for reading 32 GPIs, both of which can be mapped to
separate physical pads.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 .../bindings/gpio/gpio-altera-fpga-mgr.txt    | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-altera-fpga-mgr.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-altera-fpga-mgr.txt b/Documentation/devicetree/bindings/gpio/gpio-altera-fpga-mgr.txt
new file mode 100644
index 000000000000..74a996a6b72f
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-altera-fpga-mgr.txt
@@ -0,0 +1,24 @@
+Altera SoCFPGA FPGA manager GPIO controller.
+
+The Altera SoCFPGA fpgamgr block has a GPIO controller as a part of it.
+The controller has two sets of pins, 32 GPIs and 32 GPOs.
+
+Required properties:
+- compatible: Should contain "altr,fpga-mgr-gpio".
+- gpio-controller: Marks the device node as a gpio controller.
+- #gpio-cells: Should be 2. The first cell is the pin number and
+  the second cell is used to specify the gpio polarity:
+    0 = Active high,
+    1 = Active low.
+- gpio,syscon-dev: phandle/offset pair. The phandle to syscon used to
+  access device state control registers and the offset of device's specific
+  registers within device state control registers range.
+
+Example:
+
+	fpgamgr_gpio: gpio@ff706010 {
+		compatible = "altr,fpga-mgr-gpio";
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio,syscon-dev = <&fpgamgr0 0x10>;
+	};
-- 
2.18.0
