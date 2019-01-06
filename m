From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 3/7] soc: qcom: Add AOSS QMP genpd provider
Date: Sun,  6 Jan 2019 00:09:11 -0800
Message-ID: <20190106080915.4493-4-bjorn.andersson@linaro.org>
References: <20190106080915.4493-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190106080915.4493-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Russell King <linux@armlinux.org.uk>, Ulf Hansson <ulf.hansson@linaro.org>, Arun Kumar Neelakantam <aneela@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The AOSS QMP genpd provider implements control over power-related
resources related to low-power state associated with the remoteprocs in
the system as well as control over a set of clocks related to debug
hardware in the SoC.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Drop compatible, as the QMP DT node is flattened
- Correct size of send

 drivers/soc/qcom/Kconfig       |   9 +++
 drivers/soc/qcom/Makefile      |   1 +
 drivers/soc/qcom/aoss-qmp-pd.c | 135 +++++++++++++++++++++++++++++++++
 3 files changed, 145 insertions(+)
 create mode 100644 drivers/soc/qcom/aoss-qmp-pd.c

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index dda19471057f..d81256ef5055 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -12,6 +12,15 @@ config QCOM_AOSS_QMP
 	  micro-controller in the AOSS, using QMP, to control certain resource
 	  that are not exposed through RPMh.
 
+config QCOM_AOSS_QMP_PD
+	tristate "Qualcomm AOSS Messaging Power Domain driver"
+	depends on QCOM_AOSS_QMP
+	select PM_GENERIC_DOMAINS
+	help
+	  This driver provides the means of controlling the AOSSs handling of
+	  low-power state for resources related to the remoteproc subsystems as
+	  well as controlling the debug clocks.
+
 config QCOM_COMMAND_DB
 	bool "Qualcomm Command DB"
 	depends on ARCH_QCOM || COMPILE_TEST
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index d0d7fdc94d9a..ebfa414a5b77 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 CFLAGS_rpmh-rsc.o := -I$(src)
 obj-$(CONFIG_QCOM_AOSS_QMP) +=	aoss-qmp.o
+obj-$(CONFIG_QCOM_AOSS_QMP_PD) += aoss-qmp-pd.o
 obj-$(CONFIG_QCOM_GENI_SE) +=	qcom-geni-se.o
 obj-$(CONFIG_QCOM_COMMAND_DB) += cmd-db.o
 obj-$(CONFIG_QCOM_GLINK_SSR) +=	glink_ssr.o
