From: Rickard Strandqvist <rickard_strandqvist-IW2WV5XWFqGZkjO+N0TKoMugMpMbD5Xr@public.gmane.org>
Subject: [PATCH] media: i2c: adv7604.c:  Remove some unused functions
Date: Thu,  1 Jan 2015 17:13:20 +0100
Message-ID: <1420128800-28746-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Rickard Strandqvist <rickard_strandqvist-IW2WV5XWFqGZkjO+N0TKoMugMpMbD5Xr@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Removes some functions that are not used anywhere:
vblanking() hblanking()

This was partially found by using a static code analysis program called cppcheck.

Signed-off-by: Rickard Strandqvist <rickard_strandqvist-IW2WV5XWFqGZkjO+N0TKoMugMpMbD5Xr@public.gmane.org>
---
 drivers/media/i2c/adv7604.c |   10 ----------
 drivers/media/i2c/adv7842.c |   10 ----------
 drivers/media/i2c/ths8200.c |   10 ----------
 3 files changed, 30 deletions(-)

diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index 47795ff..0ecca94 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -333,21 +333,11 @@ static inline struct adv7604_state *to_state(struct v4l2_subdev *sd)
 	return container_of(sd, struct adv7604_state, sd);
 }
 
-static inline unsigned hblanking(const struct v4l2_bt_timings *t)
-{
-	return V4L2_DV_BT_BLANKING_WIDTH(t);
-}
-
 static inline unsigned htotal(const struct v4l2_bt_timings *t)
 {
 	return V4L2_DV_BT_FRAME_WIDTH(t);
 }
 
-static inline unsigned vblanking(const struct v4l2_bt_timings *t)
-{
-	return V4L2_DV_BT_BLANKING_HEIGHT(t);
-}
-
 static inline unsigned vtotal(const struct v4l2_bt_timings *t)
 {
 	return V4L2_DV_BT_FRAME_HEIGHT(t);
diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
index 48b628b..d89898c 100644
--- a/drivers/media/i2c/adv7842.c
+++ b/drivers/media/i2c/adv7842.c
@@ -220,21 +220,11 @@ static inline struct v4l2_subdev *to_sd(struct v4l2_ctrl *ctrl)
 	return &container_of(ctrl->handler, struct adv7842_state, hdl)->sd;
 }
 
-static inline unsigned hblanking(const struct v4l2_bt_timings *t)
-{
-	return V4L2_DV_BT_BLANKING_WIDTH(t);
-}
-
 static inline unsigned htotal(const struct v4l2_bt_timings *t)
 {
 	return V4L2_DV_BT_FRAME_WIDTH(t);
 }
 
-static inline unsigned vblanking(const struct v4l2_bt_timings *t)
-{
-	return V4L2_DV_BT_BLANKING_HEIGHT(t);
-}
-
 static inline unsigned vtotal(const struct v4l2_bt_timings *t)
 {
 	return V4L2_DV_BT_FRAME_HEIGHT(t);
diff --git a/drivers/media/i2c/ths8200.c b/drivers/media/i2c/ths8200.c
index 656d889..4ebd329 100644
--- a/drivers/media/i2c/ths8200.c
+++ b/drivers/media/i2c/ths8200.c
@@ -58,21 +58,11 @@ static inline struct ths8200_state *to_state(struct v4l2_subdev *sd)
 	return container_of(sd, struct ths8200_state, sd);
 }
 
-static inline unsigned hblanking(const struct v4l2_bt_timings *t)
-{
-	return V4L2_DV_BT_BLANKING_WIDTH(t);
-}
-
 static inline unsigned htotal(const struct v4l2_bt_timings *t)
 {
 	return V4L2_DV_BT_FRAME_WIDTH(t);
 }
 
-static inline unsigned vblanking(const struct v4l2_bt_timings *t)
-{
-	return V4L2_DV_BT_BLANKING_HEIGHT(t);
-}
-
 static inline unsigned vtotal(const struct v4l2_bt_timings *t)
 {
 	return V4L2_DV_BT_FRAME_HEIGHT(t);
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
