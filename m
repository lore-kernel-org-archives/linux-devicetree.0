From: Markus Pargmann <mpa@pengutronix.de>
Subject: [PATCH v4 1/2] dt-bindings: GPIO: Add gpio-initval
Date: Fri,  4 Dec 2015 14:06:27 +0100
Message-ID: <1449234388-4007-2-git-send-email-mpa@pengutronix.de>
References: <1449234388-4007-1-git-send-email-mpa@pengutronix.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1449234388-4007-1-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, kernel@pengutronix.de, Markus Pargmann <mpa@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Add a binding for GPIO initialization.

Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
---
 Documentation/devicetree/bindings/gpio/gpio.txt | 34 ++++++++++++++++---------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
index 069cdf6f9dac..d11abfa13add 100644
--- a/Documentation/devicetree/bindings/gpio/gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio.txt
@@ -155,29 +155,39 @@ gpio-controller@00000000 {
 	ngpios = <18>;
 }
 
-The GPIO chip may contain GPIO hog definitions. GPIO hogging is a mechanism
-providing automatic GPIO request and configuration as part of the
-gpio-controller's driver probe function.
+The GPIO chip may contain GPIO definitions. These define properties for single
+GPIOs of this controller.
 
-Each GPIO hog definition is represented as a child node of the GPIO controller.
+There are two types of GPIO definitions:
+
+- GPIO hogging is a mechanism providing automatic GPIO request and
+  configuration as part of the gpio-controller driver's probe function. The
+  GPIO is held until the gpio-controller is removed.
+- GPIO initialization provides an automatic initialization to known save
+  values. The GPIO can be used normally afterwards.
+
+Each GPIO definition is represented as a child node of the GPIO controller.
 Required properties:
-- gpio-hog:   A property specifying that this child node represent a GPIO hog.
 - gpios:      Store the GPIO information (id, flags, ...). Shall contain the
 	      number of cells specified in its parent node (GPIO controller
 	      node).
-Only one of the following properties scanned in the order shown below.
-This means that when multiple properties are present they will be searched
-in the order presented below and the first match is taken as the intended
-configuration.
+
+Optional properties:
+- line-name:  The GPIO label name. If not present the node name is used.
+
+ The following two options are mutually exclusive. One of them should be
+ specified, but not both:
+- gpio-hog:   A property specifying that this child node represent a GPIO hog.
+- gpio-initval: This GPIO should be initialized to the specified configuration.
+
+ The following three options are mutually exclusive. They change the setting of
+ the GPIO pin. One of them should be specified:
 - input:      A property specifying to set the GPIO direction as input.
 - output-low  A property specifying to set the GPIO direction as output with
 	      the value low.
 - output-high A property specifying to set the GPIO direction as output with
 	      the value high.
 
-Optional properties:
-- line-name:  The GPIO label name. If not present the node name is used.
-
 Example of two SOC GPIO banks defined as gpio-controller nodes:
 
 	qe_pio_a: gpio-controller@1400 {
-- 
2.6.2

