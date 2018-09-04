From: Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH v3 4/5] drivers: pinctrl: qcom: sdm845: support GPIO wakeup from suspend
Date: Tue,  4 Sep 2018 15:18:09 -0600
Message-ID: <20180904211810.5506-5-ilina@codeaurora.org>
References: <20180904211810.5506-1-ilina@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180904211810.5506-1-ilina@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: marc.zyngier@arm.com, bjorn.andersson@linaro.org, sboyd@kernel.org, evgreen@chromium.org, linus.walleij@linaro.org
Cc: rplsssn@codeaurora.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, rnayak@codeaurora.org, devicetree@vger.kernel.org, andy.gross@linaro.org, dianders@chromium.org, Lina Iyer <ilina@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Enable TLMM IRQs to be sensed by PDC when we enter suspend. It is
possible that the TLMM may be powered off and not detect GPIOs that are
configured as wake up interrupts. By hooking into suspend callbacks, we
allow PDC IRQs to take over and wake up the system if wakeup interrupts
are triggered.

Signed-off-by: Lina Iyer <ilina@codeaurora.org>
---
Changes in v3:
	- Move the common suspend ops definition to pinctrl-msm.c
---
 drivers/pinctrl/qcom/pinctrl-msm.c    | 5 +++++
 drivers/pinctrl/qcom/pinctrl-msm.h    | 2 ++
 drivers/pinctrl/qcom/pinctrl-sdm845.c | 1 +
 3 files changed, 8 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 01a455f86fcd..92887c075230 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -1142,6 +1142,11 @@ int __maybe_unused msm_pinctrl_resume_late(struct device *dev)
 	return 0;
 }
 
+const struct dev_pm_ops msm_pinctrl_dev_pm_ops = {
+	SET_LATE_SYSTEM_SLEEP_PM_OPS(msm_pinctrl_suspend_late,
+				     msm_pinctrl_resume_late)
+};
+
 int msm_pinctrl_probe(struct platform_device *pdev,
 		      const struct msm_pinctrl_soc_data *soc_data)
 {
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
index 21b56fb5dae9..9be1baa878a3 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.h
+++ b/drivers/pinctrl/qcom/pinctrl-msm.h
@@ -126,4 +126,6 @@ int msm_pinctrl_remove(struct platform_device *pdev);
 int msm_pinctrl_suspend_late(struct device *dev);
 int msm_pinctrl_resume_late(struct device *dev);
 
+extern const struct dev_pm_ops msm_pinctrl_dev_pm_ops;
+
 #endif
diff --git a/drivers/pinctrl/qcom/pinctrl-sdm845.c b/drivers/pinctrl/qcom/pinctrl-sdm845.c
index 2ab7a8885757..0c82dc403268 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdm845.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdm845.c
@@ -1301,6 +1301,7 @@ static struct platform_driver sdm845_pinctrl_driver = {
 	.driver = {
 		.name = "sdm845-pinctrl",
 		.of_match_table = sdm845_pinctrl_of_match,
+		.pm = &msm_pinctrl_dev_pm_ops,
 	},
 	.probe = sdm845_pinctrl_probe,
 	.remove = msm_pinctrl_remove,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
