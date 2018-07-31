From: Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH RFC 2/4] drivers: pinctrl: qcom: add wakeup gpio map for sdm845
Date: Tue, 31 Jul 2018 16:44:19 -0600
Message-ID: <20180731224421.29062-3-ilina@codeaurora.org>
References: <20180731224421.29062-1-ilina@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180731224421.29062-1-ilina@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: marc.zyngier@arm.com, sboyd@chromium.org, evgreen@chromium.org, linus.walleij@linaro.org, bjorn.andersson@linaro.org
Cc: rplsssn@codeaurora.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, rnayak@codeaurora.org, devicetree@vger.kernel.org, Lina Iyer <ilina@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add GPIO to PDC pin map for the SDM845 SoC.

Signed-off-by: Lina Iyer <ilina@codeaurora.org>
---
 drivers/pinctrl/qcom/pinctrl-sdm845.c | 76 +++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-sdm845.c b/drivers/pinctrl/qcom/pinctrl-sdm845.c
index 2ab7a8885757..e93660922dc2 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdm845.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdm845.c
@@ -1277,6 +1277,80 @@ static const struct msm_pingroup sdm845_groups[] = {
 	UFS_RESET(ufs_reset, 0x99f000),
 };
 
+static struct msm_pinctrl_pdc_map sdm845_wakeup_gpios[] = {
+	{1, 30},
+	{3, 31},
+	{5, 32},
+	{10, 33},
+	{11, 34},
+	{20, 35},
+	{22, 36},
+	{24, 37},
+	{26, 38},
+	{30, 39},
+	{32, 41},
+	{34, 42},
+	{36, 43},
+	{37, 44},
+	{38, 45},
+	{39, 46},
+	{40, 47},
+	{43, 49},
+	{44, 50},
+	{46, 51},
+	{48, 52},
+	{52, 54},
+	{53, 55},
+	{54, 56},
+	{56, 57},
+	{57, 58},
+	{58, 59},
+	{59, 60},
+	{60, 61},
+	{61, 62},
+	{62, 63},
+	{63, 64},
+	{64, 65},
+	{66, 66},
+	{68, 67},
+	{71, 68},
+	{73, 69},
+	{77, 70},
+	{78, 71},
+	{79, 72},
+	{80, 73},
+	{84, 74},
+	{85, 75},
+	{86, 76},
+	{88, 77},
+	{91, 79},
+	{92, 80},
+	{95, 81},
+	{96, 82},
+	{97, 83},
+	{101, 84},
+	{103, 85},
+	{104, 86},
+	{115, 90},
+	{116, 91},
+	{117, 92},
+	{118, 93},
+	{119, 94},
+	{120, 95},
+	{121, 96},
+	{122, 97},
+	{123, 98},
+	{124, 99},
+	{125, 100},
+	{127, 102},
+	{128, 103},
+	{129, 104},
+	{130, 105},
+	{132, 106},
+	{133, 107},
+	{145, 108},
+};
+
 static const struct msm_pinctrl_soc_data sdm845_pinctrl = {
 	.pins = sdm845_pins,
 	.npins = ARRAY_SIZE(sdm845_pins),
@@ -1285,6 +1359,8 @@ static const struct msm_pinctrl_soc_data sdm845_pinctrl = {
 	.groups = sdm845_groups,
 	.ngroups = ARRAY_SIZE(sdm845_groups),
 	.ngpios = 150,
+	.pdc_map = sdm845_wakeup_gpios,
+	.npdc_pins = ARRAY_SIZE(sdm845_wakeup_gpios),
 };
 
 static int sdm845_pinctrl_probe(struct platform_device *pdev)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
