From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [RFC] improve binding for linux,wdt-gpio
Date: Tue, 28 Jul 2015 22:33:48 +0200
Message-ID: <1438115628-2819-1-git-send-email-u.kleine-koenig@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>, Mike Looijmans <mike.looijmans-Oq418RWZeHk@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is just a suggestion up to now, I don't have any code yet to share.

Apart from minor rewording to make the document easier to understand and
less ambiguous the relevant changes are:

 - add an "enable-gpio" property.
   I admit the device I'm currently working with doesn't have this.
   Still I imagine this to be a common hardware property. I added it
   mainly to demonstrate the shortcomings of the existing binding.
 - rename "gpios" to "trigger-gpio"
   This is more descriptive. And given there is "enable-gpio" now, too,
   using plain "gpios" seems wrong.
 - deprecate always-running
   Apart from the description describing the driver behaviour and not
   the device property, always-running only seems to make sense in
   combination with hw_algo = "level" and in reality should only
   invalidate the sentence: "The watchdog timer is disabled when GPIO is
   left floating or connected to a three-state buffer."
   With this semantic using a property "disable-on-tri-state" sounds
   more sensible. And note that even the following would make sense
   hardware-wise, while the device tree looks stupid:

	watchdog {
		compatible = "linux,wdt-gpio";
		trigger-gpio = ...;
		hw_algo = "toggle";
		always-running;
		enable-gpio = ...;
	};

   (i.e. always-running, but disable possible by a dedicated gpio.)

I'm aware that using ...-gpios is more common than ...-gpio. I don't
feel strong here, but as only a single gpio makes sense here, having
-gpios seems wrong.

Also I considered renaming hw_margin_ms and hw_algo to use - instead of
_. Doing this might even ease to implement the changes above in a
compatible way. I.e. assume the watchdog can be disabled by tristating
the gpio if the description uses underscores instead of hyphen.

Feedback very welcome!

Best regards
Uwe

---
 .../devicetree/bindings/watchdog/gpio-wdt.txt      | 37 ++++++++++++++--------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/gpio-wdt.txt b/Documentation/devicetree/bindings/watchdog/gpio-wdt.txt
index 198794963786..ceb1a5f95f44 100644
--- a/Documentation/devicetree/bindings/watchdog/gpio-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/gpio-wdt.txt
@@ -2,27 +2,36 @@
 
 Required Properties:
 - compatible: Should contain "linux,wdt-gpio".
-- gpios: From common gpio binding; gpio connection to WDT reset pin.
-- hw_algo: The algorithm used by the driver. Should be one of the
+- trigger-gpio: reference to the gpio connected to watchdog's input pin
+  (typically called WDI).
+- hw_algo: The algorithm used by the device. Should be one of the
   following values:
-  - toggle: Either a high-to-low or a low-to-high transition clears
-    the WDT counter. The watchdog timer is disabled when GPIO is
-    left floating or connected to a three-state buffer.
-  - level: Low or high level starts counting WDT timeout,
-    the opposite level disables the WDT. Active level is determined
-    by the GPIO flags.
-- hw_margin_ms: Maximum time to reset watchdog circuit (milliseconds).
+  - toggle: Both a high-to-low and a low-to-high transition clear
+    the watchdog counter.
+  - level: Low or high level starts counting watchdog timeout,
+    the opposite level disables the watchdog. Active level is determined
+    by the GPIO flags of the trigger-gpio (with active meaning the watchdog is
+    enabled).
+- hw_margin_ms: Maximum time to reset watchdog circuit in milliseconds.
 
 Optional Properties:
-- always-running: If the watchdog timer cannot be disabled, add this flag to
-  have the driver keep toggling the signal without a client. It will only cease
-  to toggle the signal when the device is open and the timeout elapsed.
+- enable-gpio: Reference to a gpio that when inactive stops the watchdog.
+- disable-on-tri-state: property that signals that the watchdog can be stopped
+  by setting the trigger-gpio to tri-state.
+
+Deprecated Properties:
+- always-running: This property signals the watchdog timer cannot be disabled.
+  Without this property the watchdog is expected to turn off for hw_algo=toggle
+  watchdogs when the gpio is set to tri-state.
+  Don't use it for new device descriptions as it is misleading in the presence
+  of an enable-gpio.
+- gpios: deprecated alias of trigger-gpio
 
 Example:
 	watchdog: watchdog {
 		/* ADM706 */
-		compatible = "linux,wdt-gpio";
-		gpios = <&gpio3 9 GPIO_ACTIVE_LOW>;
+		compatible = "adi,adm706", "linux,wdt-gpio";
+		trigger-gpio = <&gpio3 9 GPIO_ACTIVE_LOW>;
 		hw_algo = "toggle";
 		hw_margin_ms = <1600>;
 	};
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
