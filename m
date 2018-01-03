From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: [PATCHv1 1/6] net: dsa: Support internal phy on 'cpu' port
Date: Wed,  3 Jan 2018 13:26:04 +0100
Message-ID: <20180103122609.5482-2-sebastian.reichel@collabora.co.uk>
References: <20180103122609.5482-1-sebastian.reichel@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180103122609.5482-1-sebastian.reichel@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>
Cc: Ian Ray <ian.ray@ge.com>, Nandor Han <nandor.han@ge.com>, Rob Herring <robh+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sebastian Reichel <sebastian.reichel@collabora.co.uk>
List-Id: devicetree@vger.kernel.org

This adds support for enabling the internal phy for a 'cpu' port.
It has been tested on GE B850v3 and B650v3, which have a built-in
MV88E6240 switch connected to a PCIe based network card. Without
this patch the link does not come up and no traffic can be routed
through the switch.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
---
 net/dsa/port.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/net/dsa/port.c b/net/dsa/port.c
index bb4be2679904..f99c1d34416c 100644
--- a/net/dsa/port.c
+++ b/net/dsa/port.c
@@ -282,6 +282,10 @@ int dsa_port_fixed_link_register_of(struct dsa_port *dp)
 	int mode;
 	int err;
 
+	mode = of_get_phy_mode(dn);
+	if (mode < 0)
+		mode = PHY_INTERFACE_MODE_NA;
+
 	if (of_phy_is_fixed_link(dn)) {
 		err = of_phy_register_fixed_link(dn);
 		if (err) {
@@ -292,10 +296,6 @@ int dsa_port_fixed_link_register_of(struct dsa_port *dp)
 		}
 
 		phydev = of_phy_find_device(dn);
-
-		mode = of_get_phy_mode(dn);
-		if (mode < 0)
-			mode = PHY_INTERFACE_MODE_NA;
 		phydev->interface = mode;
 
 		genphy_config_init(phydev);
@@ -305,6 +305,24 @@ int dsa_port_fixed_link_register_of(struct dsa_port *dp)
 			ds->ops->adjust_link(ds, port, phydev);
 
 		put_device(&phydev->mdio.dev);
+	} else if (mode == PHY_INTERFACE_MODE_INTERNAL ||
+		   mode == PHY_INTERFACE_MODE_NA) {
+		phydev = mdiobus_get_phy(ds->slave_mii_bus, port);
+		if (phydev) {
+			genphy_config_init(phydev);
+			genphy_resume(phydev);
+			genphy_read_status(phydev);
+
+			if (ds->ops->adjust_link)
+				ds->ops->adjust_link(ds, port, phydev);
+
+			dev_dbg(ds->dev, "enabled cpu port's phy: %s",
+				phydev_name(phydev));
+		} else {
+			dev_warn(ds->dev, "cpu port has no internal phy and no fixed linked has been configured!");
+		}
+	} else {
+		dev_err(ds->dev, "unsupported phy mode!");
 	}
 
 	return 0;
-- 
2.15.1
