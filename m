From: Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v4 09/10] soc: mediatek: add MT6797 scpsys support
Date: Sat, 8 Apr 2017 09:20:34 +0800
Message-ID: <1491614435-23754-10-git-send-email-mars.cheng@mediatek.com>
References: <1491614435-23754-1-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1491614435-23754-1-git-send-email-mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: CC Hwang <cc.hwang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Loda Chou <loda.chou-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Miles Chen <miles.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jades Shih <jades.shih-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Kevin-CW Chen <kevin-cw.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds scpsys support for MT6797

Signed-off-by: Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Signed-off-by: Kevin-CW Chen <kevin-cw.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/soc/mediatek/mtk-scpsys.c        |  114 ++++++++++++++++++++++++++++++
 include/dt-bindings/power/mt6797-power.h |   30 ++++++++
 2 files changed, 144 insertions(+)
 create mode 100644 include/dt-bindings/power/mt6797-power.h

diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index a8ba800..ceb2cc4 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -21,6 +21,7 @@
 #include <linux/soc/mediatek/infracfg.h>
 
 #include <dt-bindings/power/mt2701-power.h>
+#include <dt-bindings/power/mt6797-power.h>
 #include <dt-bindings/power/mt8173-power.h>
 
 #define SPM_VDE_PWR_CON			0x0210
@@ -585,6 +586,116 @@ static int __init scpsys_probe_mt2701(struct platform_device *pdev)
 }
 
 /*
+ * MT6797 power domain support
+ */
+
+static const struct scp_domain_data scp_domain_data_mt6797[] = {
+	[MT6797_POWER_DOMAIN_VDEC] = {
+		.name = "vdec",
+		.sta_mask = BIT(7),
+		.ctl_offs = 0x300,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.clk_id = {CLK_VDEC},
+	},
+	[MT6797_POWER_DOMAIN_VENC] = {
+		.name = "venc",
+		.sta_mask = BIT(21),
+		.ctl_offs = 0x304,
+		.sram_pdn_bits = GENMASK(11, 8),
+		.sram_pdn_ack_bits = GENMASK(15, 12),
+		.clk_id = {CLK_NONE},
+	},
+	[MT6797_POWER_DOMAIN_ISP] = {
+		.name = "isp",
+		.sta_mask = BIT(5),
+		.ctl_offs = 0x308,
+		.sram_pdn_bits = GENMASK(9, 8),
+		.sram_pdn_ack_bits = GENMASK(13, 12),
+		.clk_id = {CLK_NONE},
+	},
+	[MT6797_POWER_DOMAIN_MM] = {
+		.name = "mm",
+		.sta_mask = BIT(3),
+		.ctl_offs = 0x30C,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.clk_id = {CLK_MM},
+		.bus_prot_mask = (BIT(1) | BIT(2)),
+	},
+	[MT6797_POWER_DOMAIN_AUDIO] = {
+		.name = "audio",
+		.sta_mask = BIT(24),
+		.ctl_offs = 0x314,
+		.sram_pdn_bits = GENMASK(11, 8),
+		.sram_pdn_ack_bits = GENMASK(15, 12),
+		.clk_id = {CLK_NONE},
+	},
+	[MT6797_POWER_DOMAIN_MFG_ASYNC] = {
+		.name = "mfg_async",
+		.sta_mask = BIT(13),
+		.ctl_offs = 0x334,
+		.sram_pdn_bits = 0,
+		.sram_pdn_ack_bits = 0,
+		.clk_id = {CLK_MFG},
+	},
+	[MT6797_POWER_DOMAIN_MJC] = {
+		.name = "mjc",
+		.sta_mask = BIT(20),
+		.ctl_offs = 0x310,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.clk_id = {CLK_NONE},
+	},
+};
+
+#define NUM_DOMAINS_MT6797	ARRAY_SIZE(scp_domain_data_mt6797)
+#define SPM_PWR_STATUS_MT6797		0x0180
+#define SPM_PWR_STATUS_2ND_MT6797	0x0184
+
+static int __init scpsys_probe_mt6797(struct platform_device *pdev)
+{
+	struct scp *scp;
+	struct genpd_onecell_data *pd_data;
+	int ret;
+	struct scp_ctrl_reg scp_reg;
+
+	scp_reg.pwr_sta_offs = SPM_PWR_STATUS_MT6797;
+	scp_reg.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND_MT6797;
+
+	scp = init_scp(pdev, scp_domain_data_mt6797, NUM_DOMAINS_MT6797,
+		       &scp_reg);
+	if (IS_ERR(scp))
+		return PTR_ERR(scp);
+
+	mtk_register_power_domains(pdev, scp, NUM_DOMAINS_MT6797);
+
+	pd_data = &scp->pd_data;
+
+	ret = pm_genpd_add_subdomain(pd_data->domains[MT6797_POWER_DOMAIN_MM],
+				     pd_data->domains[MT6797_POWER_DOMAIN_VDEC]);
+	if (ret && IS_ENABLED(CONFIG_PM))
+		dev_err(&pdev->dev, "Failed to add subdomain: %d\n", ret);
+
+	ret = pm_genpd_add_subdomain(pd_data->domains[MT6797_POWER_DOMAIN_MM],
+				     pd_data->domains[MT6797_POWER_DOMAIN_ISP]);
+	if (ret && IS_ENABLED(CONFIG_PM))
+		dev_err(&pdev->dev, "Failed to add subdomain: %d\n", ret);
+
+	ret = pm_genpd_add_subdomain(pd_data->domains[MT6797_POWER_DOMAIN_MM],
+				     pd_data->domains[MT6797_POWER_DOMAIN_VENC]);
+	if (ret && IS_ENABLED(CONFIG_PM))
+		dev_err(&pdev->dev, "Failed to add subdomain: %d\n", ret);
+
+	ret = pm_genpd_add_subdomain(pd_data->domains[MT6797_POWER_DOMAIN_MM],
+				     pd_data->domains[MT6797_POWER_DOMAIN_MJC]);
+	if (ret && IS_ENABLED(CONFIG_PM))
+		dev_err(&pdev->dev, "Failed to add subdomain: %d\n", ret);
+
+	return 0;
+}
+
+/*
  * MT8173 power domain support
  */
 
