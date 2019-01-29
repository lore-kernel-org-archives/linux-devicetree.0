Return-Path: <SRS0=mi1T=QF=pengutronix.de=mfe@kernel.org>
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v4 7/7] media: tvp5150: add s_power callback
Date: Tue, 29 Jan 2019 17:07:57 +0100
Message-Id: <20190129160757.2314-8-m.felsch@pengutronix.de>
In-Reply-To: <20190129160757.2314-1-m.felsch@pengutronix.de>
References: <20190129160757.2314-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, sakari.ailus@linux.intel.com
Cc: devicetree@vger.kernel.org, p.zabel@pengutronix.de, javierm@redhat.com, afshin.nasser@gmail.com, laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

Don't en-/disable the interrupts during s_stream because someone can
disable the stream but wants to get informed if the stream is locked
again. So keep the interrupts enabled the whole time the pipeline is
opened.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/media/i2c/tvp5150.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
index e4f2efadd1aa..1f0dd9d3655c 100644
--- a/drivers/media/i2c/tvp5150.c
+++ b/drivers/media/i2c/tvp5150.c
@@ -1387,11 +1387,26 @@ static const struct media_entity_operations tvp5150_sd_media_ops = {
 /****************************************************************************
 			I2C Command
  ****************************************************************************/
+static int tvp5150_s_power(struct  v4l2_subdev *sd, int on)
+{
+	struct tvp5150 *decoder = to_tvp5150(sd);
+	unsigned int val = 0;
+
+	if (on)
+		val = TVP5150_INT_A_LOCK;
+
+	if (decoder->irq)
+		/* Enable / Disable lock interrupt */
+		regmap_update_bits(decoder->regmap, TVP5150_INT_ENABLE_REG_A,
+				   TVP5150_INT_A_LOCK, val);
+
+	return 0;
+}
 
 static int tvp5150_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct tvp5150 *decoder = to_tvp5150(sd);
-	unsigned int mask, val = 0, int_val = 0;
+	unsigned int mask, val = 0;
 
 	mask = TVP5150_MISC_CTL_YCBCR_OE | TVP5150_MISC_CTL_SYNC_OE |
 	       TVP5150_MISC_CTL_CLOCK_OE;
@@ -1404,15 +1419,10 @@ static int tvp5150_s_stream(struct v4l2_subdev *sd, int enable)
 			val = decoder->lock ? decoder->oe : 0;
 		else
 			val = decoder->oe;
-		int_val = TVP5150_INT_A_LOCK;
 		v4l2_subdev_notify_event(&decoder->sd, &tvp5150_ev_fmt);
 	}
 
 	regmap_update_bits(decoder->regmap, TVP5150_MISC_CTL, mask, val);
-	if (decoder->irq)
-		/* Enable / Disable lock interrupt */
-		regmap_update_bits(decoder->regmap, TVP5150_INT_ENABLE_REG_A,
-				   TVP5150_INT_A_LOCK, int_val);
 
 	return 0;
 }
@@ -1614,6 +1624,7 @@ static const struct v4l2_subdev_core_ops tvp5150_core_ops = {
 	.g_register = tvp5150_g_register,
 	.s_register = tvp5150_s_register,
 #endif
+	.s_power = tvp5150_s_power,
 };
 
 static const struct v4l2_subdev_tuner_ops tvp5150_tuner_ops = {
-- 
2.20.1
