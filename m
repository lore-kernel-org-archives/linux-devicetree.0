From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v6 09/13] mtd: rawnand: ingenic: Make use of ecc-engine property
Date: Tue, 19 Mar 2019 15:53:59 +0100
Message-ID: <20190319145403.31627-10-paul@crapouillou.net>
References: <20190319145403.31627-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190319145403.31627-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Miquel Raynal <miquel.raynal@bootlin.com>, Harvey Hunt <harveyhuntnexus@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

Use the 'ecc-engine' standard property instead of the custom
'ingenic,bch-controller' custom property, which is now deprecated.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v5: New patch
    
    v6: Fix 'a ecc-engine' -> 'an ecc-engine' typo

 drivers/mtd/nand/raw/ingenic/ingenic_ecc.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c b/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c
index d7f3a8c3abea..7b07a6a342d1 100644
--- a/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c
+++ b/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c
@@ -82,9 +82,9 @@ static struct ingenic_ecc *ingenic_ecc_get(struct device_node *np)
 
 /**
  * of_ingenic_ecc_get() - get the ECC controller from a DT node
- * @of_node: the node that contains a bch-controller property.
+ * @of_node: the node that contains an ecc-engine property.
  *
- * Get the bch-controller property from the given device tree
+ * Get the ecc-engine property from the given device tree
  * node and pass it to ingenic_ecc_get to do the work.
  *
  * Return: a pointer to ingenic_ecc, errors are encoded into the pointer.
@@ -95,7 +95,14 @@ struct ingenic_ecc *of_ingenic_ecc_get(struct device_node *of_node)
 	struct ingenic_ecc *ecc = NULL;
 	struct device_node *np;
 
-	np = of_parse_phandle(of_node, "ingenic,bch-controller", 0);
+	np = of_parse_phandle(of_node, "ecc-engine", 0);
+
+	/*
+	 * If the ecc-engine property is not found, check for the deprecated
+	 * ingenic,bch-controller property
+	 */
+	if (!np)
+		np = of_parse_phandle(of_node, "ingenic,bch-controller", 0);
 
 	if (np) {
 		ecc = ingenic_ecc_get(np);
-- 
2.11.0
