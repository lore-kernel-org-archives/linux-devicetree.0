Return-Path: <SRS0=mSv1=PQ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46240 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727656AbfAHOwY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 8 Jan 2019 09:52:24 -0500
From: Akinobu Mita <akinobu.mita@gmail.com>
Subject: [PATCH v2 04/13] media: mt9m001: sort headers alphabetically
Date: Tue,  8 Jan 2019 23:51:41 +0900
Message-Id: <1546959110-19445-5-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <1546959110-19445-1-git-send-email-akinobu.mita@gmail.com>
References: <1546959110-19445-1-git-send-email-akinobu.mita@gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: Akinobu Mita <akinobu.mita@gmail.com>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Sort header block alphabetically for easy maintenance.

Cc: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
* New patch from v2

 drivers/media/i2c/mt9m001.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
index c0b6b0c..dc6cf46 100644
--- a/drivers/media/i2c/mt9m001.c
+++ b/drivers/media/i2c/mt9m001.c
@@ -5,17 +5,17 @@
  * Copyright (C) 2008, Guennadi Liakhovetski <kernel@pengutronix.de>
  */
 
-#include <linux/videodev2.h>
-#include <linux/slab.h>
 #include <linux/i2c.h>
 #include <linux/log2.h>
 #include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/videodev2.h>
 
-#include <media/soc_camera.h>
 #include <media/drv-intf/soc_mediabus.h>
+#include <media/soc_camera.h>
 #include <media/v4l2-clk.h>
-#include <media/v4l2-subdev.h>
 #include <media/v4l2-ctrls.h>
+#include <media/v4l2-subdev.h>
 
 /*
  * mt9m001 i2c address 0x5d
-- 
2.7.4
