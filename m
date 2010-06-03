From: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
Subject: [PATCH] of/mtd: nand: fix build breakage in drivers
Date: Thu,  3 Jun 2010 02:37:17 +0200
Message-ID: <1275525437-364-1-git-send-email-agust@denx.de>
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
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Fixes build errors in drivers caused by the OF device_node
pointer being moved into struct device

Signed-off-by: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
---
 drivers/mtd/nand/fsl_upm.c       |   17 +++++++++--------
 drivers/mtd/nand/socrates_nand.c |    4 ++--
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/fsl_upm.c b/drivers/mtd/nand/fsl_upm.c
index 00aea6f..1312eda 100644
--- a/drivers/mtd/nand/fsl_upm.c
+++ b/drivers/mtd/nand/fsl_upm.c
@@ -232,7 +232,7 @@ static int __devinit fun_probe(struct of_device *ofdev,
 	if (!fun)
 		return -ENOMEM;
 
-	ret = of_address_to_resource(ofdev->node, 0, &io_res);
+	ret = of_address_to_resource(ofdev->dev.of_node, 0, &io_res);
 	if (ret) {
 		dev_err(&ofdev->dev, "can't get IO base\n");
 		goto err1;
@@ -244,7 +244,8 @@ static int __devinit fun_probe(struct of_device *ofdev,
 		goto err1;
 	}
 
-	prop = of_get_property(ofdev->node, "fsl,upm-addr-offset", &size);
+	prop = of_get_property(ofdev->dev.of_node, "fsl,upm-addr-offset",
+			       &size);
 	if (!prop || size != sizeof(uint32_t)) {
 		dev_err(&ofdev->dev, "can't get UPM address offset\n");
 		ret = -EINVAL;
@@ -252,7 +253,7 @@ static int __devinit fun_probe(struct of_device *ofdev,
 	}
 	fun->upm_addr_offset = *prop;
 
-	prop = of_get_property(ofdev->node, "fsl,upm-cmd-offset", &size);
+	prop = of_get_property(ofdev->dev.of_node, "fsl,upm-cmd-offset", &size);
 	if (!prop || size != sizeof(uint32_t)) {
 		dev_err(&ofdev->dev, "can't get UPM command offset\n");
 		ret = -EINVAL;
@@ -260,7 +261,7 @@ static int __devinit fun_probe(struct of_device *ofdev,
 	}
 	fun->upm_cmd_offset = *prop;
 
-	prop = of_get_property(ofdev->node,
+	prop = of_get_property(ofdev->dev.of_node,
 			       "fsl,upm-addr-line-cs-offsets", &size);
 	if (prop && (size / sizeof(uint32_t)) > 0) {
 		fun->mchip_count = size / sizeof(uint32_t);
@@ -276,7 +277,7 @@ static int __devinit fun_probe(struct of_device *ofdev,
 
 	for (i = 0; i < fun->mchip_count; i++) {
 		fun->rnb_gpio[i] = -1;
-		rnb_gpio = of_get_gpio(ofdev->node, i);
+		rnb_gpio = of_get_gpio(ofdev->dev.of_node, i);
 		if (rnb_gpio >= 0) {
 			ret = gpio_request(rnb_gpio, dev_name(&ofdev->dev));
 			if (ret) {
@@ -292,13 +293,13 @@ static int __devinit fun_probe(struct of_device *ofdev,
 		}
 	}
 
-	prop = of_get_property(ofdev->node, "chip-delay", NULL);
+	prop = of_get_property(ofdev->dev.of_node, "chip-delay", NULL);
 	if (prop)
 		fun->chip_delay = *prop;
 	else
 		fun->chip_delay = 50;
 
-	prop = of_get_property(ofdev->node, "fsl,upm-wait-flags", &size);
+	prop = of_get_property(ofdev->dev.of_node, "fsl,upm-wait-flags", &size);
 	if (prop && size == sizeof(uint32_t))
 		fun->wait_flags = *prop;
 	else
@@ -315,7 +316,7 @@ static int __devinit fun_probe(struct of_device *ofdev,
 	fun->dev = &ofdev->dev;
 	fun->last_ctrl = NAND_CLE;
 
-	ret = fun_chip_init(fun, ofdev->node, &io_res);
+	ret = fun_chip_init(fun, ofdev->dev.of_node, &io_res);
 	if (ret)
 		goto err2;
 
diff --git a/drivers/mtd/nand/socrates_nand.c b/drivers/mtd/nand/socrates_nand.c
index 884852d..cc728b1 100644
--- a/drivers/mtd/nand/socrates_nand.c
+++ b/drivers/mtd/nand/socrates_nand.c
@@ -183,7 +183,7 @@ static int __devinit socrates_nand_probe(struct of_device *ofdev,
 		return -ENOMEM;
 	}
 
-	host->io_base = of_iomap(ofdev->node, 0);
+	host->io_base = of_iomap(ofdev->dev.of_node, 0);
 	if (host->io_base == NULL) {
 		printk(KERN_ERR "socrates_nand: ioremap failed\n");
 		kfree(host);
@@ -244,7 +244,7 @@ static int __devinit socrates_nand_probe(struct of_device *ofdev,
 #ifdef CONFIG_MTD_OF_PARTS
 	if (num_partitions == 0) {
 		num_partitions = of_mtd_parse_partitions(&ofdev->dev,
-							 ofdev->node,
+							 ofdev->dev.of_node,
 							 &partitions);
 		if (num_partitions < 0) {
 			res = num_partitions;
-- 
1.7.0.4
