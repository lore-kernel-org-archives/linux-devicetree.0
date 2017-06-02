From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 5/7] drm/vc4: Add support for the TXP (transposer) block
Date: Fri,  2 Jun 2017 10:32:10 +0200
Message-ID: <1496392332-8722-6-git-send-email-boris.brezillon@free-electrons.com>
References: <1496392332-8722-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1496392332-8722-1-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eben Upton <eben-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, "Hollingworth, Gordon" <gordon-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, "Cobley, Dom" <dom-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, Brian Starkey <brian.starkey-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The TXP block is providing writeback support. Add a driver to expose this
feature.

Supporting this engine requires reworking the CRTC because it's not using
the usual 'HVS -> PV -> VC4 Encoder' scheme. Instead, the TXP block is
directly connected to HVS FIFO2, and the PV is completely bypassed.

In order to make things work, we have to detect when the TXP is enabled,
avoid enabling the PV when this is the case, and generate fake VBLANK
events when the TXP is done writing the frame back to memory.

Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/gpu/drm/vc4/Makefile      |   1 +
 drivers/gpu/drm/vc4/vc4_crtc.c    | 126 ++++++++--
 drivers/gpu/drm/vc4/vc4_debugfs.c |   1 +
 drivers/gpu/drm/vc4/vc4_drv.c     |   1 +
 drivers/gpu/drm/vc4/vc4_drv.h     |  10 +
 drivers/gpu/drm/vc4/vc4_kms.c     |   7 +
 drivers/gpu/drm/vc4/vc4_regs.h    |   1 +
 drivers/gpu/drm/vc4/vc4_txp.c     | 509 ++++++++++++++++++++++++++++++++++++++
 8 files changed, 634 insertions(+), 22 deletions(-)
 create mode 100644 drivers/gpu/drm/vc4/vc4_txp.c

diff --git a/drivers/gpu/drm/vc4/Makefile b/drivers/gpu/drm/vc4/Makefile
index 61f45d122bd0..660b3363400f 100644
--- a/drivers/gpu/drm/vc4/Makefile
+++ b/drivers/gpu/drm/vc4/Makefile
@@ -18,6 +18,7 @@ vc4-y := \
 	vc4_plane.o \
 	vc4_render_cl.o \
 	vc4_trace_points.o \
+	vc4_txp.o \
 	vc4_v3d.o \
 	vc4_validate.o \
 	vc4_validate_shaders.o
diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index df1d81533076..564fd795803d 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -66,6 +66,7 @@ struct vc4_crtc_state {
 	struct drm_crtc_state base;
 	/* Dlist area for this CRTC configuration. */
 	struct drm_mm_node mm;
+	bool feed_txp;
 };
 
 static inline struct vc4_crtc *
@@ -369,10 +370,8 @@ static struct drm_encoder *vc4_get_crtc_encoder(struct drm_crtc *crtc)
 	return NULL;
 }
 
-static void vc4_crtc_mode_set_nofb(struct drm_crtc *crtc)
+static void vc4_crtc_config_pv(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc);
 	struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
@@ -383,12 +382,6 @@ static void vc4_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	bool is_dsi = (vc4_encoder->type == VC4_ENCODER_TYPE_DSI0 ||
 		       vc4_encoder->type == VC4_ENCODER_TYPE_DSI1);
 	u32 format = is_dsi ? PV_CONTROL_FORMAT_DSIV_24 : PV_CONTROL_FORMAT_24;
-	bool debug_dump_regs = false;
-
-	if (debug_dump_regs) {
-		DRM_INFO("CRTC %d regs before:\n", drm_crtc_index(crtc));
-		vc4_crtc_dump_regs(vc4_crtc);
-	}
 
 	/* Reset the PV fifo. */
 	CRTC_WRITE(PV_CONTROL, 0);
@@ -464,6 +457,51 @@ static void vc4_crtc_mode_set_nofb(struct drm_crtc *crtc)
 				 PV_CONTROL_CLK_SELECT) |
 		   PV_CONTROL_FIFO_CLR |
 		   PV_CONTROL_EN);
