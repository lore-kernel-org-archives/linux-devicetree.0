Return-Path: <SRS0=qqtW=JO=pengutronix.de=mfe@kernel.org>
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 15/22] [media] tvp5150: add sync lock/loss signal debug messages
Date: Thu, 28 Jun 2018 18:20:47 +0200
Message-Id: <20180628162054.25613-16-m.felsch@pengutronix.de>
In-Reply-To: <20180628162054.25613-1-m.felsch@pengutronix.de>
References: <20180628162054.25613-1-m.felsch@pengutronix.de>
To: mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: p.zabel@pengutronix.de, afshin.nasser@gmail.com, javierm@redhat.com, sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

From: Philipp Zabel <p.zabel@pengutronix.de>

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/media/i2c/tvp5150.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
index 6296c68ac816..99d887936ea0 100644
--- a/drivers/media/i2c/tvp5150.c
+++ b/drivers/media/i2c/tvp5150.c
@@ -816,6 +816,9 @@ static irqreturn_t tvp5150_isr(int irq, void *dev_id)
 
 		if (status & TVP5150_INT_A_LOCK) {
 			decoder->lock = !!(status & TVP5150_INT_A_LOCK_STATUS);
+			dev_dbg_lvl(decoder->sd.dev, 1, debug,
+				    "sync lo%s signal\n",
+				    decoder->lock ? "ck" : "ss");
 			v4l2_subdev_notify_event(&decoder->sd, &tvp5150_ev_fmt);
 			regmap_update_bits(map, TVP5150_MISC_CTL, mask,
 					   decoder->lock ? decoder->oe : 0);
-- 
2.17.1
