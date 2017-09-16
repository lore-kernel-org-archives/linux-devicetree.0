From: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 8/9 v2] usb: usb251xb: Add max power/current dts property support
Date: Sat, 16 Sep 2017 13:42:19 +0300
Message-ID: <20170916104220.3742-9-fancer.lancer@gmail.com>
References: <20170915233113.17855-1-fancer.lancer@gmail.com>
 <20170916104220.3742-1-fancer.lancer@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170916104220.3742-1-fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: Sergey.Semin-vHJ8rsvMqnUPfZBKTuL5GA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This parameters may be varied in accordance with hardware specifics.
So lets add the corresponding settings to the usb251x driver dts
specification.

Signed-off-by: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/usb251xb.txt   |  6 ++++++
 drivers/usb/misc/usb251xb.c                          | 20 ++++++++++++++++----
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/usb251xb.txt b/Documentation/devicetree/bindings/usb/usb251xb.txt
index 3d84626d3..dd59a32e7 100644
--- a/Documentation/devicetree/bindings/usb/usb251xb.txt
+++ b/Documentation/devicetree/bindings/usb/usb251xb.txt
@@ -44,6 +44,12 @@ Optional properties :
 	device connected.
  - sp-disabled-ports : Specifies the ports which will be self-power disabled
  - bp-disabled-ports : Specifies the ports which will be bus-power disabled
+ - sp-max-{power,current} : Indicates the power/current consumed by hub from
+	an upstream port (VBUS) when operation as a self-powered hub. The value
+	is given in mA in a 0 - 100 range (default is 1mA).
+ - bp-max-{power,current} : Indicates the power/current consumed by hub from
+	an upstream port (VBUS) when operation as a bus-powered hub. The value
+	is given in mA in a 0 - 510 range (default is 100mA).
  - power-on-time-ms : Specifies the time it takes from the time the host
 	initiates the power-on sequence to a port until the port has adequate
 	power. The value is given in ms in a 0 - 510 range (default is 100ms).
diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
index c308b0006..71994b883 100644
--- a/drivers/usb/misc/usb251xb.c
+++ b/drivers/usb/misc/usb251xb.c
@@ -497,6 +497,22 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
 		}
 	}
 
+	hub->max_power_sp = USB251XB_DEF_MAX_POWER_SELF;
+	if (!of_property_read_u32(np, "sp-max-power", &property_u32))
+		hub->max_power_sp = min_t(u8, property_u32 / 2, 50);
+
+	hub->max_power_bp = USB251XB_DEF_MAX_POWER_BUS;
+	if (!of_property_read_u32(np, "bp-max-power", &property_u32))
+		hub->max_power_bp = min_t(u8, property_u32 / 2, 255);
+
+	hub->max_current_sp = USB251XB_DEF_MAX_CURRENT_SELF;
+	if (!of_property_read_u32(np, "sp-max-current", &property_u32))
+		hub->max_current_sp = min_t(u8, property_u32 / 2, 50);
+
+	hub->max_current_bp = USB251XB_DEF_MAX_CURRENT_BUS;
+	if (!of_property_read_u32(np, "bp-max-current", &property_u32))
+		hub->max_current_bp = min_t(u8, property_u32 / 2, 255);
+
 	hub->power_on_time = USB251XB_DEF_POWER_ON_TIME;
 	if (!of_property_read_u32(np, "power-on-time-ms", &property_u32))
 		hub->power_on_time = min_t(u8, property_u32 / 2, 255);
@@ -536,10 +552,6 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
 	/* The following parameters are currently not exposed to devicetree, but
 	 * may be as soon as needed.
 	 */
-	hub->max_power_sp = USB251XB_DEF_MAX_POWER_SELF;
-	hub->max_power_bp = USB251XB_DEF_MAX_POWER_BUS;
-	hub->max_current_sp = USB251XB_DEF_MAX_CURRENT_SELF;
-	hub->max_current_bp = USB251XB_DEF_MAX_CURRENT_BUS;
 	hub->bat_charge_en = USB251XB_DEF_BATTERY_CHARGING_ENABLE;
 	hub->boost_up = USB251XB_DEF_BOOST_UP;
 	hub->boost_57 = USB251XB_DEF_BOOST_57;
-- 
2.12.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
