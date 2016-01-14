From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 15/26] drm/modes: Support modes names on the
 command line
Date: Thu, 14 Jan 2016 16:24:58 +0100
Message-ID: <1452785109-6172-16-git-send-email-maxime.ripard@free-electrons.com>
References: <1452785109-6172-1-git-send-email-maxime.ripard@free-electrons.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBAP4322AKGQEFVHFSUQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1452785109-6172-1-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Wynter Woods <wynter-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The drm subsystem also uses the video= kernel parameter, and in the
documentation refers to the fbdev documentation for that parameter.

However, that documentation also says that instead of giving the mode using
its resolution we can also give a name. However, DRM doesn't handle that
case at the moment. Even though in most case it shouldn't make any
difference, it might be useful for analog modes, where different standards
might have the same resolution, but still have a few different parameters
that are not encoded in the modes (NTSC vs NTSC-J vs PAL-M for example).

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/gpu/drm/drm_crtc.c      |  3 ++-
 drivers/gpu/drm/drm_fb_helper.c |  4 ++++
 drivers/gpu/drm/drm_modes.c     | 49 ++++++++++++++++++++++++++++-------------
 include/drm/drm_modes.h         |  1 +
 4 files changed, 41 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 24c5434abd1c..c3267d695e4e 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -846,8 +846,9 @@ static void drm_connector_get_cmdline_mode(struct drm_connector *connector)
 		connector->force = mode->force;
 	}
 
-	DRM_DEBUG_KMS("cmdline mode for connector %s %dx%d@%dHz%s%s%s\n",
+	DRM_DEBUG_KMS("cmdline mode for connector %s %s %dx%d@%dHz%s%s%s\n",
 		      connector->name,
+		      mode->name ? mode->name : "",
 		      mode->xres, mode->yres,
 		      mode->refresh_specified ? mode->refresh : 60,
 		      mode->rb ? " reduced blanking" : "",
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 69cbab5e5c81..fcb7ba796202 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -1649,6 +1649,10 @@ struct drm_display_mode *drm_pick_cmdline_mode(struct drm_fb_helper_connector *f
 	prefer_non_interlace = !cmdline_mode->interlace;
 again:
 	list_for_each_entry(mode, &fb_helper_conn->connector->modes, head) {
+		/* Check (optional) mode name first */
+		if (!strcmp(mode->name, cmdline_mode->name))
+			return mode;
+
 		/* check width/height */
 		if (mode->hdisplay != cmdline_mode->xres ||
 		    mode->vdisplay != cmdline_mode->yres)
diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 5b1921b22dd6..bbb23000eb5b 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -1351,7 +1351,7 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
 					       struct drm_cmdline_mode *mode)
 {
 	const char *name;
-	bool parse_extras = false;
+	bool named_mode = false, parse_extras = false;
 	unsigned int bpp_off = 0, refresh_off = 0;
 	unsigned int mode_end = 0;
 	char *bpp_ptr = NULL, *refresh_ptr = NULL, *extra_ptr = NULL;
@@ -1370,8 +1370,14 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
 
 	name = mode_option;
 
+	/*
+	 * If the first character is not a digit, then it means that
+	 * we have a named mode.
+	 */
 	if (!isdigit(name[0]))
-		return false;
+		named_mode = true;
+	else
+		named_mode = false;
 
 	/* Try to locate the bpp and refresh specifiers, if any */
 	bpp_ptr = strchr(name, '-');
@@ -1398,12 +1404,16 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
 		parse_extras = true;
 	}
 
-	ret = drm_mode_parse_cmdline_res_mode(name, mode_end,
-					      parse_extras,
-					      connector,
-					      mode);
-	if (ret)
-		return false;
+	if (named_mode) {
+		strncpy(mode->name, name, mode_end);
+	} else {
+		ret = drm_mode_parse_cmdline_res_mode(name, mode_end,
+						      parse_extras,
+						      connector,
+						      mode);
+		if (ret)
+			return false;
+	}
 	mode->specified = true;
 
 	if (bpp_ptr) {
@@ -1431,14 +1441,23 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
 		extra_ptr = refresh_end_ptr;
 
 	if (extra_ptr) {
-		int remaining = strlen(name) - (extra_ptr - name);
+		if (!named_mode) {
+			int len = strlen(name) - (extra_ptr - name);
 
-		/*
-		 * We still have characters to process, while
-		 * we shouldn't have any
-		 */
-		if (remaining > 0)
-			return false;
+			ret = drm_mode_parse_cmdline_extra(extra_ptr, len,
+							   connector, mode);
+			if (ret)
+				return false;
+		} else {
+			int remaining = strlen(name) - (extra_ptr - name);
+
+			/*
+			 * We still have characters to process, while
+			 * we shouldn't have any
+			 */
+			if (remaining > 0)
+				return false;
+		}
 	}
 
 	return true;
diff --git a/include/drm/drm_modes.h b/include/drm/drm_modes.h
index 08a8cac9e555..709d43f3515e 100644
--- a/include/drm/drm_modes.h
+++ b/include/drm/drm_modes.h
@@ -151,6 +151,7 @@ struct drm_display_mode {
 
 /* mode specified on the command line */
 struct drm_cmdline_mode {
+	char name[DRM_DISPLAY_MODE_LEN];
 	bool specified;
 	bool refresh_specified;
 	bool bpp_specified;
-- 
2.6.4
