From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v6 13/13] mtd: rawnand: ingenic: Move BBTs out of ECC area
Date: Tue, 19 Mar 2019 15:54:03 +0100
Message-ID: <20190319145403.31627-14-paul@crapouillou.net>
References: <20190319145403.31627-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190319145403.31627-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Miquel Raynal <miquel.raynal@bootlin.com>, Harvey Hunt <harveyhuntnexus@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

The generic layout for BBT markers will most likely overlap with our
ECC bytes in the OOB, so move the BBT markers outside the OOB area.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v6: New patch

 drivers/mtd/nand/raw/ingenic/ingenic_nand.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_nand.c b/drivers/mtd/nand/raw/ingenic/ingenic_nand.c
index d32d68ef0dc7..ad0c905a03ba 100644
--- a/drivers/mtd/nand/raw/ingenic/ingenic_nand.c
+++ b/drivers/mtd/nand/raw/ingenic/ingenic_nand.c
@@ -282,6 +282,13 @@ static int ingenic_nand_attach_chip(struct nand_chip *chip)
 		return -EINVAL;
 	}
 
+	/*
+	 * The generic layout for BBT markers will most likely overlap with our
+	 * ECC bytes in the OOB, so move the BBT markers outside the OOB area.
+	 */
+	if (chip->bbt_options & NAND_BBT_USE_FLASH)
+		chip->bbt_options |= NAND_BBT_NO_OOB;
+
 	/* For legacy reasons we use a different layout on the qi,lb60 board. */
 	if (of_machine_is_compatible("qi,lb60"))
 		mtd_set_ooblayout(mtd, &qi_lb60_ooblayout_ops);
-- 
2.11.0
