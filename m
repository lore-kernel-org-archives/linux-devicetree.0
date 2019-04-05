Return-Path: <SRS0=5T1w=SH=pengutronix.de=mfe@kernel.org>
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v5 12/13] media: tvp5150: add support to limit tv norms on connector
Date: Fri,  5 Apr 2019 08:03:16 +0200
Message-Id: <20190405060317.11240-13-m.felsch@pengutronix.de>
In-Reply-To: <20190405060317.11240-1-m.felsch@pengutronix.de>
References: <20190405060317.11240-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: mchehab@kernel.org, sakari.ailus@linux.intel.com, hans.verkuil@cisco.com, jacopo+renesas@jmondi.org, robh+dt@kernel.org
Cc: p.zabel@pengutronix.de, javierm@redhat.co, laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

The tvp5150 accepts NTSC(M,J,4.43), PAL (B,D,G,H,I,M,N) and SECAM video
data and is able to auto-detect the input signal. The auto-detection
does not work if the connector does not receive an input signal and the
tvp5150 might not be configured correctly. This misconfiguration leads
into wrong decoded video streams if the tvp5150 gets powered on before
the video signal is present.

Limit the supported tv norms according to the actual selected connector
to avoid a misconfiguration.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
[1] https://patchwork.kernel.org/cover/10794703/

v5:
- probe() initialize supported tv-norms according the given connectors
  if they are available.
- check if media-controller is used. Don't limit the norm if it isn't
  used.
- add more logic to be smarter during connector changing so it is
  intuitiver for the user space.

v2-v4:
- nothing since the patch was squashed from series [1] into this
  series.

 drivers/media/i2c/tvp5150.c | 69 +++++++++++++++++++++++++++++++++++--
 1 file changed, 67 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
index 2cae1b590ca4..6af04db45b7e 100644
--- a/drivers/media/i2c/tvp5150.c
+++ b/drivers/media/i2c/tvp5150.c
@@ -32,6 +32,13 @@
 #define TVP5150_MBUS_FMT	MEDIA_BUS_FMT_UYVY8_2X8
 #define TVP5150_FIELD		V4L2_FIELD_ALTERNATE
 #define TVP5150_COLORSPACE	V4L2_COLORSPACE_SMPTE170M
+#define TVP5150_STD_MASK	(V4L2_STD_NTSC     | \
+				 V4L2_STD_NTSC_443 | \
+				 V4L2_STD_PAL      | \
+				 V4L2_STD_PAL_M    | \
+				 V4L2_STD_PAL_N    | \
+				 V4L2_STD_PAL_Nc   | \
+				 V4L2_STD_SECAM)
 
 MODULE_DESCRIPTION("Texas Instruments TVP5150A/TVP5150AM1/TVP5151 video decoder driver");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
@@ -66,6 +73,7 @@ struct tvp5150 {
 	/* media-ctl properties */
 	struct media_pad pads[TVP5150_NUM_PADS];
 	struct tvp5150_connector *connectors;
+	struct tvp5150_connector *cur_connector;
 	int connectors_num;
 
 	struct v4l2_ctrl_handler hdl;
@@ -785,17 +793,28 @@ static int tvp5150_g_std(struct v4l2_subdev *sd, v4l2_std_id *std)
 static int tvp5150_s_std(struct v4l2_subdev *sd, v4l2_std_id std)
 {
 	struct tvp5150 *decoder = to_tvp5150(sd);
+	struct tvp5150_connector *cur_con = decoder->cur_connector;
+	v4l2_std_id supported_norms = cur_con ?
+		cur_con->base.connector.analog.supported_tvnorms : V4L2_STD_ALL;
 
 	if (decoder->norm == std)
 		return 0;
 
+	/*
+	 * check if requested std or group of std's is/are supported by the
+	 * connector
+	 */
+	if ((supported_norms & std) == 0)
+		return -EINVAL;
+
 	/* Change cropping height limits */
 	if (std & V4L2_STD_525_60)
 		decoder->rect.height = TVP5150_V_MAX_525_60;
 	else
 		decoder->rect.height = TVP5150_V_MAX_OTHERS;
 
-	decoder->norm = std;
+	/* set only the specific supported std in case of group of std's */
+	decoder->norm = supported_norms & std;
 
 	return tvp5150_set_std(sd, std);
 }
@@ -1345,6 +1364,8 @@ static int tvp5150_link_setup(struct media_entity *entity,
 			  TVP5150_BLACK_SCREEN, 0);
 
 	if (flags & MEDIA_LNK_FL_ENABLED) {
+		u32 new_norm;
+
 		/*
 		 * S-Video connector is conneted to both ports AIP1A and AIP1B.
 		 * Both links must be enabled in one-shot regardless which link
@@ -1356,6 +1377,26 @@ static int tvp5150_link_setup(struct media_entity *entity,
 			if (err)
 				return err;
 		}
+
+		/* Update the current connector */
+		decoder->cur_connector =
+			container_of(remote, struct tvp5150_connector, pad);
+
+		/*
+		 * Do nothing if the new connector supports the same tv-norms as
+		 * the old one.
+		 */
+		new_norm = decoder->norm &
+			decoder->cur_connector->base.connector.analog.supported_tvnorms;
+		if (decoder->norm == new_norm)
+			return 0;
+
+		/*
+		 * Fallback to the new connector tv-norms if we can't find any
+		 * common between the current tv-norm and the new one.
+		 */
+		tvp5150_s_std(sd, new_norm ? new_norm :
+			decoder->cur_connector->base.connector.analog.supported_tvnorms);
 	}
 
 	return 0;
@@ -1574,6 +1615,9 @@ static int tvp5150_registered(struct v4l2_subdev *sd)
 				TVP5150_COMPOSITE1;
 
 			tvp5150_selmux(sd);
+			decoder->cur_connector = &decoder->connectors[i];
+			tvp5150_s_std(sd,
+				decoder->connectors[i].base.connector.analog.supported_tvnorms);
 		}
 	}
 #endif
@@ -1890,6 +1934,11 @@ static int tvp5150_parse_dt(struct tvp5150 *decoder, struct device_node *np)
 				ret = -EINVAL;
 				goto err;
 			}
+			if (!(c.connector.analog.supported_tvnorms &
+			    TVP5150_STD_MASK))
+				dev_warn(dev,
+					"Unsupported tv-norm on connector %s.\n",
+					c.label);
 			in++;
 			break;
 		case TVP5150_PAD_VID_OUT:
@@ -2008,7 +2057,23 @@ static int tvp5150_probe(struct i2c_client *c,
 	if (res < 0)
 		goto err_cleanup_dt;
 
-	core->norm = V4L2_STD_ALL;	/* Default is autodetect */
+	/*
+	 * Iterate over all available connectors in case they are supported and
+	 * successfully parsed. Fallback to default autodetect in case they
+	 * aren't supported.
+	 */
+	if (core->connectors) {
+		struct v4l2_fwnode_connector *con;
+		int i;
+
+		for (i = 0; i < core->connectors_num; i++) {
+			con = &core->connectors[i].base;
+			core->norm |= con->connector.analog.supported_tvnorms;
+		}
+	} else {
+		core->norm = V4L2_STD_ALL;
+	}
+
 	core->detected_norm = V4L2_STD_UNKNOWN;
 	core->input = TVP5150_COMPOSITE1;
 	core->enable = true;
-- 
2.20.1
