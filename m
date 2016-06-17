From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/4] iio: pressure: bmp280: augment DT bindings
Date: Fri, 17 Jun 2016 17:12:18 +0200
Message-ID: <1466176341-17442-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Irina Tirdea <irina.tirdea-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This adds standard device tree bindings for a reset GPIO line, and
the VDDD and VDDA power regulators.

Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/iio/pressure/bmp085.txt | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/pressure/bmp085.txt b/Documentation/devicetree/bindings/iio/pressure/bmp085.txt
index d7a6deb6b21e..06ad5feaea28 100644
--- a/Documentation/devicetree/bindings/iio/pressure/bmp085.txt
+++ b/Documentation/devicetree/bindings/iio/pressure/bmp085.txt
@@ -1,7 +1,7 @@
-BMP085/BMP18x digital pressure sensors
+BMP085/BMP18x/BMP28x digital pressure sensors
 
 Required properties:
-- compatible: bosch,bmp085
+- compatible: "bosch,bmp085" or "bosch,bmp180" or "bosch,bmp280"
 
 Optional properties:
 - chip-id: configurable chip id for non-default chip revisions
@@ -10,6 +10,10 @@ Optional properties:
   value range is 0-3 with rising sensitivity.
 - interrupt-parent: should be the phandle for the interrupt controller
 - interrupts: interrupt mapping for IRQ
+- reset-gpios: a GPIO line handling reset of the sensor: as the line is
+  active low, it should be marked GPIO_ACTIVE_LOW (see gpio/gpio.txt)
+- vddd-supply: digital voltage regulator (see regulator/regulator.txt)
+- vdda-supply: analog voltage regulator (see regulator/regulator.txt)
 
 Example:
 
@@ -21,4 +25,7 @@ pressure@77 {
 	default-oversampling = <2>;
 	interrupt-parent = <&gpio0>;
 	interrupts = <25 IRQ_TYPE_EDGE_RISING>;
+	reset-gpios = <&gpio0 26 GPIO_ACTIVE_LOW>;
+	vddd-supply = <&foo>;
+	vdda-supply = <&bar>;
 };
-- 
2.4.11