@@ -721,6 +832,9 @@ static int __init scpsys_probe_mt8173(struct platform_device *pdev)
 		.compatible = "mediatek,mt2701-scpsys",
 		.data = scpsys_probe_mt2701,
 	}, {
+		.compatible = "mediatek,mt6797-scpsys",
+		.data = scpsys_probe_mt6797,
+	}, {
 		.compatible = "mediatek,mt8173-scpsys",
 		.data = scpsys_probe_mt8173,
 	}, {
diff --git a/include/dt-bindings/power/mt6797-power.h b/include/dt-bindings/power/mt6797-power.h
new file mode 100644
index 0000000..d54b377
--- /dev/null
+++ b/include/dt-bindings/power/mt6797-power.h
@@ -0,0 +1,30 @@
+/*
+ * Copyright (c) 2017 MediaTek Inc.
+ * Author: Mars.C <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef _DT_BINDINGS_POWER_MT6797_POWER_H
+#define _DT_BINDINGS_POWER_MT6797_POWER_H
+
+#define MT6797_POWER_DOMAIN_VDEC		0
+#define MT6797_POWER_DOMAIN_VENC		1
+#define MT6797_POWER_DOMAIN_ISP		2
+#define MT6797_POWER_DOMAIN_MM			3
+#define MT6797_POWER_DOMAIN_AUDIO		4
+#define MT6797_POWER_DOMAIN_MFG_ASYNC		5
+#define MT6797_POWER_DOMAIN_MFG		6
+#define MT6797_POWER_DOMAIN_MFG_CORE0		7
+#define MT6797_POWER_DOMAIN_MFG_CORE1		8
+#define MT6797_POWER_DOMAIN_MFG_CORE2		9
+#define MT6797_POWER_DOMAIN_MFG_CORE3		10
+#define MT6797_POWER_DOMAIN_MJC		11
+
+#endif /* _DT_BINDINGS_POWER_MT6797_POWER_H */
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
