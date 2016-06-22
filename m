From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/9 v2] iio: pressure: bmp280: augment DT bindings
Date: Wed, 22 Jun 2016 22:53:31 +0200
Message-ID: <1466628819-29784-2-git-send-email-linus.walleij@linaro.org>
References: <1466628819-29784-1-git-send-email-linus.walleij@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1466628819-29784-1-git-send-email-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "H. Nikolaus Schaller" <hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Christoph Mair <christoph.mair-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vlad Dogaru <vlad.dogaru-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Marek Belisko <marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, Eric Andersson <eric.andersson-TStm8jYLEPpl57MIdRCFDg@public.gmane.org>, Neil Brown <neilb-l3A5Bk7waGM@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This adds standard device tree bindings for a reset GPIO line, and
the VDDD and VDDA power regulators.

Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
ChangeLog v1->v2:
- Order compatible string on single lines
- Add "bosch,bme280" for the new sensor from Matt
---
 Documentation/devicetree/bindings/iio/pressure/bmp085.txt | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/pressure/bmp085.txt b/Documentation/devicetree/bindings/iio/pressure/bmp085.txt
index d7a6deb6b21e..c7198a03c906 100644
--- a/Documentation/devicetree/bindings/iio/pressure/bmp085.txt
+++ b/Documentation/devicetree/bindings/iio/pressure/bmp085.txt
@@ -1,7 +1,11 @@
-BMP085/BMP18x digital pressure sensors
+BMP085/BMP18x/BMP28x digital pressure sensors
 
 Required properties:
-- compatible: bosch,bmp085
+- compatible: must be one of:
+  "bosch,bmp085"
+  "bosch,bmp180"
+  "bosch,bmp280"
+  "bosch,bme280"
 
 Optional properties:
 - chip-id: configurable chip id for non-default chip revisions
@@ -10,6 +14,10 @@ Optional properties:
   value range is 0-3 with rising sensitivity.
 - interrupt-parent: should be the phandle for the interrupt controller
 - interrupts: interrupt mapping for IRQ
+- reset-gpios: a GPIO line handling reset of the sensor: as the line is
+  active low, it should be marked GPIO_ACTIVE_LOW (see gpio/gpio.txt)
+- vddd-supply: digital voltage regulator (see regulator/regulator.txt)
+- vdda-supply: analog voltage regulator (see regulator/regulator.txt)
 
 Example:
 
@@ -21,4 +29,7 @@ pressure@77 {
 	default-oversampling = <2>;
 	interrupt-parent = <&gpio0>;
 	interrupts = <25 IRQ_TYPE_EDGE_RISING>;
+	reset-gpios = <&gpio0 26 GPIO_ACTIVE_LOW>;
+	vddd-supply = <&foo>;
+	vdda-supply = <&bar>;
 };
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
