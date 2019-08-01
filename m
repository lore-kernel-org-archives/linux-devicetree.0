From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v4 2/4] net: phy: Add function to retrieve LED configuration from the DT
Date: Thu,  1 Aug 2019 12:07:57 -0700
Message-ID: <20190801190759.28201-3-mka@chromium.org>
References: <20190801190759.28201-1-mka@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190801190759.28201-1-mka@chromium.org>
Sender: netdev-owner@vger.kernel.org
To: "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

Add a phylib function for retrieving PHY LED configuration that
is specified in the device tree using the generic binding. LEDs
can be configured to be 'on' for a certain link speed or to blink
when there is TX/RX activity.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
Changes in v4:
- patch added to the series
---
 drivers/net/phy/phy_device.c | 50 ++++++++++++++++++++++++++++++++++++
 include/linux/phy.h          | 15 +++++++++++
 2 files changed, 65 insertions(+)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 6b5cb87f3866..b4b48de45712 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -2188,6 +2188,56 @@ static bool phy_drv_supports_irq(struct phy_driver *phydrv)
 	return phydrv->config_intr && phydrv->ack_interrupt;
 }
 
+int of_get_phy_led_cfg(struct phy_device *phydev, int led,
+		       struct phy_led_config *cfg)
+{
+	struct device_node *np, *child;
+	const char *trigger;
+	int ret;
+
+	if (!IS_ENABLED(CONFIG_OF_MDIO))
+		return -ENOENT;
+
+	np = of_find_node_by_name(phydev->mdio.dev.of_node, "leds");
+	if (!np)
+		return -ENOENT;
+
+	for_each_child_of_node(np, child) {
+		u32 val;
+
+		if (!of_property_read_u32(child, "reg", &val)) {
+			if (val == (u32)led)
+				break;
+		}
+	}
+
+	if (!child)
+		return -ENOENT;
+
+	ret = of_property_read_string(child, "linux,default-trigger",
+				      &trigger);
+	if (ret)
+		return ret;
+
+	if (!strcmp(trigger, "phy_link_10m_active")) {
+		cfg->trigger = PHY_LED_LINK_10M;
+	} else if (!strcmp(trigger, "phy_link_100m_active")) {
+		cfg->trigger = PHY_LED_LINK_100M;
+	} else if (!strcmp(trigger, "phy_link_1g_active")) {
+		cfg->trigger = PHY_LED_LINK_1G;
+	} else if (!strcmp(trigger, "phy_link_10g_active")) {
+		cfg->trigger = PHY_LED_LINK_10G;
+	}  else if (!strcmp(trigger, "phy_activity")) {
+		cfg->trigger = PHY_LED_ACTIVITY;
+	} else {
+		phydev_warn(phydev, "trigger '%s' for LED%d is invalid\n",
+			    trigger, led);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 /**
  * phy_probe - probe and init a PHY device
  * @dev: device to probe and init
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 462b90b73f93..b4693415be31 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -1176,6 +1176,21 @@ int phy_ethtool_set_link_ksettings(struct net_device *ndev,
 				   const struct ethtool_link_ksettings *cmd);
 int phy_ethtool_nway_reset(struct net_device *ndev);
 
+enum phy_led_trigger {
+	PHY_LED_LINK_10M,
+	PHY_LED_LINK_100M,
+	PHY_LED_LINK_1G,
+	PHY_LED_LINK_10G,
+	PHY_LED_ACTIVITY,
+};
+
+struct phy_led_config {
+	enum phy_led_trigger trigger;
+};
+
+int of_get_phy_led_cfg(struct phy_device *phydev, int led,
+		       struct phy_led_config *cfg);
+
 #if IS_ENABLED(CONFIG_PHYLIB)
 int __init mdio_bus_init(void);
 void mdio_bus_exit(void);
-- 
2.22.0.770.g0f2c4a37fd-goog
