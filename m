From: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v2 01/10] drm/msm/mdp5: Don't get source of MDP core clock
Date: Fri, 10 Jun 2016 16:16:31 +0530
Message-ID: <1465555600-25742-2-git-send-email-architt@codeaurora.org>
References: <1462273081-5814-1-git-send-email-architt@codeaurora.org>
 <1465555600-25742-1-git-send-email-architt@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1465555600-25742-1-git-send-email-architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The driver expects DT to provide the parent to MDP core clock. The only
operation done to the parent clock is to set a rate. This can be
achieved by setting the rate on the core clock itsef. Don't try to
get the parent clock anymore.

Signed-off-by: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c | 7 ++-----
 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.h | 1 -
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c
index 1d840ae..b46961e 100644
--- a/drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c
@@ -629,9 +629,6 @@ struct msm_kms *mdp5_kms_init(struct drm_device *dev)
 	ret = get_clk(pdev, &mdp5_kms->ahb_clk, "iface_clk", true);
 	if (ret)
 		goto fail;
-	ret = get_clk(pdev, &mdp5_kms->src_clk, "core_clk_src", true);
-	if (ret)
-		goto fail;
 	ret = get_clk(pdev, &mdp5_kms->core_clk, "core_clk", true);
 	if (ret)
 		goto fail;
@@ -646,7 +643,7 @@ struct msm_kms *mdp5_kms_init(struct drm_device *dev)
 	 * rate first, then figure out hw revision, and then set a
 	 * more optimal rate:
 	 */
-	clk_set_rate(mdp5_kms->src_clk, 200000000);
+	clk_set_rate(mdp5_kms->core_clk, 200000000);
 
 	read_hw_revision(mdp5_kms, &major, &minor);
 
@@ -661,7 +658,7 @@ struct msm_kms *mdp5_kms_init(struct drm_device *dev)
 	mdp5_kms->caps = config->hw->mdp.caps;
 
 	/* TODO: compute core clock rate at runtime */
-	clk_set_rate(mdp5_kms->src_clk, config->hw->max_clk);
+	clk_set_rate(mdp5_kms->core_clk, config->hw->max_clk);
 
 	/*
 	 * Some chipsets have a Shared Memory Pool (SMP), while others
diff --git a/drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.h b/drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.h
index 9a25898..9cf5aa4 100644
--- a/drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.h
+++ b/drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.h
@@ -49,7 +49,6 @@ struct mdp5_kms {
 
 	struct clk *axi_clk;
 	struct clk *ahb_clk;
-	struct clk *src_clk;
 	struct clk *core_clk;
 	struct clk *lut_clk;
 	struct clk *vsync_clk;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
