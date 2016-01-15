From: Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 7/8] mtd: atmel_nand: Support 32-bit ECC strength
Date: Fri, 15 Jan 2016 11:35:01 +0100
Message-ID: <1452854102-6125-8-git-send-email-romain.izard.pro@gmail.com>
References: <1452854102-6125-1-git-send-email-romain.izard.pro@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1452854102-6125-1-git-send-email-romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Josh Wu <rainyfeeling-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Yang Wenyou <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

As the SAMA5D2 controller supports the 32-bit ECC strength, accept it
as a valid setting when required by the device tree or the NAND
parameter page.

Then configure the controller to use this new setting.

Signed-off-by: Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

For the binding:
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
v2: Split message rewording and binding rewording into their own patches

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
index f73037a3b51d..3e580eea29a1 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -474,6 +474,7 @@ static void atmel_write_buf(struct mtd_info *mtd, const u8 *buf, int len)
  *                8-bits                13-bytes                 14-bytes
  *               12-bits                20-bytes                 21-bytes
  *               24-bits                39-bytes                 42-bytes
+ *               32-bits                52-bytes                 56-bytes
  */
 static int pmecc_get_ecc_bytes(int cap, int sector_size)
 {
@@ -1023,6 +1024,9 @@ static void atmel_pmecc_core_init(struct mtd_info *mtd)
 	case 24:
 		val = PMECC_CFG_BCH_ERR24;
 		break;
+	case 32:
+		val = PMECC_CFG_BCH_ERR32;
+		break;
 	}
 
 	if (host->pmecc_sector_size == 512)
@@ -1084,6 +1088,9 @@ static int pmecc_choose_ecc(struct atmel_nand_host *host,
 
 	/* If device tree doesn't specify, use NAND's minimum ECC parameters */
 	if (host->pmecc_corr_cap == 0) {
+		if (*cap > host->caps->pmecc_max_correction)
+			return -EINVAL;
+
 		/* use the most fitable ecc bits (the near bigger one ) */
 		if (*cap <= 2)
 			host->pmecc_corr_cap = 2;
@@ -1095,6 +1102,8 @@ static int pmecc_choose_ecc(struct atmel_nand_host *host,
 			host->pmecc_corr_cap = 12;
 		else if (*cap <= 24)
 			host->pmecc_corr_cap = 24;
+		else if (*cap <= 32)
+			host->pmecc_corr_cap = 32;
 		else
 			return -EINVAL;
 	}
@@ -1553,8 +1562,14 @@ static int atmel_of_init_port(struct atmel_nand_host *host,
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
