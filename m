From: Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 2/8] mtd: atmel_nand: Simplify error messages
Date: Fri, 15 Jan 2016 11:34:56 +0100
Message-ID: <1452854102-6125-3-git-send-email-romain.izard.pro@gmail.com>
References: <1452854102-6125-1-git-send-email-romain.izard.pro@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1452854102-6125-1-git-send-email-romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Josh Wu <rainyfeeling-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Yang Wenyou <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The error messages when the ECC controller is misconfigured through the
device tree are very precise. As a result they can (and will) get
obsolete when new revisions of the controller appear.

Simplify them before adding the support for the new revision.

Signed-off-by: Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
v2: split from the 32-bit ECC enabling patch

 drivers/mtd/nand/atmel_nand.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index b8abf14e1298..6e548fc3ab7b 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -1549,7 +1549,7 @@ static int atmel_of_init_port(struct atmel_nand_host *host,
 		if ((val != 2) && (val != 4) && (val != 8) && (val != 12) &&
 				(val != 24)) {
 			dev_err(host->dev,
-				"Unsupported PMECC correction capability: %d; should be 2, 4, 8, 12 or 24\n",
+				"Required ECC strength not supported: %u\n",
 				val);
 			return -EINVAL;
 		}
@@ -1559,7 +1559,7 @@ static int atmel_of_init_port(struct atmel_nand_host *host,
 	if (of_property_read_u32(np, "atmel,pmecc-sector-size", &val) == 0) {
 		if ((val != 512) && (val != 1024)) {
 			dev_err(host->dev,
-				"Unsupported PMECC sector size: %d; should be 512 or 1024 bytes\n",
+				"Required ECC sector size not supported: %u\n",
 				val);
 			return -EINVAL;
 		}
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
