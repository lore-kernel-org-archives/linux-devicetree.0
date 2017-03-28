From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: [PATCHv6 02/14] ov7670: call v4l2_async_register_subdev
Date: Tue, 28 Mar 2017 10:23:35 +0200
Message-ID: <20170328082347.11159-3-hverkuil@xs4all.nl>
References: <20170328082347.11159-1-hverkuil@xs4all.nl>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170328082347.11159-1-hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Guennadi Liakhovetski <guennadi.liakhovetski-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Songjun Wu <songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>

Add v4l2-async support for this driver.

Signed-off-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Acked-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
---
 drivers/media/i2c/ov7670.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov7670.c b/drivers/media/i2c/ov7670.c
index 56cfb5ca9c95..9af8d3b8f848 100644
--- a/drivers/media/i2c/ov7670.c
+++ b/drivers/media/i2c/ov7670.c
@@ -1636,10 +1636,9 @@ static int ov7670_probe(struct i2c_client *client,
 			V4L2_EXPOSURE_AUTO);
 	sd->ctrl_handler = &info->hdl;
 	if (info->hdl.error) {
-		int err = info->hdl.error;
+		ret = info->hdl.error;
 
-		v4l2_ctrl_handler_free(&info->hdl);
-		return err;
+		goto hdl_free;
 	}
 	/*
 	 * We have checked empirically that hw allows to read back the gain
@@ -1651,7 +1650,15 @@ static int ov7670_probe(struct i2c_client *client,
 	v4l2_ctrl_cluster(2, &info->saturation);
 	v4l2_ctrl_handler_setup(&info->hdl);
 
+	ret = v4l2_async_register_subdev(&info->sd);
+	if (ret < 0)
+		goto hdl_free;
+
 	return 0;
+
+hdl_free:
+	v4l2_ctrl_handler_free(&info->hdl);
+	return ret;
 }
 
 
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
