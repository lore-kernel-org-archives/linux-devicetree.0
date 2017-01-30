From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: [PATCHv2 02/16] ov7670: fix g/s_parm
Date: Mon, 30 Jan 2017 15:06:14 +0100
Message-ID: <20170130140628.18088-3-hverkuil@xs4all.nl>
References: <20170130140628.18088-1-hverkuil@xs4all.nl>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170130140628.18088-1-hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Guennadi Liakhovetski <guennadi.liakhovetski-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Songjun Wu <songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>

Drop unnecesary memset. Drop the unnecessary extendedmode check and
set the V4L2_CAP_TIMEPERFRAME capability.

Signed-off-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
---
 drivers/media/i2c/ov7670.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov7670.c b/drivers/media/i2c/ov7670.c
index 9af8d3b..50e4466 100644
--- a/drivers/media/i2c/ov7670.c
+++ b/drivers/media/i2c/ov7670.c
@@ -1046,7 +1046,6 @@ static int ov7670_g_parm(struct v4l2_subdev *sd, struct v4l2_streamparm *parms)
 	if (parms->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
 		return -EINVAL;
 
-	memset(cp, 0, sizeof(struct v4l2_captureparm));
 	cp->capability = V4L2_CAP_TIMEPERFRAME;
 	info->devtype->get_framerate(sd, &cp->timeperframe);
 
@@ -1061,9 +1060,8 @@ static int ov7670_s_parm(struct v4l2_subdev *sd, struct v4l2_streamparm *parms)
 
 	if (parms->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
 		return -EINVAL;
-	if (cp->extendedmode != 0)
-		return -EINVAL;
 
+	cp->capability = V4L2_CAP_TIMEPERFRAME;
 	return info->devtype->set_framerate(sd, tpf);
 }
 
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
