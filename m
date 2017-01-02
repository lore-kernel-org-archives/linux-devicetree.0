From: Michael Tretter <m.tretter-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v3 4/7] [media] coda: add debug output about tiling
Date: Mon,  2 Jan 2017 14:23:49 +0100
Message-ID: <20170102132352.23669-5-m.tretter@pengutronix.de>
References: <20170102132352.23669-1-m.tretter@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170102132352.23669-1-m.tretter-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Michael Tretter <m.tretter-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

In order to make the VDOA work correctly, the CODA must produce frames
in tiled format. Print this information in the debug output.

Also print the color format in fourcc instead of the numeric value.

Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Signed-off-by: Michael Tretter <m.tretter-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
