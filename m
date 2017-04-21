From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v2 6/9] drm/sun4i: tcon: Find matching display
 backend by device node matching
Date: Fri, 21 Apr 2017 16:38:54 +0800
Message-ID: <20170421083857.29636-7-wens@csie.org>
References: <20170421083857.29636-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBJMK47DQKGQE2FXFBKI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170421083857.29636-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

With Allwinner's Display Engine 1.0, each TCON's input is tied to a
specific display backend, and the 2 comprise what is known as a crtc
in DRM KMS land: The layer, framebuffer, and compositing functions are
provided by the backend, while the TCON provides the display timing
signals and vblank interrupts. This 1 to 1 relationship is represented
in the device tree. On some systems there is an intermediate DRC
component.

Pointers to both matching components must be provided when initializing
the crtc. As the backend is always registered before the associated
tcon, we can recursively search upwards through the of_graph to find
the matching backend.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 55 +++++++++++++++++++++++++++++++++++---
 1 file changed, 51 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 52f37ef9a050..4409e7b6c74d 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -472,6 +472,53 @@ struct drm_bridge *sun4i_tcon_find_bridge(struct device_node *node)
 	return of_drm_find_bridge(remote) ?: ERR_PTR(-EPROBE_DEFER);
 }
 
+/*
+ * On SoCs with the old display pipeline design (Display Engine 1.0),
+ * the TCON is always tied to just one backend. Hence we can traverse
+ * the of_graph upwards to find the backend our tcon is connected to,
+ * and take its ID as our own.
+ *
+ * We can either identify backends from their compatible strings, which
+ * means maintaining a large list of them. Or, since the backend is
+ * registered and binded before the TCON, we can just go through the
+ * list of registered backends and compare the device node.
+ */
+static struct sun4i_backend *sun4i_tcon_find_backend(struct sun4i_drv *drv,
+						     struct device_node *node)
+{
+	struct device_node *port, *ep, *remote;
+	struct sun4i_backend *backend;
+
+	port = of_graph_get_port_by_id(node, 0);
+	if (!port)
+		return ERR_PTR(-EINVAL);
+
+	for_each_available_child_of_node(port, ep) {
+		remote = of_graph_get_remote_port_parent(ep);
+		if (!remote)
+			continue;
+
+		/* does this node match any registered backends? */
+		list_for_each_entry(backend, &drv->backend_list, list) {
+			if (remote == backend->node) {
+				of_node_put(remote);
+				of_node_put(port);
+				return backend;
+			}
+		}
+
+		/* keep looking through upstream ports */
+		backend = sun4i_tcon_find_backend(drv, remote);
+		if (!IS_ERR(backend)) {
+			of_node_put(remote);
+			of_node_put(port);
+			return backend;
+		}
+	}
+
+	return ERR_PTR(-EINVAL);
+}
+
 static int sun4i_tcon_bind(struct device *dev, struct device *master,
 			   void *data)
 {
@@ -481,9 +528,11 @@ static int sun4i_tcon_bind(struct device *dev, struct device *master,
 	struct sun4i_tcon *tcon;
 	int ret;
 
-	/* Wait for a backend to be registered */
-	if (list_empty(&drv->backend_list))
+	backend = sun4i_tcon_find_backend(drv, dev->of_node);
+	if (IS_ERR(backend)) {
+		dev_err(dev, "Couldn't find matching backend\n");
 		return -EPROBE_DEFER;
+	}
 
 	tcon = devm_kzalloc(dev, sizeof(*tcon), GFP_KERNEL);
 	if (!tcon)
@@ -533,8 +582,6 @@ static int sun4i_tcon_bind(struct device *dev, struct device *master,
 		goto err_free_dotclock;
 	}
 
-	backend = list_first_entry(&drv->backend_list,
-				   struct sun4i_backend, list);
 	tcon->crtc = sun4i_crtc_init(drm, backend, tcon);
 	if (IS_ERR(tcon->crtc)) {
 		dev_err(dev, "Couldn't create our CRTC\n");
-- 
2.11.0
