From: Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH RESEND v1 3/5] drivers: pinctrl: qcom: sdm845: support GPIO wakeup from suspend
Date: Fri, 17 Aug 2018 13:10:24 -0600
Message-ID: <20180817191026.32245-4-ilina@codeaurora.org>
References: <20180817191026.32245-1-ilina@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180817191026.32245-1-ilina@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: marc.zyngier@arm.com, bjorn.andersson@linaro.org, sboyd@kernel.org, evgreen@chromium.org, linus.walleij@linaro.org
Cc: rplsssn@codeaurora.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, rnayak@codeaurora.org, devicetree@vger.kernel.org, andy.gross@linaro.org, dianders@chromium.org, Lina Iyer <ilina@codeaurora.org>
List-Id: devicetree@vger.kernel.org

---
 drivers/pinctrl/qcom/pinctrl-sdm845.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-sdm845.c b/drivers/pinctrl/qcom/pinctrl-sdm845.c
index 2ab7a8885757..cc333b8afb99 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdm845.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdm845.c
@@ -1297,10 +1297,16 @@ static const struct of_device_id sdm845_pinctrl_of_match[] = {
 	{ },
 };
 
+static const struct dev_pm_ops msm_pinctrl_dev_pm_ops = {
+	SET_LATE_SYSTEM_SLEEP_PM_OPS(msm_pinctrl_suspend_late,
+				     msm_pinctrl_resume_late)
+};
+
 static struct platform_driver sdm845_pinctrl_driver = {
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
