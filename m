From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: [PATCHv6 09/14] ov2640: fix colorspace handling
Date: Tue, 28 Mar 2017 10:23:42 +0200
Message-ID: <20170328082347.11159-10-hverkuil@xs4all.nl>
References: <20170328082347.11159-1-hverkuil@xs4all.nl>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170328082347.11159-1-hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Guennadi Liakhovetski <guennadi.liakhovetski-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Songjun Wu <songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>

The colorspace is independent of whether YUV or RGB is sent to the SoC.
Fix this.

Signed-off-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Acked-by: Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>
---
 drivers/media/i2c/soc_camera/ov2640.c | 23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/media/i2c/soc_camera/ov2640.c b/drivers/media/i2c/soc_camera/ov2640.c
index 56de18263359..b9a0069f5b33 100644
--- a/drivers/media/i2c/soc_camera/ov2640.c
+++ b/drivers/media/i2c/soc_camera/ov2640.c
@@ -794,10 +794,11 @@ static int ov2640_set_params(struct i2c_client *client, u32 *width, u32 *height,
 		dev_dbg(&client->dev, "%s: Selected cfmt YUYV (YUV422)", __func__);
 		selected_cfmt_regs = ov2640_yuyv_regs;
 		break;
-	default:
 	case MEDIA_BUS_FMT_UYVY8_2X8:
+	default:
 		dev_dbg(&client->dev, "%s: Selected cfmt UYVY", __func__);
 		selected_cfmt_regs = ov2640_uyvy_regs;
+		break;
 	}
 
 	/* reset hardware */
@@ -865,17 +866,7 @@ static int ov2640_get_fmt(struct v4l2_subdev *sd,
 	mf->width	= priv->win->width;
 	mf->height	= priv->win->height;
 	mf->code	= priv->cfmt_code;
-
-	switch (mf->code) {
-	case MEDIA_BUS_FMT_RGB565_2X8_BE:
-	case MEDIA_BUS_FMT_RGB565_2X8_LE:
-		mf->colorspace = V4L2_COLORSPACE_SRGB;
-		break;
-	default:
-	case MEDIA_BUS_FMT_YUYV8_2X8:
-	case MEDIA_BUS_FMT_UYVY8_2X8:
-		mf->colorspace = V4L2_COLORSPACE_JPEG;
-	}
+	mf->colorspace	= V4L2_COLORSPACE_SRGB;
 	mf->field	= V4L2_FIELD_NONE;
 
 	return 0;
@@ -897,17 +888,17 @@ static int ov2640_set_fmt(struct v4l2_subdev *sd,
 	ov2640_select_win(&mf->width, &mf->height);
 
 	mf->field	= V4L2_FIELD_NONE;
+	mf->colorspace	= V4L2_COLORSPACE_SRGB;
 
 	switch (mf->code) {
 	case MEDIA_BUS_FMT_RGB565_2X8_BE:
 	case MEDIA_BUS_FMT_RGB565_2X8_LE:
-		mf->colorspace = V4L2_COLORSPACE_SRGB;
+	case MEDIA_BUS_FMT_YUYV8_2X8:
+	case MEDIA_BUS_FMT_UYVY8_2X8:
 		break;
 	default:
 		mf->code = MEDIA_BUS_FMT_UYVY8_2X8;
-	case MEDIA_BUS_FMT_YUYV8_2X8:
-	case MEDIA_BUS_FMT_UYVY8_2X8:
-		mf->colorspace = V4L2_COLORSPACE_JPEG;
+		break;
 	}
 
 	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
