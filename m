From: Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH v5 03/13] net: phy: adin: add support for interrupts
Date: Fri, 16 Aug 2019 16:10:01 +0300
Message-ID: <20190816131011.23264-4-alexandru.ardelean@analog.com>
References: <20190816131011.23264-1-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190816131011.23264-1-alexandru.ardelean@analog.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, f.fainelli@gmail.com, hkallweit1@gmail.com, andrew@lunn.ch, Alexandru Ardelean <alexandru.ardelean@analog.com>
List-Id: devicetree@vger.kernel.org

This change hooks link-status-change interrupts to phylib.

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 drivers/net/phy/adin.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/net/phy/adin.c b/drivers/net/phy/adin.c
index fc0148ba4b94..f4ee611e33df 100644
--- a/drivers/net/phy/adin.c
+++ b/drivers/net/phy/adin.c
@@ -14,11 +14,43 @@
 #define PHY_ID_ADIN1200				0x0283bc20
 #define PHY_ID_ADIN1300				0x0283bc30
 
+#define ADIN1300_INT_MASK_REG			0x0018
+#define   ADIN1300_INT_MDIO_SYNC_EN		BIT(9)
+#define   ADIN1300_INT_ANEG_STAT_CHNG_EN	BIT(8)
+#define   ADIN1300_INT_ANEG_PAGE_RX_EN		BIT(6)
+#define   ADIN1300_INT_IDLE_ERR_CNT_EN		BIT(5)
+#define   ADIN1300_INT_MAC_FIFO_OU_EN		BIT(4)
+#define   ADIN1300_INT_RX_STAT_CHNG_EN		BIT(3)
+#define   ADIN1300_INT_LINK_STAT_CHNG_EN	BIT(2)
+#define   ADIN1300_INT_SPEED_CHNG_EN		BIT(1)
+#define   ADIN1300_INT_HW_IRQ_EN		BIT(0)
+#define ADIN1300_INT_MASK_EN	\
+	(ADIN1300_INT_LINK_STAT_CHNG_EN | ADIN1300_INT_HW_IRQ_EN)
+#define ADIN1300_INT_STATUS_REG			0x0019
+
 static int adin_config_init(struct phy_device *phydev)
 {
 	return genphy_config_init(phydev);
 }
 
+static int adin_phy_ack_intr(struct phy_device *phydev)
+{
+	/* Clear pending interrupts */
+	int rc = phy_read(phydev, ADIN1300_INT_STATUS_REG);
+
+	return rc < 0 ? rc : 0;
+}
+
+static int adin_phy_config_intr(struct phy_device *phydev)
+{
+	if (phydev->interrupts == PHY_INTERRUPT_ENABLED)
+		return phy_set_bits(phydev, ADIN1300_INT_MASK_REG,
+				    ADIN1300_INT_MASK_EN);
+
+	return phy_clear_bits(phydev, ADIN1300_INT_MASK_REG,
+			      ADIN1300_INT_MASK_EN);
+}
+
 static struct phy_driver adin_driver[] = {
 	{
 		PHY_ID_MATCH_MODEL(PHY_ID_ADIN1200),
@@ -26,6 +58,8 @@ static struct phy_driver adin_driver[] = {
 		.config_init	= adin_config_init,
 		.config_aneg	= genphy_config_aneg,
 		.read_status	= genphy_read_status,
+		.ack_interrupt	= adin_phy_ack_intr,
+		.config_intr	= adin_phy_config_intr,
 		.resume		= genphy_resume,
 		.suspend	= genphy_suspend,
 	},
@@ -35,6 +69,8 @@ static struct phy_driver adin_driver[] = {
 		.config_init	= adin_config_init,
 		.config_aneg	= genphy_config_aneg,
 		.read_status	= genphy_read_status,
+		.ack_interrupt	= adin_phy_ack_intr,
+		.config_intr	= adin_phy_config_intr,
 		.resume		= genphy_resume,
 		.suspend	= genphy_suspend,
 	},
-- 
2.20.1
