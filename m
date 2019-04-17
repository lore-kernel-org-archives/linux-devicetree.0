From: Jacky Bai <ping.bai@nxp.com>
Subject: [PATCH 2/3] soc: imx: Add power domain driver support for i.mx8m
 family
Date: Wed, 17 Apr 2019 05:27:35 +0000
Message-ID: <20190417053211.2195-3-ping.bai@nxp.com>
References: <20190417053211.2195-1-ping.bai@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190417053211.2195-1-ping.bai@nxp.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, Aisheng Dong <aisheng.dong@nxp.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

The i.MX8M family is a set of NXP product focus on delivering
the latest and greatest video and audio experience combining
state-of-the-art media-specific features with high-performance
processing while optimized for lowest power consumption.

i.MX8MQ, i.MX8MM, i.MX8MN, even the furture i.MX8MP are all
belong to this family. A GPC module is used to manage all the
PU power domain on/off. But the situation is that the number of
power domains & the power up sequence has significate difference
on those SoCs. Even on the same SoC. The power up sequence still
has big difference. It makes us hard to reuse the GPCv2 driver to
cover the whole i.MX8M family. Each time a new SoC is supported in
the mainline kernel, we need to modify the GPCv2 driver to support
it. We need to add or modify hundred lines of code in worst case.
It is a bad practice for the driver maintainability.

This driver add a more generic power domain driver that the actual
power on/off is done by TF-A code. the abstraction give us the
possibility that using one driver to cover the whole i.MX8M family
in kernel side.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
 drivers/soc/imx/Kconfig            |   6 +
 drivers/soc/imx/Makefile           |   1 +
 drivers/soc/imx/imx8m_pm_domains.c | 224 +++++++++++++++++++++++++++++
 include/soc/imx/imx_sip.h          |  12 ++
 4 files changed, 243 insertions(+)
 create mode 100644 drivers/soc/imx/imx8m_pm_domains.c
 create mode 100644 include/soc/imx/imx_sip.h

diff --git a/drivers/soc/imx/Kconfig b/drivers/soc/imx/Kconfig
index d80f899d22f9..9a5a9cb77214 100644
--- a/drivers/soc/imx/Kconfig
+++ b/drivers/soc/imx/Kconfig
@@ -7,4 +7,10 @@ config IMX_GPCV2_PM_DOMAINS
 	select PM_GENERIC_DOMAINS
 	default y if SOC_IMX7D
 
+config IMX8M_PM_DOMAINS
+	bool "i.MX8M PM domains"
+	depends on ARCH_MXC || (COMPILE_TEST && OF)
+	depends on PM
+	select PM_GENERIC_DOMAINS
+
 endmenu
diff --git a/drivers/soc/imx/Makefile b/drivers/soc/imx/Makefile
index 506a6f3c2b9b..627a54f228e5 100644
--- a/drivers/soc/imx/Makefile
+++ b/drivers/soc/imx/Makefile
@@ -1,2 +1,3 @@
 obj-$(CONFIG_HAVE_IMX_GPC) += gpc.o
 obj-$(CONFIG_IMX_GPCV2_PM_DOMAINS) += gpcv2.o
