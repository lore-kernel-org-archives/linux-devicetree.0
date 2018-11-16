From: Rob Herring <robh@kernel.org>
Subject: [PATCH] net: fsl: Use device_type helpers to access the node type
Date: Fri, 16 Nov 2018 16:11:03 -0600
Message-ID: <20181116221104.23024-7-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "David S. Miller" <davem@davemloft.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Remove directly accessing device_node.type pointer and use the accessors
instead. This will eventually allow removing the type pointer.

Cc: "David S. Miller" <davem@davemloft.net>
Cc: netdev@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/net/ethernet/freescale/fsl_pq_mdio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/fsl_pq_mdio.c b/drivers/net/ethernet/freescale/fsl_pq_mdio.c
index 82722d05fedb..88a396fd242f 100644
--- a/drivers/net/ethernet/freescale/fsl_pq_mdio.c
+++ b/drivers/net/ethernet/freescale/fsl_pq_mdio.c
@@ -473,7 +473,7 @@ static int fsl_pq_mdio_probe(struct platform_device *pdev)
 
 	if (data->get_tbipa) {
 		for_each_child_of_node(np, tbi) {
-			if (strcmp(tbi->type, "tbi-phy") == 0) {
+			if (of_node_is_type(tbi, "tbi-phy")) {
 				dev_dbg(&pdev->dev, "found TBI PHY node %pOFP\n",
 					tbi);
 				break;
-- 
2.19.1
