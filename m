From: Leela Krishna Amudala <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 7/7] ARM: EXYNOS5: Set parent clock to fimd
Date: Mon, 16 Jul 2012 17:41:26 +0530
Message-ID: <1342440686-21860-8-git-send-email-l.krishna@samsung.com>
References: <1342440686-21860-1-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <1342440686-21860-1-git-send-email-l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Leela Krishna <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

This patch sets mout_mpll_user as parent clock to fimd also
sets Fimd source clock rate to 800 MHz for MIPI LCD

Signed-off-by: Leela Krishna Amudala <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/mach-exynos/clock-exynos5.c       |   25 +++++++++++++++----------
 arch/arm/mach-exynos/mach-exynos5-dt.c     |   11 +++++++++++
 arch/arm/plat-samsung/include/plat/clock.h |    2 ++
 3 files changed, 28 insertions(+), 10 deletions(-)

diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-exynos/clock-exynos5.c
index 61bf88d..a0d65f6 100644
--- a/arch/arm/mach-exynos/clock-exynos5.c
+++ b/arch/arm/mach-exynos/clock-exynos5.c
@@ -1039,6 +1039,18 @@ static struct clksrc_clk exynos5_clk_sclk_mmc3 = {
 	.reg_div = { .reg = EXYNOS5_CLKDIV_FSYS2, .shift = 24, .size = 8 },
 };
 
+struct clksrc_clk exynos5_clk_sclk_fimd = {
+	.clk	= {
+		.name		= "sclk_fimd",
+		.devname	= "exynos5-fb",
+		.enable		= exynos5_clksrc_mask_disp1_0_ctrl,
+		.ctrlbit	= (1 << 0),
+	},
+	.sources = &exynos5_clkset_group,
+	.reg_src = { .reg = EXYNOS5_CLKSRC_DISP1_0, .shift = 0,	.size = 4 },
+	.reg_div = { .reg = EXYNOS5_CLKDIV_DISP1_0, .shift = 0, .size = 4 },
+};
+
 static struct clksrc_clk exynos5_clksrcs[] = {
 	{
 		.clk	= {
@@ -1050,16 +1062,6 @@ static struct clksrc_clk exynos5_clksrcs[] = {
 		.reg_div = { .reg = EXYNOS5_CLKDIV_FSYS3, .shift = 8, .size = 8 },
 	}, {
 		.clk	= {
-			.name		= "sclk_fimd",
-			.devname	= "exynos5-fb",
-			.enable		= exynos5_clksrc_mask_disp1_0_ctrl,
-			.ctrlbit	= (1 << 0),
-		},
-		.sources = &exynos5_clkset_group,
-		.reg_src = { .reg = EXYNOS5_CLKSRC_DISP1_0, .shift = 0, .size = 4 },
-		.reg_div = { .reg = EXYNOS5_CLKDIV_DISP1_0, .shift = 0, .size = 4 },
-	}, {
-		.clk	= {
 			.name		= "aclk_266_gscl",
 		},
 		.sources = &clk_src_gscl_266,
@@ -1153,6 +1155,7 @@ static struct clksrc_clk *exynos5_sysclks[] = {
 	&exynos5_clk_dout_mmc4,
 	&exynos5_clk_aclk_acp,
 	&exynos5_clk_pclk_acp,
+	&exynos5_clk_sclk_fimd,
 };
 
 static struct clk *exynos5_clk_cdev[] = {
@@ -1402,6 +1405,8 @@ void __init_or_cpufreq exynos5_setup_clocks(void)
 
 	clk_set_rate(&exynos5_clk_aclk_acp.clk, 267000000);
 	clk_set_rate(&exynos5_clk_pclk_acp.clk, 134000000);
+	clk_set_parent(&exynos5_clk_sclk_fimd.clk,
+			&exynos5_clk_mout_mpll_user.clk);
 
 	for (ptr = 0; ptr < ARRAY_SIZE(exynos5_clksrcs); ptr++)
 		s3c_set_clksrc(&exynos5_clksrcs[ptr], true);
diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
index 9d5bccc..248ca58 100644
--- a/arch/arm/mach-exynos/mach-exynos5-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
@@ -24,6 +24,9 @@
 #include <plat/regs-serial.h>
 #include <plat/backlight.h>
 #include <plat/gpio-cfg.h>
+#include <plat/clock.h>
+#include <plat/s5p-clock.h>
+#include <plat/clock-clksrc.h>
 
 #include "common.h"
 
@@ -172,9 +175,17 @@ static void __init exynos5250_dt_map_io(void)
 
 static void __init exynos5250_dt_machine_init(void)
 {
+	struct device_node *fimd_node;
+
 	samsung_bl_set(&smdk5250_bl_gpio_info, &smdk5250_bl_data);
 	of_platform_populate(NULL, of_default_bus_match_table,
 				exynos5250_auxdata_lookup, NULL);
+
+	fimd_node = of_find_node_with_property(NULL, "supports-mipi-panel");
+	if (of_get_property(fimd_node, "supports-mipi-panel", NULL))
+		clk_set_rate(&exynos5_clk_sclk_fimd.clk, 800000000);
+	of_node_put(fimd_node);
+
 	exynos_fimd_gpio_setup_24bpp();
 	platform_add_devices(smdk5250_devices, ARRAY_SIZE(smdk5250_devices));
 }
diff --git a/arch/arm/plat-samsung/include/plat/clock.h b/arch/arm/plat-samsung/include/plat/clock.h
index a62753d..3d27783 100644
--- a/arch/arm/plat-samsung/include/plat/clock.h
+++ b/arch/arm/plat-samsung/include/plat/clock.h
@@ -83,6 +83,8 @@ extern struct clk clk_ext;
 extern struct clksrc_clk clk_epllref;
 extern struct clksrc_clk clk_esysclk;
 
+extern struct clksrc_clk exynos5_clk_sclk_fimd;
+
 /* S3C64XX specific clocks */
 extern struct clk clk_h2;
 extern struct clk clk_27m;
-- 
1.7.0.4
