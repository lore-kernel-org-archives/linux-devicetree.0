From: Iyappan Subramanian <isubramanian@apm.com>
Subject: [PATCH v1 5/5] drivers: net: xgene: Add 10GbE ethtool support
Date: Tue, 23 Sep 2014 20:51:28 -0700
Message-ID: <1411530688-2939-6-git-send-email-isubramanian@apm.com>
References: <1411530688-2939-1-git-send-email-isubramanian@apm.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1411530688-2939-1-git-send-email-isubramanian@apm.com>
Sender: netdev-owner@vger.kernel.org
To: davem@davemloft.net, netdev@vger.kernel.org, devicetree@vger.kernel.org
Cc: kchudgar@apm.com, patches@apm.com, Iyappan Subramanian <isubramanian@apm.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Iyappan Subramanian <isubramanian@apm.com>
---
 .../net/ethernet/apm/xgene/xgene_enet_ethtool.c    | 24 ++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/apm/xgene/xgene_enet_ethtool.c b/drivers/net/ethernet/apm/xgene/xgene_enet_ethtool.c
index 63f2aa5..88849a0 100644
--- a/drivers/net/ethernet/apm/xgene/xgene_enet_ethtool.c
+++ b/drivers/net/ethernet/apm/xgene/xgene_enet_ethtool.c
@@ -58,11 +58,24 @@ static int xgene_get_settings(struct net_device *ndev, struct ethtool_cmd *cmd)
 {
 	struct xgene_enet_pdata *pdata = netdev_priv(ndev);
 	struct phy_device *phydev = pdata->phy_dev;
+	int ret = 0;
+
+	if (pdata->phy_mode == PHY_INTERFACE_MODE_RGMII) {
+		if (phydev == NULL)
+			return -ENODEV;
+
+		ret = phy_ethtool_gset(phydev, cmd);
+	} else {
+		cmd->supported = SUPPORTED_10000baseT_Full | SUPPORTED_FIBRE;
+		cmd->advertising = cmd->supported;
+		ethtool_cmd_speed_set(cmd, SPEED_10000);
+		cmd->duplex = DUPLEX_FULL;
+		cmd->port = PORT_FIBRE;
+		cmd->transceiver = XCVR_EXTERNAL;
+		cmd->autoneg = AUTONEG_DISABLE;
+	}
 
-	if (phydev == NULL)
-		return -ENODEV;
-
-	return phy_ethtool_gset(phydev, cmd);
+	return ret;
 }
 
 static int xgene_set_settings(struct net_device *ndev, struct ethtool_cmd *cmd)
@@ -70,6 +83,9 @@ static int xgene_set_settings(struct net_device *ndev, struct ethtool_cmd *cmd)
 	struct xgene_enet_pdata *pdata = netdev_priv(ndev);
 	struct phy_device *phydev = pdata->phy_dev;
 
+	if (pdata->phy_mode == PHY_INTERFACE_MODE_XGMII)
+		return -EINVAL;
+
 	if (phydev == NULL)
 		return -ENODEV;
 
-- 
1.9.1
