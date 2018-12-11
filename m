From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v6 08/10] PM / Domains: Add a simple_opp_to_performance_state() helper
Date: Tue, 11 Dec 2018 15:19:36 +0530
Message-ID: <20181211094938.25086-9-rnayak@codeaurora.org>
References: <20181211094938.25086-1-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181211094938.25086-1-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, robh@kernel.org, viresh.kumar@linaro.org, sboyd@kernel.org, ulf.hansson@linaro.org, collinsd@codeaurora.org, mka@chromium.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Now that we have atleast 2 genpd providers, both using a simple
routine to read a performance state value from device tree and
return it, in order to implement the .opp_to_performance_state
callback, add a simple_opp_to_performance_state() helper to do
it, so it can be resued across all such genpd providers which
just need to read the value from DT.

Suggested-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/base/power/domain.c | 17 +++++++++++++++++
 include/linux/pm_domain.h   |  9 +++++++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/base/power/domain.c b/drivers/base/power/domain.c
index 8e554e6a82a2..193872afbe20 100644
--- a/drivers/base/power/domain.c
+++ b/drivers/base/power/domain.c
@@ -2520,6 +2520,23 @@ int of_genpd_parse_idle_states(struct device_node *dn,
 }
 EXPORT_SYMBOL_GPL(of_genpd_parse_idle_states);
 
+unsigned int simple_opp_to_performance_state(struct generic_pm_domain *genpd,
+					     struct dev_pm_opp *opp,
+					     const char *name)
+{
+	struct device_node *np;
+	unsigned int perf_state = 0;
+
+	np = dev_pm_opp_get_of_node(opp);
+	if (of_property_read_u32(np, name, &perf_state))
+		pr_err("%s: missing %s property\n", __func__, name);
+
+	of_node_put(np);
+
+	return perf_state;
+}
+EXPORT_SYMBOL_GPL(simple_opp_to_performance_state);
+
 /**
  * pm_genpd_opp_to_performance_state - Gets performance state of the genpd from its OPP node.
  *
diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index 642036952553..7e5777b081ee 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -260,6 +260,9 @@ int of_genpd_parse_idle_states(struct device_node *dn,
 			       struct genpd_power_state **states, int *n);
 unsigned int pm_genpd_opp_to_performance_state(struct device *genpd_dev,
 					       struct dev_pm_opp *opp);
+unsigned int simple_opp_to_performance_state(struct  generic_pm_domain *genpd,
+					     struct dev_pm_opp *opp,
+					     const char *name);
 
 int genpd_dev_pm_attach(struct device *dev);
 struct device *genpd_dev_pm_attach_by_id(struct device *dev,
@@ -306,6 +309,12 @@ pm_genpd_opp_to_performance_state(struct device *genpd_dev,
 	return 0;
 }
 
+unsigned int simple_opp_to_performance_state(struct generic_pm_domain *genpd,
+					     struct dev_pm_opp *opp,
+					     const char *name)
+{
+	return 0;
+}
 static inline int genpd_dev_pm_attach(struct device *dev)
 {
 	return 0;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
