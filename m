From: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v3 1/9] mtd: nand: davinci: fix driver registration
Date: Thu, 5 Dec 2013 19:25:49 +0200
Message-ID: <1386264358-9738-2-git-send-email-ivan.khoronzhuk@ti.com>
References: <1386264358-9738-1-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386264358-9738-1-git-send-email-ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, grygorii.strashko-l0cyMroinI0@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

When kernel is booted using DT, there is no guarantee that Davinci
NAND device has been created already at the time when driver init
function is executed. Therefore, platform_driver_probe() can't be used
because this may result the Davinci NAND driver will never be probed.
The driver probing has to be made with core mechanism.

Acked-by: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Reviewed-by: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Reviewed-by: Taras Kondratiuk <taras-l0cyMroinI0@public.gmane.org>
Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
---
 drivers/mtd/nand/davinci_nand.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index b77a01e..d87213f 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -877,6 +877,7 @@ static int __exit nand_davinci_remove(struct platform_device *pdev)
 }
 
 static struct platform_driver nand_davinci_driver = {
+	.probe		= nand_davinci_probe,
 	.remove		= __exit_p(nand_davinci_remove),
 	.driver		= {
 		.name	= "davinci_nand",
@@ -886,7 +887,7 @@ static struct platform_driver nand_davinci_driver = {
 };
 MODULE_ALIAS("platform:davinci_nand");
 
-module_platform_driver_probe(nand_davinci_driver, nand_davinci_probe);
+module_platform_driver(nand_davinci_driver);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Texas Instruments");
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
