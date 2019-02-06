From: Russell King <rmk+kernel@armlinux.org.uk>
Subject: [PATCH net-next 5/6] net: marvell: neta: add comphy support
Date: Wed, 06 Feb 2019 11:35:07 +0000
Message-ID: <E1grLTv-00061v-Tw@rmk-PC.armlinux.org.uk>
References: <20190206113409.ko7lwuv5kb7l7rjo@shell.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190206113409.ko7lwuv5kb7l7rjo@shell.armlinux.org.uk>
Content-Disposition: inline
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Kishon Vijay Abraham I <kishon@ti.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org

Add support for the common phy binding, so that we can reconfigure the
comphy according to the desired ethernet speed.  This will allow us to
support 1000base-X and 2500base-X SFPs dynamically on SolidRun Clearfog.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/marvell/mvneta.c | 57 ++++++++++++++++++++++++++++++++---
 1 file changed, 53 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
index 61b23497f836..86bdb0eb463a 100644
--- a/drivers/net/ethernet/marvell/mvneta.c
+++ b/drivers/net/ethernet/marvell/mvneta.c
@@ -27,6 +27,7 @@
 #include <linux/of_irq.h>
 #include <linux/of_mdio.h>
 #include <linux/of_net.h>
+#include <linux/phy/phy.h>
 #include <linux/phy.h>
 #include <linux/phylink.h>
 #include <linux/platform_device.h>
