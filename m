From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v7 14/14] drm/mediatek: Add fence control, wait on GPU fence
Date: Mon, 30 Nov 2015 22:07:56 +0100
Message-ID: <1448917676-25584-15-git-send-email-p.zabel@pengutronix.de>
References: <1448917676-25584-1-git-send-email-p.zabel@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1448917676-25584-1-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cawa Cheng <cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jitao Shi <jitao.shi-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jie Qiu <jie.qiu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, Daniel Stone <daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Wait on the exclusive fence for the incoming framebuffer, using
"wait_for_fences" from drm_atomic_helper.c, which needs to be exported
first.

Signed-off-by: CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Signed-off-by: YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Signed-off-by: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c  | 36 ++++++++++++++++++++++++++++++--
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h  |  1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c   |  2 ++
 drivers/gpu/drm/mediatek/mtk_drm_plane.c | 22 ++++++++++++++++---
 4 files changed, 56 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index ec0540f..69e8fe5 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -65,6 +65,8 @@ struct mtk_crtc_state {
 	struct drm_crtc_state		base;
 	struct drm_pending_vblank_event	*event;
 
+	bool				pending_needs_vblank;
+
 	bool				pending_config;
 	unsigned int			pending_width;
 	unsigned int			pending_height;
@@ -100,10 +102,24 @@ static void mtk_drm_crtc_finish_page_flip(struct mtk_drm_crtc *mtk_crtc)
 {
 	struct drm_crtc *crtc = &mtk_crtc->base;
 	struct mtk_crtc_state *state = to_mtk_crtc_state(crtc->state);
+	unsigned long flags;
 
+	spin_lock_irqsave(&crtc->dev->event_lock, flags);
 	drm_send_vblank_event(crtc->dev, state->event->pipe, state->event);
 	drm_crtc_vblank_put(crtc);
 	state->event = NULL;
+	spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
+}
+
+static void mtk_drm_finish_page_flip(struct mtk_drm_crtc *mtk_crtc)
+{
+	struct mtk_crtc_state *state = to_mtk_crtc_state(mtk_crtc->base.state);
+
+	drm_handle_vblank(mtk_crtc->base.dev, mtk_crtc->pipe);
+	if (state->pending_needs_vblank) {
+		mtk_drm_crtc_finish_page_flip(mtk_crtc);
+		state->pending_needs_vblank = false;
+	}
 }
 
 static void mtk_drm_crtc_destroy(struct drm_crtc *crtc)
@@ -391,10 +407,26 @@ void mtk_drm_crtc_commit(struct drm_crtc *crtc)
 	}
 }
 
+void mtk_drm_crtc_check_flush(struct drm_crtc *crtc)
+{
+	struct mtk_crtc_state *state = to_mtk_crtc_state(crtc->state);
+	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
+
+	if (mtk_crtc->do_flush) {
+		if (state->event)
+			state->pending_needs_vblank = true;
+		mtk_drm_crtc_commit(crtc);
+		mtk_crtc->do_flush = false;
+	}
+}
+
 static void mtk_drm_crtc_atomic_flush(struct drm_crtc *crtc,
 				      struct drm_crtc_state *old_crtc_state)
 {
-	mtk_drm_crtc_commit(crtc);
+	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
+
+	mtk_crtc->do_flush = true;
+	mtk_drm_crtc_check_flush(crtc);
 }
 
 static const struct drm_crtc_funcs mtk_crtc_funcs = {
@@ -482,7 +514,7 @@ void mtk_crtc_ddp_irq(struct drm_device *drm_dev, struct mtk_ddp_comp *ovl)
 		}
 	}
 
-	drm_handle_vblank(mtk_crtc->base.dev, mtk_crtc->pipe);
+	mtk_drm_finish_page_flip(mtk_crtc);
 }
 
 int mtk_drm_crtc_create(struct drm_device *drm_dev,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
index f04854f..94eba3c 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
@@ -22,6 +22,7 @@
 
 int mtk_drm_crtc_enable_vblank(struct drm_device *drm, unsigned int pipe);
 void mtk_drm_crtc_disable_vblank(struct drm_device *drm, unsigned int pipe);
+void mtk_drm_crtc_check_flush(struct drm_crtc *crtc);
 void mtk_drm_crtc_commit(struct drm_crtc *crtc);
 void mtk_crtc_ddp_irq(struct drm_device *drm_dev, struct mtk_ddp_comp *ovl);
 int mtk_drm_crtc_create(struct drm_device *drm_dev,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 2d5bd16..e6d8adf 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -49,6 +49,8 @@ static void mtk_atomic_complete(struct mtk_drm_private *private,
 {
 	struct drm_device *drm = private->drm;
 
+	drm_atomic_helper_wait_for_fences(drm, state);
+
 	drm_atomic_helper_commit_modeset_disables(drm, state);
 	drm_atomic_helper_commit_planes(drm, state, false);
 	drm_atomic_helper_commit_modeset_enables(drm, state);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index c0b62d1..343c060 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -123,6 +123,8 @@ static int mtk_plane_atomic_check(struct drm_plane *plane,
 				  struct drm_plane_state *state)
 {
 	struct drm_framebuffer *fb = state->fb;
+	struct drm_gem_object *gem;
+	struct reservation_object *resv;
 	struct drm_crtc_state *crtc_state;
 	bool visible;
 	int ret;
@@ -167,6 +169,16 @@ static int mtk_plane_atomic_check(struct drm_plane *plane,
 	if (ret)
 		return ret;
 
+	/* Find pending fence from incoming FB, if any, and stash in state */
+	gem = mtk_fb_get_gem_obj(fb);
+	if (!gem->dma_buf || !gem->dma_buf->resv)
+		return 0;
+
+	resv = gem->dma_buf->resv;
+	ww_mutex_lock(&resv->lock, NULL);
+	state->fence = fence_get(reservation_object_get_excl(resv));
+	ww_mutex_unlock(&resv->lock);
+
 	return 0;
 }
 
@@ -176,6 +188,7 @@ static void mtk_plane_atomic_update(struct drm_plane *plane,
 	struct mtk_plane_state *state = to_mtk_plane_state(plane->state);
 	struct drm_crtc *crtc = state->base.crtc;
 	struct drm_gem_object *gem;
+	struct mtk_drm_gem_obj *mtk_gem;
 	struct mtk_drm_plane *mtk_plane = to_mtk_plane(plane);
 	struct drm_rect dest = {
 		.x1 = state->base.crtc_x,
@@ -193,9 +206,10 @@ static void mtk_plane_atomic_update(struct drm_plane *plane,
 	drm_rect_intersect(&dest, &clip);
 
 	gem = mtk_fb_get_gem_obj(state->base.fb);
-	if (gem)
-		mtk_plane_config(mtk_plane, true, to_mtk_gem_obj(gem)->dma_addr,
-				 &dest);
+	mtk_gem = to_mtk_gem_obj(gem);
+	mtk_plane_config(mtk_plane, true, mtk_gem->dma_addr, &dest);
+
+	mtk_drm_crtc_check_flush(crtc);
 }
 
 static void mtk_plane_atomic_disable(struct drm_plane *plane,
@@ -209,6 +223,8 @@ static void mtk_plane_atomic_disable(struct drm_plane *plane,
 		return;
 
 	mtk_plane_config(mtk_plane, false, 0, &dest);
+
+	mtk_drm_crtc_check_flush(crtc);
 }
 
 static const struct drm_plane_helper_funcs mtk_plane_helper_funcs = {
-- 
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
