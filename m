From: Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 3/8] mtd: atmel_nand: Use of_device_get_match_data
Date: Fri, 15 Jan 2016 11:34:57 +0100
Message-ID: <1452854102-6125-4-git-send-email-romain.izard.pro@gmail.com>
References: <1452854102-6125-1-git-send-email-romain.izard.pro@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1452854102-6125-1-git-send-email-romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Josh Wu <rainyfeeling-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Yang Wenyou <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Remove the need for forward declaration and the risk for a null pointer
when accessing the private part of the compatible match table, by using
the newly introduced of_device_get_match_data function.

Signed-off-by: Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
v2: new patch

 drivers/mtd/nand/atmel_nand.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 6e548fc3ab7b..b5e2e62cd261 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -1485,8 +1485,6 @@ static void atmel_nand_hwctl(struct mtd_info *mtd, int mode)
 		ecc_writel(host->ecc, CR, ATMEL_ECC_RST);
 }
 
-static const struct of_device_id atmel_nand_dt_ids[];
-
 static int atmel_of_init_port(struct atmel_nand_host *host,
 			      struct device_node *np)
 {
@@ -1497,7 +1495,7 @@ static int atmel_of_init_port(struct atmel_nand_host *host,
 	enum of_gpio_flags flags = 0;
 
 	host->caps = (struct atmel_nand_caps *)
-		of_match_device(atmel_nand_dt_ids, host->dev)->data;
+		of_device_get_match_data(host->dev);
 
 	if (of_property_read_u32(np, "atmel,nand-addr-offset", &val) == 0) {
 		if (val >= 32) {
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
