From: =?UTF-8?Q?Janusz_U=c5=bcycki?= <j.uzycki-cjVIcFy54eMe9JSWTWOYM+658FiBabzs@public.gmane.org>
Subject: [RFC PATCH] gpio-pca953x driver and PCA9536 chip
Date: Mon, 31 Aug 2015 16:26:37 +0200
Message-ID: <55E4641D.7050603@elpromaelectronics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Krzysztof Borgulski <k.borgulski-9tnw74Q4ehaHKKo6LODCOg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

The driver sets register #02 (inversion) to 0x01 instead of 0x00 on my 
board.
Reason: device_pca953x_init() does not initialize val buffer because 
NBANK() returns
for PCA9536 ngpio=4 value 0 instead of 1.

My proposed code-patch for 3.14.17 is below.
Because I don't work on stable/next I can't deliver complete/ready patch.
Please for comments.

best regards
Janusz

--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -75,7 +75,7 @@ MODULE_DEVICE_TABLE(i2c, pca953x_id);
  #define MAX_BANK 5
  #define BANK_SZ 8

-#define NBANK(chip) (chip->gpio_chip.ngpio / BANK_SZ)
+#define NBANK(chip) DIV_ROUND_UP(chip->gpio_chip.ngpio, BANK_SZ)

  struct pca953x_chip {
         unsigned gpio_start;
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
