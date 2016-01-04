From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 04/10] [media] tvp5150: Add pixel rate control support
Date: Mon,  4 Jan 2016 09:25:26 -0300
Message-ID: <1451910332-23385-5-git-send-email-javier@osg.samsung.com>
References: <1451910332-23385-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1451910332-23385-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Enrico Butera <ebutera@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Enric Balletbo i Serra <eballetbo@gmail.com>, Rob Herring <robh+dt@kernel.org>, Eduard Gavin <egavinc@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hans.verkuil@cisco.com>, linux-media@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>
List-Id: devicetree@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

This patch adds support for the V4L2_CID_PIXEL_RATE control.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
---

 drivers/media/i2c/tvp5150.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
index 82fba9d46f30..71473cec236a 100644
--- a/drivers/media/i2c/tvp5150.c
+++ b/drivers/media/i2c/tvp5150.c
@@ -1204,7 +1204,7 @@ static int tvp5150_probe(struct i2c_client *c,
 	core->input = TVP5150_COMPOSITE1;
 	core->enable = 1;
 
-	v4l2_ctrl_handler_init(&core->hdl, 4);
+	v4l2_ctrl_handler_init(&core->hdl, 5);
 	v4l2_ctrl_new_std(&core->hdl, &tvp5150_ctrl_ops,
 			V4L2_CID_BRIGHTNESS, 0, 255, 1, 128);
 	v4l2_ctrl_new_std(&core->hdl, &tvp5150_ctrl_ops,
@@ -1213,6 +1213,9 @@ static int tvp5150_probe(struct i2c_client *c,
 			V4L2_CID_SATURATION, 0, 255, 1, 128);
 	v4l2_ctrl_new_std(&core->hdl, &tvp5150_ctrl_ops,
 			V4L2_CID_HUE, -128, 127, 1, 0);
+	v4l2_ctrl_new_std(&core->hdl, &tvp5150_ctrl_ops,
+			V4L2_CID_PIXEL_RATE, 27000000,
+			27000000, 1, 27000000);
 	sd->ctrl_handler = &core->hdl;
 	if (core->hdl.error) {
 		res = core->hdl.error;
-- 
2.4.3
