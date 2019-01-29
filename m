Return-Path: <SRS0=mi1T=QF=pengutronix.de=mfe@kernel.org>
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v4 4/7] media: v4l2-subdev: add stubs for v4l2_subdev_get_try_*
Date: Tue, 29 Jan 2019 17:07:54 +0100
Message-Id: <20190129160757.2314-5-m.felsch@pengutronix.de>
In-Reply-To: <20190129160757.2314-1-m.felsch@pengutronix.de>
References: <20190129160757.2314-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, sakari.ailus@linux.intel.com
Cc: devicetree@vger.kernel.org, p.zabel@pengutronix.de, javierm@redhat.com, afshin.nasser@gmail.com, laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

In case of missing CONFIG_VIDEO_V4L2_SUBDEV_API those helpers aren't
available. So each driver have to add ifdefs around those helpers or
add the CONFIG_VIDEO_V4L2_SUBDEV_API as dependcy.

Make these helpers available in case of CONFIG_VIDEO_V4L2_SUBDEV_API
isn't set to avoid ifdefs. This approach is less error prone too.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 include/media/v4l2-subdev.h | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 47af609dc8f1..90c9a301d72a 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -916,8 +916,6 @@ struct v4l2_subdev_fh {
 #define to_v4l2_subdev_fh(fh)	\
 	container_of(fh, struct v4l2_subdev_fh, vfh)
 
-#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
-
 /**
  * v4l2_subdev_get_try_format - ancillary routine to call
  *	&struct v4l2_subdev_pad_config->try_fmt
@@ -931,9 +929,13 @@ static inline struct v4l2_mbus_framefmt
 			    struct v4l2_subdev_pad_config *cfg,
 			    unsigned int pad)
 {
+#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
 	if (WARN_ON(pad >= sd->entity.num_pads))
 		pad = 0;
 	return &cfg[pad].try_fmt;
+#else
+	return NULL;
+#endif
 }
 
 /**
@@ -949,9 +951,13 @@ static inline struct v4l2_rect
 			  struct v4l2_subdev_pad_config *cfg,
 			  unsigned int pad)
 {
+#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
 	if (WARN_ON(pad >= sd->entity.num_pads))
 		pad = 0;
 	return &cfg[pad].try_crop;
+#else
+	return NULL;
+#endif
 }
 
 /**
@@ -967,11 +973,14 @@ static inline struct v4l2_rect
 			     struct v4l2_subdev_pad_config *cfg,
 			     unsigned int pad)
 {
+#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
 	if (WARN_ON(pad >= sd->entity.num_pads))
 		pad = 0;
 	return &cfg[pad].try_compose;
-}
+#else
+	return NULL;
 #endif
+}
 
 extern const struct v4l2_file_operations v4l2_subdev_fops;
 
-- 
2.20.1
