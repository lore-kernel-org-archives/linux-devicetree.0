From: Luis Oliveira <Luis.Oliveira@synopsys.com>
Subject: [v4 6/6] media: platform: dwc: Add platform data support to D-Phy
Date: Tue, 11 Jun 2019 21:20:55 +0200
Message-ID: <1560280855-18085-7-git-send-email-luis.oliveira@synopsys.com>
References: <1560280855-18085-1-git-send-email-luis.oliveira@synopsys.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560280855-18085-1-git-send-email-luis.oliveira@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mchehab@kernel.org, davem@davemloft.net, gregkh@linuxfoundation.org, Jonathan.Cameron@huawei.com, robh@kernel.org, nicolas.ferre@microchip.com, paulmck@linux.ibm.com, mark.rutland@arm.com, kishon@ti.com, devicetree@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Joao.Pinto@synopsys.com, Luis Oliveira <Luis.Oliveira@synopsys.com>
List-Id: devicetree@vger.kernel.org

This patch allows the configuration via platform data. This allows
the driver loading not devicetree dependent.

Signed-off-by: Luis Oliveira <luis.oliveira@synopsys.com>
---
Changelog
v3-v4
- This patch was not in the v3. This enables pdata to configure the driver

 drivers/media/platform/dwc/dw-dphy-plat.c | 87 ++++++++++++++++++++++---------
 drivers/media/platform/dwc/dw-dphy-rx.c   | 19 ++++---
 2 files changed, 72 insertions(+), 34 deletions(-)

