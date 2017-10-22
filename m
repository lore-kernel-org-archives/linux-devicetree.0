From: Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH 08/10 v3] usb: usb251xb: Fix property_u32 NULL pointer dereference
Date: Sun, 22 Oct 2017 23:38:10 +0300
Message-ID: <20171022203812.9379-9-fancer.lancer@gmail.com>
References: <20170916104220.3742-1-fancer.lancer@gmail.com>
 <20171022203812.9379-1-fancer.lancer@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171022203812.9379-1-fancer.lancer@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: richard.leitner@skidata.com, gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: Sergey.Semin@t-platforms.ru, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>
List-Id: devicetree@vger.kernel.org

The methods like of_property_read_u32 utilizing the specified
pointer permit only the pointer to a preallocated u32 storage as the
third argument. As a result the driver crashes on NULL pointer
dereference in case if "oc-delay-us" or "power-on-time-ms" declared
in dts file.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/usb/misc/usb251xb.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
index 80df778e0..29432fd3b 100644
--- a/drivers/usb/misc/usb251xb.c
+++ b/drivers/usb/misc/usb251xb.c
@@ -348,7 +348,7 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
 	struct device *dev = hub->dev;
 	struct device_node *np = dev->of_node;
 	int len, err, i;
-	u32 *property_u32 = NULL;
+	u32 property_u32 = 0;
 	const u32 *cproperty_u32;
 	const char *cproperty_char;
 	char str[USB251XB_STRING_BUFSIZE / 2];
@@ -425,16 +425,16 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
 	if (of_get_property(np, "dynamic-power-switching", NULL))
 		hub->conf_data2 |= BIT(7);
 
-	if (!of_property_read_u32(np, "oc-delay-us", property_u32)) {
-		if (*property_u32 == 100) {
+	if (!of_property_read_u32(np, "oc-delay-us", &property_u32)) {
+		if (property_u32 == 100) {
 			/* 100 us*/
 			hub->conf_data2 &= ~BIT(5);
 			hub->conf_data2 &= ~BIT(4);
-		} else if (*property_u32 == 4000) {
+		} else if (property_u32 == 4000) {
 			/* 4 ms */
 			hub->conf_data2 &= ~BIT(5);
 			hub->conf_data2 |= BIT(4);
-		} else if (*property_u32 == 16000) {
+		} else if (property_u32 == 16000) {
 			/* 16 ms */
 			hub->conf_data2 |= BIT(5);
 			hub->conf_data2 |= BIT(4);
@@ -501,8 +501,8 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
 	}
 
 	hub->power_on_time = USB251XB_DEF_POWER_ON_TIME;
-	if (!of_property_read_u32(np, "power-on-time-ms", property_u32))
-		hub->power_on_time = min_t(u8, *property_u32 / 2, 255);
+	if (!of_property_read_u32(np, "power-on-time-ms", &property_u32))
+		hub->power_on_time = min_t(u8, property_u32 / 2, 255);
 
 	if (of_property_read_u16_array(np, "language-id", &hub->lang_id, 1))
 		hub->lang_id = USB251XB_DEF_LANGUAGE_ID;
-- 
2.12.0
