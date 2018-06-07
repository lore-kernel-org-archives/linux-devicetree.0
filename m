Return-Path: <SRS0=13PW=IZ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:53967 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753153AbeFGJv2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 Jun 2018 05:51:28 -0400
From: Bastian Stender <bst@pengutronix.de>
Subject: [PATCH v2 1/2] cpufreq: imx6q/thermal: imx: register cooling device depending on OF
Date: Thu,  7 Jun 2018 11:51:04 +0200
Message-Id: <20180607095105.5185-1-bst@pengutronix.de>
Sender: devicetree-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Leonard Crestez <leonard.crestez@nxp.com>
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org, linux-imx@nxp.com, Anson Huang <anson.huang@nxp.com>, kernel@pengutronix.de, Bastian Stender <bst@pengutronix.de>
List-ID: <devicetree@vger.kernel.org>

The cooling device should be part of the i.MX cpufreq driver, but it
cannot be removed for the sake of DT stability. So turn the cooling
device registration into a separate function and perform the
registration only if the CPU OF node does not have the #cooling-cells
property.

Use of_cpufreq_power_cooling_register in imx_thermal code to link the
cooling device to the device tree node provided.

This makes it possible to bind the cpufreq cooling device to a custom
thermal zone via a cooling-maps entry like:

	cooling-maps {
		map0 {
			trip = <&board_alert>;
			cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
		};
	};

Assuming a cpu node exists with label "cpu0" and #cooling-cells
property.

Signed-off-by: Bastian Stender <bst@pengutronix.de>
---
Changes since implicit v1 ("cpufreq: imx6q/thermal: imx: move CPU cooling device from thermal to cpufreq",
id:20171115092332.9320-1-bst@pengutronix.de):

- create cooling device in imx_thermal in case no #cooling-cells
  property is available instead of removing it (DT stability)
- fix indentation
---
 drivers/cpufreq/imx6q-cpufreq.c | 38 +++++++++++++++++++++++++++++++++
 drivers/thermal/imx_thermal.c   | 29 +++++++++++++++++++++----
 2 files changed, 63 insertions(+), 4 deletions(-)

diff --git a/drivers/cpufreq/imx6q-cpufreq.c b/drivers/cpufreq/imx6q-cpufreq.c
index 83cf631fc9bc..47995beed3ac 100644
--- a/drivers/cpufreq/imx6q-cpufreq.c
+++ b/drivers/cpufreq/imx6q-cpufreq.c
@@ -9,6 +9,7 @@
 #include <linux/clk.h>
 #include <linux/cpu.h>
 #include <linux/cpufreq.h>
+#include <linux/cpu_cooling.h>
 #include <linux/err.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -50,6 +51,7 @@ static struct clk_bulk_data clks[] = {
 };
 
 static struct device *cpu_dev;
+static struct thermal_cooling_device *cdev;
 static bool free_opp;
 static struct cpufreq_frequency_table *freq_table;
 static unsigned int max_freq;
@@ -191,6 +193,33 @@ static int imx6q_set_target(struct cpufreq_policy *policy, unsigned int index)
 	return 0;
 }
 
+static void imx6q_cpufreq_ready(struct cpufreq_policy *policy)
+{
+	struct device_node *np = of_node_get(cpu_dev->of_node);
+	u32 capacitance = 0;
+
+	if (WARN_ON(!np))
+		return;
+
+	if (of_find_property(np, "#cooling-cells", NULL)) {
+		of_property_read_u32(np, "dynamic-power-coefficient",
+				     &capacitance);
+
+		cdev = of_cpufreq_power_cooling_register(np, policy,
+							 capacitance, NULL);
+
+		if (IS_ERR(cdev)) {
+			dev_err(cpu_dev,
+				"running cpufreq without cooling device: %ld\n",
+				PTR_ERR(cdev));
+
+			cdev = NULL;
+		}
+	}
+
+	of_node_put(np);
+}
+
 static int imx6q_cpufreq_init(struct cpufreq_policy *policy)
 {
 	int ret;
@@ -202,13 +231,22 @@ static int imx6q_cpufreq_init(struct cpufreq_policy *policy)
 	return ret;
 }
 
+static int imx6q_cpufreq_exit(struct cpufreq_policy *policy)
+{
+	cpufreq_cooling_unregister(cdev);
+
+	return 0;
+}
+
 static struct cpufreq_driver imx6q_cpufreq_driver = {
 	.flags = CPUFREQ_NEED_INITIAL_FREQ_CHECK,
 	.verify = cpufreq_generic_frequency_table_verify,
 	.target_index = imx6q_set_target,
 	.get = cpufreq_generic_get,
 	.init = imx6q_cpufreq_init,
+	.exit = imx6q_cpufreq_exit,
 	.name = "imx6q-cpufreq",
+	.ready = imx6q_cpufreq_ready,
 	.attr = cpufreq_generic_attr,
 	.suspend = cpufreq_generic_suspend,
 };
diff --git a/drivers/thermal/imx_thermal.c b/drivers/thermal/imx_thermal.c
index 334d98be03b9..d701298f3fd1 100644
--- a/drivers/thermal/imx_thermal.c
+++ b/drivers/thermal/imx_thermal.c
@@ -3,6 +3,7 @@
 // Copyright 2013 Freescale Semiconductor, Inc.
 
 #include <linux/clk.h>
+#include <linux/cpu.h>
 #include <linux/cpufreq.h>
 #include <linux/cpu_cooling.h>
 #include <linux/delay.h>
@@ -644,6 +645,28 @@ static const struct of_device_id of_imx_thermal_match[] = {
 };
 MODULE_DEVICE_TABLE(of, of_imx_thermal_match);
 
+/*
+ * Create cooling device in case no #cooling-cells property is available in
+ * CPU node
+ */
+static int imx_thermal_register_legacy_cooling(struct imx_thermal_data *data)
+{
+	struct device *cpu_dev = get_cpu_device(0);
+	struct device_node *np = of_node_get(cpu_dev->of_node);
+	int ret;
+
+	if (!np || !of_find_property(np, "#cooling-cells", NULL)) {
+		data->cdev = cpufreq_cooling_register(data->policy);
+		if (IS_ERR(data->cdev)) {
+			ret = PTR_ERR(data->cdev);
+			cpufreq_cpu_put(data->policy);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 static int imx_thermal_probe(struct platform_device *pdev)
 {
 	struct imx_thermal_data *data;
@@ -724,12 +747,10 @@ static int imx_thermal_probe(struct platform_device *pdev)
 		return -EPROBE_DEFER;
 	}
 
-	data->cdev = cpufreq_cooling_register(data->policy);
-	if (IS_ERR(data->cdev)) {
-		ret = PTR_ERR(data->cdev);
+	ret = imx_thermal_register_legacy_cooling(data);
+	if (ret) {
 		dev_err(&pdev->dev,
 			"failed to register cpufreq cooling device: %d\n", ret);
-		cpufreq_cpu_put(data->policy);
 		return ret;
 	}
 
-- 
2.17.1

