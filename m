From: Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH 3/5] usb: usb251xb: Add max power/current dts nodes
Date: Sat, 16 Sep 2017 02:31:11 +0300
Message-ID: <20170915233113.17855-4-fancer.lancer@gmail.com>
References: <20170915233113.17855-1-fancer.lancer@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170915233113.17855-1-fancer.lancer@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: richard.leitner@skidata.com, gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: Sergey.Semin@t-platforms.ru, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>
List-Id: devicetree@vger.kernel.org

This parameters may be varied in accordance with hardware specifics.
So lets add the corresponding settings to the usb251x driver dts
specification.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 Documentation/devicetree/bindings/usb/usb251xb.txt |  6 ++++++
 drivers/usb/misc/usb251xb.c                        | 20 ++++++++++++++++----
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
index 8101c6212..d6a0ff4ec 100644
--- a/drivers/usb/misc/usb251xb.c
+++ b/drivers/usb/misc/usb251xb.c
@@ -493,6 +493,22 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
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
@@ -532,10 +548,6 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
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
