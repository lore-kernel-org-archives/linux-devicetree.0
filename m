From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: [PATCHv4 1/5] net: dsa: Support internal phy on 'cpu' port
Date: Tue, 16 Jan 2018 11:19:54 +0100
Message-ID: <20180116101958.19711-2-sebastian.reichel@collabora.co.uk>
References: <20180116101958.19711-1-sebastian.reichel@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180116101958.19711-1-sebastian.reichel@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>
Cc: Ian Ray <ian.ray@ge.com>, Nandor Han <nandor.han@ge.com>, Rob Herring <robh+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sebastian Reichel <sebastian.reichel@collabora.co.uk>
List-Id: devicetree@vger.kernel.org

This adds support for enabling the internal PHY for a 'cpu' port.
It has been tested on GE B850v3,  B650v3 and B450v3, which have a
built-in MV88E6240 switch hardwired to a PCIe based network card
making use of the internal PHY. Since mv88e6xxx driver resets the
chip during probe, the PHY is disabled without this patch resulting
in missing link and non-functional switch device.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
---
 net/dsa/dsa2.c     | 25 +++++++++++++++++++------
 net/dsa/dsa_priv.h |  1 +
 net/dsa/port.c     | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 69 insertions(+), 6 deletions(-)

diff --git a/net/dsa/dsa2.c b/net/dsa/dsa2.c
index 1e287420ff49..f65938d10b6d 100644
--- a/net/dsa/dsa2.c
+++ b/net/dsa/dsa2.c
@@ -18,6 +18,7 @@
 #include <linux/rtnetlink.h>
 #include <linux/of.h>
 #include <linux/of_net.h>
+#include <linux/of_mdio.h>
 
 #include "dsa_priv.h"
 
@@ -271,11 +272,20 @@ static int dsa_port_setup(struct dsa_port *dp)
 		break;
 	case DSA_PORT_TYPE_CPU:
 	case DSA_PORT_TYPE_DSA:
-		err = dsa_port_fixed_link_register_of(dp);
-		if (err) {
-			dev_err(ds->dev, "failed to register fixed link for port %d.%d\n",
-				ds->index, dp->index);
-			return err;
+		if (of_phy_is_fixed_link(dp->dn)) {
+			err = dsa_port_fixed_link_register_of(dp);
+			if (err) {
+				dev_err(ds->dev, "failed to register fixed link for port %d.%d\n",
+					ds->index, dp->index);
+				return err;
+			}
+		} else {
+			err = dsa_port_setup_phy_of(dp, true);
+			if (err) {
+				dev_err(ds->dev, "failed to enable phy for port %d.%d\n",
+					ds->index, dp->index);
+				return err;
+			}
 		}
 
 		break;
@@ -301,7 +311,10 @@ static void dsa_port_teardown(struct dsa_port *dp)
 		break;
 	case DSA_PORT_TYPE_CPU:
 	case DSA_PORT_TYPE_DSA:
-		dsa_port_fixed_link_unregister_of(dp);
+		if (of_phy_is_fixed_link(dp->dn))
+			dsa_port_fixed_link_unregister_of(dp);
+		else
+			dsa_port_setup_phy_of(dp, false);
 		break;
 	case DSA_PORT_TYPE_USER:
 		if (dp->slave) {
diff --git a/net/dsa/dsa_priv.h b/net/dsa/dsa_priv.h
index 7d036696e8c4..6c14079e6cc8 100644
--- a/net/dsa/dsa_priv.h
+++ b/net/dsa/dsa_priv.h
@@ -159,6 +159,7 @@ int dsa_port_vlan_del(struct dsa_port *dp,
 		      const struct switchdev_obj_port_vlan *vlan);
 int dsa_port_fixed_link_register_of(struct dsa_port *dp);
 void dsa_port_fixed_link_unregister_of(struct dsa_port *dp);
+int dsa_port_setup_phy_of(struct dsa_port *dp, bool enable);
 
 /* slave.c */
 extern const struct dsa_device_ops notag_netdev_ops;
diff --git a/net/dsa/port.c b/net/dsa/port.c
index bb4be2679904..a1518024bba3 100644
--- a/net/dsa/port.c
+++ b/net/dsa/port.c
@@ -273,6 +273,55 @@ int dsa_port_vlan_del(struct dsa_port *dp,
 	return 0;
 }
 
+int dsa_port_setup_phy_of(struct dsa_port *dp, bool enable)
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
 int dsa_port_fixed_link_register_of(struct dsa_port *dp)
 {
 	struct device_node *dn = dp->dn;
-- 
2.15.1
