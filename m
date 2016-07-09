From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH v4 3/3] ath9k: parse the device configuration from an OF node
Date: Sun, 10 Jul 2016 01:28:34 +0200
Message-ID: <20160709232834.31654-4-martin.blumenstingl@googlemail.com>
References: <20160624123430.4097-1-martin.blumenstingl@googlemail.com>
 <20160709232834.31654-1-martin.blumenstingl@googlemail.com>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160709232834.31654-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ath9k-devel-xDcbHBWguxHbcTqmT+pZeQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ath9k-devel-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org
Cc: mcgrof-3uybbJdB1yH774rrrx3eTA@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org, arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This makes it possible to configure ath9k based devices using
devicetree. That makes some out-of-tree "convert devicetree to
ath9k_platform_data glue"-code obsolete.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 drivers/net/wireless/ath/ath9k/init.c | 55 +++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/net/wireless/ath/ath9k/init.c b/drivers/net/wireless/ath/ath9k/init.c
index edc74fc..9dd7ed5 100644
--- a/drivers/net/wireless/ath/ath9k/init.c
+++ b/drivers/net/wireless/ath/ath9k/init.c
@@ -20,6 +20,8 @@
 #include <linux/slab.h>
 #include <linux/ath9k_platform.h>
 #include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_net.h>
 #include <linux/relay.h>
 #include <net/ieee80211_radiotap.h>
 
@@ -555,6 +557,55 @@ static int ath9k_init_platform(struct ath_softc *sc)
 	return 0;
 }
 
+static int ath9k_of_init(struct ath_softc *sc)
+{
+	struct device_node *np = sc->dev->of_node;
+	struct ath_hw *ah = sc->sc_ah;
+	struct ath_common *common = ath9k_hw_common(ah);
+	enum ath_bus_type bus_type = common->bus_ops->ath_bus_type;
+	const char *mac;
+	char eeprom_name[100];
+	int ret;
+
+	if (!of_device_is_available(np))
+		return 0;
+
+	ath_dbg(common, CONFIG, "parsing configuration from OF node\n");
+
+	if (of_property_read_bool(np, "qca,clk-25mhz"))
+		ah->is_clk_25mhz = true;
+
+	if (of_property_read_bool(np, "qca,disable-2ghz"))
+		ah->disable_2ghz = true;
+
+	if (of_property_read_bool(np, "qca,disable-5ghz"))
+		ah->disable_5ghz = true;
+
+	if (of_property_read_bool(np, "qca,check-eeprom-endianness"))
+		ah->ah_flags &= ~AH_NO_EEP_SWAP;
+	else
+		ah->ah_flags |= AH_NO_EEP_SWAP;
+
+	if (of_property_read_bool(np, "qca,no-eeprom")) {
+		/* ath9k-eeprom-<bus>-<id>.bin */
+		scnprintf(eeprom_name, sizeof(eeprom_name),
+			  "ath9k-eeprom-%s-%s.bin",
+			  ath_bus_type_to_string(bus_type), dev_name(ah->dev));
+
+		ret = ath9k_eeprom_request(sc, eeprom_name);
+		if (ret)
+			return ret;
+	}
+
+	mac = of_get_mac_address(np);
+	if (mac)
+		ether_addr_copy(common->macaddr, mac);
+
+	ah->ah_flags &= ~AH_USE_EEPROM;
+
+	return 0;
+}
+
 static int ath9k_init_softc(u16 devid, struct ath_softc *sc,
 			    const struct ath_bus_ops *bus_ops)
 {
@@ -611,6 +662,10 @@ static int ath9k_init_softc(u16 devid, struct ath_softc *sc,
 	if (ret)
 		return ret;
 
+	ret = ath9k_of_init(sc);
+	if (ret)
+		return ret;
+
 	if (ath9k_led_active_high != -1)
 		ah->config.led_active_high = ath9k_led_active_high == 1;
 
-- 
2.9.0

--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
