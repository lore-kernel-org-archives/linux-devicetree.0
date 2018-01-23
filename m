From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: [PATCHv5 1/5] net: dsa: Support internal phy on 'cpu' port
Date: Tue, 23 Jan 2018 16:03:46 +0100
Message-ID: <20180123150350.11031-2-sebastian.reichel@collabora.co.uk>
References: <20180123150350.11031-1-sebastian.reichel@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180123150350.11031-1-sebastian.reichel@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>
Cc: Ian Ray <ian.ray@ge.com>, Nandor Han <nandor.han@ge.com>, Rob Herring <robh+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@lists.collabora.co.uk, Sebastian Reichel <sebastian.reichel@collabora.co.uk>
List-Id: devicetree@vger.kernel.org

This adds support for enabling the internal PHY for a 'cpu' port.
It has been tested on GE B850v3,  B650v3 and B450v3, which have a
built-in MV88E6240 switch hardwired to a PCIe based network card.
On these machines the internal PHY of the i210 network card and
the Marvell switch are connected to each other and must be enabled
for properly using the switch. While the i210 PHY will be enabled
when the network interface is enabled, the switch's port is not
exposed as network interface. Additionally the mv88e6xxx driver
resets the chip during probe, so the PHY is disabled without this
patch.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
---
 net/dsa/dsa2.c     |   7 ++--
 net/dsa/dsa_priv.h |   4 +--
 net/dsa/legacy.c   |   4 +--
 net/dsa/port.c     | 103 ++++++++++++++++++++++++++++++++++++++++-------------
 4 files changed, 86 insertions(+), 32 deletions(-)

diff --git a/net/dsa/dsa2.c b/net/dsa/dsa2.c
index 1e287420ff49..78c8111eedc2 100644
--- a/net/dsa/dsa2.c
+++ b/net/dsa/dsa2.c
@@ -271,13 +271,12 @@ static int dsa_port_setup(struct dsa_port *dp)
 		break;
 	case DSA_PORT_TYPE_CPU:
 	case DSA_PORT_TYPE_DSA:
