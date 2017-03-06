From: Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 1/4] usb: usb251xb: remove max_{power,current}_{sp,bp} properties
Date: Mon, 6 Mar 2017 09:24:20 +0100
Message-ID: <1488788663-21084-2-git-send-email-richard.leitner@skidata.com>
References: <1488788663-21084-1-git-send-email-richard.leitner@skidata.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1488788663-21084-1-git-send-email-richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, dev-M/VWbR8SM2SsTnJN9+BGXg@public.gmane.org, Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Remove the max_{power,current}_{sp,bp} properties of the usb251xb driver
from devicetree. This is done to simplify the dt bindings as requested
by Rob Herring in https://lkml.org/lkml/2017/2/15/1283. If those
properties are ever needed by somebody they can be enabled again easily.

Signed-off-by: Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/usb251xb.txt | 20 ------------------
 drivers/usb/misc/usb251xb.c                        | 24 ++++------------------
 2 files changed, 4 insertions(+), 40 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/usb251xb.txt b/Documentation/devicetree/bindings/usb/usb251xb.txt
index 0c065f7..a5efd10 100644
--- a/Documentation/devicetree/bindings/usb/usb251xb.txt
+++ b/Documentation/devicetree/bindings/usb/usb251xb.txt
@@ -40,26 +40,6 @@ Optional properties :
 	device connected.
  - sp-disabled-ports : Specifies the ports which will be self-power disabled
  - bp-disabled-ports : Specifies the ports which will be bus-power disabled
- - max-sp-power : Specifies the maximum current the hub consumes from an
-	upstream port when operating as self-powered hub including the power
-	consumption of a permanently attached peripheral if the hub is
-	configured as a compound device. The value is given in mA in a 0 - 500
-	range (default is 2).
- - max-bp-power : Specifies the maximum current the hub consumes from an
-	upstream port when operating as bus-powered hub including the power
-	consumption of a permanently attached peripheral if the hub is
-	configured as a compound device. The value is given in mA in a 0 - 500
-	range (default is 100).
- - max-sp-current : Specifies the maximum current the hub consumes from an
-	upstream port when operating as self-powered hub EXCLUDING the power
-	consumption of a permanently attached peripheral if the hub is
-	configured as a compound device. The value is given in mA in a 0 - 500
-	range (default is 2).
- - max-bp-current : Specifies the maximum current the hub consumes from an
-	upstream port when operating as bus-powered hub EXCLUDING the power
-	consumption of a permanently attached peripheral if the hub is
-	configured as a compound device. The value is given in mA in a 0 - 500
-	range (default is 100).
  - power-on-time : Specifies the time it takes from the time the host initiates
 	the power-on sequence to a port until the port has adequate power. The
 	value is given in ms in a 0 - 510 range (default is 100ms).
diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
index 4e18600..3f9c306 100644
--- a/drivers/usb/misc/usb251xb.c
+++ b/drivers/usb/misc/usb251xb.c
@@ -432,26 +432,6 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
 		}
 	}
 
-	hub->max_power_sp = USB251XB_DEF_MAX_POWER_SELF;
-	if (!of_property_read_u32(np, "max-sp-power", property_u32))
-		hub->max_power_sp = min_t(u8, be32_to_cpu(*property_u32) / 2,
-					  250);
-
-	hub->max_power_bp = USB251XB_DEF_MAX_POWER_BUS;
-	if (!of_property_read_u32(np, "max-bp-power", property_u32))
-		hub->max_power_bp = min_t(u8, be32_to_cpu(*property_u32) / 2,
-					  250);
-
-	hub->max_current_sp = USB251XB_DEF_MAX_CURRENT_SELF;
-	if (!of_property_read_u32(np, "max-sp-current", property_u32))
-		hub->max_current_sp = min_t(u8, be32_to_cpu(*property_u32) / 2,
-					    250);
-
-	hub->max_current_bp = USB251XB_DEF_MAX_CURRENT_BUS;
-	if (!of_property_read_u32(np, "max-bp-current", property_u32))
-		hub->max_current_bp = min_t(u8, be32_to_cpu(*property_u32) / 2,
-					    250);
-
 	hub->power_on_time = USB251XB_DEF_POWER_ON_TIME;
 	if (!of_property_read_u32(np, "power-on-time", property_u32))
 		hub->power_on_time = min_t(u8, be32_to_cpu(*property_u32) / 2,
@@ -492,6 +472,10 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
 	/* The following parameters are currently not exposed to devicetree, but
 	 * may be as soon as needed.
 	 */
+	hub->max_power_sp = USB251XB_DEF_MAX_POWER_SELF;
+	hub->max_power_bp = USB251XB_DEF_MAX_POWER_BUS;
+	hub->max_current_sp = USB251XB_DEF_MAX_CURRENT_SELF;
+	hub->max_current_bp = USB251XB_DEF_MAX_CURRENT_BUS;
 	hub->bat_charge_en = USB251XB_DEF_BATTERY_CHARGING_ENABLE;
 	hub->boost_up = USB251XB_DEF_BOOST_UP;
 	hub->boost_x = USB251XB_DEF_BOOST_X;
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
