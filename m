From: matthew.gerlach@linux.intel.com
Subject: [PATCH v2 3/3] mtd: spi-nor: add flag for reading dummy cycles from nv cfg reg
Date: Wed, 20 Sep 2017 11:28:59 -0700
Message-ID: <1505932139-2905-4-git-send-email-matthew.gerlach@linux.intel.com>
References: <1505932139-2905-1-git-send-email-matthew.gerlach@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1505932139-2905-1-git-send-email-matthew.gerlach@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: vndao@altera.com, dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, davem@davemloft.net, mchehab@kernel.org, linux-fpga@vger.kernel.org, tien.hock.loh@intel.com, hean.loong.ong@intel.com
Cc: Matthew Gerlach <matthew.gerlach@linux.intel.com>
List-Id: devicetree@vger.kernel.org

From: Matthew Gerlach <matthew.gerlach@linux.intel.com>

This patch is a work around for some non-standard behavior
of EPCQ flash parts:

https://www.altera.com/documentation/wtw1396921531042.html#wtw1396921651224

These flash parts are generally used to configure Intel/Altera FPGAs
on power up.  These parts report a JEDEC id of the Micron part at the core,
but have a different number of dummy cycles than specified in the Micron
data sheet.  The number of required dummy cycles can be read from the
Non-Volatile Configuration register.

Signed-off-by: Matthew Gerlach <matthew.gerlach@linux.intel.com>
---
 drivers/mtd/spi-nor/altera-asmip2.c | 31 ++++++++++++++++++++++++++-----
 include/linux/mtd/altera-asmip2.h   |  3 +++
 2 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/spi-nor/altera-asmip2.c b/drivers/mtd/spi-nor/altera-asmip2.c
index a977765..d9cd807 100644
--- a/drivers/mtd/spi-nor/altera-asmip2.c
+++ b/drivers/mtd/spi-nor/altera-asmip2.c
@@ -40,6 +40,10 @@
 #define QSPI_POLL_TIMEOUT_US		10000000
 #define QSPI_POLL_INTERVAL_US		5
 
+#define SPINOR_OP_RD_NVCFG		0xb5
+#define NVCFG_DUMMY_SFT			12
+#define NVCFG_DUMMY_MASK		0xf
+
 struct altera_asmip2 {
 	void __iomem *csr_base;
 	u32 num_flashes;
@@ -231,7 +235,8 @@ static void altera_asmip2_unprep(struct spi_nor *nor, enum spi_nor_ops ops)
 }
 
 static int altera_asmip2_setup_banks(struct device *dev,
-				      u32 bank, struct device_node *np)
+				     u32 bank, struct device_node *np,
+				     u32 flags)
 {
 	const struct spi_nor_hwcaps hwcaps = {
 		.mask = SNOR_HWCAPS_READ |
@@ -241,6 +246,7 @@ static int altera_asmip2_setup_banks(struct device *dev,
 	struct altera_asmip2 *q = dev_get_drvdata(dev);
 	struct altera_asmip2_flash *flash;
 	struct spi_nor *nor;
+	u16 nvcfg;
 	int ret = 0;
 
 	if (bank > q->num_flashes - 1)
@@ -273,6 +279,20 @@ static int altera_asmip2_setup_banks(struct device *dev,
 		return ret;
 	}
 
+	if (flags & ALTERA_ASMIP2_FLASH_FLG_RD_NVCFG) {
+		ret = altera_asmip2_read_reg(nor, SPINOR_OP_RD_NVCFG,
+		 			     (u8*)&nvcfg, sizeof(nvcfg));
+
+		if (ret) {
+			dev_err(nor->dev,
+				"failed to read NV Configuration register\n");
+			return ret;
+		}
+
+		nor->read_dummy = (nvcfg >> NVCFG_DUMMY_SFT) & NVCFG_DUMMY_MASK;
+		dev_info(nor->dev, "%s dummy %d\n", __func__, nor->read_dummy);
+	}
+
 	ret =  mtd_device_register(&nor->mtd, NULL, 0);
 
 	return ret;
@@ -308,7 +328,7 @@ static int altera_asmip2_create(struct device *dev, void __iomem *csr_base)
 }
 
 static int altera_asmip2_add_bank(struct device *dev,
-			 u32 bank, struct device_node *np)
+			 u32 bank, struct device_node *np, u32 flags)
 {
 	struct altera_asmip2 *q = dev_get_drvdata(dev);
 
@@ -317,7 +337,7 @@ static int altera_asmip2_add_bank(struct device *dev,
 
 	q->num_flashes++;
 
-	return altera_asmip2_setup_banks(dev, bank, np);
+	return altera_asmip2_setup_banks(dev, bank, np, flags);
 }
 
 static int altera_asmip2_remove_banks(struct device *dev)
@@ -361,7 +381,8 @@ static int altera_asmip2_probe_with_pdata(struct platform_device *pdev,
 	}
 
 	for (i = 0; i < qdata->num_chip_sel; i++) {
-		ret = altera_asmip2_add_bank(dev, i, NULL);
+		ret = altera_asmip2_add_bank(dev, i, NULL,
+					     qdata->flash_flags[i]);
 		if (ret) {
 			dev_err(dev, "failed to add qspi bank %d\n", ret);
 			break;
@@ -414,7 +435,7 @@ static int altera_asmip2_probe(struct platform_device *pdev)
 			goto error;
 		}
 
-		if (altera_asmip2_add_bank(dev, bank, pp)) {
+		if (altera_asmip2_add_bank(dev, bank, pp, 0)) {
 			dev_err(dev, "failed to add bank %u\n", bank);
 			goto error;
 		}
diff --git a/include/linux/mtd/altera-asmip2.h b/include/linux/mtd/altera-asmip2.h
index 580c43c..185a9b2 100644
--- a/include/linux/mtd/altera-asmip2.h
+++ b/include/linux/mtd/altera-asmip2.h
@@ -16,9 +16,12 @@
 #define ALTERA_ASMIP2_MAX_NUM_FLASH_CHIP 3
 #define ALTERA_ASMIP2_RESOURCE_SIZE 0x10
 
+#define ALTERA_ASMIP2_FLASH_FLG_RD_NVCFG	BIT(0)
+
 struct altera_asmip2_plat_data {
 	void __iomem *csr_base;
 	u32 num_chip_sel;
+	u32 flash_flags[ALTERA_ASMIP2_MAX_NUM_FLASH_CHIP];
 };
 
 #endif
-- 
2.7.4
