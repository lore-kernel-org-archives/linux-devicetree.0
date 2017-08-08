From: Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v1 5/5] soc: mediatek: add MT6755 scpsys support
Date: Tue, 8 Aug 2017 16:13:34 +0800
Message-ID: <1502180014-7995-6-git-send-email-mars.cheng@mediatek.com>
References: <1502180014-7995-1-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1502180014-7995-1-git-send-email-mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

This adds scpsys support for MT6755

Signed-off-by: Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/soc/mediatek/mtk-scpsys.c        |  116 ++++++++++++++++++++++++++++++
 include/dt-bindings/power/mt6755-power.h |   26 +++++++
 2 files changed, 142 insertions(+)
 create mode 100644 include/dt-bindings/power/mt6755-power.h

diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index ceb2cc4..a745d23 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -21,6 +21,7 @@
 #include <linux/soc/mediatek/infracfg.h>
 
 #include <dt-bindings/power/mt2701-power.h>
+#include <dt-bindings/power/mt6755-power.h>
 #include <dt-bindings/power/mt6797-power.h>
 #include <dt-bindings/power/mt8173-power.h>
 
@@ -586,6 +587,118 @@ static int __init scpsys_probe_mt2701(struct platform_device *pdev)
 }
 
 /*
+ * MT6755 power domain support
+ */
+
+static const struct scp_domain_data scp_domain_data_mt6755[] = {
+	[MT6755_POWER_DOMAIN_VDEC] = {
+		.name = "vdec",
+		.sta_mask = PWR_STATUS_VDEC,
+		.ctl_offs = 0x300,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.clk_id = {CLK_VDEC},
+	},
+	[MT6755_POWER_DOMAIN_VENC] = {
+		.name = "venc",
+		.sta_mask = PWR_STATUS_VENC,
+		.ctl_offs = 0x304,
+		.sram_pdn_bits = GENMASK(11, 8),
+		.sram_pdn_ack_bits = GENMASK(15, 12),
+		.clk_id = {CLK_MM},
+	},
+	[MT6755_POWER_DOMAIN_ISP] = {
+		.name = "isp",
+		.sta_mask = PWR_STATUS_ISP,
+		.ctl_offs = 0x308,
+		.sram_pdn_bits = GENMASK(9, 8),
+		.sram_pdn_ack_bits = GENMASK(13, 12),
+		.clk_id = {CLK_MM},
+	},
+	[MT6755_POWER_DOMAIN_MM] = {
+		.name = "mm",
+		.sta_mask = PWR_STATUS_DISP,
+		.ctl_offs = 0x30C,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.clk_id = {CLK_MM},
+		.bus_prot_mask = BIT(1),
+	},
+	[MT6755_POWER_DOMAIN_AUDIO] = {
+		.name = "audio",
+		.sta_mask = PWR_STATUS_AUDIO,
+		.ctl_offs = 0x314,
+		.sram_pdn_bits = GENMASK(11, 8),
+		.sram_pdn_ack_bits = GENMASK(15, 12),
+		.clk_id = {CLK_NONE},
+	},
+	[MT6755_POWER_DOMAIN_MFG_ASYNC] = {
+		.name = "mfg_async",
+		.sta_mask = PWR_STATUS_MFG_ASYNC,
+		.ctl_offs = 0x334,
+		.sram_pdn_bits = 0,
+		.sram_pdn_ack_bits = 0,
+		.clk_id = {CLK_MFG},
+	},
+	[MT6755_POWER_DOMAIN_MFG] = {
+		.name = "mfg",
+		.sta_mask = PWR_STATUS_MFG,
+		.ctl_offs = 0x338,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(16, 16),
+		.clk_id = {CLK_NONE},
+		.bus_prot_mask = BIT(21),
+	},
+};
+
+#define NUM_DOMAINS_MT6755	ARRAY_SIZE(scp_domain_data_mt6755)
+#define SPM_PWR_STATUS_MT6755		0x0180
+#define SPM_PWR_STATUS_2ND_MT6755	0x0184
+
+static int __init scpsys_probe_mt6755(struct platform_device *pdev)
+{
+	struct scp *scp;
+	struct genpd_onecell_data *pd_data;
+	int ret;
+	struct scp_ctrl_reg scp_reg;
+
+	scp_reg.pwr_sta_offs = SPM_PWR_STATUS_MT6755;
+	scp_reg.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND_MT6755;
+
+	scp = init_scp(pdev, scp_domain_data_mt6755, NUM_DOMAINS_MT6755,
+		       &scp_reg);
+	if (IS_ERR(scp))
+		return PTR_ERR(scp);
+
+	mtk_register_power_domains(pdev, scp, NUM_DOMAINS_MT6755);
+
+	pd_data = &scp->pd_data;
+
+	ret = pm_genpd_add_subdomain(pd_data->domains[MT6755_POWER_DOMAIN_MM],
+				     pd_data->domains[MT6755_POWER_DOMAIN_VDEC]);
+	if (ret && IS_ENABLED(CONFIG_PM))
+		dev_err(&pdev->dev, "Failed to add subdomain: %d\n", ret);
+
+	ret = pm_genpd_add_subdomain(pd_data->domains[MT6755_POWER_DOMAIN_MM],
+				     pd_data->domains[MT6755_POWER_DOMAIN_ISP]);
+	if (ret && IS_ENABLED(CONFIG_PM))
+		dev_err(&pdev->dev, "Failed to add subdomain: %d\n", ret);
+
+	ret = pm_genpd_add_subdomain(pd_data->domains[MT6755_POWER_DOMAIN_MM],
+				     pd_data->domains[MT6797_POWER_DOMAIN_VENC]);
+	if (ret && IS_ENABLED(CONFIG_PM))
+		dev_err(&pdev->dev, "Failed to add subdomain: %d\n", ret);
+
+	ret = pm_genpd_add_subdomain(
+		pd_data->domains[MT6755_POWER_DOMAIN_MFG_ASYNC],
+		pd_data->domains[MT6755_POWER_DOMAIN_MFG]);
+	if (ret && IS_ENABLED(CONFIG_PM))
+		dev_err(&pdev->dev, "Failed to add subdomain: %d\n", ret);
+
+	return 0;
+}
+
+/*
  * MT6797 power domain support
  */
 
