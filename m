From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v3 2/9] soc: qcom: rpmpd: Add support to set rpmpd state to max
Date: Wed, 27 Mar 2019 18:08:25 +0530
Message-ID: <20190327123832.11566-3-sibis@codeaurora.org>
References: <20190327123832.11566-1-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190327123832.11566-1-sibis@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, andy.gross@linaro.org, rnayak@codeaurora.org
Cc: david.brown@linaro.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org, devicetree@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-Id: devicetree@vger.kernel.org

rpmpd max state varies across SoCs and SoC families, add support
in the driver to make it SoC/SoC family specific

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/soc/qcom/rpmpd.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
index 235d01870dd8..94015ece40e9 100644
--- a/drivers/soc/qcom/rpmpd.c
+++ b/drivers/soc/qcom/rpmpd.c
@@ -25,7 +25,7 @@
 #define KEY_ENABLE		0x6e657773 /* swen */
 #define KEY_FLOOR_CORNER	0x636676   /* vfc */
 
-#define MAX_RPMPD_STATE		6
+#define MAX_8996_RPMPD_STATE	6
 
 #define DEFINE_RPMPD_CORNER_SMPA(_platform, _name, _active, r_id)		\
 	static struct rpmpd _platform##_##_active;			\
@@ -83,12 +83,14 @@ struct rpmpd {
 	const int res_type;
 	const int res_id;
 	struct qcom_smd_rpm *rpm;
+	unsigned int max_state;
 	__le32 key;
 };
 
 struct rpmpd_desc {
 	struct rpmpd **rpmpds;
 	size_t num_pds;
+	unsigned int max_state;
 };
 
 static DEFINE_MUTEX(rpmpd_lock);
@@ -114,6 +116,7 @@ static struct rpmpd *msm8996_rpmpds[] = {
 static const struct rpmpd_desc msm8996_desc = {
 	.rpmpds = msm8996_rpmpds,
 	.num_pds = ARRAY_SIZE(msm8996_rpmpds),
+	.max_state = MAX_8996_RPMPD_STATE,
 };
 
 static const struct of_device_id rpmpd_match_table[] = {
@@ -225,8 +228,8 @@ static int rpmpd_set_performance(struct generic_pm_domain *domain,
 	int ret = 0;
 	struct rpmpd *pd = domain_to_rpmpd(domain);
 
-	if (state > MAX_RPMPD_STATE)
-		state = MAX_RPMPD_STATE;
+	if (state > pd->max_state)
+		state = pd->max_state;
 
 	mutex_lock(&rpmpd_lock);
 
@@ -287,6 +290,7 @@ static int rpmpd_probe(struct platform_device *pdev)
 		}
 
 		rpmpds[i]->rpm = rpm;
+		rpmpds[i]->max_state = desc->max_state;
 		rpmpds[i]->pd.power_off = rpmpd_power_off;
 		rpmpds[i]->pd.power_on = rpmpd_power_on;
 		rpmpds[i]->pd.set_performance_state = rpmpd_set_performance;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