@@ -436,6 +437,7 @@ struct mvneta_port {
 	struct device_node *dn;
 	unsigned int tx_csum_limit;
 	struct phylink *phylink;
+	struct phy *comphy;
 
 	struct mvneta_bm *bm_priv;
 	struct mvneta_bm_pool *pool_long;
@@ -3151,6 +3153,8 @@ static void mvneta_start_dev(struct mvneta_port *pp)
 {
 	int cpu;
 
+	WARN_ON(phy_power_on(pp->comphy));
+
 	mvneta_max_rx_size_set(pp, pp->pkt_size);
 	mvneta_txq_max_tx_size_set(pp, pp->pkt_size);
 
@@ -3213,6 +3217,8 @@ static void mvneta_stop_dev(struct mvneta_port *pp)
 
 	mvneta_tx_reset(pp);
 	mvneta_rx_reset(pp);
+
+	WARN_ON(phy_power_off(pp->comphy));
 }
 
 static void mvneta_percpu_enable(void *arg)
@@ -3338,6 +3344,7 @@ static int mvneta_set_mac_addr(struct net_device *dev, void *addr)
 static void mvneta_validate(struct net_device *ndev, unsigned long *supported,
 			    struct phylink_link_state *state)
 {
+	struct mvneta_port *pp = netdev_priv(ndev);
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(mask) = { 0, };
 
 	/* We only support QSGMII, SGMII, 802.3z and RGMII modes */
@@ -3358,8 +3365,13 @@ static void mvneta_validate(struct net_device *ndev, unsigned long *supported,
 	phylink_set(mask, Pause);
 
 	/* Half-duplex at speeds higher than 100Mbit is unsupported */
-	phylink_set(mask, 1000baseT_Full);
-	phylink_set(mask, 1000baseX_Full);
+	if (pp->comphy || state->interface != PHY_INTERFACE_MODE_2500BASEX) {
+		phylink_set(mask, 1000baseT_Full);
+		phylink_set(mask, 1000baseX_Full);
+	}
+	if (pp->comphy || state->interface == PHY_INTERFACE_MODE_2500BASEX) {
+		phylink_set(mask, 2500baseX_Full);
+	}
 
 	if (!phy_interface_mode_is_8023z(state->interface)) {
 		/* 10M and 100M are only supported in non-802.3z mode */
@@ -3373,6 +3385,11 @@ static void mvneta_validate(struct net_device *ndev, unsigned long *supported,
 		   __ETHTOOL_LINK_MODE_MASK_NBITS);
 	bitmap_and(state->advertising, state->advertising, mask,
 		   __ETHTOOL_LINK_MODE_MASK_NBITS);
+
+	/* We can only operate at 2500BaseX or 1000BaseX.  If requested
+	 * to advertise both, only report advertising at 2500BaseX.
+	 */
+	phylink_helper_basex_speed(state);
 }
 
 static int mvneta_mac_link_state(struct net_device *ndev,
@@ -3384,7 +3401,9 @@ static int mvneta_mac_link_state(struct net_device *ndev,
 	gmac_stat = mvreg_read(pp, MVNETA_GMAC_STATUS);
 
 	if (gmac_stat & MVNETA_GMAC_SPEED_1000)
-		state->speed = SPEED_1000;
+		state->speed =
+			state->interface == PHY_INTERFACE_MODE_2500BASEX ?
+			SPEED_2500 : SPEED_1000;
 	else if (gmac_stat & MVNETA_GMAC_SPEED_100)
 		state->speed = SPEED_100;
 	else
@@ -3499,12 +3518,32 @@ static void mvneta_mac_config(struct net_device *ndev, unsigned int mode,
 			    MVNETA_GMAC_FORCE_LINK_DOWN);
 	}
 
+
 	/* When at 2.5G, the link partner can send frames with shortened
 	 * preambles.
 	 */
 	if (state->speed == SPEED_2500)
 		new_ctrl4 |= MVNETA_GMAC4_SHORT_PREAMBLE_ENABLE;
 
+	if (pp->comphy) {
+		enum phy_mode mode = PHY_MODE_INVALID;
+
+		switch (state->interface) {
+		case PHY_INTERFACE_MODE_SGMII:
+		case PHY_INTERFACE_MODE_1000BASEX:
+			mode = PHY_MODE_SGMII;
+			break;
+		case PHY_INTERFACE_MODE_2500BASEX:
+			mode = PHY_MODE_2500SGMII;
+			break;
+		default:
+			break;
+		}
+
+		if (mode != PHY_MODE_INVALID)
+			WARN_ON(phy_set_mode(pp->comphy, mode));
+	}
+
 	if (new_ctrl0 != gmac_ctrl0)
 		mvreg_write(pp, MVNETA_GMAC_CTRL_0, new_ctrl0);
 	if (new_ctrl2 != gmac_ctrl2)
@@ -4405,7 +4444,7 @@ static int mvneta_port_power_up(struct mvneta_port *pp, int phy_mode)
 	if (phy_mode == PHY_INTERFACE_MODE_QSGMII)
 		mvreg_write(pp, MVNETA_SERDES_CFG, MVNETA_QSGMII_SERDES_PROTO);
 	else if (phy_mode == PHY_INTERFACE_MODE_SGMII ||
-		 phy_mode == PHY_INTERFACE_MODE_1000BASEX)
+		 phy_interface_mode_is_8023z(phy_mode))
 		mvreg_write(pp, MVNETA_SERDES_CFG, MVNETA_SGMII_SERDES_PROTO);
 	else if (!phy_interface_mode_is_rgmii(phy_mode))
 		return -EINVAL;
@@ -4422,6 +4461,7 @@ static int mvneta_probe(struct platform_device *pdev)
 	struct mvneta_port *pp;
 	struct net_device *dev;
 	struct phylink *phylink;
+	struct phy *comphy;
 	const char *dt_mac_addr;
 	char hw_mac_addr[ETH_ALEN];
 	const char *mac_from;
@@ -4447,6 +4487,14 @@ static int mvneta_probe(struct platform_device *pdev)
 		goto err_free_irq;
 	}
 
+	comphy = devm_of_phy_get(&pdev->dev, dn, NULL);
+	if (comphy == ERR_PTR(-EPROBE_DEFER)) {
+		err = -EPROBE_DEFER;
+		goto err_free_irq;
+	} else if (IS_ERR(comphy)) {
+		comphy = NULL;
+	}
+
 	phylink = phylink_create(dev, pdev->dev.fwnode, phy_mode,
 				 &mvneta_phylink_ops);
 	if (IS_ERR(phylink)) {
@@ -4463,6 +4511,7 @@ static int mvneta_probe(struct platform_device *pdev)
 	pp = netdev_priv(dev);
 	spin_lock_init(&pp->lock);
 	pp->phylink = phylink;
+	pp->comphy = comphy;
 	pp->phy_interface = phy_mode;
 	pp->dn = dn;
 
-- 
2.7.4
