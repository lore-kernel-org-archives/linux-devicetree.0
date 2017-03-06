From: Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 2/4] usb: usb251xb: dt: add unit suffix to oc-delay and power-on-time
Date: Mon, 6 Mar 2017 09:24:21 +0100
Message-ID: <1488788663-21084-3-git-send-email-richard.leitner@skidata.com>
References: <1488788663-21084-1-git-send-email-richard.leitner@skidata.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1488788663-21084-1-git-send-email-richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, dev-M/VWbR8SM2SsTnJN9+BGXg@public.gmane.org, Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Rename oc-delay-* to oc-delay-us and make it expect a time value.
Furthermore add -ms suffix to power-on-time. There changes were
suggested by Rob Herring in https://lkml.org/lkml/2017/2/15/1283.

Signed-off-by: Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/usb251xb.txt | 10 ++++---
 drivers/usb/misc/usb251xb.c                        | 35 ++++++++++++----------
 2 files changed, 26 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/usb251xb.txt b/Documentation/devicetree/bindings/usb/usb251xb.txt
index a5efd10..91499ae 100644
--- a/Documentation/devicetree/bindings/usb/usb251xb.txt
+++ b/Documentation/devicetree/bindings/usb/usb251xb.txt
@@ -31,7 +31,9 @@ Optional properties :
 	(default is individual)
  - dynamic-power-switching : enable auto-switching from self- to bus-powered
 	operation if the local power source is removed or unavailable
- - oc-delay-{100us,4ms,8ms,16ms} : set over current timer delay (default is 8ms)
+ - oc-delay-us : Delay time (in microseconds) for filtering the over-current
+	sense inputs. Valid values are 100, 4000, 8000 (default) and 16000. If
+	an invalid value is given, the default is used instead.
  - compound-device : indicated the hub is part of a compound device
  - port-mapping-mode : enable port mapping mode
  - string-support : enable string descriptor support (required for manufacturer,
@@ -40,9 +42,9 @@ Optional properties :
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
index 3f9c306..91f66d68 100644
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
+		if (*property_u32 == 100) {
+			/* 100 us*/
+			hub->conf_data2 &= ~BIT(5);
+			hub->conf_data2 &= ~BIT(4);
+		} else if (*property_u32 == 4000) {
+			/* 4 ms */
+			hub->conf_data2 &= ~BIT(5);
+			hub->conf_data2 |= BIT(4);
+		} else if (*property_u32 == 16000) {
+			/* 16 ms */
+			hub->conf_data2 |= BIT(5);
+			hub->conf_data2 |= BIT(4);
+		} else {
+			/* 8 ms (DEFAULT) */
+			hub->conf_data2 |= BIT(5);
+			hub->conf_data2 &= ~BIT(4);
+		}
 	}
 
 	if (of_get_property(np, "compound-device", NULL))
@@ -433,9 +439,8 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
 	}
 
 	hub->power_on_time = USB251XB_DEF_POWER_ON_TIME;
-	if (!of_property_read_u32(np, "power-on-time", property_u32))
-		hub->power_on_time = min_t(u8, be32_to_cpu(*property_u32) / 2,
-					   255);
+	if (!of_property_read_u32(np, "power-on-time-ms", property_u32))
+		hub->power_on_time = min_t(u8, *property_u32 / 2, 255);
 
 	if (of_property_read_u16_array(np, "language-id", &hub->lang_id, 1))
 		hub->lang_id = USB251XB_DEF_LANGUAGE_ID;
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
