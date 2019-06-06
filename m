From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH net-next v2 02/10] net: ethernet: ti: cpts: use devm_get_clk_from_child
Date: Thu, 6 Jun 2019 19:30:39 +0300
Message-ID: <20190606163047.31199-3-grygorii.strashko@ti.com>
References: <20190606163047.31199-1-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190606163047.31199-1-grygorii.strashko@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "David S. Miller" <davem@davemloft.net>, Santosh Shilimkar <ssantosh@kernel.org>, Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Sekhar Nori <nsekhar@ti.com>, Murali Karicheri <m-karicheri2@ti.com>, Wingman Kwok <w-kwok2@ti.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Grygorii Strashko <grygorii.strashko@ti.com>
List-Id: devicetree@vger.kernel.org

Use devm_get_clk_from_child() instead of devm_clk_get() and this way allow
to group CPTS DT properties in sub-node for better code readability and
maintenance. Roll-back to devm_clk_get() if devm_get_clk_from_child()
fails for backward compatibility.

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
Acked-by: Richard Cochran <richardcochran@gmail.com>
---
 drivers/net/ethernet/ti/cpts.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/ti/cpts.c b/drivers/net/ethernet/ti/cpts.c
index e257018ada71..0e79f9743c19 100644
--- a/drivers/net/ethernet/ti/cpts.c
+++ b/drivers/net/ethernet/ti/cpts.c
@@ -572,9 +572,14 @@ struct cpts *cpts_create(struct device *dev, void __iomem *regs,
 	if (ret)
 		return ERR_PTR(ret);
 
-	cpts->refclk = devm_clk_get(dev, "cpts");
+	cpts->refclk = devm_get_clk_from_child(dev, node, "cpts");
+	if (IS_ERR(cpts->refclk))
+		/* try get clk from dev node for compatibility */
+		cpts->refclk = devm_clk_get(dev, "cpts");
+
 	if (IS_ERR(cpts->refclk)) {
-		dev_err(dev, "Failed to get cpts refclk\n");
+		dev_err(dev, "Failed to get cpts refclk %ld\n",
+			PTR_ERR(cpts->refclk));
 		return ERR_CAST(cpts->refclk);
 	}
 
-- 
2.17.1
