From: Christian Lamparter <chunkeey@googlemail.com>
Subject: [PATCH v2 3/3] pinctrl: qcom: add support to configure ipq40xx GPIO_PULL bits
Date: Sat,  1 Jul 2017 18:25:07 +0200
Message-ID: <e8b73406f36f47a408196f4bf8f6126ecc9e68aa.1498925339.git.chunkeey@googlemail.com>
References: <73f822f3f969fa2c9ed25097ab8c70826b265491.1498925339.git.chunkeey@googlemail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <73f822f3f969fa2c9ed25097ab8c70826b265491.1498925339.git.chunkeey@googlemail.com>
In-Reply-To: <a30335a8948ddcb0bc2d3db5bb13d9599af86cca.1498925339.git.chunkeey@googlemail.com>
References: <73f822f3f969fa2c9ed25097ab8c70826b265491.1498925339.git.chunkeey@googlemail.com> <a30335a8948ddcb0bc2d3db5bb13d9599af86cca.1498925339.git.chunkeey@googlemail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Cc: Ram Chandra Jangir <rjangir@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Ram Chandra Jangir <rjangir@codeaurora.org>

GPIO_PULL bits configurations in TLMM_GPIO_CFG register
differs for IPQ40xx from rest of the other qcom SoC's.
This change add support to configure the msm_gpio_pull
bits for ipq40xx, It is required to fix the proper
configurations of gpio-pull bits for nand pins mux.

IPQ40xx SoC:
2'b10: Internal pull up enable.
2'b11: Unsupport

For other SoC's:
2'b10: Keeper
2'b11: Pull-Up

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Ram Chandra Jangir <rjangir@codeaurora.org>
Signed-off-by: Christian Lamparter <chunkeey@googlemail.com>
---
 drivers/pinctrl/qcom/pinctrl-ipq4019.c |  1 +
 drivers/pinctrl/qcom/pinctrl-msm.c     | 25 +++++++++++++++++++------
 drivers/pinctrl/qcom/pinctrl-msm.h     |  1 +
 3 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-ipq4019.c b/drivers/pinctrl/qcom/pinctrl-ipq4019.c
index ce60df5b05fb..eb01c1309d3a 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq4019.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq4019.c
@@ -738,6 +738,7 @@ static const struct msm_pinctrl_soc_data ipq4019_pinctrl = {
 	.groups = ipq4019_groups,
 	.ngroups = ARRAY_SIZE(ipq4019_groups),
 	.ngpios = 100,
+	.pull_no_keeper = true,
 };
 
 static int ipq4019_pinctrl_probe(struct platform_device *pdev)
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 273badd92561..e5e27d79f5ef 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -202,10 +202,11 @@ static int msm_config_reg(struct msm_pinctrl *pctrl,
 	return 0;
 }
 
-#define MSM_NO_PULL	0
-#define MSM_PULL_DOWN	1
-#define MSM_KEEPER	2
-#define MSM_PULL_UP	3
+#define MSM_NO_PULL		0
+#define MSM_PULL_DOWN		1
+#define MSM_KEEPER		2
+#define MSM_PULL_UP_NO_KEEPER	2
+#define MSM_PULL_UP		3
 
 static unsigned msm_regval_to_drive(u32 val)
 {
@@ -243,10 +244,16 @@ static int msm_config_group_get(struct pinctrl_dev *pctldev,
 		arg = arg == MSM_PULL_DOWN;
 		break;
 	case PIN_CONFIG_BIAS_BUS_HOLD:
+		if (pctrl->soc->pull_no_keeper)
+			return -ENOTSUPP;
+
 		arg = arg == MSM_KEEPER;
 		break;
 	case PIN_CONFIG_BIAS_PULL_UP:
-		arg = arg == MSM_PULL_UP;
+		if (pctrl->soc->pull_no_keeper)
+			arg = arg == MSM_PULL_UP_NO_KEEPER;
+		else
+			arg = arg == MSM_PULL_UP;
 		break;
 	case PIN_CONFIG_DRIVE_STRENGTH:
 		arg = msm_regval_to_drive(arg);
@@ -309,10 +316,16 @@ static int msm_config_group_set(struct pinctrl_dev *pctldev,
 			arg = MSM_PULL_DOWN;
 			break;
 		case PIN_CONFIG_BIAS_BUS_HOLD:
+			if (pctrl->soc->pull_no_keeper)
+				return -ENOTSUPP;
+
 			arg = MSM_KEEPER;
 			break;
 		case PIN_CONFIG_BIAS_PULL_UP:
-			arg = MSM_PULL_UP;
+			if (pctrl->soc->pull_no_keeper)
+				arg = MSM_PULL_UP_NO_KEEPER;
+			else
+				arg = MSM_PULL_UP;
 			break;
 		case PIN_CONFIG_DRIVE_STRENGTH:
 			/* Check for invalid values */
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
index 54fdd04ce9d5..71e97db5ba18 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.h
+++ b/drivers/pinctrl/qcom/pinctrl-msm.h
@@ -115,6 +115,7 @@ struct msm_pinctrl_soc_data {
 	const struct msm_pingroup *groups;
 	unsigned ngroups;
 	unsigned ngpios;
+	bool pull_no_keeper;
 };
 
 int msm_pinctrl_probe(struct platform_device *pdev,
-- 
2.13.2

