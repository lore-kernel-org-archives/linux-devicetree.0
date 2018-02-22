From: Weiyi Lu <weiyi.lu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v1 2/5] soc: mediatek: update power domain data of MT2712
Date: Thu, 22 Feb 2018 13:48:48 +0800
Message-ID: <20180222054851.26096-4-weiyi.lu@mediatek.com>
References: <20180222054851.26096-1-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20180222054851.26096-1-weiyi.lu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Weiyi Lu <weiyi.lu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Fan Chen <fan.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

1. split MFG power domain into MFG/MFG_SC1/MFG_SC2/MFG_SC3
according to MT2712 ECO design change
2. add subdomain support for MT2712

Signed-off-by: Weiyi Lu <weiyi.lu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/soc/mediatek/mtk-scpsys.c | 42 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index 59bd749c2f25..edf8fd6c2c85 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -664,12 +664,48 @@ static const struct scp_domain_data scp_domain_data_mt2712[] = {
 		.name = "mfg",
 		.sta_mask = PWR_STATUS_MFG,
 		.ctl_offs = SPM_MFG_PWR_CON,
-		.sram_pdn_bits = GENMASK(11, 8),
-		.sram_pdn_ack_bits = GENMASK(19, 16),
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(16, 16),
 		.clk_id = {CLK_MFG},
 		.bus_prot_mask = BIT(14) | BIT(21) | BIT(23),
 		.active_wakeup = true,
 	},
+	[MT2712_POWER_DOMAIN_MFG_SC1] = {
+		.name = "mfg_sc1",
+		.sta_mask = BIT(22),
+		.ctl_offs = 0x02c0,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(16, 16),
+		.clk_id = {CLK_NONE},
+		.active_wakeup = true,
+	},
+	[MT2712_POWER_DOMAIN_MFG_SC2] = {
+		.name = "mfg_sc2",
+		.sta_mask = BIT(23),
+		.ctl_offs = 0x02c4,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(16, 16),
+		.clk_id = {CLK_NONE},
+		.active_wakeup = true,
+	},
+	[MT2712_POWER_DOMAIN_MFG_SC3] = {
+		.name = "mfg_sc3",
+		.sta_mask = BIT(30),
+		.ctl_offs = 0x01f8,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(16, 16),
+		.clk_id = {CLK_NONE},
+		.active_wakeup = true,
+	},
+};
+
+static const struct scp_subdomain scp_subdomain_mt2712[] = {
+	{MT2712_POWER_DOMAIN_MM, MT2712_POWER_DOMAIN_VDEC},
+	{MT2712_POWER_DOMAIN_MM, MT2712_POWER_DOMAIN_VENC},
+	{MT2712_POWER_DOMAIN_MM, MT2712_POWER_DOMAIN_ISP},
+	{MT2712_POWER_DOMAIN_MFG, MT2712_POWER_DOMAIN_MFG_SC1},
+	{MT2712_POWER_DOMAIN_MFG_SC1, MT2712_POWER_DOMAIN_MFG_SC2},
+	{MT2712_POWER_DOMAIN_MFG_SC2, MT2712_POWER_DOMAIN_MFG_SC3},
 };
 
 /*
@@ -905,6 +941,8 @@ static const struct scp_soc_data mt2701_data = {
 static const struct scp_soc_data mt2712_data = {
 	.domains = scp_domain_data_mt2712,
 	.num_domains = ARRAY_SIZE(scp_domain_data_mt2712),
+	.subdomains = scp_subdomain_mt2712,
+	.num_subdomains = ARRAY_SIZE(scp_subdomain_mt2712),
 	.regs = {
 		.pwr_sta_offs = SPM_PWR_STATUS,
 		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND
-- 
2.12.5
