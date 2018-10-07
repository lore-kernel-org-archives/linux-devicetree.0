From: Richard Cochran <richardcochran@gmail.com>
Subject: [PATCH V2 net-next 4/5] net: mdio: of: Register discovered MII time stampers.
Date: Sun,  7 Oct 2018 10:38:22 -0700
Message-ID: <20181007173823.21590-5-richardcochran@gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, David Miller <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Jacob Keller <jacob.e.keller@intel.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-Id: devicetree@vger.kernel.org

When parsing a PHY node, register its time stamper, if any, and attach
the instance to the PHY device.

Signed-off-by: Richard Cochran <richardcochran@gmail.com>
---
 drivers/net/phy/phy_device.c |  3 +++
 drivers/of/of_mdio.c         | 26 ++++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index a454432d166f..c24bce9b7270 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -833,6 +833,9 @@ EXPORT_SYMBOL(phy_device_register);
  */
 void phy_device_remove(struct phy_device *phydev)
 {
+	if (phydev->mii_ts)
+		unregister_mii_timestamper(phydev->mii_ts);
+
 	device_del(&phydev->mdio.dev);
 
 	/* Assert the reset signal */
diff --git a/drivers/of/of_mdio.c b/drivers/of/of_mdio.c
index f76c10ecc616..7699f167e4a9 100644
--- a/drivers/of/of_mdio.c
+++ b/drivers/of/of_mdio.c
@@ -44,14 +44,38 @@ static int of_get_phy_id(struct device_node *device, u32 *phy_id)
 	return -EINVAL;
 }
 
+struct mii_timestamper *of_find_mii_timestamper(struct device_node *node)
+{
+	struct of_phandle_args args;
+	unsigned int port = 0;
+	int err;
+
+	err = of_parse_phandle_with_args(node, "timestamper",
+					 "#phandle-cells", 0, &args);
+	if (err == -ENOENT)
+		return NULL;
+	else if (err)
+		return ERR_PTR(err);
+
+	if (args.args_count >= 1)
+		port = args.args[0];
+
+	return register_mii_timestamper(args.np, port);
+}
+
 static int of_mdiobus_register_phy(struct mii_bus *mdio,
 				    struct device_node *child, u32 addr)
 {
+	struct mii_timestamper *mii_ts;
 	struct phy_device *phy;
 	bool is_c45;
 	int rc;
 	u32 phy_id;
 
+	mii_ts = of_find_mii_timestamper(child);
+	if (IS_ERR(mii_ts))
+		return PTR_ERR(mii_ts);
+
 	is_c45 = of_device_is_compatible(child,
 					 "ethernet-phy-ieee802.3-c45");
 
@@ -97,6 +121,8 @@ static int of_mdiobus_register_phy(struct mii_bus *mdio,
 		return rc;
 	}
 
+	phy->mii_ts = mii_ts;
+
 	dev_dbg(&mdio->dev, "registered phy %s at address %i\n",
 		child->name, addr);
 	return 0;
-- 
2.11.0
