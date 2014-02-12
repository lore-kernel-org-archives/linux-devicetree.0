From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH net-next 01/10] net: phy: add "internal" PHY mode
Date: Tue, 11 Feb 2014 20:07:24 -0800
Message-ID: <1392178053-3143-2-git-send-email-f.fainelli@gmail.com>
References: <1392178053-3143-1-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1392178053-3143-1-git-send-email-f.fainelli@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: davem@davemloft.net, cernekee@gmail.com, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>
List-Id: devicetree@vger.kernel.org

On some systems, the PHY can be internal, in the same package as the
Ethernet MAC, and still be responding to a specific address on the MDIO
bus, in that case, the Ethernet MAC might need to know about it to
properly configure a port multiplexer to switch to an internal or
external PHY. Add a new PHY interface mode for this and update the
Device Tree of_get_phy_mode() function to look for it.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/of/of_net.c | 1 +
 include/linux/phy.h | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/of/of_net.c b/drivers/of/of_net.c
index a208a45..729beba 100644
--- a/drivers/of/of_net.c
+++ b/drivers/of/of_net.c
@@ -31,6 +31,7 @@ static const char *phy_modes[] = {
 	[PHY_INTERFACE_MODE_RTBI]	= "rtbi",
 	[PHY_INTERFACE_MODE_SMII]	= "smii",
 	[PHY_INTERFACE_MODE_XGMII]	= "xgmii",
+	[PHY_INTERFACE_MODE_INTERNAL]	= "internal",
 };
 
 /**
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 565188c..463434b 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -74,6 +74,7 @@ typedef enum {
 	PHY_INTERFACE_MODE_RTBI,
 	PHY_INTERFACE_MODE_SMII,
 	PHY_INTERFACE_MODE_XGMII,
+	PHY_INTERFACE_MODE_INTERNAL,
 } phy_interface_t;
 
 
@@ -553,7 +554,8 @@ static inline bool phy_interrupt_is_valid(struct phy_device *phydev)
  */
 static inline bool phy_is_internal(struct phy_device *phydev)
 {
-	return phydev->is_internal;
+	return phydev->is_internal ||
+		phydev->interface == PHY_INTERFACE_MODE_INTERNAL;
 }
 
 /**
-- 
1.8.3.2
