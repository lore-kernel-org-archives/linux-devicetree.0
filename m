From: Thara Gopinath <thara.gopinath@linaro.org>
Subject: [PATCH v2 2/5] soc: qcom: rpmhpd: Introduce function to retrieve power domain performance state count
Date: Tue, 10 Sep 2019 13:14:33 -0400
Message-ID: <1568135676-9328-3-git-send-email-thara.gopinath@linaro.org>
References: <1568135676-9328-1-git-send-email-thara.gopinath@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1568135676-9328-1-git-send-email-thara.gopinath@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: edubezval@gmail.com, rui.zhang@intel.com, ulf.hansson@linaro.org, daniel.lezcano@linaro.org, bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org
Cc: amit.kucheria@verdurent.com, mark.rutland@arm.com, rjw@rjwysocki.net, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Populate .get_performace_state_count in genpd ops to retrieve the count
of performance states supported by a rpmh power domain.

Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
---
v1->v2:
	- Changes ti incorporate the new format of
	get_performance_state_count.

 drivers/soc/qcom/rpmhpd.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
index 5741ec3..9d37534 100644
--- a/drivers/soc/qcom/rpmhpd.c
+++ b/drivers/soc/qcom/rpmhpd.c
@@ -285,6 +285,13 @@ static unsigned int rpmhpd_get_performance_state(struct generic_pm_domain *genpd
 	return dev_pm_opp_get_level(opp);
 }
 
+static int rpmhpd_performance_states_count(struct generic_pm_domain *domain)
+{
+	struct rpmhpd *pd = domain_to_rpmhpd(domain);
+
+	return pd->level_count;
+}
+
 static int rpmhpd_update_level_mapping(struct rpmhpd *rpmhpd)
 {
 	int i;
@@ -373,6 +380,8 @@ static int rpmhpd_probe(struct platform_device *pdev)
 		rpmhpds[i]->pd.power_on = rpmhpd_power_on;
 		rpmhpds[i]->pd.set_performance_state = rpmhpd_set_performance_state;
 		rpmhpds[i]->pd.opp_to_performance_state = rpmhpd_get_performance_state;
+		rpmhpds[i]->pd.get_performance_state_count =
+					rpmhpd_performance_states_count;
 		pm_genpd_init(&rpmhpds[i]->pd, NULL, true);
 
 		data->domains[i] = &rpmhpds[i]->pd;
-- 
2.1.4
