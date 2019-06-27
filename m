From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH RFC 3/4] cpufreq: qcom: Update the bandwidth levels on frequency change
Date: Thu, 27 Jun 2019 19:04:23 +0530
Message-ID: <20190627133424.4980-4-sibis@codeaurora.org>
References: <20190627133424.4980-1-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190627133424.4980-1-sibis@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: viresh.kumar@linaro.org, nm@ti.com, sboyd@kernel.org, georgi.djakov@linaro.org
Cc: agross@kernel.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, rjw@rjwysocki.net, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, saravanak@google.com, Sibi Sankar <sibis@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add support to parse and update optional OPP tables attached to the
cpu nodes when the OPP bandwidth values are populated to enable
scaling of DDR/L3 bandwidth levels with frequency change.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/cpufreq/qcom-cpufreq-hw.c | 77 ++++++++++++++++++++++++++++++-
 1 file changed, 75 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
index 4b0b50403901b..eacc75fac9b00 100644
--- a/drivers/cpufreq/qcom-cpufreq-hw.c
+++ b/drivers/cpufreq/qcom-cpufreq-hw.c
@@ -6,6 +6,7 @@
 #include <linux/bitfield.h>
 #include <linux/cpufreq.h>
 #include <linux/init.h>
+#include <linux/interconnect.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
@@ -30,13 +31,41 @@
 static unsigned long cpu_hw_rate, xo_rate;
 static struct platform_device *global_pdev;
 
+static int qcom_cpufreq_set_bw(struct cpufreq_policy *policy,
+			       unsigned long freq_khz)
+{
+	struct device *dev;
+
+	dev = get_cpu_device(policy->cpu);
+	if (!dev)
+		return -ENODEV;
+
+	return dev_pm_opp_set_bw(dev, freq_khz * 1000);
+}
+
+static int qcom_cpufreq_update_opp(struct device *cpu_dev,
+				   unsigned long freq_khz,
+				   unsigned long volt)
+{
+	unsigned long freq_hz = freq_khz * 1000;
+
+	if (dev_pm_opp_update_voltage(cpu_dev, freq_hz, volt))
+		return dev_pm_opp_add(cpu_dev, freq_hz, volt);
+
+	/* Enable the opp after voltage update*/
+	return dev_pm_opp_enable(cpu_dev, freq_hz);
+}
+
 static int qcom_cpufreq_hw_target_index(struct cpufreq_policy *policy,
 					unsigned int index)
 {
 	void __iomem *perf_state_reg = policy->driver_data;
+	u32 freq = policy->freq_table[index].frequency;
 
 	writel_relaxed(index, perf_state_reg);
 
+	qcom_cpufreq_set_bw(policy, freq);
+
 	return 0;
 }
 
@@ -79,13 +108,29 @@ static int qcom_cpufreq_hw_read_lut(struct device *cpu_dev,
 {
 	u32 data, src, lval, i, core_count, prev_cc = 0, prev_freq = 0, freq;
 	u32 volt;
+	u64 rate;
 	unsigned int max_cores = cpumask_weight(policy->cpus);
 	struct cpufreq_frequency_table	*table;
+	struct device_node *opp_table_np, *np;
+	int ret;
 
 	table = kcalloc(LUT_MAX_ENTRIES + 1, sizeof(*table), GFP_KERNEL);
 	if (!table)
 		return -ENOMEM;
 
+	ret = dev_pm_opp_of_add_table(cpu_dev);
+	if (!ret) {
+		/* Disable all opps and cross-validate against LUT */
+		opp_table_np = dev_pm_opp_of_get_opp_desc_node(cpu_dev);
+		for_each_available_child_of_node(opp_table_np, np) {
+			ret = of_property_read_u64(np, "opp-hz", &rate);
+			dev_pm_opp_disable(cpu_dev, rate);
+		}
+		of_node_put(opp_table_np);
+	} else {
+		dev_err(cpu_dev, "Couldn't add OPP table from dt\n");
+	}
+
 	for (i = 0; i < LUT_MAX_ENTRIES; i++) {
 		data = readl_relaxed(base + REG_FREQ_LUT +
 				      i * LUT_ROW_SIZE);
@@ -104,7 +149,7 @@ static int qcom_cpufreq_hw_read_lut(struct device *cpu_dev,
 
 		if (freq != prev_freq && core_count == max_cores) {
 			table[i].frequency = freq;
-			dev_pm_opp_add(cpu_dev, freq * 1000, volt);
+			qcom_cpufreq_update_opp(cpu_dev, freq, volt);
 			dev_dbg(cpu_dev, "index=%d freq=%d, core_count %d\n", i,
 				freq, core_count);
 		} else {
@@ -125,7 +170,8 @@ static int qcom_cpufreq_hw_read_lut(struct device *cpu_dev,
 			if (prev_cc != max_cores) {
 				prev->frequency = prev_freq;
 				prev->flags = CPUFREQ_BOOST_FREQ;
-				dev_pm_opp_add(cpu_dev,	prev_freq * 1000, volt);
+				qcom_cpufreq_update_opp(cpu_dev, prev_freq,
+							volt);
 			}
 
 			break;
@@ -168,6 +214,7 @@ static void qcom_get_related_cpus(int index, struct cpumask *m)
 static int qcom_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
 {
 	struct device *dev = &global_pdev->dev;
+	struct opp_table *opp_table = NULL;
 	struct of_phandle_args args;
 	struct device_node *cpu_np;
 	struct device *cpu_dev;
@@ -202,6 +249,8 @@ static int qcom_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
 	if (!base)
 		return -ENOMEM;
 
+	opp_table = dev_pm_opp_set_paths(cpu_dev);
+
 	/* HW should be in enabled state to proceed */
 	if (!(readl_relaxed(base + REG_ENABLE) & 0x1)) {
 		dev_err(dev, "Domain-%d cpufreq hardware not enabled\n", index);
@@ -237,6 +286,8 @@ static int qcom_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
 
 	return 0;
 error:
+	if (opp_table)
+		dev_pm_opp_put_paths(opp_table);
 	devm_iounmap(dev, base);
 	return ret;
 }
@@ -275,6 +326,8 @@ static struct cpufreq_driver cpufreq_qcom_hw_driver = {
 
 static int qcom_cpufreq_hw_driver_probe(struct platform_device *pdev)
 {
+	struct opp_table *opp_table = NULL;
+	struct device *cpu_dev;
 	struct clk *clk;
 	int ret;
 
@@ -294,6 +347,26 @@ static int qcom_cpufreq_hw_driver_probe(struct platform_device *pdev)
 
 	global_pdev = pdev;
 
+	/* Check for optional interconnect paths on CPU0 */
+	cpu_dev = get_cpu_device(0);
+	if (!cpu_dev) {
+		dev_err(&pdev->dev, "failed to get cpu0 device\n");
+		return -ENODEV;
+	}
+
+	opp_table = dev_pm_opp_set_paths(cpu_dev);
+	if (IS_ERR(opp_table)) {
+		ret = PTR_ERR(opp_table);
+		if (ret == -EPROBE_DEFER) {
+			dev_dbg(&pdev->dev, "defer icc set paths: %d\n", ret);
+			return ret;
+		}
+		dev_err(&pdev->dev, "set paths failed ddr/l3 scaling off: %d\n",
+			ret);
+	} else {
+		dev_pm_opp_put_paths(opp_table);
+	}
+
 	ret = cpufreq_register_driver(&cpufreq_qcom_hw_driver);
 	if (ret)
 		dev_err(&pdev->dev, "CPUFreq HW driver failed to register\n");
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
