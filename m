From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 2/4] pinctrl: qcom: Support dispersed tiles
Date: Mon, 24 Sep 2018 15:17:46 -0700
Message-ID: <20180924221748.21584-3-bjorn.andersson@linaro.org>
References: <20180924221748.21584-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180924221748.21584-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On some new platforms the tiles have been placed too far apart to be
covered in a single ioremap. Turn "regs" into an array of base addresses
and make the pingroup carry the information about which tile the pin
resides in.

For existing platforms we map the first entry regs and the existing
pingroups will all use tile 0, meaning that there's no functional
change.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- None

 drivers/pinctrl/qcom/pinctrl-msm.c | 30 +++++++++++++++++++++---------
 drivers/pinctrl/qcom/pinctrl-msm.h |  4 ++++
 2 files changed, 25 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index ac724a357bd6..6f02bbdb0865 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -37,6 +37,7 @@
 #include "../pinctrl-utils.h"
 
 #define MAX_NR_GPIO 300
+#define MAX_NR_TILES 4
 #define PS_HOLD_OFFSET 0x820
 
 /**
@@ -52,7 +53,7 @@
  * @dual_edge_irqs: Bitmap of irqs that need sw emulated dual edge
  *                  detection.
  * @soc;            Reference to soc_data of platform specific data.
- * @regs:           Base address for the TLMM register map.
+ * @regs:           Base addresses for the TLMM tiles.
  */
 struct msm_pinctrl {
 	struct device *dev;
@@ -70,19 +71,19 @@ struct msm_pinctrl {
 	DECLARE_BITMAP(enabled_irqs, MAX_NR_GPIO);
 
 	const struct msm_pinctrl_soc_data *soc;
-	void __iomem *regs;
+	void __iomem *regs[MAX_NR_TILES];
 };
 
 #define MSM_ACCESSOR(name) \
 static u32 msm_readl_##name(struct msm_pinctrl *pctrl, \
 			    const struct msm_pingroup *g) \
 { \
-	return readl(pctrl->regs + g->name##_reg); \
+	return readl(pctrl->regs[g->tile] + g->name##_reg); \
 } \
 static void msm_writel_##name(u32 val, struct msm_pinctrl *pctrl, \
 			      const struct msm_pingroup *g) \
 { \
-	writel(val, pctrl->regs + g->name##_reg); \
+	writel(val, pctrl->regs[g->tile] + g->name##_reg); \
 }
 
 MSM_ACCESSOR(ctl)
@@ -1022,7 +1023,7 @@ static int msm_ps_hold_restart(struct notifier_block *nb, unsigned long action,
 {
 	struct msm_pinctrl *pctrl = container_of(nb, struct msm_pinctrl, restart_nb);
 
-	writel(0, pctrl->regs + PS_HOLD_OFFSET);
+	writel(0, pctrl->regs[0] + PS_HOLD_OFFSET);
 	mdelay(1000);
 	return NOTIFY_DONE;
 }
@@ -1058,6 +1059,7 @@ int msm_pinctrl_probe(struct platform_device *pdev,
 	struct msm_pinctrl *pctrl;
 	struct resource *res;
 	int ret;
+	int i;
 
 	pctrl = devm_kzalloc(&pdev->dev, sizeof(*pctrl), GFP_KERNEL);
 	if (!pctrl)
@@ -1069,10 +1071,20 @@ int msm_pinctrl_probe(struct platform_device *pdev,
 
 	raw_spin_lock_init(&pctrl->lock);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	pctrl->regs = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(pctrl->regs))
-		return PTR_ERR(pctrl->regs);
+	if (soc_data->tiles) {
+		for (i = 0; i < soc_data->ntiles; i++) {
+			res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
+							   soc_data->tiles[i]);
+			pctrl->regs[i] = devm_ioremap_resource(&pdev->dev, res);
+			if (IS_ERR(pctrl->regs[i]))
+				return PTR_ERR(pctrl->regs[i]);
+		}
+	} else {
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+		pctrl->regs[0] = devm_ioremap_resource(&pdev->dev, res);
+		if (IS_ERR(pctrl->regs[0]))
+			return PTR_ERR(pctrl->regs[0]);
+	}
 
 	msm_pinctrl_setup_pm_reset(pctrl);
 
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
index 9b9feea540ff..0ad4bc55e2e1 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.h
+++ b/drivers/pinctrl/qcom/pinctrl-msm.h
@@ -76,6 +76,8 @@ struct msm_pingroup {
 	u32 intr_status_reg;
 	u32 intr_target_reg;
 
+	unsigned int tile:2;
+
 	unsigned mux_bit:5;
 
 	unsigned pull_bit:5;
@@ -117,6 +119,8 @@ struct msm_pinctrl_soc_data {
 	unsigned ngroups;
 	unsigned ngpios;
 	bool pull_no_keeper;
+	const char **tiles;
+	unsigned int ntiles;
 };
 
 int msm_pinctrl_probe(struct platform_device *pdev,
-- 
2.18.0
