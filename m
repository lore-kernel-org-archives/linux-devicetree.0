Return-Path: <SRS0=78dS=JJ=zonque.org=daniel@kernel.org>
From: Daniel Mack <daniel@zonque.org>
Subject: [PATCH] leds: lt3593: sync module license information with header
Date: Sat, 23 Jun 2018 21:57:29 +0200
Message-Id: <20180623195729.1429-1-daniel@zonque.org>
To: jacek.anaszewski@gmail.com, robh+dt@kernel.org
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Daniel Mack <daniel@zonque.org>
List-ID: <devicetree@vger.kernel.org>

Use GPLv2 for both the module information and the header.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 drivers/leds/leds-lt3593.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-lt3593.c b/drivers/leds/leds-lt3593.c
index f6aae616242e..90a8c86c5341 100644
--- a/drivers/leds/leds-lt3593.c
+++ b/drivers/leds/leds-lt3593.c
@@ -202,5 +202,5 @@ module_platform_driver(lt3593_led_driver);
 
 MODULE_AUTHOR("Daniel Mack <daniel@zonque.org>");
 MODULE_DESCRIPTION("LED driver for LT3593 controllers");
-MODULE_LICENSE("GPL");
+MODULE_LICENSE("GPLv2");
 MODULE_ALIAS("platform:leds-lt3593");
-- 
2.17.1
