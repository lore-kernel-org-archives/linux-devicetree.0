From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 1/3] drm/sun4i: Drop unused tcon pointer
Date: Tue, 25 Apr 2017 23:25:03 +0800
Message-ID: <20170425152505.6796-2-wens@csie.org>
References: <20170425152505.6796-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBVGU7XDQKGQEMR42NQY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170425152505.6796-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

The sun4i DRM driver now uses 2 lists to track backends and tcons.
During the switch, the original tcon pointer was not removed.

As it is now unused, remove it, so other new drivers can't accidentally
use it.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---

As mentioned in the cover letter, please squash this into the patch

    drm/sun4i: Use lists to track registered display backends and TCONs

---
 drivers/gpu/drm/sun4i/sun4i_drv.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.h b/drivers/gpu/drm/sun4i/sun4i_drv.h
index 835bdb5cc0c2..250c29017ef5 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.h
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.h
@@ -20,7 +20,6 @@
 struct sun4i_drv {
 	struct list_head	backend_list;
 	struct list_head	tcon_list;
-	struct sun4i_tcon	*tcon;
 
 	struct drm_fbdev_cma	*fbdev;
 };
-- 
2.11.0
