Return-Path: <SRS0=5T1w=SH=pengutronix.de=mfe@kernel.org>
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v5 08/13] media: tvp5150: initialize subdev before parsing device tree
Date: Fri,  5 Apr 2019 08:03:12 +0200
Message-Id: <20190405060317.11240-9-m.felsch@pengutronix.de>
In-Reply-To: <20190405060317.11240-1-m.felsch@pengutronix.de>
References: <20190405060317.11240-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: mchehab@kernel.org, sakari.ailus@linux.intel.com, hans.verkuil@cisco.com, jacopo+renesas@jmondi.org, robh+dt@kernel.org
Cc: p.zabel@pengutronix.de, javierm@redhat.co, laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, Michael Tretter <m.tretter@pengutronix.de>
List-ID: <devicetree@vger.kernel.org>

From: Michael Tretter <m.tretter@pengutronix.de>

There are several debug prints in the tvp5150_parse_dt() function, which
do not print the prefix, because the v4l2_subdev is not initialized, yet.

Initialize the v4l2_subdev before parsing the device tree to fix the
debug messages.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/media/i2c/tvp5150.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
index d126127628c5..82a9cb9bf736 100644
--- a/drivers/media/i2c/tvp5150.c
+++ b/drivers/media/i2c/tvp5150.c
@@ -1974,6 +1974,9 @@ static int tvp5150_probe(struct i2c_client *c,
 
 	core->regmap = map;
 	sd = &core->sd;
+	v4l2_i2c_subdev_init(sd, c, &tvp5150_ops);
+	sd->internal_ops = &tvp5150_internal_ops;
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 
 	if (IS_ENABLED(CONFIG_OF) && np) {
 		res = tvp5150_parse_dt(core, np);
@@ -1986,10 +1989,6 @@ static int tvp5150_probe(struct i2c_client *c,
 		core->mbus_type = V4L2_MBUS_BT656;
 	}
 
-	v4l2_i2c_subdev_init(sd, c, &tvp5150_ops);
-	sd->internal_ops = &tvp5150_internal_ops;
-	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
-
 	res = tvp5150_mc_init(sd);
 	if (res)
 		goto err_cleanup_dt;
-- 
2.20.1
