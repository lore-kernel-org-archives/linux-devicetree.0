From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v2 08/11] ARM i.MX6q: fix ldb di divider and selector clocks
Date: Wed, 27 Mar 2013 18:30:42 +0100
Message-ID: <1364405445-5271-9-git-send-email-p.zabel@pengutronix.de>
References: <1364405445-5271-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1364405445-5271-1-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Martin Fuzzey <mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sean Cross <xobs-nXMMniAx+RbQT0dZR+AlfA@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Use imx_clk_mux_flags and imx_clk_divider_flags to set the appropriate
flags for the LDB display interface divider and selector clocks.

Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 arch/arm/mach-imx/clk-imx6q.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-imx/clk-imx6q.c b/arch/arm/mach-imx/clk-imx6q.c
index 5528656..516f03e 100644
--- a/arch/arm/mach-imx/clk-imx6q.c
+++ b/arch/arm/mach-imx/clk-imx6q.c
@@ -299,8 +299,8 @@ int __init mx6q_clocks_init(void)
 	clk[gpu3d_shader_sel] = imx_clk_mux("gpu3d_shader_sel", base + 0x18, 8,  2, gpu3d_shader_sels, ARRAY_SIZE(gpu3d_shader_sels));
 	clk[ipu1_sel]         = imx_clk_mux("ipu1_sel",         base + 0x3c, 9,  2, ipu_sels,          ARRAY_SIZE(ipu_sels));
 	clk[ipu2_sel]         = imx_clk_mux("ipu2_sel",         base + 0x3c, 14, 2, ipu_sels,          ARRAY_SIZE(ipu_sels));
-	clk[ldb_di0_sel]      = imx_clk_mux("ldb_di0_sel",      base + 0x2c, 9,  3, ldb_di_sels,       ARRAY_SIZE(ldb_di_sels));
-	clk[ldb_di1_sel]      = imx_clk_mux("ldb_di1_sel",      base + 0x2c, 12, 3, ldb_di_sels,       ARRAY_SIZE(ldb_di_sels));
+	clk[ldb_di0_sel]      = imx_clk_mux_flags("ldb_di0_sel", base + 0x2c, 9,  3, ldb_di_sels,      ARRAY_SIZE(ldb_di_sels), CLK_SET_RATE_PARENT);
+	clk[ldb_di1_sel]      = imx_clk_mux_flags("ldb_di1_sel", base + 0x2c, 12, 3, ldb_di_sels,      ARRAY_SIZE(ldb_di_sels), CLK_SET_RATE_PARENT);
 	clk[ipu1_di0_pre_sel] = imx_clk_mux("ipu1_di0_pre_sel", base + 0x34, 6,  3, ipu_di_pre_sels,   ARRAY_SIZE(ipu_di_pre_sels));
 	clk[ipu1_di1_pre_sel] = imx_clk_mux("ipu1_di1_pre_sel", base + 0x34, 15, 3, ipu_di_pre_sels,   ARRAY_SIZE(ipu_di_pre_sels));
 	clk[ipu2_di0_pre_sel] = imx_clk_mux("ipu2_di0_pre_sel", base + 0x38, 6,  3, ipu_di_pre_sels,   ARRAY_SIZE(ipu_di_pre_sels));
@@ -348,9 +348,9 @@ int __init mx6q_clocks_init(void)
 	clk[ipu1_podf]        = imx_clk_divider("ipu1_podf",        "ipu1_sel",          base + 0x3c, 11, 3);
 	clk[ipu2_podf]        = imx_clk_divider("ipu2_podf",        "ipu2_sel",          base + 0x3c, 16, 3);
 	clk[ldb_di0_div_3_5]  = imx_clk_fixed_factor("ldb_di0_div_3_5", "ldb_di0_sel", 2, 7);
-	clk[ldb_di0_podf]     = imx_clk_divider("ldb_di0_podf",     "ldb_di0_div_3_5",       base + 0x20, 10, 1);
+	clk[ldb_di0_podf]     = imx_clk_divider_flags("ldb_di0_podf", "ldb_di0_div_3_5", base + 0x20, 10, 1, 0);
 	clk[ldb_di1_div_3_5]  = imx_clk_fixed_factor("ldb_di1_div_3_5", "ldb_di1_sel", 2, 7);
-	clk[ldb_di1_podf]     = imx_clk_divider("ldb_di1_podf",     "ldb_di1_div_3_5",   base + 0x20, 11, 1);
+	clk[ldb_di1_podf]     = imx_clk_divider_flags("ldb_di1_podf", "ldb_di1_div_3_5", base + 0x20, 11, 1, 0);
 	clk[ipu1_di0_pre]     = imx_clk_divider("ipu1_di0_pre",     "ipu1_di0_pre_sel",  base + 0x34, 3,  3);
 	clk[ipu1_di1_pre]     = imx_clk_divider("ipu1_di1_pre",     "ipu1_di1_pre_sel",  base + 0x34, 12, 3);
 	clk[ipu2_di0_pre]     = imx_clk_divider("ipu2_di0_pre",     "ipu2_di0_pre_sel",  base + 0x38, 3,  3);
-- 
1.8.2.rc2
