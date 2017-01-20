From: Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v4 4/7] [media] coda: add debug output about tiling
Date: Fri, 20 Jan 2017 15:00:22 +0100
Message-ID: <20170120140025.3338-5-m.tretter@pengutronix.de>
References: <20170120140025.3338-1-m.tretter@pengutronix.de>
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20170120140025.3338-1-m.tretter@pengutronix.de>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, kernel@pengutronix.de, Michael Tretter <m.tretter@pengutronix.de>
List-Id: devicetree@vger.kernel.org

From: Philipp Zabel <p.zabel@pengutronix.de>

In order to make the VDOA work correctly, the CODA must produce frames
in tiled format. Print this information in the debug output.

Also print the color format in fourcc instead of the numeric value.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/media/platform/coda/coda-common.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
index fa3ed74af116..b23fe0f0fb56 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -616,8 +616,10 @@ static int coda_s_fmt(struct coda_ctx *ctx, struct v4l2_format *f,
 	}
 
 	v4l2_dbg(1, coda_debug, &ctx->dev->v4l2_dev,
-		"Setting format for type %d, wxh: %dx%d, fmt: %d\n",
-		f->type, q_data->width, q_data->height, q_data->fourcc);
+		"Setting format for type %d, wxh: %dx%d, fmt: %4.4s %c\n",
+		f->type, q_data->width, q_data->height,
+		(char *)&q_data->fourcc,
+		(ctx->tiled_map_type == GDI_LINEAR_FRAME_MAP) ? 'L' : 'T');
 
 	return 0;
 }
-- 
2.11.0