+obj-$(CONFIG_IMX8M_PM_DOMAINS) += imx8m_pm_domains.o
diff --git a/drivers/soc/imx/imx8m_pm_domains.c b/drivers/soc/imx/imx8m_pm_domains.c
new file mode 100644
index 000000000000..ce06a059eaaa
--- /dev/null
+++ b/drivers/soc/imx/imx8m_pm_domains.c
@@ -0,0 +1,224 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2019 NXP.
+ */
+
+#include <linux/arm-smccc.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+#include <linux/regulator/consumer.h>
+
+#include <soc/imx/imx_sip.h>
+
+#define MAX_CLK_NUM	6
+#define to_imx8m_pm_domain(_genpd) container_of(_genpd, struct imx8m_pm_domain, pd)
+
+
+struct imx8m_pm_domain {
+	struct device *dev;
+	struct generic_pm_domain pd;
+	u32 domain_index;
+	struct clk *clk[MAX_CLK_NUM];
+	unsigned int num_clks;
+	struct regulator *reg;
+};
+
+enum imx8m_pm_domain_state {
+	PD_STATE_OFF,
+	PD_STATE_ON,
+};
+
+static DEFINE_MUTEX(gpc_pd_mutex);
+
+static int imx8m_pd_power_on(struct generic_pm_domain *genpd)
+{
+	struct imx8m_pm_domain *domain = to_imx8m_pm_domain(genpd);
+	struct arm_smccc_res res;
+	int index, ret = 0;
+
+	/* power on the external supply */
+	if (!IS_ERR(domain->reg)) {
+		ret = regulator_enable(domain->reg);
+		if (ret) {
+			dev_warn(domain->dev, "failed to power up the reg%d\n", ret);
+			return ret;
+		}
+	}
+
+	/* enable the necessary clks needed by the power domain */
+	if (domain->num_clks) {
+		for (index = 0; index < domain->num_clks; index++)
+			clk_prepare_enable(domain->clk[index]);
+	}
+
+	mutex_lock(&gpc_pd_mutex);
+	arm_smccc_smc(IMX_SIP_GPC, IMX_SIP_CONFIG_GPC_PM_DOMAIN, domain->domain_index,
+		      PD_STATE_ON, 0, 0, 0, 0, &res);
+	mutex_unlock(&gpc_pd_mutex);
+
+	return 0;
+}
+
+static int imx8m_pd_power_off(struct generic_pm_domain *genpd)
+{
+	struct imx8m_pm_domain *domain = to_imx8m_pm_domain(genpd);
+	struct arm_smccc_res res;
+	int index, ret = 0;
+
+	mutex_lock(&gpc_pd_mutex);
+	arm_smccc_smc(IMX_SIP_GPC, IMX_SIP_CONFIG_GPC_PM_DOMAIN, domain->domain_index,
+		      PD_STATE_OFF, 0, 0, 0, 0, &res);
+	mutex_unlock(&gpc_pd_mutex);
+
+	/* power off the external supply */
+	if (!IS_ERR(domain->reg)) {
+		ret = regulator_disable(domain->reg);
+		if (ret) {
+			dev_warn(domain->dev, "failed to power off the reg%d\n", ret);
+			return ret;
+		}
+	}
+
+	/* disable clks when power domain is off */
+	if (domain->num_clks) {
+		for (index = 0; index < domain->num_clks; index++)
+			clk_disable_unprepare(domain->clk[index]);
+	}
+
+	return ret;
+};
+
+static int imx8m_pd_get_clocks(struct imx8m_pm_domain *domain)
+{
+	int i, ret;
+
+	for (i = 0; ; i++) {
+		struct clk *clk = of_clk_get(domain->dev->of_node, i);
+		if (IS_ERR(clk))
+			break;
+		if (i >= MAX_CLK_NUM) {
+			dev_err(domain->dev, "more than %d clocks\n",
+				MAX_CLK_NUM);
+			ret = -EINVAL;
+			goto clk_err;
+		}
+		domain->clk[i] = clk;
+	}
+	domain->num_clks = i;
+
+	return 0;
+
+clk_err:
+	while (i--)
+		clk_put(domain->clk[i]);
+
+	return ret;
+}
+
+static void imx8m_pd_put_clocks(struct imx8m_pm_domain *domain)
+{
+	int i;
+
+	for (i = domain->num_clks - 1; i >= 0; i--)
+		clk_put(domain->clk[i]);
+}
+
+static const struct of_device_id imx8m_pm_domain_ids[] = {
+	{.compatible = "fsl,imx8m-pm-domain"},
+	{},
+};
+
+static int imx8m_pm_domain_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct imx8m_pm_domain *domain;
+	struct of_phandle_args parent, child;
+	int ret;
+
+	domain = devm_kzalloc(dev, sizeof(*domain), GFP_KERNEL);
+	if (!domain)
+		return -ENOMEM;
+
+	child.np = np;
+	domain->dev = dev;
+
+	ret = of_property_read_string(np, "domain-name", &domain->pd.name);
+	if (ret) {
+		dev_err(dev, "failed to get the domain name\n");
+		return -EINVAL;
+	}
+
+	ret = of_property_read_u32(np, "domain-index", &domain->domain_index);
+	if (ret) {
+		dev_err(dev, "failed to get the domain index\n");
+		return -EINVAL;
+	}
+
+	domain->reg = devm_regulator_get_optional(dev, "power");
+	if (IS_ERR(domain->reg)) {
+		if (PTR_ERR(domain->reg) != -ENODEV) {
+			if (PTR_ERR(domain->reg) != -EPROBE_DEFER)
+				dev_err(dev, "failed to get domain's regulator\n");
+			return PTR_ERR(domain->reg);
+		}
+	}
+
+	ret = imx8m_pd_get_clocks(domain);
+	if (ret) {
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "failed to get domain's clocks\n");
+		return ret;
+	}
+
+	domain->pd.power_off = imx8m_pd_power_off;
+	domain->pd.power_on = imx8m_pd_power_on;
+
+	pm_genpd_init(&domain->pd, NULL, true);
+
+	ret = of_genpd_add_provider_simple(np, &domain->pd);
+	if (ret) {
+		dev_err(dev, "failed to add the domain provider\n");
+		pm_genpd_remove(&domain->pd);
+		imx8m_pd_put_clocks(domain);
+		return ret;
+	}
+
+	/* add it as subdomain if necessary */
+	if (!of_parse_phandle_with_args(np, "parent-domains",
+			"#power-domain-cells", 0, &parent)) {
+		ret = of_genpd_add_subdomain(&parent, &child);
+		of_node_put(parent.np);
+
+		if (ret < 0) {
+			dev_dbg(dev, "failed to add the subdomain: %s: %d",
+				domain->pd.name, ret);
+			of_genpd_del_provider(np);
+			pm_genpd_remove(&domain->pd);
+			imx8m_pd_put_clocks(domain);
+			return driver_deferred_probe_check_state(dev);
+		}
+	}
+
+	return 0;
+}
+
+static struct platform_driver imx8m_pm_domain_driver = {
+	.driver = {
+		.name	= "imx8m_pm_domain",
+		.owner	= THIS_MODULE,
+		.of_match_table = imx8m_pm_domain_ids,
+	},
+	.probe = imx8m_pm_domain_probe,
+};
+module_platform_driver(imx8m_pm_domain_driver);
+
+MODULE_AUTHOR("NXP");
+MODULE_DESCRIPTION("NXP i.MX8M power domain driver");
+MODULE_LICENSE("GPL v2");
diff --git a/include/soc/imx/imx_sip.h b/include/soc/imx/imx_sip.h
new file mode 100644
index 000000000000..6b96b33c870e
--- /dev/null
+++ b/include/soc/imx/imx_sip.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2019 NXP
+ */
+
+#ifndef __IMX_SIP_H__
+#define __IMX_SIP_H__
+
+#define IMX_SIP_GPC			0xC2000000
+#define IMX_SIP_CONFIG_GPC_PM_DOMAIN	0x03
+
+#endif /* __IMX_SIP_H__ */
-- 
2.21.0
