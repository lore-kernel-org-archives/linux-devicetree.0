From: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: [PATCH] gpio: mention in DT binding doc that <name>-gpio is also supported
Date: Thu, 17 Sep 2015 03:33:58 +0200
Message-ID: <1442453638-14246-1-git-send-email-javier@osg.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The GPIO DT binding doc mentions that GPIO are mapped by defining
a <name>-gpios property in the consumer device's node but a -gpio
sufix is also supported after commit:

dd34c37aa3e8 ("gpio: of: Allow -gpio suffix for property names")

Update the DT binding documentation to match the implementation.

Signed-off-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>

---
Hello,

The GPIO documentation was updated to mention that the -gpio sufix
is also supported in patch https://lkml.org/lkml/2015/9/1/117 that
already landed in Torvalds tree.

I now noticed that the DT binding also only mentions -gpios so I'm
posting this patch that adds -gpio to the DT binding documentation.

Best regards,
Javier

 Documentation/devicetree/bindings/gpio/gpio.txt | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
index 5788d5cf1252..8db8c7bb96c1 100644
--- a/Documentation/devicetree/bindings/gpio/gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio.txt
@@ -13,10 +13,10 @@ properties, each containing a 'gpio-list':
 	gpio-specifier : Array of #gpio-cells specifying specific gpio
 			 (controller specific)
 
-GPIO properties should be named "[<name>-]gpios", with <name> being the purpose
-of this GPIO for the device. While a non-existent <name> is considered valid
-for compatibility reasons (resolving to the "gpios" property), it is not allowed
-for new bindings.
+GPIO properties should be named "[<name>-]gpios" or "[<name>-]gpio" with <name>
+being the purpose of this GPIO for the device. While a non-existent <name> is
+considered valid for compatibility reasons (resolving to the "gpios" property),
+it is not allowed for new bindings.
 
 GPIO properties can contain one or more GPIO phandles, but only in exceptional
 cases should they contain more than one. If your device uses several GPIOs with
-- 
2.4.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
