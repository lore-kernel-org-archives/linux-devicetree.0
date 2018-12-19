From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v5 4/8] drm/msm/dsi: 14nm PHY: Get ref clock from the DT
Date: Wed, 19 Dec 2018 15:55:24 -0800
Message-ID: <20181219235528.114830-5-mka@chromium.org>
References: <20181219235528.114830-1-mka@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181219235528.114830-1-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Clark <robdclark@gmail.com>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Archit Taneja <architt@codeaurora.org>, Sean Paul <seanpaul@chromium.org>, Rajesh Yadav <ryadav@codeaurora.org>, Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>, Jeykumar Sankaran <jsanka@codeaurora.org>, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

Get the ref clock of the PHY from the device tree instead of
hardcoding its name and rate.

Note: This change could break old out-of-tree DTS files that
use the 14nm PHY.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
Changes in v5:
- pass the ref clock name to _register() instead of storing a point
  to the clk object in the PLL data structure

Changes in v4:
- none

Changes in v3:
- fixed check for EPROBE_DEFER
- added note to commit message about breaking old DTS files
- added 'Reviewed-by: Douglas Anderson <dianders@chromium.org>' tag

Changes in v2:
- patch added to the series
---
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_14nm.c | 23 +++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_14nm.c b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_14nm.c
index 71fe60e5f01f1..9a647d93a7e0b 100644
--- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_14nm.c
@@ -40,7 +40,6 @@
 
 #define NUM_PROVIDED_CLKS		2
 
-#define VCO_REF_CLK_RATE		19200000
 #define VCO_MIN_RATE			1300000000UL
 #define VCO_MAX_RATE			2600000000UL
 
@@ -591,7 +590,7 @@ static int dsi_pll_14nm_vco_set_rate(struct clk_hw *hw, unsigned long rate,
 	    parent_rate);
 
 	pll_14nm->vco_current_rate = rate;
-	pll_14nm->vco_ref_clk_rate = VCO_REF_CLK_RATE;
+	pll_14nm->vco_ref_clk_rate = parent_rate;
 
 	dsi_pll_14nm_input_init(pll_14nm);
 
@@ -947,11 +946,12 @@ static struct clk_hw *pll_14nm_postdiv_register(struct dsi_pll_14nm *pll_14nm,
 	return &pll_postdiv->hw;
 }
 
-static int pll_14nm_register(struct dsi_pll_14nm *pll_14nm)
+static int pll_14nm_register(struct dsi_pll_14nm *pll_14nm,
+			     const char *ref_clk_name)
 {
 	char clk_name[32], parent[32], vco_name[32];
 	struct clk_init_data vco_init = {
-		.parent_names = (const char *[]){ "xo" },
+		.parent_names = &ref_clk_name,
 		.num_parents = 1,
 		.name = vco_name,
 		.flags = CLK_IGNORE_UNUSED,
@@ -1050,6 +1050,8 @@ struct msm_dsi_pll *msm_dsi_pll_14nm_init(struct platform_device *pdev, int id)
 {
 	struct dsi_pll_14nm *pll_14nm;
 	struct msm_dsi_pll *pll;
+	struct clk *vco_ref_clk;
+	const char *vco_ref_clk_name;
 	int ret;
 
 	if (!pdev)
@@ -1065,6 +1067,17 @@ struct msm_dsi_pll *msm_dsi_pll_14nm_init(struct platform_device *pdev, int id)
 	pll_14nm->id = id;
 	pll_14nm_list[id] = pll_14nm;
 
+	vco_ref_clk = devm_clk_get(&pdev->dev, "ref");
+	if (IS_ERR(vco_ref_clk)) {
+		ret = PTR_ERR(vco_ref_clk);
+		if (ret != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "couldn't get 'ref' clock: %d\n",
+				ret);
+		return ERR_PTR(ret);
+	}
+
+	vco_ref_clk_name = __clk_get_name(vco_ref_clk);
+
 	pll_14nm->phy_cmn_mmio = msm_ioremap(pdev, "dsi_phy", "DSI_PHY");
 	if (IS_ERR_OR_NULL(pll_14nm->phy_cmn_mmio)) {
 		dev_err(&pdev->dev, "failed to map CMN PHY base\n");
@@ -1094,7 +1107,7 @@ struct msm_dsi_pll *msm_dsi_pll_14nm_init(struct platform_device *pdev, int id)
 	pll->en_seq_cnt = 1;
 	pll->enable_seqs[0] = dsi_pll_14nm_enable_seq;
 
-	ret = pll_14nm_register(pll_14nm);
+	ret = pll_14nm_register(pll_14nm, vco_ref_clk_name);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register PLL: %d\n", ret);
 		return ERR_PTR(ret);
-- 
2.20.1.415.g653613c723-goog
