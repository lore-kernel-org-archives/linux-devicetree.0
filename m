From: Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 2/3] usb: usb251xb: dt: add unit suffix to oc-delay and power-on-time
Date: Tue, 21 Feb 2017 09:56:18 +0100
Message-ID: <1487667379-2075-3-git-send-email-richard.leitner@skidata.com>
References: <1487667379-2075-1-git-send-email-richard.leitner@skidata.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1487667379-2075-1-git-send-email-richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, dev-M/VWbR8SM2SsTnJN9+BGXg@public.gmane.org, Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Rename oc-delay-* to oc-delay-us and make it expect a time value.
Furthermore add -ms suffix to power-on-time. These changes were
suggested by Rob Herring in https://lkml.org/lkml/2017/2/15/1283.

Signed-off-by: Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/usb251xb.txt |  9 +++---
 drivers/usb/misc/usb251xb.c                        | 32 +++++++++++++---------
 2 files changed, 24 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/usb251xb.txt b/Documentation/devicetree/bindings/usb/usb251xb.txt
index a5efd10..4d6bd73 100644
--- a/Documentation/devicetree/bindings/usb/usb251xb.txt
+++ b/Documentation/devicetree/bindings/usb/usb251xb.txt
@@ -31,7 +31,8 @@ Optional properties :
 	(default is individual)
  - dynamic-power-switching : enable auto-switching from self- to bus-powered
 	operation if the local power source is removed or unavailable
- - oc-delay-{100us,4ms,8ms,16ms} : set over current timer delay (default is 8ms)
+ - oc-delay-us : microseconds over current timer delay, valid values are 100,
+	4000, 8000 (default) and 16000. All other values are rounded up.
  - compound-device : indicated the hub is part of a compound device
  - port-mapping-mode : enable port mapping mode
  - string-support : enable string descriptor support (required for manufacturer,
@@ -40,9 +41,9 @@ Optional properties :
 	device connected.
  - sp-disabled-ports : Specifies the ports which will be self-power disabled
  - bp-disabled-ports : Specifies the ports which will be bus-power disabled
- - power-on-time : Specifies the time it takes from the time the host initiates
-	the power-on sequence to a port until the port has adequate power. The
-	value is given in ms in a 0 - 510 range (default is 100ms).
+ - power-on-time-ms : Specifies the time it takes from the time the host
+	initiates the power-on sequence to a port until the port has adequate
+	power. The value is given in ms in a 0 - 510 range (default is 100ms).
 
 Examples:
 	usb2512b@2c {
diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
index 3f9c306..58b887a 100644
--- a/drivers/usb/misc/usb251xb.c
+++ b/drivers/usb/misc/usb251xb.c
@@ -375,18 +375,24 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
 	if (of_get_property(np, "dynamic-power-switching", NULL))
 		hub->conf_data2 |= BIT(7);
 
-	if (of_get_property(np, "oc-delay-100us", NULL)) {
-		hub->conf_data2 &= ~BIT(5);
-		hub->conf_data2 &= ~BIT(4);
-	} else if (of_get_property(np, "oc-delay-4ms", NULL)) {
-		hub->conf_data2 &= ~BIT(5);
-		hub->conf_data2 |= BIT(4);
-	} else if (of_get_property(np, "oc-delay-8ms", NULL)) {
-		hub->conf_data2 |= BIT(5);
-		hub->conf_data2 &= ~BIT(4);
-	} else if (of_get_property(np, "oc-delay-16ms", NULL)) {
-		hub->conf_data2 |= BIT(5);
-		hub->conf_data2 |= BIT(4);
+	if (!of_property_read_u32(np, "oc-delay-us", property_u32)) {
+		if (*property_u32 < 100) {
+			/* 100 us*/
+			hub->conf_data2 &= ~BIT(5);
+			hub->conf_data2 &= ~BIT(4);
+		} else if (*property_u32 < 4000) {
+			/* 4 ms */
+			hub->conf_data2 &= ~BIT(5);
+			hub->conf_data2 |= BIT(4);
+		} else if (*property_u32 < 8000) {
+			/* 8 ms */
+			hub->conf_data2 |= BIT(5);
+			hub->conf_data2 &= ~BIT(4);
+		} else {
+			/* 16 ms */
+			hub->conf_data2 |= BIT(5);
+			hub->conf_data2 |= BIT(4);
+		}
 	}
 
 	if (of_get_property(np, "compound-device", NULL))
@@ -433,7 +439,7 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
 	}
 
 	hub->power_on_time = USB251XB_DEF_POWER_ON_TIME;
-	if (!of_property_read_u32(np, "power-on-time", property_u32))
+	if (!of_property_read_u32(np, "power-on-time-ms", property_u32))
 		hub->power_on_time = min_t(u8, be32_to_cpu(*property_u32) / 2,
 					   255);
 
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
