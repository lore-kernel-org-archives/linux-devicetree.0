From: Biao Huang <biao.huang@mediatek.com>
Subject: [v3, PATCH 2/2] net-next: stmmac: dwmac-mediatek: remove fine-tune property
Date: Wed, 19 Dec 2018 15:22:41 +0800
Message-ID: <1545204161-15742-3-git-send-email-biao.huang@mediatek.com>
References: <1545204161-15742-1-git-send-email-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1545204161-15742-1-git-send-email-biao.huang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: davem@davemloft.net, robh+dt@kernel.org
Cc: honghui.zhang@mediatek.com, yt.shen@mediatek.com, liguo.zhang@mediatek.com, mark.rutland@arm.com, nelson.chang@mediatek.com, matthias.bgg@gmail.com, biao.huang@mediatek.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, joabreu@synopsys.com, andrew@lunn.ch
List-Id: devicetree@vger.kernel.org

1. remove fine-tune property and related setting to simplify
the timing adjustment flow.
2. set timing value according to the value from device tree,
and will not care whether PHY insert internal delay.

Signed-off-by: Biao Huang <biao.huang@mediatek.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-mediatek.c   |   71 +++++++-------------
 1 file changed, 24 insertions(+), 47 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index e400cbd..bf25629 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -44,7 +44,6 @@ struct mac_delay_struct {
 	u32 rx_delay;
 	bool tx_inv;
 	bool rx_inv;
-	bool fine_tune;
 };
 
 struct mediatek_dwmac_plat_data {
@@ -105,16 +104,28 @@ static int mt2712_set_interface(struct mediatek_dwmac_plat_data *plat)
 	return 0;
 }
 
-static void mt2712_delay_ps2stage(struct mac_delay_struct *mac_delay)
+static void mt2712_delay_ps2stage(struct mediatek_dwmac_plat_data *plat)
 {
-	if (mac_delay->fine_tune) {
-		/* 170ps per stage for fine tune delay macro circuit*/
-		mac_delay->tx_delay /= 170;
-		mac_delay->rx_delay /= 170;
-	} else {
-		/* 550ps per stage for coarse tune delay macro circuit*/
+	struct mac_delay_struct *mac_delay = &plat->mac_delay;
+
+	switch (plat->phy_mode) {
+	case PHY_INTERFACE_MODE_MII:
+	case PHY_INTERFACE_MODE_RMII:
+		/* 550ps per stage for MII/RMII */
 		mac_delay->tx_delay /= 550;
 		mac_delay->rx_delay /= 550;
+		break;
+	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+		/* 170ps per stage for RGMII */
+		mac_delay->tx_delay /= 170;
+		mac_delay->rx_delay /= 170;
+		break;
+	default:
+		dev_err(plat->dev, "phy interface not supported\n");
+		break;
 	}
 }
 
@@ -123,7 +134,7 @@ static int mt2712_set_delay(struct mediatek_dwmac_plat_data *plat)
 	struct mac_delay_struct *mac_delay = &plat->mac_delay;
 	u32 delay_val = 0, fine_val = 0;
 
-	mt2712_delay_ps2stage(mac_delay);
+	mt2712_delay_ps2stage(plat);
 
 	switch (plat->phy_mode) {
 	case PHY_INTERFACE_MODE_MII:
@@ -167,13 +178,10 @@ static int mt2712_set_delay(struct mediatek_dwmac_plat_data *plat)
 			fine_val = ETH_RMII_DLY_TX_INV;
 		break;
 	case PHY_INTERFACE_MODE_RGMII:
-		/* the PHY is not responsible for inserting any internal
-		 * delay by itself in PHY_INTERFACE_MODE_RGMII case,
-		 * so Ethernet MAC will insert delays for both transmit
-		 * and receive path here.
-		 */
-		if (mac_delay->fine_tune)
-			fine_val = ETH_FINE_DLY_GTXC | ETH_FINE_DLY_RXC;
+	case PHY_INTERFACE_MODE_RGMII_TXID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+		fine_val = ETH_FINE_DLY_GTXC | ETH_FINE_DLY_RXC;
 
 		delay_val |= FIELD_PREP(ETH_DLY_GTXC_ENABLE, !!mac_delay->tx_delay);
 		delay_val |= FIELD_PREP(ETH_DLY_GTXC_STAGES, mac_delay->tx_delay);
@@ -183,36 +191,6 @@ static int mt2712_set_delay(struct mediatek_dwmac_plat_data *plat)
 		delay_val |= FIELD_PREP(ETH_DLY_RXC_STAGES, mac_delay->rx_delay);
 		delay_val |= FIELD_PREP(ETH_DLY_RXC_INV, mac_delay->rx_inv);
 		break;
-	case PHY_INTERFACE_MODE_RGMII_TXID:
-		/* the PHY should insert an internal delay for the transmit
-		 * path in PHY_INTERFACE_MODE_RGMII_TXID case,
-		 * so Ethernet MAC will insert the delay for receive path here.
-		 */
-		if (mac_delay->fine_tune)
-			fine_val = ETH_FINE_DLY_RXC;
-
-		delay_val |= FIELD_PREP(ETH_DLY_RXC_ENABLE, !!mac_delay->rx_delay);
-		delay_val |= FIELD_PREP(ETH_DLY_RXC_STAGES, mac_delay->rx_delay);
-		delay_val |= FIELD_PREP(ETH_DLY_RXC_INV, mac_delay->rx_inv);
-		break;
-	case PHY_INTERFACE_MODE_RGMII_RXID:
-		/* the PHY should insert an internal delay for the receive
-		 * path in PHY_INTERFACE_MODE_RGMII_RXID case,
-		 * so Ethernet MAC will insert the delay for transmit path here.
-		 */
-		if (mac_delay->fine_tune)
-			fine_val = ETH_FINE_DLY_GTXC;
-
-		delay_val |= FIELD_PREP(ETH_DLY_GTXC_ENABLE, !!mac_delay->tx_delay);
-		delay_val |= FIELD_PREP(ETH_DLY_GTXC_STAGES, mac_delay->tx_delay);
-		delay_val |= FIELD_PREP(ETH_DLY_GTXC_INV, mac_delay->tx_inv);
-		break;
-	case PHY_INTERFACE_MODE_RGMII_ID:
-		/* the PHY should insert internal delays for both transmit
-		 * and receive path in PHY_INTERFACE_MODE_RGMII_RXID case,
-		 * so Ethernet MAC will NOT insert any delay here.
-		 */
-		break;
 	default:
 		dev_err(plat->dev, "phy interface not supported\n");
 		return -EINVAL;
@@ -270,7 +248,6 @@ static int mediatek_dwmac_config_dt(struct mediatek_dwmac_plat_data *plat)
 
 	mac_delay->tx_inv = of_property_read_bool(plat->np, "mediatek,txc-inverse");
 	mac_delay->rx_inv = of_property_read_bool(plat->np, "mediatek,rxc-inverse");
-	mac_delay->fine_tune = of_property_read_bool(plat->np, "mediatek,fine-tune");
 	plat->rmii_rxc = of_property_read_bool(plat->np, "mediatek,rmii-rxc");
 
 	return 0;
-- 
1.7.9.5
