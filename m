Return-Path: <SRS0=BUHn=O7=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pl1-f196.google.com ([209.85.214.196]:41251 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390366AbeLVRNQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 22 Dec 2018 12:13:16 -0500
From: Akinobu Mita <akinobu.mita@gmail.com>
Subject: [PATCH 04/12] media: mt9m001: add of_match_table
Date: Sun, 23 Dec 2018 02:12:46 +0900
Message-Id: <1545498774-11754-5-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <1545498774-11754-1-git-send-email-akinobu.mita@gmail.com>
References: <1545498774-11754-1-git-send-email-akinobu.mita@gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: Akinobu Mita <akinobu.mita@gmail.com>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@s-opensource.com>
List-ID: <devicetree@vger.kernel.org>

Add of_match_table for the MT9M001 CMOS image sensor.

Cc: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
 drivers/media/i2c/mt9m001.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
index 65ff59d..2d800ca 100644
--- a/drivers/media/i2c/mt9m001.c
+++ b/drivers/media/i2c/mt9m001.c
@@ -738,9 +738,16 @@ static const struct i2c_device_id mt9m001_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, mt9m001_id);
 
+static const struct of_device_id mt9m001_of_match[] = {
+	{ .compatible = "onnn,mt9m001", },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, mt9m001_of_match);
+
 static struct i2c_driver mt9m001_i2c_driver = {
 	.driver = {
 		.name = "mt9m001",
+		.of_match_table = mt9m001_of_match,
 	},
 	.probe		= mt9m001_probe,
 	.remove		= mt9m001_remove,
-- 
2.7.4
