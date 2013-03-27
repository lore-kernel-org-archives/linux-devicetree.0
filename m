From: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v2 3/5] ARM: imx27 DT init cpufreq-cpu0 device
Date: Wed, 27 Mar 2013 14:01:32 +0100
Message-ID: <1364389294-1997-4-git-send-email-mpa@pengutronix.de>
References: <1364389294-1997-1-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1364389294-1997-1-git-send-email-mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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
To: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Adds cpufreq-cpu0 platform device for imx27 DT init and adds a clock
registration for cpufreq-cpu0 device.

Signed-off-by: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 arch/arm/mach-imx/clk-imx27.c | 2 +-
 arch/arm/mach-imx/imx27-dt.c  | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-imx/clk-imx27.c b/arch/arm/mach-imx/clk-imx27.c
index 30b3242..c1d59b8 100644
--- a/arch/arm/mach-imx/clk-imx27.c
+++ b/arch/arm/mach-imx/clk-imx27.c
@@ -276,7 +276,7 @@ int __init mx27_clocks_init(unsigned long fref)
 	clk_register_clkdev(clk[ata_ahb_gate], "ata", NULL);
 	clk_register_clkdev(clk[rtc_ipg_gate], NULL, "imx21-rtc");
 	clk_register_clkdev(clk[scc_ipg_gate], "scc", NULL);
-	clk_register_clkdev(clk[cpu_div], "cpu", NULL);
+	clk_register_clkdev(clk[cpu_div], NULL, "cpufreq-cpu0.0");
 	clk_register_clkdev(clk[emi_ahb_gate], "emi_ahb" , NULL);
 	clk_register_clkdev(clk[ssi1_baud_gate], "bitrate" , "imx-ssi.0");
 	clk_register_clkdev(clk[ssi2_baud_gate], "bitrate" , "imx-ssi.1");
diff --git a/arch/arm/mach-imx/imx27-dt.c b/arch/arm/mach-imx/imx27-dt.c
index c915a49..2d7ff9d 100644
--- a/arch/arm/mach-imx/imx27-dt.c
+++ b/arch/arm/mach-imx/imx27-dt.c
@@ -35,8 +35,11 @@ static const struct of_dev_auxdata imx27_auxdata_lookup[] __initconst = {
 
 static void __init imx27_dt_init(void)
 {
+	struct platform_device_info devinfo = { .name = "cpufreq-cpu0", };
+
 	of_platform_populate(NULL, of_default_bus_match_table,
 			     imx27_auxdata_lookup, NULL);
+	platform_device_register_full(&devinfo);
 }
 
 static const char * const imx27_dt_board_compat[] __initconst = {
-- 
1.8.1.5
