From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
Subject: [PATCH 1/5] dts: gpio_atmel: adapt binding doc to reality
Date: Fri, 26 May 2017 20:06:05 +0200
Message-ID: <20170526180609.2699-1-uwe@kleine-koenig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The second cell in a gpio reference is used to pass GPIO_ACTIVE_LOW or
GPIO_ACTIVE_HIGH. The gpio device can also be used as irq controller and
a reference can contain the IRQ_TYPE_* values in the second cell.

Signed-off-by: Uwe Kleine-König <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
---
 Documentation/devicetree/bindings/gpio/gpio_atmel.txt | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio_atmel.txt b/Documentation/devicetree/bindings/gpio/gpio_atmel.txt
index 85f8c0d084fa..b53fe3bce270 100644
--- a/Documentation/devicetree/bindings/gpio/gpio_atmel.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio_atmel.txt
@@ -5,9 +5,16 @@ Required properties:
 - reg: Should contain GPIO controller registers location and length
 - interrupts: Should be the port interrupt shared by all the pins.
 - #gpio-cells: Should be two.  The first cell is the pin number and
-  the second cell is used to specify optional parameters (currently
-  unused).
+  the second cell is used to specify optional parameters to declare if the GPIO
+  is active high or low. See gpio.txt.
 - gpio-controller: Marks the device node as a GPIO controller.
+- interrupt-controller: Marks the device node as a GPIO controller.
+- #interrupt-cells: Should be two. The first cell is the pin number and the
+  second cell is used to specify irq type flags:
+      1 = low-to-high edge triggered.
+      2 = high-to-low edge triggered.
+      4 = active high level-sensitive.
+      8 = active low level-sensitive.
 
 optional properties:
 - #gpio-lines: Number of gpio if absent 32.
@@ -21,5 +28,7 @@ Example:
 		#gpio-cells = <2>;
 		gpio-controller;
 		#gpio-lines = <19>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
 	};
 
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
