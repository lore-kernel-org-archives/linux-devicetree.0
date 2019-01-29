Return-Path: <SRS0=mi1T=QF=pengutronix.de=mfe@kernel.org>
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v4 6/7] media: tvp5150: initialize subdev before parsing device tree
Date: Tue, 29 Jan 2019 17:07:56 +0100
Message-Id: <20190129160757.2314-7-m.felsch@pengutronix.de>
In-Reply-To: <20190129160757.2314-1-m.felsch@pengutronix.de>
References: <20190129160757.2314-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, sakari.ailus@linux.intel.com
Cc: devicetree@vger.kernel.org, p.zabel@pengutronix.de, javierm@redhat.com, afshin.nasser@gmail.com, laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org, kernel@pengutronix.de, Michael Tretter <m.tretter@pengutronix.de>
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
index 83b976aa4492..e4f2efadd1aa 100644
--- a/drivers/media/i2c/tvp5150.c
+++ b/drivers/media/i2c/tvp5150.c
@@ -2030,6 +2030,9 @@ static int tvp5150_probe(struct i2c_client *c,
 
 	core->regmap = map;
 	sd = &core->sd;
+	v4l2_i2c_subdev_init(sd, c, &tvp5150_ops);
+	sd->internal_ops = &tvp5150_internal_ops;
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 
 	if (IS_ENABLED(CONFIG_OF) && np) {
 		res = tvp5150_parse_dt(core, np);
@@ -2042,10 +2045,6 @@ static int tvp5150_probe(struct i2c_client *c,
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
