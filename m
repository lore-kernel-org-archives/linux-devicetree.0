From: Aaron Sierra <asierra-AQeFf1F/bRxBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 2/2] mtd: fsl_upm: Support NAND ECC DTS properties
Date: Wed, 27 Aug 2014 12:45:43 -0500 (CDT)
Message-ID: <716589480.189636.1409161543701.JavaMail.zimbra@xes-inc.com>
References: <2135487545.481347.1409098562105.JavaMail.zimbra@xes-inc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2135487545.481347.1409098562105.JavaMail.zimbra-AQeFf1F/bRxBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jordan Friendshuh <jfriendshuh-AQeFf1F/bRxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Jordan Friendshuh <jfriendshuh-AQeFf1F/bRxBDgjK7y7TUQ@public.gmane.org>

Support the generic nand-ecc-mode and nand-ecc-strength device-tree
properties with the Freescale UPM NAND driver.

This patch preserves the default software ECC mode while adding the
ability to use BCH ECC for larger NAND devices.

Signed-off-by: Jordan Friendshuh <jfriendshuh-AQeFf1F/bRxBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Aaron Sierra <asierra-AQeFf1F/bRxBDgjK7y7TUQ@public.gmane.org>
---
 .../devicetree/bindings/mtd/fsl-upm-nand.txt       |  2 ++
 drivers/mtd/nand/Kconfig                           |  1 +
 drivers/mtd/nand/fsl_upm.c                         | 33 ++++++++++++++++++----
 3 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/fsl-upm-nand.txt b/Documentation/devicetree/bindings/mtd/fsl-upm-nand.txt
index fce4894..a9906f6 100644
--- a/Documentation/devicetree/bindings/mtd/fsl-upm-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/fsl-upm-nand.txt
@@ -18,6 +18,8 @@ Optional properties:
 - chip-delay : chip dependent delay for transferring data from array to
 	read registers (tR). Required if property "gpios" is not used
 	(R/B# pins not connected).
+- nand-ecc-mode : as defined by nand.txt ("soft" and "soft_bch", only).
+- nand-ecc-strength : as defined by nand.txt.
 
 Each flash chip described may optionally contain additional sub-nodes
 describing partitions of the address space. See partition.txt for more
diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index f1cf503..85c0243 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -439,6 +439,7 @@ config MTD_NAND_FSL_UPM
 	tristate "Support for NAND on Freescale UPM"
 	depends on PPC_83xx || PPC_85xx
 	select FSL_LBC
+	select MTD_NAND_ECC_BCH
 	help
 	  Enables support for NAND Flash chips wired onto Freescale PowerPC
 	  processor localbus with User-Programmable Machine support.
diff --git a/drivers/mtd/nand/fsl_upm.c b/drivers/mtd/nand/fsl_upm.c
index 4d203e8..1fea897 100644
--- a/drivers/mtd/nand/fsl_upm.c
+++ b/drivers/mtd/nand/fsl_upm.c
@@ -160,6 +160,12 @@ static int fun_chip_init(struct fsl_upm_nand *fun,
 	int ret;
 	struct device_node *flash_np;
 	struct mtd_part_parser_data ppdata;
+	const char *mode;
+	u32 strength;
+
+	flash_np = of_get_next_child(upm_np, NULL);
+	if (!flash_np)
+		return -ENODEV;
 
 	fun->chip.IO_ADDR_R = fun->io_base;
 	fun->chip.IO_ADDR_W = fun->io_base;
@@ -168,7 +174,28 @@ static int fun_chip_init(struct fsl_upm_nand *fun,
 	fun->chip.read_byte = fun_read_byte;
 	fun->chip.read_buf = fun_read_buf;
 	fun->chip.write_buf = fun_write_buf;
-	fun->chip.ecc.mode = NAND_ECC_SOFT;
+
+	if (of_property_read_string(flash_np, "nand-ecc-mode", &mode) ||
+	    !strcmp(mode, "soft")) {
+		fun->chip.ecc.mode = NAND_ECC_SOFT;
+	} else if (!strcmp(mode, "soft_bch")) {
+		fun->chip.ecc.mode = NAND_ECC_SOFT_BCH;
+	} else {
+		dev_err(fun->dev, "ECC mode '%s' unsupported", mode);
+		goto err;
+	}
+
+	if (of_property_read_u32(flash_np, "nand-ecc-strength", &strength)) {
+		if (fun->chip.ecc.mode == NAND_ECC_SOFT_BCH) {
+			dev_err(fun->dev, "BCH ECC strength unspecified\n");
+			goto err;
+		}
+	} else if (fun->chip.ecc.mode == NAND_ECC_SOFT) {
+		dev_warn(fun->dev, "Ignoring %d-bit software ECC\n", strength);
+	} else if (fun->chip.ecc.mode == NAND_ECC_SOFT_BCH) {
+		fun->chip.ecc.strength = strength;
+	}
+
 	if (fun->mchip_count > 1)
 		fun->chip.select_chip = fun_select_chip;
 
@@ -178,10 +205,6 @@ static int fun_chip_init(struct fsl_upm_nand *fun,
 	fun->mtd.priv = &fun->chip;
 	fun->mtd.owner = THIS_MODULE;
 
-	flash_np = of_get_next_child(upm_np, NULL);
-	if (!flash_np)
-		return -ENODEV;
-
 	fun->mtd.name = kasprintf(GFP_KERNEL, "0x%llx.%s", (u64)io_res->start,
 				  flash_np->name);
 	if (!fun->mtd.name) {
-- 
1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
