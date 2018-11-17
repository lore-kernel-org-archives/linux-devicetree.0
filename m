From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 3/7] net: phy: icplus: keep all ip101a_g functions together
Date: Sat, 17 Nov 2018 19:20:03 +0100
Message-ID: <20181117182007.14791-4-martin.blumenstingl@googlemail.com>
References: <20181117182007.14791-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20181117182007.14791-1-martin.blumenstingl@googlemail.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, andrew@lunn.ch, mark.rutland@arm.com, robh+dt@kernel.org, davem@davemloft.net
Cc: linux-kernel@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

This simply moves ip101a_g_config_init right above
ip101a_g_config_intr so all functions for the ICPlus IP101A/G PHYs are
grouped together.
No functional changes.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/net/phy/icplus.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/net/phy/icplus.c b/drivers/net/phy/icplus.c
index ad87bd3280d7..3d3e9134c762 100644
--- a/drivers/net/phy/icplus.c
+++ b/drivers/net/phy/icplus.c
@@ -162,21 +162,6 @@ static int ip1001_config_init(struct phy_device *phydev)
 	return 0;
 }
 
-static int ip101a_g_config_init(struct phy_device *phydev)
-{
-	int c;
-
-	c = ip1xx_reset(phydev);
-	if (c < 0)
-		return c;
-
-	/* Enable Auto Power Saving mode */
-	c = phy_read(phydev, IP10XX_SPEC_CTRL_STATUS);
-	c |= IP101A_G_APS_ON;
-
-	return phy_write(phydev, IP10XX_SPEC_CTRL_STATUS, c);
-}
-
 static int ip175c_read_status(struct phy_device *phydev)
 {
 	if (phydev->mdio.addr == 4) /* WAN port */
@@ -196,6 +181,21 @@ static int ip175c_config_aneg(struct phy_device *phydev)
 	return 0;
 }
 
+static int ip101a_g_config_init(struct phy_device *phydev)
+{
+	int c;
+
+	c = ip1xx_reset(phydev);
+	if (c < 0)
+		return c;
+
+	/* Enable Auto Power Saving mode */
+	c = phy_read(phydev, IP10XX_SPEC_CTRL_STATUS);
+	c |= IP101A_G_APS_ON;
+
+	return phy_write(phydev, IP10XX_SPEC_CTRL_STATUS, c);
+}
+
 static int ip101a_g_config_intr(struct phy_device *phydev)
 {
 	u16 val;
-- 
2.19.1
