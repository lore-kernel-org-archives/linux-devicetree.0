From: Shirish S <s.shirish-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH] drm: edid: enable probing and listing of non rb modes
Date: Mon, 25 Nov 2013 14:24:36 +0530
Message-ID: <1385369679-4337-3-git-send-email-s.shirish@samsung.com>
References: <1385369679-4337-1-git-send-email-s.shirish@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1385369679-4337-1-git-send-email-s.shirish-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, shirish-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Shirish S <s.shirish-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The current solution checks for the existing RB mode,
if available in the edid block returns by adding it,
but does not populate the connector with the modes
of same resolution but which are non-rb modes.

As a result the probing and listing of non-rb modes can't
be made, in case the rb mode's pixel clock is not
supported but non-rb mode is supported.

This patch changes the drm_mode_std mode selection to
collect all the supported modes and not just one mode.

Signed-off-by: Shirish S <s.shirish-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/gpu/drm/drm_edid.c |   40 ++++++++++++++++++----------------------
 1 file changed, 18 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index fb7cf0e..765aa96 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1587,12 +1587,12 @@ bad_std_timing(u8 a, u8 b)
  * Take the standard timing params (in this case width, aspect, and refresh)
  * and convert them into a real mode using CVT/GTF/DMT.
  */
-static struct drm_display_mode *
-drm_mode_std(struct drm_connector *connector, struct edid *edid,
+unsigned int drm_mode_std(struct drm_connector *connector, struct edid *edid,
 	     struct std_timing *t, int revision)
 {
 	struct drm_device *dev = connector->dev;
 	struct drm_display_mode *m, *mode = NULL;
+	unsigned int modes = 0;
 	int hsize, vsize;
 	int vrefresh_rate;
 	unsigned aspect_ratio = (t->vfreq_aspect & EDID_TIMING_ASPECT_MASK)
@@ -1602,7 +1602,7 @@ drm_mode_std(struct drm_connector *connector, struct edid *edid,
 	int timing_level = standard_timing_level(edid);
 
 	if (bad_std_timing(t->hsize, t->vfreq_aspect))
-		return NULL;
+		return modes;
 
 	/* According to the EDID spec, the hdisplay = hsize * 8 + 248 */
 	hsize = t->hsize * 8 + 248;
@@ -1638,7 +1638,7 @@ drm_mode_std(struct drm_connector *connector, struct edid *edid,
 	list_for_each_entry(m, &connector->probed_modes, head)
 		if (m->hdisplay == hsize && m->vdisplay == vsize &&
 		    drm_mode_vrefresh(m) == vrefresh_rate)
-			return NULL;
+			return modes;
 
 	/* HDTV hack, part 2 */
 	if (hsize == 1366 && vsize == 768 && vrefresh_rate == 60) {
@@ -1647,19 +1647,21 @@ drm_mode_std(struct drm_connector *connector, struct edid *edid,
 		mode->hdisplay = 1366;
 		mode->hsync_start = mode->hsync_start - 1;
 		mode->hsync_end = mode->hsync_end - 1;
-		return mode;
+		goto done;
 	}
 
 	/* check whether it can be found in default mode table */
 	if (drm_monitor_supports_rb(edid)) {
 		mode = drm_mode_find_dmt(dev, hsize, vsize, vrefresh_rate,
 					 true);
-		if (mode)
-			return mode;
+		if (mode) {
+			drm_mode_probed_add(connector, mode);
+			modes++;
+		}
 	}
 	mode = drm_mode_find_dmt(dev, hsize, vsize, vrefresh_rate, false);
 	if (mode)
-		return mode;
+		goto done;
 
 	/* okay, generate it */
 	switch (timing_level) {
@@ -1676,7 +1678,7 @@ drm_mode_std(struct drm_connector *connector, struct edid *edid,
 		 */
 		mode = drm_gtf_mode(dev, hsize, vsize, vrefresh_rate, 0, 0);
 		if (!mode)
-			return NULL;
+			return modes;
 		if (drm_mode_hsync(mode) > drm_gtf2_hbreak(edid)) {
 			drm_mode_destroy(dev, mode);
 			mode = drm_gtf_mode_complex(dev, hsize, vsize,
@@ -1692,7 +1694,11 @@ drm_mode_std(struct drm_connector *connector, struct edid *edid,
 				    false);
 		break;
 	}
-	return mode;
+
+done:
+	drm_mode_probed_add(connector, mode);
+	return modes++;
+
 }
 
 /*
@@ -2174,15 +2180,10 @@ do_standard_modes(struct detailed_timing *timing, void *c)
 		int i;
 		for (i = 0; i < 6; i++) {
 			struct std_timing *std;
-			struct drm_display_mode *newmode;
 
 			std = &data->data.timings[i];
-			newmode = drm_mode_std(connector, edid, std,
+			closure->modes += drm_mode_std(connector, edid, std,
 					       edid->revision);
-			if (newmode) {
-				drm_mode_probed_add(connector, newmode);
-				closure->modes++;
-			}
 		}
 	}
 }
@@ -2203,15 +2204,10 @@ add_standard_modes(struct drm_connector *connector, struct edid *edid)
 	};
 
 	for (i = 0; i < EDID_STD_TIMINGS; i++) {
-		struct drm_display_mode *newmode;
 
-		newmode = drm_mode_std(connector, edid,
+		modes += drm_mode_std(connector, edid,
 				       &edid->standard_timings[i],
 				       edid->revision);
-		if (newmode) {
-			drm_mode_probed_add(connector, newmode);
-			modes++;
-		}
 	}
 
 	if (version_greater(edid, 1, 0))
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
