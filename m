From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v3 9/9] mtd: rawnand: ingenic: Add ooblayout for the Qi Ben Nanonote
Date: Mon,  4 Feb 2019 16:04:26 -0300
Message-ID: <20190204190426.11618-9-paul@crapouillou.net>
References: <20190204190426.11618-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190204190426.11618-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Harvey Hunt <harveyhuntnexus@gmail.com>
Cc: Mathieu Malaterre <malat@debian.org>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

The Ben Nanonote from Qi Hardware expects a specific OOB layout on its
NAND.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Changes:

v2: New patch

v3: Use the qi,lb60 layout unconditionally if we detect that we're
    running on that board.

 drivers/mtd/nand/raw/ingenic/ingenic_nand.c | 41 ++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_nand.c b/drivers/mtd/nand/raw/ingenic/ingenic_nand.c
index 0e6d79993ff3..fc6309895162 100644
--- a/drivers/mtd/nand/raw/ingenic/ingenic_nand.c
+++ b/drivers/mtd/nand/raw/ingenic/ingenic_nand.c
@@ -72,6 +72,41 @@ static inline struct ingenic_nfc *to_ingenic_nfc(struct nand_controller *ctrl)
 	return container_of(ctrl, struct ingenic_nfc, controller);
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
@@ -247,7 +282,11 @@ static int ingenic_nand_attach_chip(struct nand_chip *chip)
 		return -EINVAL;
 	}
 
-	mtd_set_ooblayout(mtd, nfc->soc_info->oob_layout);
+	/* For legacy reasons we use a different layout on the qi,lb60 board. */
+	if (of_machine_is_compatible("qi,lb60"))
+		mtd_set_ooblayout(mtd, &qi_lb60_ooblayout_ops);
+	else
+		mtd_set_ooblayout(mtd, nfc->soc_info->oob_layout);
 
 	return 0;
 }
-- 
2.11.0
