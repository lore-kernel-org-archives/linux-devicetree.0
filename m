From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH RFC 2/4] OPP: Add and export helper to set bandwidth
Date: Thu, 27 Jun 2019 19:04:22 +0530
Message-ID: <20190627133424.4980-3-sibis@codeaurora.org>
References: <20190627133424.4980-1-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190627133424.4980-1-sibis@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: viresh.kumar@linaro.org, nm@ti.com, sboyd@kernel.org, georgi.djakov@linaro.org
Cc: agross@kernel.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, rjw@rjwysocki.net, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, saravanak@google.com, Sibi Sankar <sibis@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add and export 'dev_pm_opp_set_bw' to set the bandwidth
levels associated with an OPP for a given frequency.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/opp/core.c     | 46 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/pm_opp.h |  6 ++++++
 2 files changed, 52 insertions(+)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index c85c04dc2c7de..78f42960860d1 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -746,6 +746,52 @@ static int _set_required_opps(struct device *dev,
 	return ret;
 }
 
+/**
+ * dev_pm_opp_set_bw() - Configures OPP bandwidth levels
+ * @dev:	device for which we do this operation
+ * @freq:	bandwidth values to set with matching 'freq'
+ *
+ * This configures the bandwidth to the levels specified
+ * by the OPP corresponding to the given frequency.
+ *
+ * Return: 0 on success or a negative error value.
+ */
+int dev_pm_opp_set_bw(struct device *dev, unsigned long freq)
+{
+	struct opp_table *opp_table;
+	struct dev_pm_opp *opp;
+	int ret = 0;
+	int i;
+
+	opp = dev_pm_opp_find_freq_exact(dev, freq, true);
+	if (IS_ERR(opp))
+		return PTR_ERR(opp);
+
+	opp_table = _find_opp_table(dev);
+	if (IS_ERR(opp_table)) {
+		dev_err(dev, "%s: device opp table doesn't exist\n", __func__);
+		ret = PTR_ERR(opp_table);
+		goto put_opp;
+	}
+
+	if (IS_ERR_OR_NULL(opp_table->paths)) {
+		ret = -ENODEV;
+		goto put_opp_table;
+	}
+
+	for (i = 0; i < opp_table->path_count; i++) {
+		ret = icc_set_bw(opp_table->paths[i], opp->bandwidth[i].avg,
+				 opp->bandwidth[i].peak);
+	}
+
+put_opp_table:
+	dev_pm_opp_put_opp_table(opp_table);
+put_opp:
+	dev_pm_opp_put(opp);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(dev_pm_opp_set_bw);
+
 /**
  * dev_pm_opp_set_rate() - Configure new OPP based on frequency
  * @dev:	 device for which we do this operation
diff --git a/include/linux/pm_opp.h b/include/linux/pm_opp.h
index a17c462974851..1cdc2d0a2b20e 100644
--- a/include/linux/pm_opp.h
+++ b/include/linux/pm_opp.h
@@ -152,6 +152,7 @@ struct opp_table *dev_pm_opp_attach_genpd(struct device *dev, const char **names
 void dev_pm_opp_detach_genpd(struct opp_table *opp_table);
 int dev_pm_opp_xlate_performance_state(struct opp_table *src_table, struct opp_table *dst_table, unsigned int pstate);
 int dev_pm_opp_set_rate(struct device *dev, unsigned long target_freq);
+int dev_pm_opp_set_bw(struct device *dev, unsigned long freq);
 int dev_pm_opp_set_sharing_cpus(struct device *cpu_dev, const struct cpumask *cpumask);
 int dev_pm_opp_get_sharing_cpus(struct device *cpu_dev, struct cpumask *cpumask);
 void dev_pm_opp_remove_table(struct device *dev);
@@ -336,6 +337,11 @@ static inline int dev_pm_opp_set_rate(struct device *dev, unsigned long target_f
 	return -ENOTSUPP;
 }
 
+static inline int dev_pm_opp_set_bw(struct device *dev, unsigned long freq)
+{
+	return -ENOTSUPP;
+}
+
 static inline int dev_pm_opp_set_sharing_cpus(struct device *cpu_dev, const struct cpumask *cpumask)
 {
 	return -ENOTSUPP;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
