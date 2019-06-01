From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH net-next 03/10] net: ethernet: ti: netcp_ethss: add support for child cpts node
Date: Sat, 1 Jun 2019 13:45:27 +0300
Message-ID: <20190601104534.25790-4-grygorii.strashko@ti.com>
References: <20190601104534.25790-1-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190601104534.25790-1-grygorii.strashko@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "David S. Miller" <davem@davemloft.net>, Santosh Shilimkar <ssantosh@kernel.org>, Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Sekhar Nori <nsekhar@ti.com>, Murali Karicheri <m-karicheri2@ti.com>, Wingman Kwok <w-kwok2@ti.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Grygorii Strashko <grygorii.strashko@ti.com>
List-Id: devicetree@vger.kernel.org

Allow to place CPTS properties in the child "cpts" DT node. For backward
compatibility - roll-back and read CPTS DT properties from parent node if
"cpts" node is not present.

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 drivers/net/ethernet/ti/netcp_ethss.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/ti/netcp_ethss.c b/drivers/net/ethernet/ti/netcp_ethss.c
index ec179700c184..2c1fac33136c 100644
--- a/drivers/net/ethernet/ti/netcp_ethss.c
+++ b/drivers/net/ethernet/ti/netcp_ethss.c
@@ -3554,7 +3554,7 @@ static int set_gbenu_ethss_priv(struct gbe_priv *gbe_dev,
 static int gbe_probe(struct netcp_device *netcp_device, struct device *dev,
 		     struct device_node *node, void **inst_priv)
 {
-	struct device_node *interfaces, *interface;
+	struct device_node *interfaces, *interface, *cpts_node;
 	struct device_node *secondary_ports;
 	struct cpsw_ale_params ale_params;
 	struct gbe_priv *gbe_dev;
@@ -3713,7 +3713,12 @@ static int gbe_probe(struct netcp_device *netcp_device, struct device *dev,
 		dev_dbg(gbe_dev->dev, "Created a gbe ale engine\n");
 	}
 
-	gbe_dev->cpts = cpts_create(gbe_dev->dev, gbe_dev->cpts_reg, node);
+	cpts_node = of_get_child_by_name(node, "cpts");
+	if (!cpts_node)
+		cpts_node = of_node_get(node);
+
+	gbe_dev->cpts = cpts_create(gbe_dev->dev, gbe_dev->cpts_reg, cpts_node);
+	of_node_put(cpts_node);
 	if (IS_ENABLED(CONFIG_TI_CPTS) && IS_ERR(gbe_dev->cpts)) {
 		ret = PTR_ERR(gbe_dev->cpts);
 		goto free_sec_ports;
-- 
2.17.1
