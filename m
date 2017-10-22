From: Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH 09/10 v3] usb: usb251xb: Add max power/current dts property support
Date: Sun, 22 Oct 2017 23:38:11 +0300
Message-ID: <20171022203812.9379-10-fancer.lancer@gmail.com>
References: <20170916104220.3742-1-fancer.lancer@gmail.com>
 <20171022203812.9379-1-fancer.lancer@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171022203812.9379-1-fancer.lancer@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: richard.leitner@skidata.com, gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: Sergey.Semin@t-platforms.ru, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>
List-Id: devicetree@vger.kernel.org

This parameters may be varied in accordance with hardware specifics.
So lets add the corresponding settings to the usb251xb driver dts
specification.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/usb/misc/usb251xb.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
index 29432fd3b..669b98be2 100644
--- a/drivers/usb/misc/usb251xb.c
+++ b/drivers/usb/misc/usb251xb.c
@@ -500,6 +500,26 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
 		}
 	}
 
+	hub->max_power_sp = USB251XB_DEF_MAX_POWER_SELF;
+	if (!of_property_read_u32(np, "sp-max-total-current-microamp",
+	    &property_u32))
+		hub->max_power_sp = min_t(u8, property_u32 / 2000, 50);
+
+	hub->max_power_bp = USB251XB_DEF_MAX_POWER_BUS;
+	if (!of_property_read_u32(np, "bp-max-total-current-microamp",
+	    &property_u32))
+		hub->max_power_bp = min_t(u8, property_u32 / 2000, 255);
+
+	hub->max_current_sp = USB251XB_DEF_MAX_CURRENT_SELF;
+	if (!of_property_read_u32(np, "sp-max-removable-current-microamp",
+	    &property_u32))
+		hub->max_current_sp = min_t(u8, property_u32 / 2000, 50);
+
+	hub->max_current_bp = USB251XB_DEF_MAX_CURRENT_BUS;
+	if (!of_property_read_u32(np, "bp-max-removable-current-microamp",
+	    &property_u32))
+		hub->max_current_bp = min_t(u8, property_u32 / 2000, 255);
+
 	hub->power_on_time = USB251XB_DEF_POWER_ON_TIME;
 	if (!of_property_read_u32(np, "power-on-time-ms", &property_u32))
 		hub->power_on_time = min_t(u8, property_u32 / 2, 255);
@@ -539,10 +559,6 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
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
