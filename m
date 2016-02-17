From: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v5 4/4] soc: mediatek: Add MT2701 scpsys driver
Date: Wed, 17 Feb 2016 15:01:39 +0800
Message-ID: <1455692499-56828-5-git-send-email-jamesjj.liao@mediatek.com>
References: <1455692499-56828-1-git-send-email-jamesjj.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1455692499-56828-1-git-send-email-jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Shunli Wang <shunli.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Shunli Wang <shunli.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Add scpsys driver for MT2701.

Signed-off-by: Shunli Wang <shunli.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Signed-off-by: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/soc/mediatek/mtk-scpsys.c | 108 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 107 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index ebfc887..171fd8e 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -20,6 +20,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/soc/mediatek/infracfg.h>
 
+#include <dt-bindings/power/mt2701-power.h>
 #include <dt-bindings/power/mt8173-power.h>
 
 #define SPM_VDE_PWR_CON			0x0210
@@ -27,8 +28,13 @@
 #define SPM_VEN_PWR_CON			0x0230
 #define SPM_ISP_PWR_CON			0x0238
 #define SPM_DIS_PWR_CON			0x023c
+#define SPM_CONN_PWR_CON		0x0280
 #define SPM_VEN2_PWR_CON		0x0298
-#define SPM_AUDIO_PWR_CON		0x029c
+#define SPM_AUDIO_PWR_CON		0x029c	/* MT8173 */
+#define SPM_BDP_PWR_CON			0x029c	/* MT2701 */
+#define SPM_ETH_PWR_CON			0x02a0
+#define SPM_HIF_PWR_CON			0x02a4
+#define SPM_IFR_MSC_PWR_CON		0x02a8
 #define SPM_MFG_2D_PWR_CON		0x02c0
 #define SPM_MFG_ASYNC_PWR_CON		0x02c4
 #define SPM_USB_PWR_CON			0x02cc
@@ -42,10 +48,15 @@
 #define PWR_ON_2ND_BIT			BIT(3)
 #define PWR_CLK_DIS_BIT			BIT(4)
 
+#define PWR_STATUS_CONN			BIT(1)
 #define PWR_STATUS_DISP			BIT(3)
 #define PWR_STATUS_MFG			BIT(4)
 #define PWR_STATUS_ISP			BIT(5)
 #define PWR_STATUS_VDEC			BIT(7)
+#define PWR_STATUS_BDP			BIT(14)
+#define PWR_STATUS_ETH			BIT(15)
+#define PWR_STATUS_HIF			BIT(16)
+#define PWR_STATUS_IFR_MSC		BIT(17)
 #define PWR_STATUS_VENC_LT		BIT(20)
 #define PWR_STATUS_VENC			BIT(21)
 #define PWR_STATUS_MFG_2D		BIT(22)
@@ -469,6 +480,98 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 }
 
 /*
+ * MT2701 power domain support
+ */
+
+static const struct scp_domain_data scp_domain_data_mt2701[] __initconst = {
+	[MT2701_POWER_DOMAIN_CONN] = {
+		.name = "conn",
+		.sta_mask = PWR_STATUS_CONN,
+		.ctl_offs = SPM_CONN_PWR_CON,
+		.bus_prot_mask = 0x0104,
+		.active_wakeup = true,
+	},
+	[MT2701_POWER_DOMAIN_DISP] = {
+		.name = "disp",
+		.sta_mask = PWR_STATUS_DISP,
+		.ctl_offs = SPM_DIS_PWR_CON,
+		.sram_pdn_bits = GENMASK(11, 8),
+		.clk_id = {CLK_MM},
+		.bus_prot_mask = 0x0002,
+		.active_wakeup = true,
+	},
+	[MT2701_POWER_DOMAIN_MFG] = {
+		.name = "mfg",
+		.sta_mask = PWR_STATUS_MFG,
+		.ctl_offs = SPM_MFG_PWR_CON,
+		.sram_pdn_bits = GENMASK(11, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.active_wakeup = true,
+	},
+	[MT2701_POWER_DOMAIN_VDEC] = {
+		.name = "vdec",
+		.sta_mask = PWR_STATUS_VDEC,
+		.ctl_offs = SPM_VDE_PWR_CON,
+		.sram_pdn_bits = GENMASK(11, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.clk_id = {CLK_MM},
+		.active_wakeup = true,
+	},
+	[MT2701_POWER_DOMAIN_ISP] = {
+		.name = "isp",
+		.sta_mask = PWR_STATUS_ISP,
+		.ctl_offs = SPM_ISP_PWR_CON,
+		.sram_pdn_bits = GENMASK(11, 8),
+		.sram_pdn_ack_bits = GENMASK(13, 12),
+		.active_wakeup = true,
+	},
+	[MT2701_POWER_DOMAIN_BDP] = {
+		.name = "bdp",
+		.sta_mask = PWR_STATUS_BDP,
+		.ctl_offs = SPM_BDP_PWR_CON,
+		.sram_pdn_bits = GENMASK(11, 8),
+		.active_wakeup = true,
+	},
+	[MT2701_POWER_DOMAIN_ETH] = {
+		.name = "eth",
+		.sta_mask = PWR_STATUS_ETH,
+		.ctl_offs = SPM_ETH_PWR_CON,
+		.sram_pdn_bits = GENMASK(11, 8),
+		.sram_pdn_ack_bits = GENMASK(15, 12),
+		.active_wakeup = true,
+	},
+	[MT2701_POWER_DOMAIN_HIF] = {
+		.name = "hif",
+		.sta_mask = PWR_STATUS_HIF,
+		.ctl_offs = SPM_HIF_PWR_CON,
+		.sram_pdn_bits = GENMASK(11, 8),
+		.sram_pdn_ack_bits = GENMASK(15, 12),
+		.active_wakeup = true,
+	},
+	[MT2701_POWER_DOMAIN_IFR_MSC] = {
+		.name = "ifr_msc",
+		.sta_mask = PWR_STATUS_IFR_MSC,
+		.ctl_offs = SPM_IFR_MSC_PWR_CON,
+		.active_wakeup = true,
+	},
+};
+
+#define NUM_DOMAINS_MT2701	ARRAY_SIZE(scp_domain_data_mt2701)
+
+static int __init scpsys_probe_mt2701(struct platform_device *pdev)
+{
+	struct scp *scp;
+
+	scp = init_scp(pdev, scp_domain_data_mt2701, NUM_DOMAINS_MT2701);
+	if (IS_ERR(scp))
+		return PTR_ERR(scp);
+
+	mtk_register_power_domains(pdev, scp, NUM_DOMAINS_MT2701);
+
+	return 0;
+}
+
+/*
  * MT8173 power domain support
  */
 
@@ -597,6 +700,9 @@ static int __init scpsys_probe_mt8173(struct platform_device *pdev)
 
 static const struct of_device_id of_scpsys_match_tbl[] = {
 	{
+		.compatible = "mediatek,mt2701-scpsys",
+		.data = scpsys_probe_mt2701,
+	}, {
 		.compatible = "mediatek,mt8173-scpsys",
 		.data = scpsys_probe_mt8173,
 	}, {
-- 
1.9.1
