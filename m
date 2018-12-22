Return-Path: <SRS0=BUHn=O7=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pf1-f195.google.com ([209.85.210.195]:41245 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731640AbeLVRNO (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 22 Dec 2018 12:13:14 -0500
From: Akinobu Mita <akinobu.mita@gmail.com>
Subject: [PATCH 03/12] media: mt9m001: convert to SPDX license identifer
Date: Sun, 23 Dec 2018 02:12:45 +0900
Message-Id: <1545498774-11754-4-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <1545498774-11754-1-git-send-email-akinobu.mita@gmail.com>
References: <1545498774-11754-1-git-send-email-akinobu.mita@gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: Akinobu Mita <akinobu.mita@gmail.com>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@s-opensource.com>
List-ID: <devicetree@vger.kernel.org>

Replace GPL license statements with SPDX license identifiers (GPL-2.0).

Cc: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
 drivers/media/i2c/mt9m001.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
index a1a85ff..65ff59d 100644
--- a/drivers/media/i2c/mt9m001.c
+++ b/drivers/media/i2c/mt9m001.c
@@ -1,11 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Driver for MT9M001 CMOS Image Sensor from Micron
  *
  * Copyright (C) 2008, Guennadi Liakhovetski <kernel@pengutronix.de>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
  */
 
 #include <linux/videodev2.h>
-- 
2.7.4
