Return-Path: <SRS0=W1u3=GL=gmail.com=richardcochran@kernel.org>
From: Richard Cochran <richardcochran@gmail.com>
Subject: [PATCH net-next RFC V1 3/5] net: Introduce field for the MII time stamper.
Date: Wed, 21 Mar 2018 11:58:16 -0700
Message-Id: <338f19a006839f1d00e3cfd3521bdd5fd0afc5fe.1521656774.git.richardcochran@gmail.com>
In-Reply-To: <cover.1521656774.git.richardcochran@gmail.com>
References: <cover.1521656774.git.richardcochran@gmail.com>
To: netdev@vger.kernel.org
Cc: devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, David Miller <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-ID: <devicetree@vger.kernel.org>

This patch adds a new field to the network device structure to reference
a time stamping device on the MII bus.  By decoupling the time stamping
function from the PHY device, we pave the way to allowing a non-PHY
device to take this role.

Signed-off-by: Richard Cochran <richardcochran@gmail.com>
---
 drivers/net/phy/mdio_bus.c | 51 +++++++++++++++++++++++++++++++++++++++++++++-
 include/linux/netdevice.h  |  1 +
 2 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/mdio_bus.c b/drivers/net/phy/mdio_bus.c
index 24b5511222c8..fdac8c8ac272 100644
--- a/drivers/net/phy/mdio_bus.c
+++ b/drivers/net/phy/mdio_bus.c
@@ -717,6 +717,47 @@ static int mdio_uevent(struct device *dev, struct kobj_uevent_env *env)
 	return 0;
 }
 
+static bool mdiodev_supports_timestamping(struct mdio_device *mdiodev)
+{
+	if (mdiodev->ts_info  && mdiodev->hwtstamp &&
+	    mdiodev->rxtstamp && mdiodev->txtstamp)
+		return true;
+	else
+		return false;
+}
+
+static int mdiobus_netdev_notification(struct notifier_block *nb,
+				       unsigned long msg, void *ptr)
+{
+	struct net_device *netdev = netdev_notifier_info_to_dev(ptr);
+	struct phy_device *phydev = netdev->phydev;
+	struct mdio_device *mdev;
+	struct mii_bus *bus;
+	int i;
+
+	if (netdev->mdiots || msg != NETDEV_UP || !phydev)
+		return NOTIFY_DONE;
+
+	/*
+	 * Examine the MII bus associated with the PHY that is
+	 * attached to the MAC.  If there is a time stamping device
+	 * on the bus, then connect it to the network device.
+	 */
+	bus = phydev->mdio.bus;
+
+	for (i = 0; i < PHY_MAX_ADDR; i++) {
+		mdev = bus->mdio_map[i];
+		if (!mdev)
+			continue;
+		if (mdiodev_supports_timestamping(mdev)) {
+			netdev->mdiots = mdev;
+			return NOTIFY_OK;
+		}
+	}
+
+	return NOTIFY_DONE;
+}
+
 #ifdef CONFIG_PM
 static int mdio_bus_suspend(struct device *dev)
 {
@@ -772,6 +813,10 @@ struct bus_type mdio_bus_type = {
 };
 EXPORT_SYMBOL(mdio_bus_type);
 
+static struct notifier_block mdiobus_netdev_notifier __read_mostly = {
+	.notifier_call = mdiobus_netdev_notification,
+};
+
 int __init mdio_bus_init(void)
 {
 	int ret;
@@ -782,14 +827,18 @@ int __init mdio_bus_init(void)
 		if (ret)
 			class_unregister(&mdio_bus_class);
 	}
+	if (ret)
+		return ret;
+
+	return register_netdevice_notifier(&mdiobus_netdev_notifier);
 
-	return ret;
 }
 EXPORT_SYMBOL_GPL(mdio_bus_init);
 
 #if IS_ENABLED(CONFIG_PHYLIB)
 void mdio_bus_exit(void)
 {
+	unregister_netdevice_notifier(&mdiobus_netdev_notifier);
 	class_unregister(&mdio_bus_class);
 	bus_unregister(&mdio_bus_type);
 }
diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 5fbb9f1da7fd..223d691aa0b0 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -1943,6 +1943,7 @@ struct net_device {
 	struct netprio_map __rcu *priomap;
 #endif
 	struct phy_device	*phydev;
+	struct mdio_device	*mdiots;
 	struct lock_class_key	*qdisc_tx_busylock;
 	struct lock_class_key	*qdisc_running_key;
 	bool			proto_down;
-- 
2.11.0
