From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH net-next] of: mdio: honor flags passed to of_phy_connect
Date: Tue, 16 Sep 2014 10:49:36 -0700
Message-ID: <1410889776-11107-1-git-send-email-f.fainelli@gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: davem@davemloft.net, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>
List-Id: devicetree@vger.kernel.org

Commit f9a8f83b04e0 ("net: phy: remove flags argument from phy_{attach,
connect, connect_direct}") removed the flags argument to the PHY library
calls to: phy_{attach,connect,connect_direct}.

Most Device Tree aware drivers call of_phy_connect() with the flag
argument set to 0, but some of them might want to set a different value
there in order for the PHY driver to key a specific behavior based on
the phy_device::dev_flags value.

Allow such drivers to set custom dev_flags as part of the
of_phy_connect() call since of_phy_connect() does start the PHY state
machine, it will call into the PHY driver config_init() callback which
is usually where a specific phy_flags value is important.

Fixes: f9a8f83b04e0 ("net: phy: remove flags argument from phy_{attach, connect, connect_direct}")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
David,

This is applicable to 3.9 and newer, thanks!

 drivers/of/of_mdio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/of/of_mdio.c b/drivers/of/of_mdio.c
index 401b2453da45..a85d80012993 100644
--- a/drivers/of/of_mdio.c
+++ b/drivers/of/of_mdio.c
@@ -224,6 +224,8 @@ struct phy_device *of_phy_connect(struct net_device *dev,
 	if (!phy)
 		return NULL;
 
+	phy->dev_flags = flags;
+
 	return phy_connect_direct(dev, phy, hndlr, iface) ? NULL : phy;
 }
 EXPORT_SYMBOL(of_phy_connect);
-- 
1.9.1
