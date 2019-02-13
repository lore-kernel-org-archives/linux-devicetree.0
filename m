From: <Tudor.Ambarus@microchip.com>
Subject: [PATCH 05/11] mtd: rawnand: atmel: add generic name for EBICSA regmap
Date: Wed, 13 Feb 2019 08:59:58 +0000
Message-ID: <20190213085930.31578-6-tudor.ambarus@microchip.com>
References: <20190213085930.31578-1-tudor.ambarus@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190213085930.31578-1-tudor.ambarus@microchip.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com, Ludovic.Desroches@microchip.com, dwmw2@infradead.org, computersforpeace@gmail.com, bbrezillon@kernel.org, marek.vasut@gmail.com, richard@nod.at, miquel.raynal@bootlin.com, lee.jones@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Tudor.Ambarus@microchip.com
List-Id: devicetree@vger.kernel.org

From: Tudor Ambarus <tudor.ambarus@microchip.com>

The sam9x60 board defines the CCFG_EBICSA register under SFR,
and not as a MATRIX register, as previous boards do. Add a
more generic name for the EBICSA regmap, as a prerequisite for
sam9x60 nand controller support.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 28 +++++++++++++++++-------=
----
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nan=
d/raw/atmel/nand-controller.c
index 5781fcf6b76c..6aef98b7338a 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -211,6 +211,7 @@ struct atmel_nand_controller_caps {
 	bool legacy_of_bindings;
 	u32 ale_offs;
 	u32 cle_offs;
+	const char *ebi_csa_regmap_name;
 	const struct atmel_nand_controller_ops *ops;
 };
=20
@@ -233,7 +234,7 @@ to_nand_controller(struct nand_controller *ctl)
=20
 struct atmel_smc_nand_controller {
 	struct atmel_nand_controller base;
-	struct regmap *matrix;
+	struct regmap *ebi_csa_regmap;
 	unsigned int ebi_csa_offs;
 };
=20
@@ -1507,12 +1508,12 @@ static void atmel_smc_nand_init(struct atmel_nand_c=
ontroller *nc,
 	atmel_nand_init(nc, nand);
=20
 	smc_nc =3D to_smc_nand_controller(chip->controller);
-	if (!smc_nc->matrix)
+	if (!smc_nc->ebi_csa_regmap)
 		return;
=20
 	/* Attach the CS to the NAND Flash logic. */
 	for (i =3D 0; i < nand->numcs; i++)
-		regmap_update_bits(smc_nc->matrix, smc_nc->ebi_csa_offs,
+		regmap_update_bits(smc_nc->ebi_csa_regmap, smc_nc->ebi_csa_offs,
 				   BIT(nand->cs[i].id), BIT(nand->cs[i].id));
 }
=20
@@ -1833,7 +1834,7 @@ static void atmel_nand_controller_cleanup(struct atme=
l_nand_controller *nc)
 	clk_put(nc->mck);
 }
=20
-static const struct of_device_id atmel_matrix_of_ids[] =3D {
+static const struct of_device_id atmel_ebi_csa_regmap_of_ids[] =3D {
 	{
 		.compatible =3D "atmel,at91sam9260-matrix",
 		.data =3D (void *)AT91SAM9260_MATRIX_EBICSA,
@@ -1982,25 +1983,26 @@ atmel_smc_nand_controller_init(struct atmel_smc_nan=
d_controller *nc)
 	struct device_node *np;
 	int ret;
=20
-	/* We do not retrieve the matrix syscon when parsing old DTs. */
+	/* We do not retrieve the EBICSA regmap when parsing old DTs. */
 	if (nc->base.caps->legacy_of_bindings)
 		return 0;
=20
-	np =3D of_parse_phandle(dev->parent->of_node, "atmel,matrix", 0);
+	np =3D of_parse_phandle(dev->parent->of_node,
+			      nc->base.caps->ebi_csa_regmap_name, 0);
 	if (!np)
 		return 0;
=20
-	match =3D of_match_node(atmel_matrix_of_ids, np);
+	match =3D of_match_node(atmel_ebi_csa_regmap_of_ids, np);
 	if (!match) {
 		of_node_put(np);
 		return 0;
 	}
=20
-	nc->matrix =3D syscon_node_to_regmap(np);
+	nc->ebi_csa_regmap =3D syscon_node_to_regmap(np);
 	of_node_put(np);
-	if (IS_ERR(nc->matrix)) {
-		ret =3D PTR_ERR(nc->matrix);
-		dev_err(dev, "Could not get Matrix regmap (err =3D %d)\n", ret);
+	if (IS_ERR(nc->ebi_csa_regmap)) {
+		ret =3D PTR_ERR(nc->ebi_csa_regmap);
+		dev_err(dev, "Could not get EBICSA regmap (err =3D %d)\n", ret);
 		return ret;
 	}
=20
@@ -2341,6 +2343,7 @@ static const struct atmel_nand_controller_ops at91rm9=
200_nc_ops =3D {
 static const struct atmel_nand_controller_caps atmel_rm9200_nc_caps =3D {
 	.ale_offs =3D BIT(21),
 	.cle_offs =3D BIT(22),
+	.ebi_csa_regmap_name =3D "atmel,matrix",
 	.ops =3D &at91rm9200_nc_ops,
 };
=20
@@ -2355,12 +2358,14 @@ static const struct atmel_nand_controller_ops atmel=
_smc_nc_ops =3D {
 static const struct atmel_nand_controller_caps atmel_sam9260_nc_caps =3D {
 	.ale_offs =3D BIT(21),
 	.cle_offs =3D BIT(22),
+	.ebi_csa_regmap_name =3D "atmel,matrix",
 	.ops =3D &atmel_smc_nc_ops,
 };
=20
 static const struct atmel_nand_controller_caps atmel_sam9261_nc_caps =3D {
 	.ale_offs =3D BIT(22),
 	.cle_offs =3D BIT(21),
+	.ebi_csa_regmap_name =3D "atmel,matrix",
 	.ops =3D &atmel_smc_nc_ops,
 };
=20
@@ -2368,6 +2373,7 @@ static const struct atmel_nand_controller_caps atmel_=
sam9g45_nc_caps =3D {
 	.has_dma =3D true,
 	.ale_offs =3D BIT(21),
 	.cle_offs =3D BIT(22),
+	.ebi_csa_regmap_name =3D "atmel,matrix",
 	.ops =3D &atmel_smc_nc_ops,
 };
=20
--=20
2.9.5
