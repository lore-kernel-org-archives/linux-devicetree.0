Return-Path: <SRS0=jObF=U7=nxp.com=ping.bai@kernel.org>
From: Jacky Bai <ping.bai@nxp.com>
Subject: [RESEND PATCH 2/3] soc: imx: Add power domain driver support for
 i.mx8m family
Date: Tue, 2 Jul 2019 10:03:46 +0000
Message-ID: <20190702100832.29718-3-ping.bai@nxp.com>
References: <20190702100832.29718-1-ping.bai@nxp.com>
In-Reply-To: <20190702100832.29718-1-ping.bai@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <1D29A89D4534824DB83E2C9B2B7E7443@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, Leonard Crestez <leonard.crestez@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, Peng Fan <peng.fan@nxp.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>
List-ID: <devicetree@vger.kernel.org>

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
index 8aaebf13e2e6..2f3be81aabea 100644
--- a/drivers/soc/imx/Kconfig
+++ b/drivers/soc/imx/Kconfig
@@ -17,4 +17,10 @@ config IMX_SCU_SOC
 	  Controller Unit SoC info module, it will provide the SoC info
 	  like SoC family, ID and revision etc.
=20
+config IMX8M_PM_DOMAINS
+	bool "i.MX8M PM domains"
+	depends on ARCH_MXC || (COMPILE_TEST && OF)
+	depends on PM
+	select PM_GENERIC_DOMAINS
+
 endmenu
diff --git a/drivers/soc/imx/Makefile b/drivers/soc/imx/Makefile
index cf9ca42ff739..469e721b479e 100644
--- a/drivers/soc/imx/Makefile
+++ b/drivers/soc/imx/Makefile
@@ -3,3 +3,4 @@ obj-$(CONFIG_HAVE_IMX_GPC) +=3D gpc.o
 obj-$(CONFIG_IMX_GPCV2_PM_DOMAINS) +=3D gpcv2.o
 obj-$(CONFIG_ARCH_MXC) +=3D soc-imx8.o
 obj-$(CONFIG_IMX_SCU_SOC) +=3D soc-imx-scu.o
+obj-$(CONFIG_IMX8M_PM_DOMAINS) +=3D imx8m_pm_domains.o
diff --git a/drivers/soc/imx/imx8m_pm_domains.c b/drivers/soc/imx/imx8m_pm_=
domains.c
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
+#define to_imx8m_pm_domain(_genpd) container_of(_genpd, struct imx8m_pm_do=
main, pd)
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
+	struct imx8m_pm_domain *domain =3D to_imx8m_pm_domain(genpd);
+	struct arm_smccc_res res;
+	int index, ret =3D 0;
+
+	/* power on the external supply */
+	if (!IS_ERR(domain->reg)) {
+		ret =3D regulator_enable(domain->reg);
+		if (ret) {
+			dev_warn(domain->dev, "failed to power up the reg%d\n", ret);
+			return ret;
+		}
+	}
+
+	/* enable the necessary clks needed by the power domain */
+	if (domain->num_clks) {
+		for (index =3D 0; index < domain->num_clks; index++)
+			clk_prepare_enable(domain->clk[index]);
+	}
+
+	mutex_lock(&gpc_pd_mutex);
+	arm_smccc_smc(IMX_SIP_GPC, IMX_SIP_CONFIG_GPC_PM_DOMAIN, domain->domain_i=
ndex,
+		      PD_STATE_ON, 0, 0, 0, 0, &res);
+	mutex_unlock(&gpc_pd_mutex);
+
+	return 0;
+}
+
+static int imx8m_pd_power_off(struct generic_pm_domain *genpd)
+{
+	struct imx8m_pm_domain *domain =3D to_imx8m_pm_domain(genpd);
+	struct arm_smccc_res res;
+	int index, ret =3D 0;
+
+	mutex_lock(&gpc_pd_mutex);
+	arm_smccc_smc(IMX_SIP_GPC, IMX_SIP_CONFIG_GPC_PM_DOMAIN, domain->domain_i=
ndex,
+		      PD_STATE_OFF, 0, 0, 0, 0, &res);
+	mutex_unlock(&gpc_pd_mutex);
+
+	/* power off the external supply */
+	if (!IS_ERR(domain->reg)) {
+		ret =3D regulator_disable(domain->reg);
+		if (ret) {
+			dev_warn(domain->dev, "failed to power off the reg%d\n", ret);
+			return ret;
+		}
+	}
+
+	/* disable clks when power domain is off */
+	if (domain->num_clks) {
+		for (index =3D 0; index < domain->num_clks; index++)
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
+	for (i =3D 0; ; i++) {
+		struct clk *clk =3D of_clk_get(domain->dev->of_node, i);
+		if (IS_ERR(clk))
+			break;
+		if (i >=3D MAX_CLK_NUM) {
+			dev_err(domain->dev, "more than %d clocks\n",
+				MAX_CLK_NUM);
+			ret =3D -EINVAL;
+			goto clk_err;
+		}
+		domain->clk[i] =3D clk;
+	}
+	domain->num_clks =3D i;
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
+	for (i =3D domain->num_clks - 1; i >=3D 0; i--)
+		clk_put(domain->clk[i]);
+}
+
+static const struct of_device_id imx8m_pm_domain_ids[] =3D {
+	{.compatible =3D "fsl,imx8m-pm-domain"},
+	{},
+};
+
+static int imx8m_pm_domain_probe(struct platform_device *pdev)
+{
+	struct device *dev =3D &pdev->dev;
+	struct device_node *np =3D dev->of_node;
+	struct imx8m_pm_domain *domain;
+	struct of_phandle_args parent, child;
+	int ret;
+
+	domain =3D devm_kzalloc(dev, sizeof(*domain), GFP_KERNEL);
+	if (!domain)
+		return -ENOMEM;
+
+	child.np =3D np;
+	domain->dev =3D dev;
+
+	ret =3D of_property_read_string(np, "domain-name", &domain->pd.name);
+	if (ret) {
+		dev_err(dev, "failed to get the domain name\n");
+		return -EINVAL;
+	}
+
+	ret =3D of_property_read_u32(np, "domain-index", &domain->domain_index);
+	if (ret) {
+		dev_err(dev, "failed to get the domain index\n");
+		return -EINVAL;
+	}
+
+	domain->reg =3D devm_regulator_get_optional(dev, "power");
+	if (IS_ERR(domain->reg)) {
+		if (PTR_ERR(domain->reg) !=3D -ENODEV) {
+			if (PTR_ERR(domain->reg) !=3D -EPROBE_DEFER)
+				dev_err(dev, "failed to get domain's regulator\n");
+			return PTR_ERR(domain->reg);
+		}
+	}
+
+	ret =3D imx8m_pd_get_clocks(domain);
+	if (ret) {
+		if (ret !=3D -EPROBE_DEFER)
+			dev_err(dev, "failed to get domain's clocks\n");
+		return ret;
+	}
+
+	domain->pd.power_off =3D imx8m_pd_power_off;
+	domain->pd.power_on =3D imx8m_pd_power_on;
+
+	pm_genpd_init(&domain->pd, NULL, true);
+
+	ret =3D of_genpd_add_provider_simple(np, &domain->pd);
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
+		ret =3D of_genpd_add_subdomain(&parent, &child);
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
+static struct platform_driver imx8m_pm_domain_driver =3D {
+	.driver =3D {
+		.name	=3D "imx8m_pm_domain",
+		.owner	=3D THIS_MODULE,
+		.of_match_table =3D imx8m_pm_domain_ids,
+	},
+	.probe =3D imx8m_pm_domain_probe,
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
--=20
2.21.0
