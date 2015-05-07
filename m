From: Zhangfei Gao <zhangfei.gao@linaro.org>
Subject: [PATCH v2 2/3] mmc: dw_mmc: add switch_voltage
Date: Thu,  7 May 2015 15:56:40 +0800
Message-ID: <1430985401-12202-3-git-send-email-zhangfei.gao@linaro.org>
References: <1430985401-12202-1-git-send-email-zhangfei.gao@linaro.org>
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <1430985401-12202-1-git-send-email-zhangfei.gao@linaro.org>
Sender: linux-mmc-owner@vger.kernel.org
To: Jaehoon Chung <jh80.chung@samsung.com>, ulf.hansson@linaro.org
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, Zhangfei Gao <zhangfei.gao@linaro.org>, "Jorge A. Ramirez-Ortiz" <jorge.ramirez-ortiz@linaro.org>, Dan Yuan <yuandan@hisilicon.com>
List-Id: devicetree@vger.kernel.org

switch_voltage is required on some platform since special register accessing

Signed-off-by: Jorge A. Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Signed-off-by: Dan Yuan <yuandan@hisilicon.com>
Signed-off-by: Zhangfei Gao <zhangfei.gao@linaro.org>
---
 drivers/mmc/host/dw_mmc.c | 4 ++++
 drivers/mmc/host/dw_mmc.h | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
index 5f5adaf..ce66565 100644
--- a/drivers/mmc/host/dw_mmc.c
+++ b/drivers/mmc/host/dw_mmc.c
@@ -1236,11 +1236,15 @@ static int dw_mci_switch_voltage(struct mmc_host *mmc, struct mmc_ios *ios)
 {
 	struct dw_mci_slot *slot = mmc_priv(mmc);
 	struct dw_mci *host = slot->host;
+	const struct dw_mci_drv_data *drv_data = host->drv_data;
 	u32 uhs;
 	u32 v18 = SDMMC_UHS_18V << slot->id;
 	int min_uv, max_uv;
 	int ret;
 
+	if (drv_data && drv_data->switch_voltage)
+		return drv_data->switch_voltage(mmc, ios);
+
 	/*
 	 * Program the voltage.  Note that some instances of dw_mmc may use
 	 * the UHS_REG for this.  For other instances (like exynos) the UHS_REG
diff --git a/drivers/mmc/host/dw_mmc.h b/drivers/mmc/host/dw_mmc.h
index f45ab91..c723617 100644
--- a/drivers/mmc/host/dw_mmc.h
+++ b/drivers/mmc/host/dw_mmc.h
@@ -287,5 +287,7 @@ struct dw_mci_drv_data {
 	int		(*execute_tuning)(struct dw_mci_slot *slot);
 	int		(*prepare_hs400_tuning)(struct dw_mci *host,
 						struct mmc_ios *ios);
+	int		(*switch_voltage)(struct mmc_host *mmc,
+					  struct mmc_ios *ios);
 };
 #endif /* _DW_MMC_H_ */
-- 
1.9.1

