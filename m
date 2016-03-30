From: Guodong Xu <guodong.xu@linaro.org>
Subject: [PATCH v3 2/2] mmc: dw_mmc: add resets support to dw_mmc
Date: Wed, 30 Mar 2016 15:24:56 +0800
Message-ID: <1459322696-29919-3-git-send-email-guodong.xu@linaro.org>
References: <1459322696-29919-1-git-send-email-guodong.xu@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459322696-29919-1-git-send-email-guodong.xu@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawn.lin@rock-chips.com, jh80.chung@samsung.com, --to=robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, ulf.hansson@linaro.org, guodong.xu@linaro.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Xinwei Kong <kong.kongxinwei@hisilicon.com>, Zhangfei Gao <zhangfei.gao@linaro.org>
List-Id: devicetree@vger.kernel.org

mmc registers may in abnormal state if mmc is used in bootloader,
eg. to support booting from eMMC. So we need reset mmc registers
when kernel boots up, instead of assuming mmc is in clean state.

With this patch, user can add a 'resets' property into dw_mmc dts
node. When driver parse_dt and probe, it calls reset API to
deassert the 'reset' of dw_mmc host controller. When probe error or
remove, it calls reset API to assert it.

Please also refer to Documentation/devicetree/bindings/reset/reset.txt

Signed-off-by: Guodong Xu <guodong.xu@linaro.org>
Signed-off-by: Xinwei Kong <kong.kongxinwei@hisilicon.com>
Signed-off-by: Zhangfei Gao <zhangfei.gao@linaro.org>
---
 drivers/mmc/host/dw_mmc.c  | 20 +++++++++++++++++++-
 include/linux/mmc/dw_mmc.h |  6 ++++--
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
index 242f9a0..d0a4535 100644
--- a/drivers/mmc/host/dw_mmc.c
+++ b/drivers/mmc/host/dw_mmc.c
@@ -2878,6 +2878,13 @@ static struct dw_mci_board *dw_mci_parse_dt(struct dw_mci *host)
 	if (!pdata)
 		return ERR_PTR(-ENOMEM);
 
+	/* find reset controller when exist */
+	pdata->rstc = devm_reset_control_get_optional(dev, NULL);
+	if (IS_ERR(pdata->rstc)) {
+		if (PTR_ERR(pdata->rstc) == -EPROBE_DEFER)
+			return ERR_PTR(-EPROBE_DEFER);
+	}
+
 	/* find out number of slots supported */
 	of_property_read_u32(np, "num-slots", &pdata->num_slots);
 
@@ -2949,7 +2956,9 @@ int dw_mci_probe(struct dw_mci *host)
 
 	if (!host->pdata) {
 		host->pdata = dw_mci_parse_dt(host);
-		if (IS_ERR(host->pdata)) {
+		if (PTR_ERR(host->pdata) == -EPROBE_DEFER) {
+			return -EPROBE_DEFER;
+		} else if (IS_ERR(host->pdata)) {
 			dev_err(host->dev, "platform data not available\n");
 			return -EINVAL;
 		}
@@ -3012,6 +3021,9 @@ int dw_mci_probe(struct dw_mci *host)
 		}
 	}
 
+	if (!IS_ERR(host->pdata->rstc))
+		reset_control_deassert(host->pdata->rstc);
+
 	setup_timer(&host->cmd11_timer,
 		    dw_mci_cmd11_timer, (unsigned long)host);
 
@@ -3164,6 +3176,9 @@ err_dmaunmap:
 	if (host->use_dma && host->dma_ops->exit)
 		host->dma_ops->exit(host);
 
+	if (!IS_ERR(host->pdata->rstc))
+		reset_control_assert(host->pdata->rstc);
+
 err_clk_ciu:
 	if (!IS_ERR(host->ciu_clk))
 		clk_disable_unprepare(host->ciu_clk);
@@ -3196,6 +3211,9 @@ void dw_mci_remove(struct dw_mci *host)
 	if (host->use_dma && host->dma_ops->exit)
 		host->dma_ops->exit(host);
 
+	if (!IS_ERR(host->pdata->rstc))
+		reset_control_assert(host->pdata->rstc);
+
 	if (!IS_ERR(host->ciu_clk))
 		clk_disable_unprepare(host->ciu_clk);
 
diff --git a/include/linux/mmc/dw_mmc.h b/include/linux/mmc/dw_mmc.h
index 7b41c6d..b95cd84 100644
--- a/include/linux/mmc/dw_mmc.h
+++ b/include/linux/mmc/dw_mmc.h
@@ -14,9 +14,10 @@
 #ifndef LINUX_MMC_DW_MMC_H
 #define LINUX_MMC_DW_MMC_H
 
-#include <linux/scatterlist.h>
-#include <linux/mmc/core.h>
 #include <linux/dmaengine.h>
+#include <linux/mmc/core.h>
+#include <linux/reset.h>
+#include <linux/scatterlist.h>
 
 #define MAX_MCI_SLOTS	2
 
@@ -260,6 +261,7 @@ struct dw_mci_board {
 	/* delay in mS before detecting cards after interrupt */
 	u32 detect_delay_ms;
 
+	struct reset_control *rstc;
 	struct dw_mci_dma_ops *dma_ops;
 	struct dma_pdata *data;
 };
-- 
1.9.1
