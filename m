From: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Subject: [PATCH 6/7] mtd: brcmnand: run bcm47xxpart part parser in addition
Date: Sun, 17 May 2015 17:41:05 +0200
Message-ID: <1431877266-28566-7-git-send-email-hauke@hauke-m.de>
References: <1431877266-28566-1-git-send-email-hauke@hauke-m.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431877266-28566-1-git-send-email-hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On the bcm53xx and bcm47xx SoC the bcm47xxpart partition parser is able
to parse the partitions automatically by reading some special header
used on these SoCs flash partition and some guessing. Without this
patch the default list is used, with this patch this partition parser
is used if the others haven't found a partition.

Signed-off-by: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
---
 drivers/mtd/nand/brcmnand/brcmnand.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
index 468a212..cc5dc1e 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/brcmnand/brcmnand.c
@@ -1879,6 +1879,9 @@ static int brcmnand_setup_dev(struct brcmnand_host *host)
 	return 0;
 }
 
+static const char * const probes[] = {"cmdlinepart", "ofpart", "bcm47xxpart",
+				      NULL};
+
 static int brcmnand_init_cs(struct brcmnand_host *host)
 {
 	struct brcmnand_controller *ctrl = host->ctrl;
@@ -1956,7 +1959,7 @@ static int brcmnand_init_cs(struct brcmnand_host *host)
 	if (nand_scan_tail(mtd))
 		return -ENXIO;
 
-	return mtd_device_parse_register(mtd, NULL, &ppdata, NULL, 0);
+	return mtd_device_parse_register(mtd, probes, &ppdata, NULL, 0);
 }
 
 static void brcmnand_save_restore_cs_config(struct brcmnand_host *host,
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
