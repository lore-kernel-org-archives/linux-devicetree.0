From: Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH 1/2] soc: imx: gpcv2: handle additional power-down bits in
 handshake register
Date: Mon, 17 Dec 2018 16:31:51 +0100
Message-ID: <20181217153152.21135-1-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, patchwork-lst@pengutronix.de, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Some of the i.MX8MQ domains have an additional control bit in the PU
handshake (HSK) register. Documentation about this bit is a bit sparse
at the moment, but it seems that it controls a power-down request to
the AMBA domain bridge (ADB-400) attached to those domains.

As the documentation doesn't desribe the usage of this bit yet, handle
it in the same way as done in the ATF implementation.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
https://source.codeaurora.org/external/imx/imx-atf/tree/plat/freescale/imx8mq/gpc.c?h=imx_4.9.51_imx8m_ga
---
 drivers/soc/imx/gpcv2.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/imx/gpcv2.c b/drivers/soc/imx/gpcv2.c
index 8b4f48a2ca57..a8dd0cddb3d2 100644
--- a/drivers/soc/imx/gpcv2.c
+++ b/drivers/soc/imx/gpcv2.c
@@ -65,6 +65,12 @@
 
 #define GPC_M4_PU_PDN_FLG		0x1bc
 
+#define GPC_PU_PWRHSK			0x1fc
+
+#define IMX8M_GPU_HSK_PWRDNREQN			BIT(6)
+#define IMX8M_VPU_HSK_PWRDNREQN			BIT(5)
+#define IMX8M_DISP_HSK_PWRDNREQN		BIT(4)
+
 /*
  * The PGC offset values in Reference Manual
  * (Rev. 1, 01/2018 and the older ones) GPC chapter's
@@ -102,6 +108,7 @@ struct imx_pgc_domain {
 	const struct {
 		u32 pxx;
 		u32 map;
+		u32 hsk;
 	} bits;
 
 	const int voltage;
@@ -142,6 +149,10 @@ static int imx_gpc_pu_pgc_sw_pxx_req(struct generic_pm_domain *genpd,
 		regmap_update_bits(domain->regmap, GPC_PGC_CTRL(domain->pgc),
 				   GPC_PGC_CTRL_PCR, GPC_PGC_CTRL_PCR);
 
+	if (domain->bits.hsk)
+		regmap_update_bits(domain->regmap, GPC_PU_PWRHSK,
+				   domain->bits.hsk, on ? domain->bits.hsk : 0);
+
 	regmap_update_bits(domain->regmap, offset,
 			   domain->bits.pxx, domain->bits.pxx);
 
@@ -328,6 +339,7 @@ static const struct imx_pgc_domain imx8m_pgc_domains[] = {
 		.bits  = {
 			.pxx = IMX8M_GPU_SW_Pxx_REQ,
 			.map = IMX8M_GPU_A53_DOMAIN,
+			.hsk = IMX8M_GPU_HSK_PWRDNREQN,
 		},
 		.pgc   = IMX8M_PGC_GPU,
 	},
@@ -339,6 +351,7 @@ static const struct imx_pgc_domain imx8m_pgc_domains[] = {
 		.bits  = {
 			.pxx = IMX8M_VPU_SW_Pxx_REQ,
 			.map = IMX8M_VPU_A53_DOMAIN,
+			.hsk = IMX8M_VPU_HSK_PWRDNREQN,
 		},
 		.pgc   = IMX8M_PGC_VPU,
 	},
@@ -350,6 +363,7 @@ static const struct imx_pgc_domain imx8m_pgc_domains[] = {
 		.bits  = {
 			.pxx = IMX8M_DISP_SW_Pxx_REQ,
 			.map = IMX8M_DISP_A53_DOMAIN,
+			.hsk = IMX8M_DISP_HSK_PWRDNREQN,
 		},
 		.pgc   = IMX8M_PGC_DISP,
 	},
@@ -390,7 +404,7 @@ static const struct imx_pgc_domain imx8m_pgc_domains[] = {
 
 static const struct regmap_range imx8m_yes_ranges[] = {
 		regmap_reg_range(GPC_LPCR_A_CORE_BSC,
-				 GPC_M4_PU_PDN_FLG),
+				 GPC_PU_PWRHSK),
 		regmap_reg_range(GPC_PGC_CTRL(IMX8M_PGC_MIPI),
 				 GPC_PGC_SR(IMX8M_PGC_MIPI)),
 		regmap_reg_range(GPC_PGC_CTRL(IMX8M_PGC_PCIE1),
-- 
2.19.1
