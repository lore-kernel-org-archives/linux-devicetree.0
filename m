Return-Path: <SRS0=NCrW=G4=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:35118 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751643AbeDGPsp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 7 Apr 2018 11:48:45 -0400
From: Akinobu Mita <akinobu.mita@gmail.com>
Subject: [PATCH 2/6] media: ov772x: add checks for register read errors
Date: Sun,  8 Apr 2018 00:48:06 +0900
Message-Id: <1523116090-13101-3-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <1523116090-13101-1-git-send-email-akinobu.mita@gmail.com>
References: <1523116090-13101-1-git-send-email-akinobu.mita@gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: Akinobu Mita <akinobu.mita@gmail.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hans.verkuil@cisco.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@s-opensource.com>
List-ID: <devicetree@vger.kernel.org>

This change adds checks for register read errors and returns correct
error code.

Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hans.verkuil@cisco.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
 drivers/media/i2c/ov772x.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
index 283ae2c..c56f910 100644
--- a/drivers/media/i2c/ov772x.c
+++ b/drivers/media/i2c/ov772x.c
@@ -1169,8 +1169,15 @@ static int ov772x_video_probe(struct ov772x_priv *priv)
 		return ret;
 
 	/* Check and show product ID and manufacturer ID. */
-	pid = ov772x_read(client, PID);
-	ver = ov772x_read(client, VER);
+	ret = ov772x_read(client, PID);
+	if (ret < 0)
+		return ret;
+	pid = ret;
+
+	ret = ov772x_read(client, VER);
+	if (ret < 0)
+		return ret;
+	ver = ret;
 
 	switch (VERSION(pid, ver)) {
 	case OV7720:
-- 
2.7.4

