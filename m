From: Rob Herring <robh@kernel.org>
Subject: [PATCH] dma: Convert to using %pOF instead of full_name
Date: Tue, 18 Jul 2017 16:42:58 -0500
Message-ID: <20170718214339.7774-18-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Now that we have a custom printf format specifier, convert users of
full_name to use %pOF instead. This is preparation to remove storing
of the full path string for each node.

Signed-off-by: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vinod.koul@intel.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: dmaengine@vger.kernel.org
---
 drivers/dma/of-dma.c      |  8 ++++----
 drivers/dma/ppc4xx/adma.c | 14 ++++++--------
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/dma/of-dma.c b/drivers/dma/of-dma.c
index faae0bfe1109..91fd395c90c4 100644
--- a/drivers/dma/of-dma.c
+++ b/drivers/dma/of-dma.c
@@ -38,8 +38,8 @@ static struct of_dma *of_dma_find_controller(struct of_phandle_args *dma_spec)
 		if (ofdma->of_node == dma_spec->np)
 			return ofdma;

-	pr_debug("%s: can't find DMA controller %s\n", __func__,
-		 dma_spec->np->full_name);
+	pr_debug("%s: can't find DMA controller %pOF\n", __func__,
+		 dma_spec->np);

 	return NULL;
 }
@@ -255,8 +255,8 @@ struct dma_chan *of_dma_request_slave_channel(struct device_node *np,

 	count = of_property_count_strings(np, "dma-names");
 	if (count < 0) {
-		pr_err("%s: dma-names property of node '%s' missing or empty\n",
-			__func__, np->full_name);
+		pr_err("%s: dma-names property of node '%pOF' missing or empty\n",
+			__func__, np);
 		return ERR_PTR(-ENODEV);
 	}

diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
index b1535b1fe95c..e535342c8970 100644
--- a/drivers/dma/ppc4xx/adma.c
+++ b/drivers/dma/ppc4xx/adma.c
@@ -4040,9 +4040,9 @@ static int ppc440spe_adma_probe(struct platform_device *ofdev)
 		/* it is DMA0 or DMA1 */
 		idx = of_get_property(np, "cell-index", &len);
 		if (!idx || (len != sizeof(u32))) {
-			dev_err(&ofdev->dev, "Device node %s has missing "
+			dev_err(&ofdev->dev, "Device node %pOF has missing "
 				"or invalid cell-index property\n",
-				np->full_name);
+				np);
 			return -EINVAL;
 		}
 		id = *idx;
@@ -4448,8 +4448,7 @@ static int ppc440spe_configure_raid_devices(void)
 	dcr_base = dcr_resource_start(np, 0);
 	dcr_len = dcr_resource_len(np, 0);
 	if (!dcr_base && !dcr_len) {
-		pr_err("%s: can't get DCR registers base/len!\n",
-			np->full_name);
+		pr_err("%pOF: can't get DCR registers base/len!\n", np);
 		of_node_put(np);
 		iounmap(i2o_reg);
 		return -ENODEV;
@@ -4457,7 +4456,7 @@ static int ppc440spe_configure_raid_devices(void)

 	i2o_dcr_host = dcr_map(np, dcr_base, dcr_len);
 	if (!DCR_MAP_OK(i2o_dcr_host)) {
-		pr_err("%s: failed to map DCRs!\n", np->full_name);
+		pr_err("%pOF: failed to map DCRs!\n", np);
 		of_node_put(np);
 		iounmap(i2o_reg);
 		return -ENODEV;
@@ -4518,15 +4517,14 @@ static int ppc440spe_configure_raid_devices(void)
 	dcr_base = dcr_resource_start(np, 0);
 	dcr_len = dcr_resource_len(np, 0);
 	if (!dcr_base && !dcr_len) {
-		pr_err("%s: can't get DCR registers base/len!\n",
-			np->full_name);
+		pr_err("%pOF: can't get DCR registers base/len!\n", np);
 		ret = -ENODEV;
 		goto out_mq;
 	}

 	ppc440spe_mq_dcr_host = dcr_map(np, dcr_base, dcr_len);
 	if (!DCR_MAP_OK(ppc440spe_mq_dcr_host)) {
-		pr_err("%s: failed to map DCRs!\n", np->full_name);
+		pr_err("%pOF: failed to map DCRs!\n", np);
 		ret = -ENODEV;
 		goto out_mq;
 	}
--
2.11.0
