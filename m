From: <Tudor.Ambarus@microchip.com>
Subject: [PATCH 08/11] memory: atmel-ebi: move NUM_CS definition inside
 atmel-ebi
Date: Wed, 13 Feb 2019 09:00:08 +0000
Message-ID: <20190213085930.31578-9-tudor.ambarus@microchip.com>
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

The total number of cs lines is described by the EBI controller
and not by the matrix. Move the definition for the number of cs
inside ebi driver. Drop "matrix" from its name.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/memory/atmel-ebi.c              | 6 ++++--
 include/linux/mfd/syscon/atmel-matrix.h | 1 -
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/memory/atmel-ebi.c b/drivers/memory/atmel-ebi.c
index 0322df9dc249..8515196c2b03 100644
--- a/drivers/memory/atmel-ebi.c
+++ b/drivers/memory/atmel-ebi.c
@@ -19,6 +19,8 @@
 #include <linux/regmap.h>
 #include <soc/at91/atmel-sfr.h>
=20
+#define AT91_EBI_NUM_CS		8
+
 struct atmel_ebi_dev_config {
 	int cs;
 	struct atmel_smc_cs_conf smcconf;
@@ -314,7 +316,7 @@ static int atmel_ebi_dev_setup(struct atmel_ebi *ebi, s=
truct device_node *np,
 		if (ret)
 			return ret;
=20
-		if (cs >=3D AT91_MATRIX_EBI_NUM_CS ||
+		if (cs >=3D AT91_EBI_NUM_CS ||
 		    !(ebi->caps->available_cs & BIT(cs))) {
 			dev_err(dev, "invalid reg property in %pOF\n", np);
 			return -EINVAL;
@@ -344,7 +346,7 @@ static int atmel_ebi_dev_setup(struct atmel_ebi *ebi, s=
truct device_node *np,
 		apply =3D true;
=20
 	i =3D 0;
-	for_each_set_bit(cs, &cslines, AT91_MATRIX_EBI_NUM_CS) {
+	for_each_set_bit(cs, &cslines, AT91_EBI_NUM_CS) {
 		ebid->configs[i].cs =3D cs;
=20
 		if (apply) {
diff --git a/include/linux/mfd/syscon/atmel-matrix.h b/include/linux/mfd/sy=
scon/atmel-matrix.h
index 8293c3e2a82a..1e2cd118e4e3 100644
--- a/include/linux/mfd/syscon/atmel-matrix.h
+++ b/include/linux/mfd/syscon/atmel-matrix.h
@@ -110,7 +110,6 @@
 #define AT91_MATRIX_DDR_IOSR			BIT(18)
 #define AT91_MATRIX_NFD0_SELECT			BIT(24)
 #define AT91_MATRIX_DDR_MP_EN			BIT(25)
-#define AT91_MATRIX_EBI_NUM_CS			8
=20
 #define AT91_MATRIX_USBPUCR_PUON		BIT(30)
=20
--=20
2.9.5
