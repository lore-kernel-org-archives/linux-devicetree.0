From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: [PATCHv2 1/5] net: dsa: Support internal phy on 'cpu' port
Date: Mon, 15 Jan 2018 13:15:04 +0100
Message-ID: <20180115121508.14544-2-sebastian.reichel@collabora.co.uk>
References: <20180115121508.14544-1-sebastian.reichel@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180115121508.14544-1-sebastian.reichel@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>
Cc: Ian Ray <ian.ray@ge.com>, Nandor Han <nandor.han@ge.com>, Rob Herring <robh+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sebastian Reichel <sebastian.reichel@collabora.co.uk>
List-Id: devicetree@vger.kernel.org

This adds support for enabling the internal PHY for a 'cpu' port.
It has been tested on GE B850v3,  B650v3 and B450v3, which have a
built-in MV88E6240 switch connected to a PCIe based network card.
Without this patch the link does not come up and no traffic can be
routed through the switch.

The PHY interface, that is being used on the above test systems is
part of the MV88E6240 and since mv88e6xxx driver resets the chip
during probe, it is definitely disabled without this patch.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
---
 net/dsa/port.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/net/dsa/port.c b/net/dsa/port.c
index bb4be2679904..33ea0d73350d 100644
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
@@ -305,6 +305,21 @@ int dsa_port_fixed_link_register_of(struct dsa_port *dp)
 			ds->ops->adjust_link(ds, port, phydev);
 
 		put_device(&phydev->mdio.dev);
+	} else if (mode == PHY_INTERFACE_MODE_INTERNAL) {
+		phydev = mdiobus_get_phy(ds->slave_mii_bus, port);
+		if (!phydev) {
+			dev_err(ds->dev, "port %d has no internal phy!", port);
+			return -ENODEV;
+		}
+
+		genphy_config_init(phydev);
+		genphy_resume(phydev);
+		genphy_read_status(phydev);
+
+		if (ds->ops->adjust_link)
+			ds->ops->adjust_link(ds, port, phydev);
+
+		dev_dbg(ds->dev, "enabled port's phy: %s", phydev_name(phydev));
 	}
 
 	return 0;
-- 
2.15.1
