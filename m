Return-Path: <SRS0=RYdj=RH=gmail.com=marek.vasut@kernel.org>
From: marek.vasut@gmail.com
Subject: [PATCH V2] regulator: gpio: Reword the binding document
Date: Mon,  4 Mar 2019 20:40:23 +0100
Message-Id: <20190304194023.10926-1-marek.vasut@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: devicetree@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>, Harald Geyer <harald@ccbib.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

From: Marek Vasut <marek.vasut+renesas@gmail.com>

Reword the binding document to make it clear how the propeties work
and which properties affect which other properties.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Harald Geyer <harald@ccbib.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org
To: devicetree@vger.kernel.org
---
V2: - Make "gpios" a mandatory property
    - Reword "gpio-states" property description
    - Change "enable-gpio" to "enable-gpios" to match modern DT rules
Note: The recent gpio-regulator rework caused breakage. While the
      changes in the gpio-regulator code were according to the DT
      binding document, they stopped working with older DTs. Make
      the binding document clearer to prevent such breakage in the
      future.
---
 .../bindings/regulator/gpio-regulator.txt     | 25 +++++++++++++------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/gpio-regulator.txt b/Documentation/devicetree/bindings/regulator/gpio-regulator.txt
index 1f496159e2bb..d7f8c1b17db6 100644
--- a/Documentation/devicetree/bindings/regulator/gpio-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/gpio-regulator.txt
@@ -4,16 +4,25 @@ Required properties:
 - compatible		: Must be "regulator-gpio".
 - regulator-name	: Defined in regulator.txt as optional, but required
 			  here.
-- states		: Selection of available voltages and GPIO configs.
-                          if there are no states, then use a fixed regulator
+- gpios			: Array of one or more GPIO pins used to select the
+			  regulator voltage/current listed in "states".
+- states		: Selection of available voltages/currents provided by
+			  this regulator and matching GPIO configurations to
+			  achieve them. If there are no states in the "states"
+			  array, use a fixed regulator instead.
 
 Optional properties:
-- enable-gpio		: GPIO to use to enable/disable the regulator.
-- gpios			: GPIO group used to control voltage.
-- gpios-states		: gpios pin's initial states array. 0: LOW, 1: HIGH.
-			  defualt is LOW if nothing is specified.
+- enable-gpios		: GPIO used to enable/disable the regulator.
+			  Warning, the GPIO phandle flags are ignored and the
+			  GPIO polarity is controlled solely by the presence
+			  of "enable-active-high" DT property. This is due to
+			  compatibility with old DTs.
+- enable-active-high	: Polarity of "enable-gpio" GPIO is active HIGH.
+			  Default is active LOW.
+- gpios-states		: State of GPIO pins in "gpios" array that is set until
+			  changed by the first consumer. 0: LOW, 1: HIGH.
+			  Default is LOW if nothing else is specified.
 - startup-delay-us	: Startup time in microseconds.
-- enable-active-high	: Polarity of GPIO is active high (default is low).
 - regulator-type	: Specifies what is being regulated, must be either
 			  "voltage" or "current", defaults to voltage.
 
@@ -30,7 +39,7 @@ Example:
 		regulator-max-microvolt = <2600000>;
 		regulator-boot-on;
 
-		enable-gpio = <&gpio0 23 0x4>;
+		enable-gpios = <&gpio0 23 0x4>;
 		gpios = <&gpio0 24 0x4
 			 &gpio0 25 0x4>;
 		states = <1800000 0x3
-- 
2.19.2
