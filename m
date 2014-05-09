From: Mugunthan V N <mugunthanvnm@ti.com>
Subject: [PATCH v2 1/3] drivers: net: cpsw-phy-sel: initialize priv->dev
Date: Fri, 9 May 2014 19:07:33 +0530
Message-ID: <1399642655-6412-2-git-send-email-mugunthanvnm@ti.com>
References: <1399642655-6412-1-git-send-email-mugunthanvnm@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1399642655-6412-1-git-send-email-mugunthanvnm@ti.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: davem@davemloft.net, devicetree@vger.kernel.org, Mugunthan V N <mugunthanvnm@ti.com>
List-Id: devicetree@vger.kernel.org

priv->dev is uninitialized, initializing with pdev->dev

Signed-off-by: Mugunthan V N <mugunthanvnm@ti.com>
---
 drivers/net/ethernet/ti/cpsw-phy-sel.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/ti/cpsw-phy-sel.c b/drivers/net/ethernet/ti/cpsw-phy-sel.c
index 148da9a..86b5dce 100644
--- a/drivers/net/ethernet/ti/cpsw-phy-sel.c
+++ b/drivers/net/ethernet/ti/cpsw-phy-sel.c
@@ -132,6 +132,7 @@ static int cpsw_phy_sel_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
+	priv->dev = &pdev->dev;
 	priv->cpsw_phy_sel = of_id->data;
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "gmii-sel");
-- 
1.9.2.459.g68773ac
