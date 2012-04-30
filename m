From: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: [PATCH 2/4] OF: MTD: make plat_nand loadable from DT
Date: Mon, 30 Apr 2012 19:30:46 +0200
Message-ID: <1335807048-24032-2-git-send-email-blogic@openwrt.org>
References: <1335807048-24032-1-git-send-email-blogic@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1335807048-24032-1-git-send-email-blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch sets the of_match_table field inside plat_nand's platform_driver.
We also add a struct mtd_part_parser_data pointer to make sure of_part parsing
works.

If an arch wants to support plat_nand via DT it needs to setup the
platform_nand_data and hook it into the platform_device.

Signed-off-by: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
---
This patch should go upstream via MTD with the other 3 patches.

 drivers/mtd/nand/plat_nand.c |   21 +++++++++++++++------
 1 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/plat_nand.c b/drivers/mtd/nand/plat_nand.c
index 5856399..fd2d2a1 100644
--- a/drivers/mtd/nand/plat_nand.c
+++ b/drivers/mtd/nand/plat_nand.c
@@ -31,6 +31,7 @@ static const char *part_probe_types[] = { "cmdlinepart", NULL };
 static int __devinit plat_nand_probe(struct platform_device *pdev)
 {
 	struct platform_nand_data *pdata = pdev->dev.platform_data;
+	struct mtd_part_parser_data ppdata;
 	struct plat_nand_data *data;
 	struct resource *res;
 	const char **part_types;
@@ -103,7 +104,8 @@ static int __devinit plat_nand_probe(struct platform_device *pdev)
 
 	part_types = pdata->chip.part_probe_types ? : part_probe_types;
 
-	err = mtd_device_parse_register(&data->mtd, part_types, NULL,
+	ppdata.of_node = pdev->dev.of_node;
+	err = mtd_device_parse_register(&data->mtd, part_types, &ppdata,
 					pdata->chip.partitions,
 					pdata->chip.nr_partitions);
 
@@ -144,12 +146,19 @@ static int __devexit plat_nand_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct of_device_id plat_nand_match[] = {
+	{ .compatible = "gen_nand" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, plat_nand_match);
+
 static struct platform_driver plat_nand_driver = {
-	.probe		= plat_nand_probe,
-	.remove		= __devexit_p(plat_nand_remove),
-	.driver		= {
-		.name	= "gen_nand",
-		.owner	= THIS_MODULE,
+	.probe	= plat_nand_probe,
+	.remove	= __devexit_p(plat_nand_remove),
+	.driver	= {
+		.name		= "gen_nand",
+		.owner		= THIS_MODULE,
+		.of_match_table = plat_nand_match,
 	},
 };
 
-- 
1.7.9.1
