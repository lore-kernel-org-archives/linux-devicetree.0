From: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v3 2/3] drm/omap: dss: Add support for reporting memory bandwidth limitation
Date: Thu, 30 Nov 2017 14:12:36 +0200
Message-ID: <20171130121237.30431-3-peter.ujfalusi@ti.com>
References: <20171130121237.30431-1-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171130121237.30431-1-peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: tomi.valkeinen-l0cyMroinI0@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org
Cc: airlied-cv59FeDIM0c@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, jsarha-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

The get_memory_bandwidth_limit() in dispc_ops can be used to query the
memory bandwidth limit of dispc by upper layers.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
---
 drivers/gpu/drm/omapdrm/dss/dispc.c   | 13 +++++++++++++
 drivers/gpu/drm/omapdrm/dss/omapdss.h |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
index 0f4fdb221498..90f9ad89af0d 100644
--- a/drivers/gpu/drm/omapdrm/dss/dispc.c
+++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
@@ -4325,6 +4325,17 @@ static void dispc_free_irq(void *dev_id)
 	dispc.user_data = NULL;
 }
 
+static u32 dispc_get_memory_bandwidth_limit(void)
+{
+	u32 limit = 0;
+
+	/* Optional maximum memory bandwidth */
+	of_property_read_u32(dispc.pdev->dev.of_node, "max-memory-bandwidth",
+			     &limit);
+
+	return limit;
+}
+
 /*
  * Workaround for errata i734 in DSS dispc
  *  - LCD1 Gamma Correction Is Not Working When GFX Pipe Is Disabled
@@ -4497,6 +4508,8 @@ static const struct dispc_ops dispc_ops = {
 	.get_num_ovls = dispc_get_num_ovls,
 	.get_num_mgrs = dispc_get_num_mgrs,
 
+	.get_memory_bandwidth_limit = dispc_get_memory_bandwidth_limit,
+
 	.mgr_enable = dispc_mgr_enable,
 	.mgr_is_enabled = dispc_mgr_is_enabled,
 	.mgr_get_vsync_irq = dispc_mgr_get_vsync_irq,
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 990422b35784..c2166d2d3f29 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -695,6 +695,8 @@ struct dispc_ops {
 	int (*get_num_ovls)(void);
 	int (*get_num_mgrs)(void);
 
+	u32 (*get_memory_bandwidth_limit)(void);
+
 	void (*mgr_enable)(enum omap_channel channel, bool enable);
 	bool (*mgr_is_enabled)(enum omap_channel channel);
 	u32 (*mgr_get_vsync_irq)(enum omap_channel channel);
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
