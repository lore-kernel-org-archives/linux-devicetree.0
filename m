From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 6/9] mtd: rawnand: jz4780: Add ooblayout for the Qi Ben Nanonote
Date: Sat,  2 Feb 2019 20:19:23 -0300
Message-ID: <20190202231926.2444-7-paul@crapouillou.net>
References: <20190202231926.2444-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190202231926.2444-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Harvey Hunt <harveyhuntnexus@gmail.com>
Cc: Mathieu Malaterre <malat@debian.org>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

The Ben Nanonote from Qi Hardware expects a specific OOB layout on its
NAND. If the "ingenic,oob-layout" device property is set to "qi,lb60",
this specific OOB layout is used.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Changes:

v2: New patch

 drivers/mtd/nand/raw/ingenic/jz4780_nand.c | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/mtd/nand/raw/ingenic/jz4780_nand.c b/drivers/mtd/nand/raw/ingenic/jz4780_nand.c
index baebb9a5c7c8..4b304eceae8d 100644
--- a/drivers/mtd/nand/raw/ingenic/jz4780_nand.c
+++ b/drivers/mtd/nand/raw/ingenic/jz4780_nand.c
@@ -346,6 +346,41 @@ static int jz4780_nand_init_chips(struct jz4780_nand_controller *nfc,
 	return 0;
 }
 
+static int qi_lb60_ooblayout_ecc(struct mtd_info *mtd, int section,
+				 struct mtd_oob_region *oobregion)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_ecc_ctrl *ecc = &chip->ecc;
+
+	if (section || !ecc->total)
+		return -ERANGE;
+
+	oobregion->length = ecc->total;
+	oobregion->offset = 12;
+
+	return 0;
+}
+
+static int qi_lb60_ooblayout_free(struct mtd_info *mtd, int section,
+				  struct mtd_oob_region *oobregion)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_ecc_ctrl *ecc = &chip->ecc;
+
+	if (section)
+		return -ERANGE;
+
+	oobregion->length = mtd->oobsize - ecc->total - 12;
+	oobregion->offset = 12 + ecc->total;
+
+	return 0;
+}
+
+const struct mtd_ooblayout_ops qi_lb60_ooblayout_ops = {
+	.ecc = qi_lb60_ooblayout_ecc,
+	.free = qi_lb60_ooblayout_free,
+};
+
 static int jz4725b_ooblayout_ecc(struct mtd_info *mtd, int section,
 				 struct mtd_oob_region *oobregion)
 {
@@ -409,6 +444,8 @@ static int jz4780_nand_probe(struct platform_device *pdev)
 	if (!ret) {
 		if (!strcmp(layout, "ingenic,jz4725b")) {
 			nfc->oob_layout  = &jz4725b_ooblayout_ops;
+		} else if (!strcmp(layout, "qi,lb60")) {
+			nfc->oob_layout = &qi_lb60_ooblayout_ops;
 		} else {
 			dev_err(dev, "Unrecognized OOB layout %s\n", layout);
 			return -EINVAL;
-- 
2.20.1
