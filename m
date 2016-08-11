From: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Subject: [PATCH] gpio: dt-bindings: remove ti,tps65086-gpio binding
Date: Thu, 11 Aug 2016 13:40:13 -0500
Message-ID: <20160811184013.2499-1-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This binding is no longer correct, the GPIO information can should be
added to the parent node and not into this child node. See
Documentation/devicetree/bindings/mfd/tps65086.txt for the correct usage.

Signed-off-by: Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org>
---
 Documentation/devicetree/bindings/gpio/gpio-tps65086.txt | 16 ----------------
 1 file changed, 16 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-tps65086.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-tps65086.txt b/Documentation/devicetree/bindings/gpio/gpio-tps65086.txt
deleted file mode 100644
index ba05107..0000000
--- a/Documentation/devicetree/bindings/gpio/gpio-tps65086.txt
+++ /dev/null
@@ -1,16 +0,0 @@
-* TPS65086 GPO Controller bindings
-
-Required properties:
- - compatible		: Should be "ti,tps65086-gpio".
- - gpio-controller	: Marks the device node as a GPIO Controller.
- - #gpio-cells		: Should be two. The first cell is the pin number
-			    and the second cell is used to specify flags.
-			    See ../gpio/gpio.txt for possible values.
-
-Example:
-
-	gpio4: gpio {
-		compatible = "ti,tps65086-gpio";
-		gpio-controller;
-		#gpio-cells = <2>;
-	};
-- 
2.9.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