-		err = dsa_port_fixed_link_register_of(dp);
+		err = dsa_port_link_register_of(dp);
 		if (err) {
-			dev_err(ds->dev, "failed to register fixed link for port %d.%d\n",
+			dev_err(ds->dev, "failed to setup link for port %d.%d\n",
 				ds->index, dp->index);
 			return err;
 		}
-
 		break;
 	case DSA_PORT_TYPE_USER:
 		err = dsa_slave_create(dp);
@@ -301,7 +300,7 @@ static void dsa_port_teardown(struct dsa_port *dp)
 		break;
 	case DSA_PORT_TYPE_CPU:
 	case DSA_PORT_TYPE_DSA:
-		dsa_port_fixed_link_unregister_of(dp);
+		dsa_port_link_unregister_of(dp);
 		break;
 	case DSA_PORT_TYPE_USER:
 		if (dp->slave) {
diff --git a/net/dsa/dsa_priv.h b/net/dsa/dsa_priv.h
index 7d036696e8c4..1cb3b75720c8 100644
--- a/net/dsa/dsa_priv.h
+++ b/net/dsa/dsa_priv.h
@@ -157,8 +157,8 @@ int dsa_port_vlan_add(struct dsa_port *dp,
 		      struct switchdev_trans *trans);
 int dsa_port_vlan_del(struct dsa_port *dp,
 		      const struct switchdev_obj_port_vlan *vlan);
-int dsa_port_fixed_link_register_of(struct dsa_port *dp);
-void dsa_port_fixed_link_unregister_of(struct dsa_port *dp);
+int dsa_port_link_register_of(struct dsa_port *dp);
+void dsa_port_link_unregister_of(struct dsa_port *dp);
 
 /* slave.c */
 extern const struct dsa_device_ops notag_netdev_ops;
diff --git a/net/dsa/legacy.c b/net/dsa/legacy.c
index 84611d7fcfa2..a8d94a65849f 100644
--- a/net/dsa/legacy.c
+++ b/net/dsa/legacy.c
@@ -86,7 +86,7 @@ static int dsa_cpu_dsa_setups(struct dsa_switch *ds)
 		if (!(dsa_is_cpu_port(ds, port) || dsa_is_dsa_port(ds, port)))
 			continue;
 
-		ret = dsa_port_fixed_link_register_of(&ds->ports[port]);
+		ret = dsa_port_link_register_of(&ds->ports[port]);
 		if (ret)
 			return ret;
 	}
@@ -275,7 +275,7 @@ static void dsa_switch_destroy(struct dsa_switch *ds)
 	for (port = 0; port < ds->num_ports; port++) {
 		if (!(dsa_is_cpu_port(ds, port) || dsa_is_dsa_port(ds, port)))
 			continue;
-		dsa_port_fixed_link_unregister_of(&ds->ports[port]);
+		dsa_port_link_unregister_of(&ds->ports[port]);
 	}
 
 	if (ds->slave_mii_bus && ds->ops->phy_read)
diff --git a/net/dsa/port.c b/net/dsa/port.c
index bb4be2679904..7acc1169d75e 100644
--- a/net/dsa/port.c
+++ b/net/dsa/port.c
@@ -273,7 +273,56 @@ int dsa_port_vlan_del(struct dsa_port *dp,
 	return 0;
 }
 
-int dsa_port_fixed_link_register_of(struct dsa_port *dp)
+static int dsa_port_setup_phy_of(struct dsa_port *dp, bool enable)
+{
+	struct device_node *port_dn = dp->dn;
+	struct device_node *phy_dn;
+	struct dsa_switch *ds = dp->ds;
+	struct phy_device *phydev;
+	int port = dp->index;
+	int err = 0;
+
+	phy_dn = of_parse_phandle(port_dn, "phy-handle", 0);
+	if (!phy_dn)
+		return 0;
+
+	phydev = of_phy_find_device(phy_dn);
+	if (!phydev) {
+		err = -EPROBE_DEFER;
+		goto err_put_of;
+	}
+
+	if (enable) {
+		err = genphy_config_init(phydev);
+		if (err < 0)
+			goto err_put_dev;
+
+		err = genphy_resume(phydev);
+		if (err < 0)
+			goto err_put_dev;
+
+		err = genphy_read_status(phydev);
+		if (err < 0)
+			goto err_put_dev;
+	} else {
+		err = genphy_suspend(phydev);
+		if (err < 0)
+			goto err_put_dev;
+	}
+
+	if (ds->ops->adjust_link)
+		ds->ops->adjust_link(ds, port, phydev);
+
+	dev_dbg(ds->dev, "enabled port's phy: %s", phydev_name(phydev));
+
+err_put_dev:
+	put_device(&phydev->mdio.dev);
+err_put_of:
+	of_node_put(phy_dn);
+	return err;
+}
+
+static int dsa_port_fixed_link_register_of(struct dsa_port *dp)
 {
 	struct device_node *dn = dp->dn;
 	struct dsa_switch *ds = dp->ds;
@@ -282,38 +331,44 @@ int dsa_port_fixed_link_register_of(struct dsa_port *dp)
 	int mode;
 	int err;
 
-	if (of_phy_is_fixed_link(dn)) {
-		err = of_phy_register_fixed_link(dn);
-		if (err) {
-			dev_err(ds->dev,
-				"failed to register the fixed PHY of port %d\n",
-				port);
-			return err;
-		}
+	err = of_phy_register_fixed_link(dn);
+	if (err) {
+		dev_err(ds->dev,
+			"failed to register the fixed PHY of port %d\n",
+			port);
+		return err;
+	}
 
-		phydev = of_phy_find_device(dn);
+	phydev = of_phy_find_device(dn);
 
-		mode = of_get_phy_mode(dn);
-		if (mode < 0)
-			mode = PHY_INTERFACE_MODE_NA;
-		phydev->interface = mode;
+	mode = of_get_phy_mode(dn);
+	if (mode < 0)
+		mode = PHY_INTERFACE_MODE_NA;
+	phydev->interface = mode;
 
-		genphy_config_init(phydev);
-		genphy_read_status(phydev);
+	genphy_config_init(phydev);
+	genphy_read_status(phydev);
 
-		if (ds->ops->adjust_link)
-			ds->ops->adjust_link(ds, port, phydev);
+	if (ds->ops->adjust_link)
+		ds->ops->adjust_link(ds, port, phydev);
 
-		put_device(&phydev->mdio.dev);
-	}
+	put_device(&phydev->mdio.dev);
 
 	return 0;
 }
 
-void dsa_port_fixed_link_unregister_of(struct dsa_port *dp)
+int dsa_port_link_register_of(struct dsa_port *dp)
 {
-	struct device_node *dn = dp->dn;
+	if (of_phy_is_fixed_link(dp->dn))
+		return dsa_port_fixed_link_register_of(dp);
+	else
+		return dsa_port_setup_phy_of(dp, true);
+}
 
-	if (of_phy_is_fixed_link(dn))
-		of_phy_deregister_fixed_link(dn);
+void dsa_port_link_unregister_of(struct dsa_port *dp)
+{
+	if (of_phy_is_fixed_link(dp->dn))
+		of_phy_deregister_fixed_link(dp->dn);
+	else
+		dsa_port_setup_phy_of(dp, false);
 }
-- 
2.15.1
