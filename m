From: Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 4/5] mtd: atmel_nand: Support 32-bit ECC strength
Date: Wed, 10 Feb 2016 10:56:26 +0100
Message-ID: <1455098187-9442-5-git-send-email-romain.izard.pro@gmail.com>
References: <1455098187-9442-1-git-send-email-romain.izard.pro@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455098187-9442-1-git-send-email-romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Josh Wu <rainyfeeling-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Yang Wenyou <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

As the SAMA5D2 controller supports the 32-bit ECC strength, accept it
as a valid setting when required by the device tree or the NAND
parameter page.

Then configure the controller to use this new setting.

For the binding:
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Signed-off-by: Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Tested-by: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Reviewed-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
v4: collect Tested-By and Reviewed-by tags
v3: no change
v2: split message rewording and binding rewording into their own patches

 Documentation/devicetree/bindings/mtd/atmel-nand.txt |  3 ++-
 drivers/mtd/nand/atmel_nand.c                        | 19 +++++++++++++++++--
 drivers/mtd/nand/atmel_nand_ecc.h                    |  1 +
 3 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
index e1887b7d7e53..d53aba98fbc9 100644
--- a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
@@ -27,7 +27,8 @@ Optional properties:
 - atmel,has-pmecc : boolean to enable Programmable Multibit ECC hardware,
   capable of BCH encoding and decoding, on devices where it is present.
 - atmel,pmecc-cap : error correct capability for Programmable Multibit ECC
-  Controller. Supported values are: 2, 4, 8, 12, 24.
+  Controller. Supported values are: 2, 4, 8, 12, 24. If the compatible string
+  is "atmel,sama5d2-nand", 32 is also valid.
 - atmel,pmecc-sector-size : sector size for ECC computation. Supported values
   are: 512, 1024.
 - atmel,pmecc-lookup-table-offset : includes two offsets of lookup table in ROM
diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 00fa71045805..aaad1b98dd0d 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -475,6 +475,7 @@ static void atmel_write_buf(struct mtd_info *mtd, const u8 *buf, int len)
  *                8-bits                13-bytes                 14-bytes
  *               12-bits                20-bytes                 21-bytes
  *               24-bits                39-bytes                 42-bytes
+ *               32-bits                52-bytes                 56-bytes
  */
 static int pmecc_get_ecc_bytes(int cap, int sector_size)
 {
@@ -1024,6 +1025,9 @@ static void atmel_pmecc_core_init(struct mtd_info *mtd)
 	case 24:
 		val = PMECC_CFG_BCH_ERR24;
 		break;
+	case 32:
+		val = PMECC_CFG_BCH_ERR32;
+		break;
 	}
 
 	if (host->pmecc_sector_size == 512)
@@ -1085,6 +1089,9 @@ static int pmecc_choose_ecc(struct atmel_nand_host *host,
 
 	/* If device tree doesn't specify, use NAND's minimum ECC parameters */
 	if (host->pmecc_corr_cap == 0) {
+		if (*cap > host->caps->pmecc_max_correction)
+			return -EINVAL;
+
 		/* use the most fitable ecc bits (the near bigger one ) */
 		if (*cap <= 2)
 			host->pmecc_corr_cap = 2;
@@ -1096,6 +1103,8 @@ static int pmecc_choose_ecc(struct atmel_nand_host *host,
 			host->pmecc_corr_cap = 12;
 		else if (*cap <= 24)
 			host->pmecc_corr_cap = 24;
+		else if (*cap <= 32)
+			host->pmecc_corr_cap = 32;
 		else
 			return -EINVAL;
 	}
@@ -1554,8 +1563,14 @@ static int atmel_of_init_port(struct atmel_nand_host *host,
 	 * them from NAND ONFI parameters.
 	 */
 	if (of_property_read_u32(np, "atmel,pmecc-cap", &val) == 0) {
-		if ((val != 2) && (val != 4) && (val != 8) && (val != 12) &&
-				(val != 24)) {
+		if (val > host->caps->pmecc_max_correction) {
+			dev_err(host->dev,
+				"Required ECC strength too high: %u max %u\n",
+				val, host->caps->pmecc_max_correction);
+			return -EINVAL;
+		}
+		if ((val != 2)  && (val != 4)  && (val != 8) &&
+		    (val != 12) && (val != 24) && (val != 32)) {
 			dev_err(host->dev,
 				"Required ECC strength not supported: %u\n",
 				val);
diff --git a/drivers/mtd/nand/atmel_nand_ecc.h b/drivers/mtd/nand/atmel_nand_ecc.h
index ec964c43c932..834d694487bd 100644
--- a/drivers/mtd/nand/atmel_nand_ecc.h
+++ b/drivers/mtd/nand/atmel_nand_ecc.h
@@ -43,6 +43,7 @@
 #define		PMECC_CFG_BCH_ERR8		(2 << 0)
 #define		PMECC_CFG_BCH_ERR12		(3 << 0)
 #define		PMECC_CFG_BCH_ERR24		(4 << 0)
+#define		PMECC_CFG_BCH_ERR32		(5 << 0)
 
 #define		PMECC_CFG_SECTOR512		(0 << 4)
 #define		PMECC_CFG_SECTOR1024		(1 << 4)
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