@@ -832,6 +945,9 @@ static int __init scpsys_probe_mt8173(struct platform_device *pdev)
 		.compatible = "mediatek,mt2701-scpsys",
 		.data = scpsys_probe_mt2701,
 	}, {
+		.compatible = "mediatek,mt6755-scpsys",
+		.data = scpsys_probe_mt6755,
+	}, {
 		.compatible = "mediatek,mt6797-scpsys",
 		.data = scpsys_probe_mt6797,
 	}, {
diff --git a/include/dt-bindings/power/mt6755-power.h b/include/dt-bindings/power/mt6755-power.h
new file mode 100644
index 0000000..4f9aaf4
--- /dev/null
+++ b/include/dt-bindings/power/mt6755-power.h
@@ -0,0 +1,26 @@
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
+#ifndef _DT_BINDINGS_POWER_MT6755_POWER_H
+#define _DT_BINDINGS_POWER_MT6755_POWER_H
+
+#define MT6755_POWER_DOMAIN_VDEC	0
+#define MT6755_POWER_DOMAIN_VENC	1
+#define MT6755_POWER_DOMAIN_ISP		2
+#define MT6755_POWER_DOMAIN_MM		3
+#define MT6755_POWER_DOMAIN_AUDIO	4
+#define MT6755_POWER_DOMAIN_USB		5
+#define MT6755_POWER_DOMAIN_MFG_ASYNC	6
+#define MT6755_POWER_DOMAIN_MFG		7
+
+#endif /* _DT_BINDINGS_POWER_MT6755_POWER_H */
-- 
1.7.9.5
