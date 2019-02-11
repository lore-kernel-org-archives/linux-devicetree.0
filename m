From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH v3 5/7] drm/sun4i: Rely on dma interconnect for our RAM offset
Date: Mon, 11 Feb 2019 16:02:53 +0100
Message-ID: <dfbdedf89c6a36f6fe5564e7c518664fa9e828c0.1549897336.git-series.maxime.ripard@bootlin.com>
References: <cover.f2e5fbb4d21384168973fa32377a33d627768146.1549897336.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.f2e5fbb4d21384168973fa32377a33d627768146.1549897336.git-series.maxime.ripard@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>
Cc: devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, Georgi Djakov <georgi.djakov@linaro.org>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Yong Deng <yong.deng@magewell.com>, Robin Murphy <robin.murphy@arm.com>, Dave Martin <dave.martin@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Now that we can express our DMA topology, rely on those property instead of
hardcoding an offset from the dma_addr_t which wasn't really great.

We still need to add some code to deal with the old DT that would lack that
property, but we move the offset to the DRM device dma_pfn_offset to be
able to rely on just the dma_addr_t associated to the GEM object.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 drivers/gpu/drm/sun4i/sun4i_backend.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4i/sun4i_backend.c
index 9e9255ee59cd..1846a1b30fea 100644
--- a/drivers/gpu/drm/sun4i/sun4i_backend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
@@ -383,13 +383,6 @@ int sun4i_backend_update_layer_buffer(struct sun4i_backend *backend,
 	paddr = drm_fb_cma_get_gem_addr(fb, state, 0);
 	DRM_DEBUG_DRIVER("Setting buffer address to %pad\n", &paddr);
 
-	/*
-	 * backend DMA accesses DRAM directly, bypassing the system
-	 * bus. As such, the address range is different and the buffer
-	 * address needs to be corrected.
-	 */
-	paddr -= PHYS_OFFSET;
-
 	if (fb->format->is_yuv)
 		return sun4i_backend_update_yuv_buffer(backend, fb, paddr);
 
@@ -835,6 +828,27 @@ static int sun4i_backend_bind(struct device *dev, struct device *master,
 	dev_set_drvdata(dev, backend);
 	spin_lock_init(&backend->frontend_lock);
 
+	if (of_find_property(dev->of_node, "interconnects", NULL)) {
+		/*
+		 * This assume we have the same DMA constraints for all our the
+		 * devices in our pipeline (all the backends, but also the
+		 * frontends). This sounds bad, but it has always been the case
+		 * for us, and DRM doesn't do per-device allocation either, so
+		 * we would need to fix DRM first...
+		 */
+		ret = of_dma_configure(drm->dev, dev->of_node, true);
+		if (ret)
+			return ret;
+	} else {
+		/*
+		 * If we don't have the interconnect property, most likely
+		 * because of an old DT, we need to set the DMA offset by hand
+		 * on our device since the RAM mapping is at 0 for the DMA bus,
+		 * unlike the CPU.
+		 */
+		drm->dev->dma_pfn_offset = PHYS_PFN_OFFSET;
+	}
+
 	backend->engine.node = dev->of_node;
 	backend->engine.ops = &sun4i_backend_engine_ops;
 	backend->engine.id = sun4i_backend_of_get_id(dev->of_node);
-- 
git-series 0.9.1
