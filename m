From: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v2] mtd: davinci-nand: disable subpage write for keystone-nand
Date: Thu, 20 Mar 2014 22:08:32 +0200
Message-ID: <1395346112-13350-1-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, santosh.shilimkar-l0cyMroinI0@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, grygorii.strashko-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, m-karicheri2-l0cyMroinI0@public.gmane.org, Warner Losh <imp-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org>, Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>

Sub page write doesn't work because of hw issue in controller found on
Keystone SOCs. AEMIF controller is also used on DaVinci SOCs which
don't seems to have any issue. So add "ti,keysone-nand" compatible
to nand driver in order to set NAND_NO_SUBPAGE_WRITE option.

Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Warner Losh <imp-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org>
Cc: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>

Signed-off-by: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>
Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
---

This patch is a result of discussion on patch v1:
https://lkml.org/lkml/2014/3/20/461

 drivers/mtd/nand/davinci_nand.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index 4615d79..b922c8e 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -523,6 +523,7 @@ static struct nand_ecclayout hwecc4_2048 = {
 #if defined(CONFIG_OF)
 static const struct of_device_id davinci_nand_of_match[] = {
 	{.compatible = "ti,davinci-nand", },
+	{.compatible = "ti,keystone-nand", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, davinci_nand_of_match);
@@ -581,6 +582,11 @@ static struct davinci_nand_pdata
 		    of_property_read_bool(pdev->dev.of_node,
 			"ti,davinci-nand-use-bbt"))
 			pdata->bbt_options = NAND_BBT_USE_FLASH;
+
+		if (of_device_is_compatible(pdev->dev.of_node,
+					    "ti,keystone-nand")) {
+			pdata->options |= NAND_NO_SUBPAGE_WRITE;
+		}
 	}
 
 	return dev_get_platdata(&pdev->dev);
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
