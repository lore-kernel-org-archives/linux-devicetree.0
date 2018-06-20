Return-Path: <SRS0=5+Be=JG=zonque.org=daniel@kernel.org>
From: Daniel Mack <daniel@zonque.org>
Subject: [PATCH v3 5/5] leds: lt3593: update email address
Date: Wed, 20 Jun 2018 22:13:03 +0200
Message-Id: <20180620201303.6272-6-daniel@zonque.org>
In-Reply-To: <20180620201303.6272-1-daniel@zonque.org>
References: <20180620201303.6272-1-daniel@zonque.org>
To: jacek.anaszewski@gmail.com, robh+dt@kernel.org
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Daniel Mack <daniel@zonque.org>
List-ID: <devicetree@vger.kernel.org>

Update the email address in the module information and in the header.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 drivers/leds/leds-lt3593.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-lt3593.c b/drivers/leds/leds-lt3593.c
index e45c26588799..4ba633740b14 100644
--- a/drivers/leds/leds-lt3593.c
+++ b/drivers/leds/leds-lt3593.c
@@ -3,7 +3,7 @@
  *
  * See the datasheet at http://cds.linear.com/docs/Datasheet/3593f.pdf
  *
- * Copyright (c) 2009 Daniel Mack <daniel@caiaq.de>
+ * Copyright (c) 2009,2018 Daniel Mack <daniel@zonque.org>
  *
  * Based on leds-gpio.c,
  *
@@ -215,7 +215,7 @@ static struct platform_driver lt3593_led_driver = {
 
 module_platform_driver(lt3593_led_driver);
 
-MODULE_AUTHOR("Daniel Mack <daniel@caiaq.de>");
+MODULE_AUTHOR("Daniel Mack <daniel@zonque.org>");
 MODULE_DESCRIPTION("LED driver for LT3593 controllers");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:leds-lt3593");
-- 
2.17.1
