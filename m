From: Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>
Subject: [PATCH] MTD: Add device-tree support to fsmc_nand
Date: Fri, 16 Mar 2012 10:19:31 +0100
Message-ID: <1331889571-3372-1-git-send-email-sr@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>, spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds support to configure the FSMC NAND driver (used amongst
others on SPEAr platforms) via device-tree instead of platform_data.

Signed-off-by: Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>
Cc: Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>
---
 .../devicetree/bindings/mtd/fsmc-nand.txt          |   33 ++++++++++++
 drivers/mtd/nand/fsmc_nand.c                       |   57 +++++++++++++++++++-
 include/linux/mtd/fsmc.h                           |    4 +-
 3 files changed, 91 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/fsmc-nand.txt

diff --git a/Documentation/devicetree/bindings/mtd/fsmc-nand.txt b/Documentation/devicetree/bindings/mtd/fsmc-nand.txt
new file mode 100644
index 0000000..e2c663b
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/fsmc-nand.txt
@@ -0,0 +1,33 @@
+* FSMC NAND
+
+Required properties:
+- compatible : "st,spear600-fsmc-nand"
+- reg : Address range of the mtd chip
+- reg-names: Should contain the reg names "fsmc_regs" and "nand_data"
+- st,ale-off : Chip specific offset to ALE
+- st,cle-off : Chip specific offset to CLE
+
+Optional properties:
+- bank-width : Width (in bytes) of the device.  If not present, the width
+  defaults to 1 byte
+- nand-skip-bbtscan: Indicates the the BBT scanning should be skipped
+
+Example:
+
+	fsmc: flash@d1800000 {
+		compatible = "st,spear600-fsmc-nand";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reg = <0xd1800000 0x1000	/* FSMC Register */
+		       0xd2000000 0x4000>;	/* NAND Base */
+		reg-names = "fsmc_regs", "nand_data";
+		st,ale-off = <0x20000>;
+		st,cle-off = <0x10000>;
+
+		bank-width = <1>;
+		nand-skip-bbtscan;
+
+		partition@0 {
+			...
+		};
+	};
diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 0490182..1b8330e 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -31,6 +31,7 @@
 #include <linux/mtd/nand.h>
 #include <linux/mtd/nand_ecc.h>
 #include <linux/platform_device.h>
+#include <linux/of.h>
 #include <linux/mtd/partitions.h>
 #include <linux/io.h>
 #include <linux/slab.h>
@@ -854,6 +855,38 @@ static bool filter(struct dma_chan *chan, void *slave)
 	return true;
 }
 
+#ifdef CONFIG_OF
+static int __devinit fsmc_nand_probe_config_dt(struct platform_device *pdev,
+					       struct device_node *np)
+{
+	struct fsmc_nand_platform_data *pdata = dev_get_platdata(&pdev->dev);
+	u32 val;
+
+	/* Set default NAND width to 8 bits */
+	pdata->width = 8;
+	if (!of_property_read_u32(np, "bank-width", &val)) {
+		if (val == 2) {
+			pdata->width = 16;
+		} else if (val != 1) {
+			dev_err(&pdev->dev, "invalid bank-width %u\n", val);
+			return -EINVAL;
+		}
+	}
+	of_property_read_u32(np, "st,ale-off", &pdata->ale_off);
+	of_property_read_u32(np, "st,cle-off", &pdata->cle_off);
+	if (of_get_property(np, "nand-skip-bbtscan", NULL))
+		pdata->options = NAND_SKIP_BBTSCAN;
+
+	return 0;
+}
+#else
+static int __devinit fsmc_nand_probe_config_dt(struct platform_device *pdev,
+					       struct device_node *np)
+{
+	return -ENOSYS;
+}
+#endif
+
 /*
  * fsmc_nand_probe - Probe function
  * @pdev:       platform device structure
@@ -861,6 +894,8 @@ static bool filter(struct dma_chan *chan, void *slave)
 static int __init fsmc_nand_probe(struct platform_device *pdev)
 {
 	struct fsmc_nand_platform_data *pdata = dev_get_platdata(&pdev->dev);
+	struct device_node __maybe_unused *np = pdev->dev.of_node;
+	struct mtd_part_parser_data ppdata = {};
 	struct fsmc_nand_data *host;
 	struct mtd_info *mtd;
 	struct nand_chip *nand;
@@ -870,6 +905,16 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	u32 pid;
 	int i;
 
+	if (np) {
+		pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
+		pdev->dev.platform_data = pdata;
+		ret = fsmc_nand_probe_config_dt(pdev, np);
+		if (ret) {
+			dev_err(&pdev->dev, "no platform data\n");
+			return -ENODEV;
+		}
+	}
+
 	if (!pdata) {
 		dev_err(&pdev->dev, "platform data is NULL\n");
 		return -EINVAL;
@@ -1113,7 +1158,8 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	 * Check for partition info passed
 	 */
 	host->mtd.name = "nand";
-	ret = mtd_device_parse_register(&host->mtd, NULL, NULL,
+	ppdata.of_node = np;
+	ret = mtd_device_parse_register(&host->mtd, NULL, &ppdata,
 					host->partitions, host->nr_partitions);
 	if (ret)
 		goto err_probe;
@@ -1183,11 +1229,20 @@ static int fsmc_nand_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(fsmc_nand_pm_ops, fsmc_nand_suspend, fsmc_nand_resume);
 #endif
 
+#ifdef CONFIG_OF
+static const struct of_device_id fsmc_nand_id_table[] = {
+	{ .compatible = "st,spear600-fsmc-nand" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, fsmc_nand_id_table);
+#endif
+
 static struct platform_driver fsmc_nand_driver = {
 	.remove = fsmc_nand_remove,
 	.driver = {
 		.owner = THIS_MODULE,
 		.name = "fsmc-nand",
+		.of_match_table = of_match_ptr(fsmc_nand_id_table),
 #ifdef CONFIG_PM
 		.pm = &fsmc_nand_pm_ops,
 #endif
diff --git a/include/linux/mtd/fsmc.h b/include/linux/mtd/fsmc.h
index 823359c..b200292 100644
--- a/include/linux/mtd/fsmc.h
+++ b/include/linux/mtd/fsmc.h
@@ -156,8 +156,8 @@ struct fsmc_nand_platform_data {
 	unsigned int		bank;
 
 	/* CLE, ALE offsets */
-	unsigned long           cle_off;
-	unsigned long           ale_off;
+	unsigned int		cle_off;
+	unsigned int		ale_off;
 	enum access_mode	mode;
 
 	void			(*select_bank)(uint32_t bank, uint32_t busw);
-- 
1.7.9.2
