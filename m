Return-Path: <SRS0=bntt=JN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.bugwerft.de ([46.23.86.59]:50920 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S966004AbeF0Swt (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 27 Jun 2018 14:52:49 -0400
From: Daniel Mack <daniel@zonque.org>
Subject: [PATCH v5 5/5] leds: lt3593: update email address and switch to SPDX license header
Date: Wed, 27 Jun 2018 20:52:37 +0200
Message-Id: <20180627185237.24830-6-daniel@zonque.org>
In-Reply-To: <20180627185237.24830-1-daniel@zonque.org>
References: <20180627185237.24830-1-daniel@zonque.org>
Sender: devicetree-owner@vger.kernel.org
To: jacek.anaszewski@gmail.com, robh+dt@kernel.org
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Daniel Mack <daniel@zonque.org>
List-ID: <devicetree@vger.kernel.org>

Update the email address in the module information and in the comments
and in the module information, and drop the existing boilerplate in
favor of a SPDX header.

Also sync the module license information with the header.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 drivers/leds/leds-lt3593.c | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/drivers/leds/leds-lt3593.c b/drivers/leds/leds-lt3593.c
index 2e35a4a4c571..de3623e0d094 100644
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
@@ -211,7 +196,7 @@ static struct platform_driver lt3593_led_driver = {
 
 module_platform_driver(lt3593_led_driver);
 
-MODULE_AUTHOR("Daniel Mack <daniel@caiaq.de>");
+MODULE_AUTHOR("Daniel Mack <daniel@zonque.org>");
 MODULE_DESCRIPTION("LED driver for LT3593 controllers");
-MODULE_LICENSE("GPL");
+MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:leds-lt3593");
-- 
2.17.1

