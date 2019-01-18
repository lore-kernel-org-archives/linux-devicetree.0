From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 5/8] mtd: rawnand: jz4780: Add ooblayout for the JZ4725B
Date: Thu, 17 Jan 2019 22:06:31 -0300
Message-ID: <20190118010634.27399-5-paul@crapouillou.net>
References: <20190118010634.27399-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190118010634.27399-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Harvey Hunt <harveyhuntnexus@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

The boot ROM of the JZ4725B SoC expects a specific OOB layout on the
NAND, so it makes sense to use this OOB layout unconditionally on this
SoC.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/mtd/nand/raw/jz4780_nand.c | 40 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/jz4780_nand.c b/drivers/mtd/nand/raw/jz4780_nand.c
index cf24bf12884f..073b3da5c3f7 100644
--- a/drivers/mtd/nand/raw/jz4780_nand.c
+++ b/drivers/mtd/nand/raw/jz4780_nand.c
@@ -34,6 +34,7 @@ struct jz_soc_info {
 	unsigned long data_offset;
 	unsigned long addr_offset;
 	unsigned long cmd_offset;
+	const struct mtd_ooblayout_ops *oob_layout;
 };
 
 struct jz4780_nand_cs {
@@ -208,7 +209,7 @@ static int jz4780_nand_attach_chip(struct nand_chip *chip)
 		return -EINVAL;
 	}
 
-	mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);
+	mtd_set_ooblayout(mtd, nfc->soc_info->oob_layout);
 
 	return 0;
 }
@@ -398,16 +399,53 @@ static int jz4780_nand_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static int jz4725b_ooblayout_ecc(struct mtd_info *mtd, int section,
+				 struct mtd_oob_region *oobregion)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_ecc_ctrl *ecc = &chip->ecc;
+
+	if (section || !ecc->total)
+		return -ERANGE;
+
+	oobregion->length = ecc->total;
+	oobregion->offset = 3;
+
+	return 0;
+}
+
+static int jz4725b_ooblayout_free(struct mtd_info *mtd, int section,
+				  struct mtd_oob_region *oobregion)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_ecc_ctrl *ecc = &chip->ecc;
+
+	if (section)
+		return -ERANGE;
+
+	oobregion->length = mtd->oobsize - ecc->total - 3;
+	oobregion->offset = 3 + ecc->total;
+
+	return 0;
+}
+
+const struct mtd_ooblayout_ops jz4725b_ooblayout_ops = {
+	.ecc = jz4725b_ooblayout_ecc,
+	.free = jz4725b_ooblayout_free,
+};
+
 static const struct jz_soc_info jz4725b_soc_info = {
 	.data_offset = 0x00000000,
 	.cmd_offset  = 0x00008000,
 	.addr_offset = 0x00010000,
+	.oob_layout  = &jz4725b_ooblayout_ops,
 };
 
 static const struct jz_soc_info jz4780_soc_info = {
 	.data_offset = 0x00000000,
 	.cmd_offset  = 0x00400000,
 	.addr_offset = 0x00800000,
+	.oob_layout  = &nand_ooblayout_lp_ops,
 };
 
 static const struct of_device_id jz4780_nand_dt_match[] = {
-- 
2.11.0
