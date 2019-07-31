From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 01/19] phy: mvebu-cp110-comphy: Add clocks support
Date: Wed, 31 Jul 2019 14:21:08 +0200
Message-ID: <20190731122126.3049-2-miquel.raynal@bootlin.com>
References: <20190731122126.3049-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190731122126.3049-1-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, Grzegorz Jaszczyk <jaz@semihalf.com>, Russell King <linux@armlinux.org.uk>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

There is no public clock tree that implies such dependencies between
the MG/MG-core/AXI clocks and the COMPHY IP but accessing the COMPHY
registers while one of the three clocks are disabled stalls the CPU.

This happens if, for instance, the COMPHY driver probe is deferred
(eg. the USB Vbus regulator driver is not yet visible). The MVPP2
driver which also needs these clocks (among others) will
prepare/enable the clocks, then be deferred, and disable/unprepare
them. Next COMPHY lane to be configured would produce an infinite
stall.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/phy/marvell/phy-mvebu-cp110-comphy.c | 94 ++++++++++++++++++--
 1 file changed, 89 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/marvell/phy-mvebu-cp110-comphy.c b/drivers/phy/marvell/phy-mvebu-cp110-comphy.c
index d98e0451f6a1..83d173d298ed 100644
--- a/drivers/phy/marvell/phy-mvebu-cp110-comphy.c
+++ b/drivers/phy/marvell/phy-mvebu-cp110-comphy.c
@@ -5,6 +5,7 @@
  * Antoine Tenart <antoine.tenart@free-electrons.com>
  */
 
+#include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/mfd/syscon.h>
@@ -160,6 +161,9 @@ struct mvebu_comphy_priv {
 	void __iomem *base;
 	struct regmap *regmap;
 	struct device *dev;
+	struct clk *mg_domain_clk;
+	struct clk *mg_core_clk;
+	struct clk *axi_clk;
 };
 
 struct mvebu_comphy_lane {
@@ -585,12 +589,72 @@ static struct phy *mvebu_comphy_xlate(struct device *dev,
 	return phy;
 }
 
+static int mvebu_comphy_init_clks(struct mvebu_comphy_priv *priv)
+{
+	int ret;
+
+	priv->mg_domain_clk = devm_clk_get(priv->dev, "mg_clk");
+	if (IS_ERR(priv->mg_domain_clk))
+		return PTR_ERR(priv->mg_domain_clk);
+
+	ret = clk_prepare_enable(priv->mg_domain_clk);
+	if (ret < 0)
+		return ret;
+
+	priv->mg_core_clk = devm_clk_get(priv->dev, "mg_core_clk");
+	if (IS_ERR(priv->mg_core_clk)) {
+		ret = PTR_ERR(priv->mg_core_clk);
+		goto dis_mg_domain_clk;
+	}
+
+	ret = clk_prepare_enable(priv->mg_core_clk);
+	if (ret < 0)
+		goto dis_mg_domain_clk;
+
+	priv->axi_clk = devm_clk_get(priv->dev, "axi_clk");
+	if (IS_ERR(priv->axi_clk)) {
+		ret = PTR_ERR(priv->axi_clk);
+		goto dis_mg_core_clk;
+	}
+
+	ret = clk_prepare_enable(priv->axi_clk);
+	if (ret < 0)
+		goto dis_mg_core_clk;
+
+	return 0;
+
+dis_mg_core_clk:
+	clk_disable_unprepare(priv->mg_core_clk);
+
+dis_mg_domain_clk:
+	clk_disable_unprepare(priv->mg_domain_clk);
+
+	priv->mg_domain_clk = NULL;
+	priv->mg_core_clk = NULL;
+	priv->axi_clk = NULL;
+
+	return ret;
+};
+
+static void mvebu_comphy_disable_unprepare_clks(struct mvebu_comphy_priv *priv)
+{
+	if (priv->axi_clk)
+		clk_disable_unprepare(priv->axi_clk);
+
+	if (priv->mg_core_clk)
+		clk_disable_unprepare(priv->mg_core_clk);
+
+	if (priv->mg_domain_clk)
+		clk_disable_unprepare(priv->mg_domain_clk);
+}
+
 static int mvebu_comphy_probe(struct platform_device *pdev)
 {
 	struct mvebu_comphy_priv *priv;
 	struct phy_provider *provider;
 	struct device_node *child;
 	struct resource *res;
+	int ret;
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -607,10 +671,20 @@ static int mvebu_comphy_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
+	/*
+	 * Ignore error if clocks have not been initialized properly for DT
+	 * compatibility reasons.
+	 */
+	ret = mvebu_comphy_init_clks(priv);
+	if (ret) {
+		if (ret == -EPROBE_DEFER)
+			return ret;
+		dev_warn(&pdev->dev, "cannot initialize clocks\n");
+	}
+
 	for_each_available_child_of_node(pdev->dev.of_node, child) {
 		struct mvebu_comphy_lane *lane;
 		struct phy *phy;
-		int ret;
 		u32 val;
 
 		ret = of_property_read_u32(child, "reg", &val);
@@ -626,12 +700,16 @@ static int mvebu_comphy_probe(struct platform_device *pdev)
 		}
 
 		lane = devm_kzalloc(&pdev->dev, sizeof(*lane), GFP_KERNEL);
-		if (!lane)
-			return -ENOMEM;
+		if (!lane) {
+			ret = -ENOMEM;
+			goto disable_clks;
+		}
 
 		phy = devm_phy_create(&pdev->dev, child, &mvebu_comphy_ops);
-		if (IS_ERR(phy))
-			return PTR_ERR(phy);
+		if (IS_ERR(phy)) {
+			ret = PTR_ERR(phy);
+			goto disable_clks;
+		}
 
 		lane->priv = priv;
 		lane->mode = PHY_MODE_INVALID;
@@ -649,7 +727,13 @@ static int mvebu_comphy_probe(struct platform_device *pdev)
 	dev_set_drvdata(&pdev->dev, priv);
 	provider = devm_of_phy_provider_register(&pdev->dev,
 						 mvebu_comphy_xlate);
+
 	return PTR_ERR_OR_ZERO(provider);
+
+disable_clks:
+	mvebu_comphy_disable_unprepare_clks(priv);
+
+	return ret;
 }
 
 static const struct of_device_id mvebu_comphy_of_match_table[] = {
-- 
2.20.1
