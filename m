From: "Khoronzhuk, Ivan" <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 10/12] mtd: nand: davinci: don't set timings if AEMIF is used
Date: Mon, 11 Nov 2013 17:10:53 +0000
Message-ID: <4F5844B3A985794BA902E12C070812375F8D53@DNCE04.ent.ti.com>
References: <1384187188-5776-1-git-send-email-ivan.khoronzhuk@ti.com>,<1384187188-5776-11-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384187188-5776-11-git-send-email-ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Shilimkar, Santosh" <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "Strashko, Grygorii" <grygorii.strashko-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

If Davinci AEMIF is used we don't need to set timings and bus width.
It is done by AEMIF driver (drivers/memory/davinci-aemfi.c).

Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
---
 drivers/mtd/nand/davinci_nand.c |   22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index 4705214..879e915 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -742,27 +742,35 @@ static int __init nand_davinci_probe(struct platform_device *pdev)
                goto err_clk_enable;
        }

+#if !IS_ENABLED(CONFIG_TI_DAVINCI_AEMIF)
        /*
-        * Setup Async configuration register in case we did not boot from
-        * NAND and so bootloader did not bother to set it up.
+        * Setup Async configuration register in case we did not boot
+        * from NAND and so bootloader did not bother to set it up.
         */
-       val = davinci_nand_readl(info, A1CR_OFFSET + info->core_chipsel * 4);
+       val = davinci_nand_readl(info, A1CR_OFFSET +
+                                info->core_chipsel * 4);

-       /* Extended Wait is not valid and Select Strobe mode is not used */
+       /*
+        * Extended Wait is not valid and Select Strobe mode is not
+        * used
+        */
        val &= ~(ACR_ASIZE_MASK | ACR_EW_MASK | ACR_SS_MASK);
        if (info->chip.options & NAND_BUSWIDTH_16)
                val |= 0x1;

-       davinci_nand_writel(info, A1CR_OFFSET + info->core_chipsel * 4, val);
+       davinci_nand_writel(info, A1CR_OFFSET +
+                           info->core_chipsel * 4, val);

        ret = 0;
        if (info->timing)
-               ret = davinci_aemif_setup_timing(info->timing, info->base,
-                                                       info->core_chipsel);
+               ret = davinci_aemif_setup_timing(info->timing,
+                                                info->base,
+                                                info->core_chipsel);
        if (ret < 0) {
                dev_dbg(&pdev->dev, "NAND timing values setup fail\n");
                goto err;
        }
+#endif

        spin_lock_irq(&davinci_nand_lock);

--
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