+}
+
+static void vc4_crtc_mode_set_nofb(struct drm_crtc *crtc)
+{
+	struct drm_device *dev = crtc->dev;
+	struct vc4_dev *vc4 = to_vc4_dev(dev);
+	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
+	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
+	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
+	bool interlace = mode->flags & DRM_MODE_FLAG_INTERLACE;
+	bool debug_dump_regs = false;
+
+	if (debug_dump_regs) {
+		DRM_INFO("CRTC %d regs before:\n", drm_crtc_index(crtc));
+		vc4_crtc_dump_regs(vc4_crtc);
+	}
+
+	if (vc4_crtc->channel == 2) {
+		u32 dispctrl, olddispctrl;
+
+		olddispctrl = HVS_READ(SCALER_DISPCTRL);
+		dispctrl = olddispctrl & ~SCALER_DISPCTRL_DSP3_MUX_MASK;
+
+		/* SCALER_DISPCTRL_DSP3 = X, where X < 2 means 'connect DSP3 to
+		 * FIFO X'.
+		 * SCALER_DISPCTRL_DSP3 = 3 means 'disable DSP 3'.
+		 *
+		 * DSP3 is connected to FIFO2 unless the transposer is
+		 * enabled. In this case, FIFO 2 is directly accessed by the
+		 * TXP IP, and we need to disable the FIFO2 -> pixelvalve1
+		 * route.
+		 */
+		if (vc4_state->feed_txp)
+			dispctrl |= VC4_SET_FIELD(3, SCALER_DISPCTRL_DSP3_MUX);
+		else
+			dispctrl |= VC4_SET_FIELD(2, SCALER_DISPCTRL_DSP3_MUX);
+
+		/* Reconfigure the DSP3 mux if required. */
+		if (olddispctrl != dispctrl)
+			HVS_WRITE(SCALER_DISPCTRL, dispctrl);
+	}
+
+	/* Only configure the pixelvalve if we're not feeding the TXP block. */
+	if (!vc4_state->feed_txp)
+		vc4_crtc_config_pv(crtc);
 
 	HVS_WRITE(SCALER_DISPBKGNDX(vc4_crtc->channel),
 		  SCALER_DISPBKGND_AUTOHS |
@@ -576,8 +614,8 @@ static void vc4_crtc_enable(struct drm_crtc *crtc)
 	struct drm_device *dev = crtc->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
-	struct drm_crtc_state *state = crtc->state;
-	struct drm_display_mode *mode = &state->adjusted_mode;
+	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
+	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
 
 	require_hvs_enabled(dev);
 
@@ -589,15 +627,21 @@ static void vc4_crtc_enable(struct drm_crtc *crtc)
 
 	/* Turn on the scaler, which will wait for vstart to start
 	 * compositing.
+	 * When feeding the transposer, we should operate in oneshot
+	 * mode.
 	 */
 	HVS_WRITE(SCALER_DISPCTRLX(vc4_crtc->channel),
 		  VC4_SET_FIELD(mode->hdisplay, SCALER_DISPCTRLX_WIDTH) |
 		  VC4_SET_FIELD(mode->vdisplay, SCALER_DISPCTRLX_HEIGHT) |
-		  SCALER_DISPCTRLX_ENABLE);
+		  SCALER_DISPCTRLX_ENABLE |
+		  (vc4_state->feed_txp ? SCALER_DISPCTRLX_ONESHOT : 0));
 
-	/* Turn on the pixel valve, which will emit the vstart signal. */
-	CRTC_WRITE(PV_V_CONTROL,
-		   CRTC_READ(PV_V_CONTROL) | PV_VCONTROL_VIDEN);
+	/* When feeding the composer block the pixelvalve is unneeded and
+	 * should not be enabled.
+	 */
+	if (!vc4_state->feed_txp)
+		CRTC_WRITE(PV_V_CONTROL,
+			   CRTC_READ(PV_V_CONTROL) | PV_VCONTROL_VIDEN);
 }
 
 static bool vc4_crtc_mode_fixup(struct drm_crtc *crtc,
@@ -623,8 +667,10 @@ static int vc4_crtc_atomic_check(struct drm_crtc *crtc,
 	struct drm_plane *plane;
 	unsigned long flags;
 	const struct drm_plane_state *plane_state;
+	struct drm_connector *conn;
+	struct drm_connector_state *conn_state;
 	u32 dlist_count = 0;
-	int ret;
+	int ret, i;
 
 	/* The pixelvalve can only feed one encoder (and encoders are
 	 * 1:1 with connectors.)
@@ -644,6 +690,19 @@ static int vc4_crtc_atomic_check(struct drm_crtc *crtc,
 	if (ret)
 		return ret;
 
+	for_each_connector_in_state(state->state, conn, conn_state, i) {
+		if (conn_state->crtc != crtc)
+			continue;
+
+		/* The writeback connector is implemented using the transposer
+		 * block which is directly taking its data from HVS FIFO2.
+		 */
+		if (conn->connector_type == DRM_MODE_CONNECTOR_WRITEBACK)
+			vc4_state->feed_txp = true;
+
+		break;
+	}
+
 	return 0;
 }
 