diff --git a/drivers/soc/qcom/aoss-qmp-pd.c b/drivers/soc/qcom/aoss-qmp-pd.c
new file mode 100644
index 000000000000..62b8fcb9d09e
--- /dev/null
+++ b/drivers/soc/qcom/aoss-qmp-pd.c
@@ -0,0 +1,135 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018, Linaro Ltd
+ */
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+#include <linux/soc/qcom/aoss-qmp.h>
+#include <dt-bindings/power/qcom-aoss-qmp.h>
+
+struct qmp_pd {
+	struct qmp *qmp;
+
+	struct generic_pm_domain pd;
+
+	const char *name;
+};
+
+#define to_qmp_pd_resource(res) container_of(res, struct qmp_pd, pd)
+
+struct qmp_pd_resource {
+	const char *name;
+	int (*on)(struct generic_pm_domain *domain);
+	int (*off)(struct generic_pm_domain *domain);
+};
+
+static int qmp_pd_clock_toggle(struct qmp_pd *res, bool enable)
+{
+	char buf[96];
+
+	snprintf(buf, sizeof(buf), "{class: clock, res: %s, val: %d}",
+		 res->name, !!enable);
+	return qmp_send(res->qmp, buf, sizeof(buf));
+}
+
+static int qmp_pd_clock_on(struct generic_pm_domain *domain)
+{
+	return qmp_pd_clock_toggle(to_qmp_pd_resource(domain), true);
+}
+
+static int qmp_pd_clock_off(struct generic_pm_domain *domain)
+{
+	return qmp_pd_clock_toggle(to_qmp_pd_resource(domain), false);
+}
+
+static int qmp_pd_image_toggle(struct qmp_pd *res, bool enable)
+{
+	char buf[96];
+
+	snprintf(buf, sizeof(buf),
+		 "{class: image, res: load_state, name: %s, val: %s}",
+		 res->name, enable ? "on" : "off");
+	return qmp_send(res->qmp, buf, sizeof(buf));
+}
+
+static int qmp_pd_image_on(struct generic_pm_domain *domain)
+{
+	return qmp_pd_image_toggle(to_qmp_pd_resource(domain), true);
+}
+
+static int qmp_pd_image_off(struct generic_pm_domain *domain)
+{
+	return qmp_pd_image_toggle(to_qmp_pd_resource(domain), false);
+}
+
+static const struct qmp_pd_resource sdm845_resources[] = {
+	[AOSS_QMP_QDSS_CLK] = { "qdss", qmp_pd_clock_on, qmp_pd_clock_off },
+	[AOSS_QMP_LS_CDSP] = { "cdsp", qmp_pd_image_on, qmp_pd_image_off },
+	[AOSS_QMP_LS_LPASS] = { "adsp", qmp_pd_image_on, qmp_pd_image_off },
+	[AOSS_QMP_LS_MODEM] = { "modem", qmp_pd_image_on, qmp_pd_image_off },
+	[AOSS_QMP_LS_SLPI] = { "slpi", qmp_pd_image_on, qmp_pd_image_off },
+	[AOSS_QMP_LS_SPSS] = { "spss", qmp_pd_image_on, qmp_pd_image_off },
+	[AOSS_QMP_LS_VENUS] = { "venus", qmp_pd_image_on, qmp_pd_image_off },
+};
+
+static int qmp_pd_probe(struct platform_device *pdev)
+{
+	struct genpd_onecell_data *data;
+	struct device *parent = pdev->dev.parent;
+	struct qmp_pd *res;
+	struct qmp *qmp;
+	size_t num = ARRAY_SIZE(sdm845_resources);
+	int i;
+
+	qmp = dev_get_drvdata(pdev->dev.parent);
+	if (!qmp)
+		return -EINVAL;
+
+	res = devm_kcalloc(&pdev->dev, num, sizeof(*res), GFP_KERNEL);
+	if (!res)
+		return -ENOMEM;
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->domains = devm_kcalloc(&pdev->dev, num, sizeof(*data->domains),
+				     GFP_KERNEL);
+
+	for (i = 0; i < num; i++) {
+		pm_genpd_init(&res[i].pd, NULL, true);
+		res[i].qmp = qmp;
+		res[i].name = sdm845_resources[i].name;
+
+		res[i].pd.name = sdm845_resources[i].name;
+		res[i].pd.power_on = sdm845_resources[i].on;
+		res[i].pd.power_off = sdm845_resources[i].off;
+
+		data->domains[data->num_domains++] = &res[i].pd;
+	}
+
+	return of_genpd_add_provider_onecell(parent->of_node, data);
+}
+
+static int qmp_pd_remove(struct platform_device *pdev)
+{
+	struct device *parent = pdev->dev.parent;
+
+	of_genpd_del_provider(parent->of_node);
+
+	return 0;
+}
+
+static struct platform_driver qmp_pd_driver = {
+	.driver = {
+		.name		= "aoss_qmp_pd",
+	},
+	.probe = qmp_pd_probe,
+	.remove = qmp_pd_remove,
+};
+module_platform_driver(qmp_pd_driver);
+
+MODULE_ALIAS("platform:aoss_qmp_pd");
+MODULE_DESCRIPTION("Qualcomm AOSS QMP load-state driver");
+MODULE_LICENSE("GPL v2");
-- 
2.18.0
