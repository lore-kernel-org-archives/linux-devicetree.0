From: Manu Gautam <mgautam@codeaurora.org>
Subject: [PATCH v5 2/7] phy: qcom-qmp: Enable pipe_clk before PHY initialization
Date: Thu,  3 May 2018 02:36:09 +0530
Message-ID: <1525295174-15995-3-git-send-email-mgautam@codeaurora.org>
References: <1525295174-15995-1-git-send-email-mgautam@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1525295174-15995-1-git-send-email-mgautam@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, robh@kernel.org, sboyd@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dianders@chromium.org, evgreen@chromium.org, Vivek Gautam <vivek.gautam@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
List-Id: devicetree@vger.kernel.org

QMP PHY for USB/PCIE requires pipe_clk for locking of
retime buffers at the pipe interface. Driver checks for
PHY_STATUS without enabling pipe_clk due to which
phy_init() fails with initialization timeout.
Though pipe_clk is output from PHY (after PLL is programmed
during initialization sequence) to GCC clock_ctl and then fed
back to PHY but for PHY_STATUS register to reflect successful
initialization pipe_clk from GCC must be present.
Since, clock driver now ignores status_check for pipe_clk on
clk_enable/disable, driver can safely enable/disable pipe_clk
from phy_init/exit.

Signed-off-by: Manu Gautam <mgautam@codeaurora.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 6470c5d..fddb1c9 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -793,19 +793,6 @@ static void qcom_qmp_phy_configure(void __iomem *base,
 	}
 }
 
-static int qcom_qmp_phy_poweron(struct phy *phy)
-{
-	struct qmp_phy *qphy = phy_get_drvdata(phy);
-	struct qcom_qmp *qmp = qphy->qmp;
-	int ret;
-
-	ret = clk_prepare_enable(qphy->pipe_clk);
-	if (ret)
-		dev_err(qmp->dev, "pipe_clk enable failed, err=%d\n", ret);
-
-	return ret;
-}
-
 static int qcom_qmp_phy_com_init(struct qcom_qmp *qmp)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -974,6 +961,12 @@ static int qcom_qmp_phy_init(struct phy *phy)
 		}
 	}
 
+	ret = clk_prepare_enable(qphy->pipe_clk);
+	if (ret) {
+		dev_err(qmp->dev, "pipe_clk enable failed err=%d\n", ret);
+		goto err_clk_enable;
+	}
+
 	/* Tx, Rx, and PCS configurations */
 	qcom_qmp_phy_configure(tx, cfg->regs, cfg->tx_tbl, cfg->tx_tbl_num);
 	/* Configuration for other LANE for USB-DP combo PHY */
@@ -1019,6 +1012,8 @@ static int qcom_qmp_phy_init(struct phy *phy)
 	return ret;
 
 err_pcs_ready:
+	clk_disable_unprepare(qphy->pipe_clk);
+err_clk_enable:
 	if (cfg->has_lane_rst)
 		reset_control_assert(qphy->lane_rst);
 err_lane_rst:
@@ -1283,7 +1278,6 @@ static int phy_pipe_clk_register(struct qcom_qmp *qmp, struct device_node *np)
 static const struct phy_ops qcom_qmp_phy_gen_ops = {
 	.init		= qcom_qmp_phy_init,
 	.exit		= qcom_qmp_phy_exit,
-	.power_on	= qcom_qmp_phy_poweron,
 	.set_mode	= qcom_qmp_phy_set_mode,
 	.owner		= THIS_MODULE,
 };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
