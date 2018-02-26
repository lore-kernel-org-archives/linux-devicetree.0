Return-Path: <SRS0=m1Og=FU=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:36145 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751986AbeBZHqL (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 26 Feb 2018 02:46:11 -0500
Received: by mail-lf0-f68.google.com with SMTP id g72so1332109lfg.3
        for <devicetree@vger.kernel.org>; Sun, 25 Feb 2018 23:46:10 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/2 v3] spi: spi-gpio: Augment device tree bindings
Date: Mon, 26 Feb 2018 08:45:59 +0100
Message-Id: <20180226074559.3227-2-linus.walleij@linaro.org>
In-Reply-To: <20180226074559.3227-1-linus.walleij@linaro.org>
References: <20180226074559.3227-1-linus.walleij@linaro.org>
Sender: devicetree-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

After we augmented the core to handle "gpio-sck"/"sck-gpios",
"gpio-mosi"/"mosi-gpios", "gpio-miso"/"miso-gpios" alike,
deprecate the old binding and put the strict modern and
recommended binding practice into place as the default for
GPIO-based SPI.

This reflects the similar change in I2C:
commit 7d29f509d2cf
("dt-bindings: i2c: i2c-gpio: Add support for named gpios")

Cc: devicetree@vger.kernel.org
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Collect Rob's ACK.
---
 Documentation/devicetree/bindings/spi/spi-gpio.txt | 24 ++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/spi-gpio.txt b/Documentation/devicetree/bindings/spi/spi-gpio.txt
index a95603bcf6ff..52db562f17a4 100644
--- a/Documentation/devicetree/bindings/spi/spi-gpio.txt
+++ b/Documentation/devicetree/bindings/spi/spi-gpio.txt
@@ -1,18 +1,30 @@
 SPI-GPIO devicetree bindings
 
+This represents a group of 3-n GPIO lines used for bit-banged SPI on dedicated
+GPIO lines.
+
 Required properties:
 
  - compatible: should be set to "spi-gpio"
  - #address-cells: should be set to <0x1>
  - ranges
- - gpio-sck: GPIO spec for the SCK line to use
- - gpio-miso: GPIO spec for the MISO line to use
- - gpio-mosi: GPIO spec for the MOSI line to use
+ - sck-gpios: GPIO spec for the SCK line to use
+ - miso-gpios: GPIO spec for the MISO line to use
+ - mosi-gpios: GPIO spec for the MOSI line to use
  - cs-gpios: GPIOs to use for chipselect lines.
              Not needed if num-chipselects = <0>.
  - num-chipselects: Number of chipselect lines. Should be <0> if a single device
                     with no chip select is connected.
 
+Deprecated bindings:
+
+These legacy GPIO line bindings can alternatively be used to define the
+GPIO lines used, they should not be used in new device trees.
+
+ - gpio-sck: GPIO spec for the SCK line to use
+ - gpio-miso: GPIO spec for the MISO line to use
+ - gpio-mosi: GPIO spec for the MOSI line to use
+
 Example:
 
 	spi {
@@ -20,9 +32,9 @@ Example:
 		#address-cells = <0x1>;
 		ranges;
 
-		gpio-sck = <&gpio 95 0>;
-		gpio-miso = <&gpio 98 0>;
-		gpio-mosi = <&gpio 97 0>;
+		sck-gpios = <&gpio 95 0>;
+		miso-gpios = <&gpio 98 0>;
+		mosi-gpios = <&gpio 97 0>;
 		cs-gpios = <&gpio 125 0>;
 		num-chipselects = <1>;
 
-- 
2.14.3

