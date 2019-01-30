Return-Path: <SRS0=IkuC=QG=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-lf1-f68.google.com ([209.85.167.68]:38219 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727269AbfA3UcG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 30 Jan 2019 15:32:06 -0500
Received: by mail-lf1-f68.google.com with SMTP id a8so655428lfk.5
        for <devicetree@vger.kernel.org>; Wed, 30 Jan 2019 12:32:05 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/2] gpio: Add DT bindings for Gateworks PLD GPIO
Date: Wed, 30 Jan 2019 21:31:55 +0100
Message-Id: <20190130203156.19774-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, Imre Kaloz <kaloz@openwrt.org>, Tim Harvey <tharvey@gateworks.com>
List-ID: <devicetree@vger.kernel.org>

This adds device tree bindings for the Gateworks PLD
GPIO chip, a simple I2C GPIO controller.

Cc: devicetree@vger.kernel.org
Cc: Imre Kaloz <kaloz@openwrt.org>
Cc: Tim Harvey <tharvey@gateworks.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../bindings/gpio/gateworks,pld-gpio.txt      | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gateworks,pld-gpio.txt

diff --git a/Documentation/devicetree/bindings/gpio/gateworks,pld-gpio.txt b/Documentation/devicetree/bindings/gpio/gateworks,pld-gpio.txt
new file mode 100644
index 000000000000..6e81f8b755c5
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gateworks,pld-gpio.txt
@@ -0,0 +1,20 @@
+Gateworks PLD GPIO controller bindings
+
+The GPIO controller should be a child node on an I2C bus,
+see: i2c/i2c.txt for details.
+
+Required properties:
+- compatible: Should be "gateworks,pld-gpio"
+- reg: I2C slave address
+- gpio-controller: Marks the device node as a GPIO controller.
+- #gpio-cells: Should be <2>. The first cell is the gpio number and
+  the second cell is used to specify optional parameters.
+
+Example:
+
+pld@56 {
+	compatible = "gateworks,pld-gpio";
+	reg = <0x56>;
+	gpio-controller;
+	#gpio-cells = <2>;
+};
-- 
2.20.1