diff --git a/drivers/media/platform/dwc/dw-dphy-plat.c b/drivers/media/platform/dwc/dw-dphy-plat.c
index 1f5113d..34d9caf 100644
--- a/drivers/media/platform/dwc/dw-dphy-plat.c
+++ b/drivers/media/platform/dwc/dw-dphy-plat.c
@@ -23,38 +23,50 @@ static struct phy_ops dw_dphy_ops = {
 
 static struct phy_provider *phy_provider;
 
+#if IS_ENABLED(CONFIG_DWC_MIPI_TC_DPHY_GEN3)
 static u8 get_config_8l(struct device *dev, struct dw_dphy_rx *dphy)
 {
-	dphy->config_8l = of_get_gpio(dev->of_node, 0);
-	if (!gpio_is_valid(dphy->config_8l)) {
-		dev_warn(dev,
-			 "failed to parse 8l config, default is 0\n");
-		dphy->config_8l = 0;
-	}
+	if (IS_ENABLED(CONFIG_OF) && dev->of_node) {
+		dphy->config_8l = of_get_gpio(dev->of_node, 0);
+		if (!gpio_is_valid(dphy->config_8l)) {
+			dev_warn(dev,
+				 "failed to parse 8l config, default is 0\n");
+			dphy->config_8l = 0;
+		}
+	} else {
+		struct dw_phy_pdata *pdata = dev->platform_data;
 
+		dphy->config_8l = pdata->config_8l;
+	}
 	return dphy->config_8l;
 }
-
+#endif
 static int get_resources(struct device *dev, struct dw_dphy_rx *dphy)
 {
 	int ret = 0;
 
-	if (of_property_read_u32(dev->of_node, "snps,dphy-frequency",
-				 &dphy->dphy_freq)) {
-		dev_err(dev, "failed to find dphy frequency\n");
-		ret = -EINVAL;
-	}
-
-	if (of_property_read_u32(dev->of_node, "bus-width",
-				 &dphy->dphy_te_len)) {
-		dev_err(dev, "failed to find dphy te length\n");
-		ret = -EINVAL;
-	}
+	if (IS_ENABLED(CONFIG_OF) && dev->of_node) {
+		if (of_property_read_u32(dev->of_node, "snps,dphy-frequency",
+					 &dphy->dphy_freq)) {
+			dev_err(dev, "failed to find dphy frequency\n");
+			ret = -EINVAL;
+		}
+		if (of_property_read_u32(dev->of_node, "bus-width",
+					 &dphy->dphy_te_len)) {
+			dev_err(dev, "failed to find dphy te length\n");
+			ret = -EINVAL;
+		}
+		if (of_property_read_u32(dev->of_node, "snps,phy_type",
+					 &dphy->phy_type)) {
+			dev_err(dev, "failed to find dphy type\n");
+			ret = -EINVAL;
+		}
+	} else {
+		struct dw_phy_pdata *pdata = dev->platform_data;
 
-	if (of_property_read_u32(dev->of_node, "snps,phy_type",
-				 &dphy->phy_type)) {
-		dev_err(dev, "failed to find dphy te length\n");
-		ret = -EINVAL;
+		dphy->dphy_freq = pdata->dphy_frequency;
+		dphy->dphy_te_len = pdata->dphy_te_len;
+		dphy->dphy_gen = pdata->dphy_gen;
 	}
 	dev_set_drvdata(dev, dphy);
 
@@ -63,20 +75,39 @@ static int get_resources(struct device *dev, struct dw_dphy_rx *dphy)
 
 static int phy_register(struct device *dev)
 {
-	if (dev->of_node) {
+	int ret = 0;
+
+	if (IS_ENABLED(CONFIG_OF) && dev->of_node) {
 		phy_provider = devm_of_phy_provider_register(dev,
 							     dw_dphy_xlate);
 		if (IS_ERR(phy_provider)) {
 			dev_err(dev, "error getting phy provider\n");
-			return PTR_ERR(phy_provider);
+			ret = PTR_ERR(phy_provider);
 		}
+	} else {
+		struct dw_phy_pdata *pdata = dev->platform_data;
+		struct dw_dphy_rx *dphy = dev_get_drvdata(dev);
+
+		ret = phy_create_lookup(dphy->phy,
+					phys[pdata->id].name,
+					csis[pdata->id].name);
+		if (ret)
+			dev_err(dev, "Failed to create dphy lookup\n");
+		else
+			dev_warn(dev,
+				 "Created dphy lookup [%s] --> [%s]\n",
+				 phys[pdata->id].name, csis[pdata->id].name);
 	}
-	return 0;
+	return ret;
 }
 
 static void phy_unregister(struct device *dev)
 {
-	devm_of_phy_provider_unregister(dev, phy_provider);
+	if (!dev->of_node) {
+		struct dw_dphy_rx *dphy = dev_get_drvdata(dev);
+
+		phy_remove_lookup(dphy->phy, "dw-dphy", "dw-csi");
+	}
 }
 
 static int dw_dphy_rx_probe(struct platform_device *pdev)
@@ -166,18 +197,22 @@ static int dw_dphy_rx_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#if IS_ENABLED(CONFIG_OF)
 static const struct of_device_id dw_dphy_rx_of_match[] = {
 	{ .compatible = "snps,dw-dphy-rx" },
 	{},
 };
 
 MODULE_DEVICE_TABLE(of, dw_dphy_rx_of_match);
+#endif
 
 static struct platform_driver dw_dphy_rx_driver = {
 	.probe = dw_dphy_rx_probe,
 	.remove = dw_dphy_rx_remove,
 	.driver = {
+#if IS_ENABLED(CONFIG_OF)
 		.of_match_table = of_match_ptr(dw_dphy_rx_of_match),
+#endif
 		.name = "dw-dphy",
 		.owner = THIS_MODULE,
 	}
diff --git a/drivers/media/platform/dwc/dw-dphy-rx.c b/drivers/media/platform/dwc/dw-dphy-rx.c
index f57a814..a69cb3e 100644
--- a/drivers/media/platform/dwc/dw-dphy-rx.c
+++ b/drivers/media/platform/dwc/dw-dphy-rx.c
@@ -71,15 +71,18 @@ u8 dw_dphy_setup_config(struct dw_dphy_rx *dphy)
 		dev_vdbg(&dphy->phy->dev, "CONFIG 4L\n");
 		return CTRL_4_LANES;
 	}
-
-	ret = gpio_request(dphy->config_8l, "config");
-	if (ret < 0) {
-		dev_vdbg(&dphy->phy->dev,
-			 "could not acquire config gpio (err=%d)\n", ret);
-		return ret;
+	if (IS_ENABLED(CONFIG_OF)) {
+		ret = gpio_request(dphy->config_8l, "config");
+		if (ret < 0) {
+			dev_vdbg(&dphy->phy->dev,
+				 "could not acquire config (err=%d)\n", ret);
+			return ret;
+		}
+		ret = gpio_get_value(dphy->config_8l);
+		gpio_free(dphy->config_8l);
+	} else {
+		ret = dphy->config_8l;
 	}
-	ret = gpio_get_value(dphy->config_8l);
-	gpio_free(dphy->config_8l);
 
 	dev_vdbg(&dphy->phy->dev,
 		 "Booting in [%s] mode\n",
-- 
2.7.4
