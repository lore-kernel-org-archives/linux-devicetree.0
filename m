From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 1/9] soc: qcom: rpmpd: fixup rpmpd set performance state
Date: Sun, 24 Mar 2019 23:19:59 +0530
Message-ID: <20190324175007.29040-2-sibis@codeaurora.org>
References: <20190324175007.29040-1-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190324175007.29040-1-sibis@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, andy.gross@linaro.org, rnayak@codeaurora.org
Cc: david.brown@linaro.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org, devicetree@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Fixup rpmpd state to max if the required state is greater than all the
supported states.

Fixes: 075d3db8d10d ("Add support for the .set_performace_state() and
.opp_to_performance_state()")

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/soc/qcom/rpmpd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
index 005326050c23..235d01870dd8 100644
--- a/drivers/soc/qcom/rpmpd.c
+++ b/drivers/soc/qcom/rpmpd.c
@@ -226,7 +226,7 @@ static int rpmpd_set_performance(struct generic_pm_domain *domain,
 	struct rpmpd *pd = domain_to_rpmpd(domain);
 
 	if (state > MAX_RPMPD_STATE)
-		goto out;
+		state = MAX_RPMPD_STATE;
 
 	mutex_lock(&rpmpd_lock);
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
