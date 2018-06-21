Return-Path: <SRS0=YCj9=JH=zonque.org=daniel@kernel.org>
From: Daniel Mack <daniel@zonque.org>
Subject: [PATCH v4 5/5] leds: lt3593: update email address and switch to SPDX license header
Date: Thu, 21 Jun 2018 22:23:22 +0200
Message-Id: <20180621202322.11581-6-daniel@zonque.org>
In-Reply-To: <20180621202322.11581-1-daniel@zonque.org>
References: <20180621202322.11581-1-daniel@zonque.org>
To: jacek.anaszewski@gmail.com, robh+dt@kernel.org
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Daniel Mack <daniel@zonque.org>
List-ID: <devicetree@vger.kernel.org>

Update the email address in the module information and in the comments
and in the module information, and drop the existing boilerplate in
favor of a SPDX header.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 drivers/leds/leds-lt3593.c | 21 +++------------------
 1 file changed, 3 insertions(+), 18 deletions(-)

diff --git a/drivers/leds/leds-lt3593.c b/drivers/leds/leds-lt3593.c
index b9a907e9d321..f6aae616242e 100644
--- a/drivers/leds/leds-lt3593.c
+++ b/drivers/leds/leds-lt3593.c
@@ -1,20 +1,5 @@
-/*
- * LEDs driver for LT3593 controllers
- *
- * See the datasheet at http://cds.linear.com/docs/Datasheet/3593f.pdf
- *
- * Copyright (c) 2009 Daniel Mack <daniel@caiaq.de>
- *
- * Based on leds-gpio.c,
- *
- *   Copyright (C) 2007 8D Technologies inc.
- *   Raphael Assenat <raph@8d.com>
- *   Copyright (C) 2008 Freescale Semiconductor, Inc.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- */
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2009,2018 Daniel Mack <daniel@zonque.org>
 
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
@@ -215,7 +200,7 @@ static struct platform_driver lt3593_led_driver = {
 
 module_platform_driver(lt3593_led_driver);
 
-MODULE_AUTHOR("Daniel Mack <daniel@caiaq.de>");
+MODULE_AUTHOR("Daniel Mack <daniel@zonque.org>");
 MODULE_DESCRIPTION("LED driver for LT3593 controllers");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:leds-lt3593");
-- 
2.17.1
