From: Lukas Wunner <lukas@wunner.de>
Subject: [PATCH v2 3/5] dt-bindings: Document common property for
 daisy-chained devices
Date: Thu, 12 Oct 2017 12:40:10 +0200
Message-ID: <f0c3b0c5514f74717c5783360b60062dfe9b8c0f.1507797496.git.lukas@wunner.de>
References: <cover.1507797496.git.lukas@wunner.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <cover.1507797496.git.lukas@wunner.de>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mathias Duckeck <m.duckeck@kunbus.de>, Phil Elwell <phil@raspberrypi.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jonathan Cameron <jic23@kernel.org>
List-Id: devicetree@vger.kernel.org

Many serially-attached GPIO and IIO devices are daisy-chainable.

    Examples for GPIO devices are Maxim MAX3191x and TI SN65HVS88x:
    https://datasheets.maximintegrated.com/en/ds/MAX31913.pdf
    http://www.ti.com/lit/ds/symlink/sn65hvs880.pdf

    Examples for IIO devices are TI DAC128S085 and TI DAC161S055:
    http://www.ti.com/lit/ds/symlink/dac128s085.pdf
    http://www.ti.com/lit/ds/symlink/dac161s055.pdf

We already have drivers for daisy-chainable devices in the tree but
their devicetree bindings are somewhat inconsistent and ill-named:

    The gpio-74x164.c driver uses "registers-number" to convey the
    number of devices in the daisy-chain.  (Sans vendor prefix,
    multiple vendors sell compatible versions of this chip.)

    The gpio-pisosr.c driver takes a different approach and calculates
    the number of devices in the daisy-chain by dividing the common
    "ngpios" property (Documentation/devicetree/bindings/gpio/gpio.txt)
    by 8 (which assumes that each chip has 8 inputs).

Let's standardize on a common "#daisy-chained-devices" property.
That name was chosen because it's the term most frequently used in
datasheets.  (A less frequently used synonym is "cascaded devices".)

Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
Changes v1 -> v2:

- Newly inserted patch.

 .../devicetree/bindings/common-properties.txt      | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/common-properties.txt b/Documentation/devicetree/bindings/common-properties.txt
index 697714f8d75c..a3448bfa1c82 100644
--- a/Documentation/devicetree/bindings/common-properties.txt
+++ b/Documentation/devicetree/bindings/common-properties.txt
@@ -1,4 +1,8 @@
 Common properties
+=================
+
+Endianness
+----------
 
 The Devicetree Specification does not define any properties related to hardware
 byteswapping, but endianness issues show up frequently in porting Linux to
@@ -58,3 +62,25 @@ dev: dev@40031000 {
 	      ...
 	      little-endian;
 };
+
+Daisy-chained devices
+---------------------
+
+Many serially-attached GPIO and IIO devices are daisy-chainable.  To the
+host controller, a daisy-chain appears as a single device, but the number
+of inputs and outputs it provides is the sum of inputs and outputs provided
+by all of its devices.  The driver needs to know how many devices the
+daisy-chain comprises to determine the amount of data exchanged, how many
+inputs and outputs to register and so on.
+
+Optional properties:
+ - #daisy-chained-devices: Number of devices in the daisy-chain (default is 1).
+
+Example:
+gpio@0 {
+	      compatible = "name";
+	      reg = <0>;
+	      gpio-controller;
+	      #gpio-cells = <2>;
+	      #daisy-chained-devices = <3>;
+};
-- 
2.11.0

