From: Jamie Lentin <jm@lentin.co.uk>
Subject: [PATCH V4 1/3] mtd: Add orion_nand devicetree bindings
Date: Sat, 31 Mar 2012 14:53:03 +0100
Message-ID: <1333201985-2222-2-git-send-email-jm@lentin.co.uk>
References: <1333201985-2222-1-git-send-email-jm@lentin.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1333201985-2222-1-git-send-email-jm@lentin.co.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>, Jason <jason@lakedaemon.net>, Grant Likely <grant.likely@secretlab.ca>
Cc: devicetree-discuss@lists.ozlabs.org, Jamie Lentin <jm@lentin.co.uk>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Allow a NAND chip using the orion_nand driver to be described using devicetree.

Signed-off-by: Jamie Lentin <jm@lentin.co.uk>
---
* Document all parameters.
* Convert bank-width to be in bytes
* Add explicit defaults for cle, ale and bank-width

 .../devicetree/bindings/mtd/orion-nand.txt         |   50 ++++++++++++++++++++
 drivers/mtd/nand/orion_nand.c                      |   41 +++++++++++++++-
 2 files changed, 89 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/orion-nand.txt

diff --git a/Documentation/devicetree/bindings/mtd/orion-nand.txt b/Documentation/devicetree/bindings/mtd/orion-nand.txt
new file mode 100644
index 0000000..b2356b7
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/orion-nand.txt
@@ -0,0 +1,50 @@
+NAND support for Marvell Orion SoC platforms
+
+Required properties:
+- compatible : "mrvl,orion-nand".
+- reg : Base physical address of the NAND and length of memory mapped
+	region
+
+Optional properties:
+- cle : Address line number connected to CLE. Default is 0
+- ale : Address line number connected to ALE. Default is 1
+- bank-width : Width in bytes of the device. Default is 1
+- chip-delay : Chip dependent delay for transferring data from array to read
+               registers in usecs
+
+The device tree may optionally contain sub-nodes describing partitions of the
+address space. See partition.txt for more detail.
+
+Example:
+
+nand@f4000000 {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	cle = <0>;
+	ale = <1>;
+	bank-width = <1>;
+	chip-delay = <25>;
+	compatible = "mrvl,orion-nand";
+	reg = <0xf4000000 0x400>;
+
+	partition@0 {
+		label = "u-boot";
+		reg = <0x0000000 0x100000>;
+		read-only;
+	};
+
+	partition@100000 {
+		label = "uImage";
+		reg = <0x0100000 0x200000>;
+	};
+
+	partition@300000 {
+		label = "dtb";
+		reg = <0x0300000 0x100000>;
+	};
+
+	partition@400000 {
+		label = "root";
+		reg = <0x0400000 0x7d00000>;
+	};
+};
diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
index 29f505a..dd3ece8 100644
--- a/drivers/mtd/nand/orion_nand.c
+++ b/drivers/mtd/nand/orion_nand.c
@@ -13,6 +13,7 @@
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/of.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/nand.h>
 #include <linux/mtd/partitions.h>
@@ -74,11 +75,13 @@ static void orion_nand_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 static int __init orion_nand_probe(struct platform_device *pdev)
 {
 	struct mtd_info *mtd;
+	struct mtd_part_parser_data ppdata = {};
 	struct nand_chip *nc;
 	struct orion_nand_data *board;
 	struct resource *res;
 	void __iomem *io_base;
 	int ret = 0;
+	u32 val = 0;
 
 	nc = kzalloc(sizeof(struct nand_chip) + sizeof(struct mtd_info), GFP_KERNEL);
 	if (!nc) {
@@ -101,7 +104,32 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 		goto no_res;
 	}
 
-	board = pdev->dev.platform_data;
+	if (pdev->dev.of_node) {
+		board = devm_kzalloc(&pdev->dev, sizeof(struct orion_nand_data),
+					GFP_KERNEL);
+		if (!board) {
+			printk(KERN_ERR "orion_nand: failed to allocate board structure.\n");
+			ret = -ENOMEM;
+			goto no_res;
+		}
+		if (!of_property_read_u32(pdev->dev.of_node, "cle", &val))
+			board->cle = (u8)val;
+		else
+			board->cle = 0;
+		if (!of_property_read_u32(pdev->dev.of_node, "ale", &val))
+			board->ale = (u8)val;
+		else
+			board->ale = 1;
+		if (!of_property_read_u32(pdev->dev.of_node,
+						"bank-width", &val))
+			board->width = (u8)val * 8;
+		else
+			board->width = 8;
+		if (!of_property_read_u32(pdev->dev.of_node,
+						"chip-delay", &val))
+			board->chip_delay = (u8)val;
+	} else
+		board = pdev->dev.platform_data;
 
 	mtd->priv = nc;
 	mtd->owner = THIS_MODULE;
@@ -129,7 +157,8 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 	}
 
 	mtd->name = "orion_nand";
-	ret = mtd_device_parse_register(mtd, NULL, 0,
+	ppdata.of_node = pdev->dev.of_node;
+	ret = mtd_device_parse_register(mtd, NULL, &ppdata,
 			board->parts, board->nr_parts);
 	if (ret) {
 		nand_release(mtd);
@@ -161,11 +190,19 @@ static int __devexit orion_nand_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_OF
+static struct of_device_id orion_nand_of_match_table[] = {
+	{ .compatible = "mrvl,orion-nand", },
+	{},
+};
+#endif
+
 static struct platform_driver orion_nand_driver = {
 	.remove		= __devexit_p(orion_nand_remove),
 	.driver		= {
 		.name	= "orion_nand",
 		.owner	= THIS_MODULE,
+		.of_match_table = of_match_ptr(orion_nand_of_match_table),
 	},
 };
 
-- 
1.7.9.1
