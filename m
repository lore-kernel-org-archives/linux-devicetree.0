Return-Path: <SRS0=pcha=WL=pengutronix.de=mfe@kernel.org>
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v7 13/13] media: tvp5150: make debug output more readable
Date: Thu, 15 Aug 2019 13:57:47 +0200
Message-Id: <20190815115747.24018-14-m.felsch@pengutronix.de>
In-Reply-To: <20190815115747.24018-1-m.felsch@pengutronix.de>
References: <20190815115747.24018-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: mchehab@kernel.org, sakari.ailus@linux.intel.com, hans.verkuil@cisco.com, jacopo+renesas@jmondi.org, robh+dt@kernel.org, laurent.pinchart@ideasonboard.com
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, Jacopo Mondi <jacopo@jmondi.org>
List-ID: <devicetree@vger.kernel.org>

The debug output for tvp5150_selmux() isn't really intuitive. Register
values are printed decimal formatted and the input/output driver states
are printed as enum. Even more the "normal" output enum mapps to zero so
a active output will printing output=0 and a inactive output=1.

Change this by brinting the register values hex formatted and the states
as more readable string.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/tvp5150.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
index 8f0daa2f0d58..0103eae9e459 100644
--- a/drivers/media/i2c/tvp5150.c
+++ b/drivers/media/i2c/tvp5150.c
@@ -299,9 +299,12 @@ static void tvp5150_selmux(struct v4l2_subdev *sd)
 		break;
 	}
 
-	dev_dbg_lvl(sd->dev, 1, debug, "Selecting video route: route input=%i, output=%i => tvp5150 input=%i, opmode=%i\n",
-			decoder->input, decoder->output,
-			input, opmode);
+	dev_dbg_lvl(sd->dev, 1, debug,
+		    "Selecting video route: route input=%s, output=%s => tvp5150 input=0x%02x, opmode=0x%02x\n",
+		    decoder->input == 0 ? "aip1a" :
+		    decoder->input == 2 ? "aip1b" : "svideo",
+		    decoder->output == 0 ? "normal" : "black-frame-gen",
+		    input, opmode);
 
 	regmap_write(decoder->regmap, TVP5150_OP_MODE_CTL, opmode);
 	regmap_write(decoder->regmap, TVP5150_VD_IN_SRC_SEL_1, input);
-- 
2.20.1
