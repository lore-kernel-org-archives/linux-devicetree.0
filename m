From: Archit Taneja <architt@codeaurora.org>
Subject: [PATCH v2 02/10] drm/msm/mdp4: Clean up some MDP4 clocks
Date: Fri, 10 Jun 2016 16:16:32 +0530
Message-ID: <1465555600-25742-3-git-send-email-architt@codeaurora.org>
References: <1462273081-5814-1-git-send-email-architt@codeaurora.org>
 <1465555600-25742-1-git-send-email-architt@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1465555600-25742-1-git-send-email-architt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: robdclark@gmail.com, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, heiko@sntech.de, p.zabel@pengutronix.de, devicetree@vger.kernel.org, Archit Taneja <architt@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Fix some issues with MDP4 clocks:

- mdp4_dtv_encoder tries to get "src_clk", which is a RCG(TV_SRC) in
  MSM8960 and APQ8064. This isn't something the driver should access or
  configure. Instead of this, configure the "mdp_clk" (MDP_TV_CLK), a
  branch clock in MMCC that has the TV_SRC as its parent. Setting
  rate/enabling the "mdp_clk" will eventually configure "src_clk", which
  is what we want.
- Rename "mdp_clk" to "tv_clk" because that's slightly less confusing.
- Rename "mdp_axi_clk" to "bus_clk" because that's what we do elsewhere
  too.

Signed-off-by: Archit Taneja <architt@codeaurora.org>
---
 drivers/gpu/drm/msm/mdp/mdp4/mdp4_dtv_encoder.c | 31 ++++++++++---------------
 drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c         |  2 +-
 2 files changed, 13 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/mdp/mdp4/mdp4_dtv_encoder.c b/drivers/gpu/drm/msm/mdp/mdp4/mdp4_dtv_encoder.c
index 35ad78a..24258e3 100644
--- a/drivers/gpu/drm/msm/mdp/mdp4/mdp4_dtv_encoder.c
+++ b/drivers/gpu/drm/msm/mdp/mdp4/mdp4_dtv_encoder.c
@@ -23,7 +23,6 @@
 
 struct mdp4_dtv_encoder {
 	struct drm_encoder base;
-	struct clk *src_clk;
 	struct clk *hdmi_clk;
 	struct clk *mdp_clk;
 	unsigned long int pixclock;
@@ -179,7 +178,6 @@ static void mdp4_dtv_encoder_disable(struct drm_encoder *encoder)
 	 */
 	mdp_irq_wait(&mdp4_kms->base, MDP4_IRQ_EXTERNAL_VSYNC);
 
-	clk_disable_unprepare(mdp4_dtv_encoder->src_clk);
 	clk_disable_unprepare(mdp4_dtv_encoder->hdmi_clk);
 	clk_disable_unprepare(mdp4_dtv_encoder->mdp_clk);
 
@@ -208,19 +206,21 @@ static void mdp4_dtv_encoder_enable(struct drm_encoder *encoder)
 
 	bs_set(mdp4_dtv_encoder, 1);
 
-	DBG("setting src_clk=%lu", pc);
+	DBG("setting mdp_clk=%lu", pc);
 
-	ret = clk_set_rate(mdp4_dtv_encoder->src_clk, pc);
+	ret = clk_set_rate(mdp4_dtv_encoder->mdp_clk, pc);
 	if (ret)
-		dev_err(dev->dev, "failed to set src_clk to %lu: %d\n", pc, ret);
-	clk_prepare_enable(mdp4_dtv_encoder->src_clk);
-	ret = clk_prepare_enable(mdp4_dtv_encoder->hdmi_clk);
-	if (ret)
-		dev_err(dev->dev, "failed to enable hdmi_clk: %d\n", ret);
+		dev_err(dev->dev, "failed to set mdp_clk to %lu: %d\n",
+			pc, ret);
+
 	ret = clk_prepare_enable(mdp4_dtv_encoder->mdp_clk);
 	if (ret)
 		dev_err(dev->dev, "failed to enabled mdp_clk: %d\n", ret);
 
+	ret = clk_prepare_enable(mdp4_dtv_encoder->hdmi_clk);
+	if (ret)
+		dev_err(dev->dev, "failed to enable hdmi_clk: %d\n", ret);
+
 	mdp4_write(mdp4_kms, REG_MDP4_DTV_ENABLE, 1);
 
 	mdp4_dtv_encoder->enabled = true;
@@ -235,7 +235,7 @@ static const struct drm_encoder_helper_funcs mdp4_dtv_encoder_helper_funcs = {
 long mdp4_dtv_round_pixclk(struct drm_encoder *encoder, unsigned long rate)
 {
 	struct mdp4_dtv_encoder *mdp4_dtv_encoder = to_mdp4_dtv_encoder(encoder);
-	return clk_round_rate(mdp4_dtv_encoder->src_clk, rate);
+	return clk_round_rate(mdp4_dtv_encoder->mdp_clk, rate);
 }
 
 /* initialize encoder */
@@ -257,13 +257,6 @@ struct drm_encoder *mdp4_dtv_encoder_init(struct drm_device *dev)
 			 DRM_MODE_ENCODER_TMDS, NULL);
 	drm_encoder_helper_add(encoder, &mdp4_dtv_encoder_helper_funcs);
 
-	mdp4_dtv_encoder->src_clk = devm_clk_get(dev->dev, "src_clk");
-	if (IS_ERR(mdp4_dtv_encoder->src_clk)) {
-		dev_err(dev->dev, "failed to get src_clk\n");
-		ret = PTR_ERR(mdp4_dtv_encoder->src_clk);
-		goto fail;
-	}
-
 	mdp4_dtv_encoder->hdmi_clk = devm_clk_get(dev->dev, "hdmi_clk");
 	if (IS_ERR(mdp4_dtv_encoder->hdmi_clk)) {
 		dev_err(dev->dev, "failed to get hdmi_clk\n");
@@ -271,9 +264,9 @@ struct drm_encoder *mdp4_dtv_encoder_init(struct drm_device *dev)
 		goto fail;
 	}
 
-	mdp4_dtv_encoder->mdp_clk = devm_clk_get(dev->dev, "mdp_clk");
+	mdp4_dtv_encoder->mdp_clk = devm_clk_get(dev->dev, "tv_clk");
 	if (IS_ERR(mdp4_dtv_encoder->mdp_clk)) {
-		dev_err(dev->dev, "failed to get mdp_clk\n");
+		dev_err(dev->dev, "failed to get tv_clk\n");
 		ret = PTR_ERR(mdp4_dtv_encoder->mdp_clk);
 		goto fail;
 	}
diff --git a/drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c
index f145d25..388663a 100644
--- a/drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c
@@ -492,7 +492,7 @@ struct msm_kms *mdp4_kms_init(struct drm_device *dev)
 		goto fail;
 	}
 
-	mdp4_kms->axi_clk = devm_clk_get(&pdev->dev, "mdp_axi_clk");
+	mdp4_kms->axi_clk = devm_clk_get(&pdev->dev, "bus_clk");
 	if (IS_ERR(mdp4_kms->axi_clk)) {
 		dev_err(dev->dev, "failed to get axi_clk\n");
 		ret = PTR_ERR(mdp4_kms->axi_clk);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