@@ -722,10 +781,14 @@ static void vc4_crtc_handle_page_flip(struct vc4_crtc *vc4_crtc)
 	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
 	u32 chan = vc4_crtc->channel;
 	unsigned long flags;
+	u32 dispstat_mode;
 
+	dispstat_mode = VC4_GET_FIELD(HVS_READ(SCALER_DISPSTATX(chan)),
+				      SCALER_DISPSTATX_MODE);
 	spin_lock_irqsave(&dev->event_lock, flags);
 	if (vc4_crtc->event &&
-	    (vc4_state->mm.start == HVS_READ(SCALER_DISPLACTX(chan)))) {
+	    (vc4_state->mm.start == HVS_READ(SCALER_DISPLACTX(chan)) ||
+	     dispstat_mode == SCALER_DISPSTATX_MODE_DISABLED)) {
 		drm_crtc_send_vblank_event(crtc, vc4_crtc->event);
 		vc4_crtc->event = NULL;
 		drm_crtc_vblank_put(crtc);
@@ -733,6 +796,15 @@ static void vc4_crtc_handle_page_flip(struct vc4_crtc *vc4_crtc)
 	spin_unlock_irqrestore(&dev->event_lock, flags);
 }
 
+void vc4_crtc_eof_event(struct drm_crtc *crtc)
+{
+	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
+
+	vc4_crtc->t_vblank = ktime_get();
+	drm_crtc_handle_vblank(&vc4_crtc->base);
+	vc4_crtc_handle_page_flip(vc4_crtc);
+}
+
 static irqreturn_t vc4_crtc_irq_handler(int irq, void *data)
 {
 	struct vc4_crtc *vc4_crtc = data;
@@ -740,11 +812,8 @@ static irqreturn_t vc4_crtc_irq_handler(int irq, void *data)
 	irqreturn_t ret = IRQ_NONE;
 
 	if (stat & PV_INT_VFP_START) {
-		vc4_crtc->t_vblank = ktime_get();
 		CRTC_WRITE(PV_INTSTAT, PV_INT_VFP_START);
-		drm_crtc_handle_vblank(&vc4_crtc->base);
-		vc4_crtc_handle_page_flip(vc4_crtc);
-		ret = IRQ_HANDLED;
+		vc4_crtc_eof_event(&vc4_crtc->base);
 	}
 
 	return ret;
@@ -956,9 +1025,22 @@ static void vc4_set_crtc_possible_masks(struct drm_device *drm,
 	struct drm_encoder *encoder;
 
 	drm_for_each_encoder(encoder, drm) {
-		struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
+		struct vc4_encoder *vc4_encoder;
 		int i;
 
+		/*
+		 * TXP is not a regular VC4 encoder, and has to be treated
+		 * differently.
+		 */
+		if (vc4_is_txp_encoder(drm, encoder)) {
+			/* HVS FIFO2 can feed the TXP IP. */
+			if (crtc_data->hvs_channel == 2)
+				encoder->possible_crtcs |= drm_crtc_mask(crtc);
+
+			continue;
+		}
+
+		vc4_encoder = to_vc4_encoder(encoder);
 		for (i = 0; i < ARRAY_SIZE(crtc_data->encoder_types); i++) {
 			if (vc4_encoder->type == encoder_types[i]) {
 				vc4_encoder->clock_select = i;
diff --git a/drivers/gpu/drm/vc4/vc4_debugfs.c b/drivers/gpu/drm/vc4/vc4_debugfs.c
index 5db06bdb5f27..7a0003de71ab 100644
--- a/drivers/gpu/drm/vc4/vc4_debugfs.c
+++ b/drivers/gpu/drm/vc4/vc4_debugfs.c
@@ -21,6 +21,7 @@ static const struct drm_info_list vc4_debugfs_list[] = {
 	{"dsi1_regs", vc4_dsi_debugfs_regs, 0, (void *)(uintptr_t)1},
 	{"hdmi_regs", vc4_hdmi_debugfs_regs, 0},
 	{"vec_regs", vc4_vec_debugfs_regs, 0},
+	{"txp_regs", vc4_txp_debugfs_regs, 0},
 	{"hvs_regs", vc4_hvs_debugfs_regs, 0},
 	{"crtc0_regs", vc4_crtc_debugfs_regs, 0, (void *)(uintptr_t)0},
 	{"crtc1_regs", vc4_crtc_debugfs_regs, 0, (void *)(uintptr_t)1},
diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 61e674baf3a6..f1af50886d9d 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -309,6 +309,7 @@ static struct platform_driver *const component_drivers[] = {
 	&vc4_vec_driver,
 	&vc4_dpi_driver,
 	&vc4_dsi_driver,
+	&vc4_txp_driver,
 	&vc4_hvs_driver,
 	&vc4_crtc_driver,
 	&vc4_v3d_driver,
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 1999bbb073ec..efe8d34593fd 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -20,6 +20,7 @@ struct vc4_dev {
 	struct vc4_dpi *dpi;
 	struct vc4_dsi *dsi1;
 	struct vc4_vec *vec;
+	struct vc4_txp *txp;
 
 	struct drm_fbdev_cma *fbdev;
 
@@ -453,6 +454,7 @@ int vc4_crtc_get_scanoutpos(struct drm_device *dev, unsigned int crtc_id,
 int vc4_crtc_get_vblank_timestamp(struct drm_device *dev, unsigned int crtc_id,
 				  int *max_error, struct timeval *vblank_time,
 				  unsigned flags);
+void vc4_crtc_eof_event(struct drm_crtc *crtc);
 
 /* vc4_debugfs.c */
 int vc4_debugfs_init(struct drm_minor *minor);
@@ -495,6 +497,14 @@ int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused);
 extern struct platform_driver vc4_vec_driver;
 int vc4_vec_debugfs_regs(struct seq_file *m, void *unused);
 
+/* vc4_txp.c */
+extern struct platform_driver vc4_txp_driver;
+int vc4_txp_debugfs_regs(struct seq_file *m, void *unused);
+void vc4_txp_atomic_commit(struct drm_device *dev,
+			   struct drm_atomic_state *old_state);
+bool vc4_is_txp_encoder(struct drm_device *dev,
+			struct drm_encoder *encoder);
+
 /* vc4_irq.c */
 irqreturn_t vc4_irq(int irq, void *arg);
 void vc4_irq_preinstall(struct drm_device *dev);
diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 86a60e9b623d..8e2cbe5a93d3 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -52,6 +52,13 @@ vc4_atomic_complete_commit(struct vc4_commit *c)
 
 	drm_atomic_helper_commit_modeset_enables(dev, state);
 
+	/*
+	 * Keep vc4_txp_atomic_commit() after
+	 * drm_atomic_helper_commit_modeset_enables() because the TXP block has
+	 * to be enabled after the HVS channel.
+	 */
+	vc4_txp_atomic_commit(dev, state);
+
 	/* Make sure that drm_atomic_helper_wait_for_vblanks()
 	 * actually waits for vblank.  If we're doing a full atomic
 	 * modeset (as opposed to a vc4_update_plane() short circuit),
diff --git a/drivers/gpu/drm/vc4/vc4_regs.h b/drivers/gpu/drm/vc4/vc4_regs.h
index 932093936178..ab6287336140 100644
--- a/drivers/gpu/drm/vc4/vc4_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_regs.h
@@ -359,6 +359,7 @@
 #define SCALER_DISPCTRL0                        0x00000040
 # define SCALER_DISPCTRLX_ENABLE		BIT(31)
 # define SCALER_DISPCTRLX_RESET			BIT(30)
+# define SCALER_DISPCTRLX_ONESHOT		BIT(29)
 # define SCALER_DISPCTRLX_WIDTH_MASK		VC4_MASK(23, 12)
 # define SCALER_DISPCTRLX_WIDTH_SHIFT		12
 # define SCALER_DISPCTRLX_HEIGHT_MASK		VC4_MASK(11, 0)
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
new file mode 100644
index 000000000000..1886e031bef3
--- /dev/null
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -0,0 +1,509 @@
+/*
+ * Copyright © 2017 Broadcom
+ *
+ * Author: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ */
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_edid.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_writeback.h>
+#include <linux/clk.h>
+#include <linux/component.h>
+#include <linux/of_graph.h>
+#include <linux/of_platform.h>
+#include <linux/pm_runtime.h>
+
+#include "vc4_drv.h"
+#include "vc4_regs.h"
+
+/* Base address of the output.  Raster formats must be 4-byte aligned,
+ * T and LT must be 16-byte aligned or maybe utile-aligned (docs are
+ * inconsistent, but probably utile).
+ */
+#define TXP_DST_PTR		0x00
+
+/* Pitch in bytes for raster images, 16-byte aligned.  For tiled, it's
+ * the width in tiles.
+ */
+#define TXP_DST_PITCH		0x04
+/* For T-tiled imgaes, DST_PITCH should be the number of tiles wide,
+ * shifted up.
+ */
+# define TXP_T_TILE_WIDTH_SHIFT		7
+/* For LT-tiled images, DST_PITCH should be the number of utiles wide,
+ * shifted up.
+ */
+# define TXP_LT_TILE_WIDTH_SHIFT	4
+
+/* Pre-rotation width/height of the image.  Must match HVS config.
+ *
+ * If TFORMAT and 32-bit, limit is 1920 for 32-bit and 3840 to 16-bit
+ * and width/height must be tile or utile-aligned as appropriate.  If
+ * transposing (rotating), width is limited to 1920.
+ *
+ * Height is limited to various numbers between 4088 and 4095.  I'd
+ * just use 4088 to be safe.
+ */
+#define TXP_DIM			0x08
+# define TXP_HEIGHT_SHIFT		16
+# define TXP_HEIGHT_MASK		GENMASK(31, 16)
+# define TXP_WIDTH_SHIFT		0
+# define TXP_WIDTH_MASK			GENMASK(15, 0)
+
+#define TXP_DST_CTRL		0x0c
+/* These bits are set to 0x54 */
+#define TXP_PILOT_SHIFT			24
+#define TXP_PILOT_MASK			GENMASK(31, 24)
+/* Bits 22-23 are set to 0x01 */
+#define TXP_VERSION_SHIFT		22
+#define TXP_VERSION_MASK		GENMASK(23, 22)
+
+/* Powers down the internal memory. */
+# define TXP_POWERDOWN			BIT(21)
+
+/* Enables storing the alpha component in 8888/4444, instead of
+ * filling with ~ALPHA_INVERT.
+ */
+# define TXP_ALPHA_ENABLE		BIT(20)
+
+/* 4 bits, each enables stores for a channel in each set of 4 bytes.
+ * Set to 0xf for normal operation.
+ */
+# define TXP_BYTE_ENABLE_SHIFT		16
+# define TXP_BYTE_ENABLE_MASK		GENMASK(19, 16)
+
+/* Debug: Generate VSTART again at EOF. */
+# define TXP_VSTART_AT_EOF		BIT(15)
+
+/* Debug: Terminate the current frame immediately.  Stops AXI
+ * writes.
+ */
+# define TXP_ABORT			BIT(14)
+
+# define TXP_DITHER			BIT(13)
+
+/* Inverts alpha if TXP_ALPHA_ENABLE, chooses fill value for
+ * !TXP_ALPHA_ENABLE.
+ */
+# define TXP_ALPHA_INVERT		BIT(12)
+
+/* Note: I've listed the channels here in high bit (in byte 3/2/1) to
+ * low bit (in byte 0) order.
+ */
+# define TXP_FORMAT_SHIFT		8
+# define TXP_FORMAT_MASK		GENMASK(11, 8)
+# define TXP_FORMAT_ABGR4444		0
+# define TXP_FORMAT_ARGB4444		1
+# define TXP_FORMAT_BGRA4444		2
+# define TXP_FORMAT_RGBA4444		3
+# define TXP_FORMAT_BGR565		6
+# define TXP_FORMAT_RGB565		7
+/* 888s are non-rotated, raster-only */
+# define TXP_FORMAT_BGR888		8
+# define TXP_FORMAT_RGB888		9
+# define TXP_FORMAT_ABGR8888		12
+# define TXP_FORMAT_ARGB8888		13
+# define TXP_FORMAT_BGRA8888		14
+# define TXP_FORMAT_RGBA8888		15
+
+/* If TFORMAT is set, generates LT instead of T format. */
+# define TXP_LINEAR_UTILE		BIT(7)
+
+/* Rotate output by 90 degrees. */
+# define TXP_TRANSPOSE			BIT(6)
+
+/* Generate a tiled format for V3D. */
+# define TXP_TFORMAT			BIT(5)
+
+/* Generates some undefined test mode output. */
+# define TXP_TEST_MODE			BIT(4)
+
+/* Request odd field from HVS. */
+# define TXP_FIELD			BIT(3)
+
+/* Raise interrupt when idle. */
+# define TXP_EI				BIT(2)
+
+/* Set when generating a frame, clears when idle. */
+# define TXP_BUSY			BIT(1)
+
+/* Starts a frame.  Self-clearing. */
+# define TXP_GO				BIT(0)
+
+/* Number of lines received and committed to memory. */
+#define TXP_PROGRESS		0x10
+
+#define TXP_READ(offset) readl(txp->regs + (offset))
+#define TXP_WRITE(offset, val) writel(val, txp->regs + (offset))
+
+struct vc4_txp {
+	struct platform_device *pdev;
+
+	struct drm_writeback_connector connector;
+
+	void __iomem *regs;
+};
+
+static inline struct vc4_txp *connector_to_vc4_txp(struct drm_connector *conn)
+{
+	return container_of(conn, struct vc4_txp, connector.base);
+}
+
+#define TXP_REG(reg) { reg, #reg }
+static const struct {
+	u32 reg;
+	const char *name;
+} txp_regs[] = {
+	TXP_REG(TXP_DST_PTR),
+	TXP_REG(TXP_DST_PITCH),
+	TXP_REG(TXP_DIM),
+	TXP_REG(TXP_DST_CTRL),
+	TXP_REG(TXP_PROGRESS),
+};
+
+#ifdef CONFIG_DEBUG_FS
+int vc4_txp_debugfs_regs(struct seq_file *m, void *unused)
+{
+	struct drm_info_node *node = (struct drm_info_node *)m->private;
+	struct drm_device *dev = node->minor->dev;
+	struct vc4_dev *vc4 = to_vc4_dev(dev);
+	struct vc4_txp *txp = vc4->txp;
+	int i;
+
+	if (!txp)
+		return 0;
+
+	for (i = 0; i < ARRAY_SIZE(txp_regs); i++) {
+		seq_printf(m, "%s (0x%04x): 0x%08x\n",
+			   txp_regs[i].name, txp_regs[i].reg,
+			   TXP_READ(txp_regs[i].reg));
+	}
+
+	return 0;
+}
+#endif
+
+static int vc4_txp_connector_get_modes(struct drm_connector *connector)
+{
+	struct drm_device *dev = connector->dev;
+
+	return drm_add_modes_noedid(connector, dev->mode_config.max_width,
+				    dev->mode_config.max_height);
+}
+
+static enum drm_mode_status
+vc4_txp_connector_mode_valid(struct drm_connector *connector,
+			     struct drm_display_mode *mode)
+{
+	struct drm_device *dev = connector->dev;
+	struct drm_mode_config *mode_config = &dev->mode_config;
+	int w = mode->hdisplay, h = mode->vdisplay;
+
+	if (w < mode_config->min_width || w > mode_config->max_width)
+		return MODE_BAD_HVALUE;
+
+	if (h < mode_config->min_height || h > mode_config->max_height)
+		return MODE_BAD_VVALUE;
+
+	return MODE_OK;
+}
+
+static const u32 vc4_txp_formats[] = {
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_BGR888,
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_RGBX8888,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_RGBA8888,
+	DRM_FORMAT_BGRA8888,
+};
+
+static int
+vc4_txp_connector_atomic_check(struct drm_connector *connector,
+			       struct drm_connector_state *conn_state)
+{
+	struct drm_crtc_state *crtc_state;
+	struct drm_gem_cma_object *gem;
+	struct drm_framebuffer *fb;
+	int i;
+
+	if (!conn_state->crtc)
+		return 0;
+
+	if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
+		return 0;
+
+	crtc_state = drm_atomic_get_crtc_state(conn_state->state,
+					       conn_state->crtc);
+	fb = conn_state->writeback_job->fb;
+	if (fb->width != crtc_state->mode.hdisplay ||
+	    fb->height != crtc_state->mode.vdisplay) {
+		DRM_DEBUG_KMS("Invalid framebuffer size %ux%u\n",
+			      fb->width, fb->height);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(vc4_txp_formats); i++) {
+		if (fb->format->format == vc4_txp_formats[i])
+			break;
+	}
+
+	if (i == ARRAY_SIZE(vc4_txp_formats))
+		return -EINVAL;
+
+	gem = drm_fb_cma_get_gem_obj(fb, 0);
+
+	/* Pitch must be aligned on 16 bytes. */
+	if (fb->pitches[0] & GENMASK(3, 0))
+		return -EINVAL;
+
+	return 0;
+}
+
+void vc4_txp_atomic_commit(struct drm_device *dev,
+			   struct drm_atomic_state *old_state)
+{
+	struct vc4_dev *vc4 = to_vc4_dev(dev);
+	struct vc4_txp *txp = vc4->txp;
+	struct drm_connector_state *conn_state = txp->connector.base.state;
+	struct drm_display_mode *mode;
+	struct drm_gem_cma_object *gem;
+	struct drm_framebuffer *fb;
+	u32 ctrl = TXP_GO | TXP_EI;
+
+	/* Writeback connector is disabled, nothing to do. */
+	if (!conn_state->crtc)
+		return;
+
+	/* Writeback connector is enabled, but has no FB assigned to it. Fake a
+	 * vblank event to complete ->flip_done.
+	 */
+	if (!conn_state->writeback_job || !conn_state->writeback_job->fb) {
+		vc4_crtc_eof_event(conn_state->crtc);
+		return;
+	}
+
+	fb = conn_state->writeback_job->fb;
+
+	switch (fb->format->format) {
+	case DRM_FORMAT_ARGB8888:
+		ctrl |= TXP_ALPHA_ENABLE;
+	case DRM_FORMAT_XRGB8888:
+		ctrl |= VC4_SET_FIELD(TXP_FORMAT_ARGB8888, TXP_FORMAT) |
+			VC4_SET_FIELD(0xf, TXP_BYTE_ENABLE);
+		break;
+
+	case DRM_FORMAT_ABGR8888:
+		ctrl |= TXP_ALPHA_ENABLE;
+	case DRM_FORMAT_XBGR8888:
+		ctrl |= VC4_SET_FIELD(TXP_FORMAT_ABGR8888, TXP_FORMAT) |
+			VC4_SET_FIELD(0xf, TXP_BYTE_ENABLE);
+		break;
+
+	case DRM_FORMAT_RGBA8888:
+		ctrl |= TXP_ALPHA_ENABLE;
+	case DRM_FORMAT_RGBX8888:
+		ctrl |= VC4_SET_FIELD(TXP_FORMAT_RGBA8888, TXP_FORMAT) |
+			VC4_SET_FIELD(0xf, TXP_BYTE_ENABLE);
+		break;
+
+	case DRM_FORMAT_BGRA8888:
+		ctrl |= TXP_ALPHA_ENABLE;
+	case DRM_FORMAT_BGRX8888:
+		ctrl |= VC4_SET_FIELD(TXP_FORMAT_BGRA8888, TXP_FORMAT) |
+			VC4_SET_FIELD(0xf, TXP_BYTE_ENABLE);
+		break;
+
+	case DRM_FORMAT_BGR888:
+		ctrl |= VC4_SET_FIELD(TXP_FORMAT_BGR888, TXP_FORMAT) |
+			VC4_SET_FIELD(0xf, TXP_BYTE_ENABLE);
+		break;
+
+	case DRM_FORMAT_RGB888:
+		ctrl |= VC4_SET_FIELD(TXP_FORMAT_RGB888, TXP_FORMAT) |
+			VC4_SET_FIELD(0xf, TXP_BYTE_ENABLE);
+		break;
+	default:
+		WARN_ON(1);
+		return;
+	}
+
+	if (!(ctrl & TXP_ALPHA_ENABLE))
+		ctrl |= TXP_ALPHA_INVERT;
+
+	mode = &conn_state->crtc->state->adjusted_mode;
+	gem = drm_fb_cma_get_gem_obj(fb, 0);
+	TXP_WRITE(TXP_DST_PTR, gem->paddr + fb->offsets[0]);
+	TXP_WRITE(TXP_DST_PITCH, fb->pitches[0]);
+	TXP_WRITE(TXP_DIM,
+		  VC4_SET_FIELD(mode->hdisplay, TXP_WIDTH) |
+		  VC4_SET_FIELD(mode->vdisplay, TXP_HEIGHT));
+
+	TXP_WRITE(TXP_DST_CTRL, ctrl);
+
+	drm_writeback_queue_job(&txp->connector, conn_state->writeback_job);
+	conn_state->writeback_job = NULL;
+}
+
+bool vc4_is_txp_encoder(struct drm_device *dev, struct drm_encoder *encoder)
+{
+	struct vc4_dev *vc4 = to_vc4_dev(dev);
+
+	return encoder == &vc4->txp->connector.encoder;
+}
+
+static const struct drm_connector_helper_funcs vc4_txp_connector_helper_funcs = {
+	.get_modes = vc4_txp_connector_get_modes,
+	.mode_valid = vc4_txp_connector_mode_valid,
+	.atomic_check = vc4_txp_connector_atomic_check,
+};
+
+static enum drm_connector_status
+vc4_txp_connector_detect(struct drm_connector *connector, bool force)
+{
+	return connector_status_disconnected;
+}
+
+static void vc4_txp_connector_destroy(struct drm_connector *connector)
+{
+	drm_connector_unregister(connector);
+	drm_connector_cleanup(connector);
+}
+
+static const struct drm_connector_funcs vc4_txp_connector_funcs = {
+	.dpms = drm_atomic_helper_connector_dpms,
+	.detect = vc4_txp_connector_detect,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.set_property = drm_atomic_helper_connector_set_property,
+	.destroy = vc4_txp_connector_destroy,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static const struct drm_encoder_funcs vc4_txp_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
+static irqreturn_t vc4_txp_interrupt(int irq, void *data)
+{
+	struct vc4_txp *txp = data;
+	struct drm_crtc *crtc = txp->connector.base.state->crtc;
+
+	TXP_WRITE(TXP_DST_CTRL, 0);
+	vc4_crtc_eof_event(crtc);
+	drm_writeback_signal_completion(&txp->connector, 0);
+
+	return IRQ_HANDLED;
+}
+
+static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct drm_device *drm = dev_get_drvdata(master);
+	struct vc4_dev *vc4 = to_vc4_dev(drm);
+	struct vc4_txp *txp;
+	int ret, irq;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	txp = devm_kzalloc(dev, sizeof(*txp), GFP_KERNEL);
+	if (!txp)
+		return -ENOMEM;
+
+	txp->pdev = pdev;
+
+	txp->regs = vc4_ioremap_regs(pdev, 0);
+	if (IS_ERR(txp->regs))
+		return PTR_ERR(txp->regs);
+
+	drm_connector_helper_add(&txp->connector.base,
+				 &vc4_txp_connector_helper_funcs);
+	ret = drm_writeback_connector_init(drm, &txp->connector,
+					   &vc4_txp_connector_funcs,
+					   NULL,
+					   vc4_txp_formats,
+					   ARRAY_SIZE(vc4_txp_formats));
+	if (ret)
+		return ret;
+
+	ret = devm_request_irq(dev, irq, vc4_txp_interrupt, 0,
+			       dev_name(dev), txp);
+	if (ret)
+		return ret;
+
+	dev_set_drvdata(dev, txp);
+	vc4->txp = txp;
+
+	return 0;
+}
+
+static void vc4_txp_unbind(struct device *dev, struct device *master,
+			   void *data)
+{
+	struct drm_device *drm = dev_get_drvdata(master);
+	struct vc4_dev *vc4 = to_vc4_dev(drm);
+	struct vc4_txp *txp = dev_get_drvdata(dev);
+
+	vc4_txp_connector_destroy(&txp->connector.base);
+
+	vc4->txp = NULL;
+}
+
+static const struct component_ops vc4_txp_ops = {
+	.bind   = vc4_txp_bind,
+	.unbind = vc4_txp_unbind,
+};
+
+static int vc4_txp_dev_probe(struct platform_device *pdev)
+{
+	return component_add(&pdev->dev, &vc4_txp_ops);
+}
+
+static int vc4_txp_dev_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &vc4_txp_ops);
+	return 0;
+}
+
+static const struct of_device_id vc4_txp_dt_match[] = {
+	{ .compatible = "brcm,bcm2835-txp" },
+	{ /* sentinel */ },
+};
+
+struct platform_driver vc4_txp_driver = {
+	.probe = vc4_txp_dev_probe,
+	.remove = vc4_txp_dev_remove,
+	.driver = {
+		.name = "vc4_txp",
+		.of_match_table = vc4_txp_dt_match,
+	},
+};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
