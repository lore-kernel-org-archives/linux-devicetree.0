From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 1/6] ARM: at91/dt: add specific DT soc init
Date: Fri,  2 Mar 2012 20:54:03 +0100
Message-ID: <1330718048-9314-1-git-send-email-plagnioj@jcrosoft.com>
References: <20120302192844.GB21255@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120302192844.GB21255-RQcB7r2h9QmfDR2tN2SG5Ni2O/JbrIOy@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This will allow to have static Device mapping and DT probe mapping for the
System Controller.

Temporary keep the call to ioremap_registers() until we have the binding
for the SDRAM/DDR Controller.

Temporary keep the main clock hardcoded to 12MHz until we have the binding
for the PMC.

Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
---
 arch/arm/mach-at91/board-dt.c |    8 +-------
 arch/arm/mach-at91/generic.h  |    1 +
 arch/arm/mach-at91/setup.c    |   18 ++++++++++++++++++
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mach-at91/board-dt.c b/arch/arm/mach-at91/board-dt.c
index 9f729d6..c18d4d3 100644
--- a/arch/arm/mach-at91/board-dt.c
+++ b/arch/arm/mach-at91/board-dt.c
@@ -30,12 +30,6 @@
 #include "generic.h"
 
 
-static void __init ek_init_early(void)
-{
-	/* Initialize processor: 12.000 MHz crystal */
-	at91_initialize(12000000);
-}
-
 static const struct of_device_id irq_of_match[] __initconst = {
 
 	{ .compatible = "atmel,at91rm9200-aic", .data = at91_aic_of_init },
@@ -65,7 +59,7 @@ DT_MACHINE_START(at91sam_dt, "Atmel AT91SAM (Device Tree)")
 	/* Maintainer: Atmel */
 	.timer		= &at91sam926x_timer,
 	.map_io		= at91_map_io,
-	.init_early	= ek_init_early,
+	.init_early	= at91_dt_initialize,
 	.init_irq	= at91_dt_init_irq,
 	.init_machine	= at91_dt_device_init,
 	.dt_compat	= at91_dt_board_compat,
diff --git a/arch/arm/mach-at91/generic.h b/arch/arm/mach-at91/generic.h
index 459f01a..d5f5083 100644
--- a/arch/arm/mach-at91/generic.h
+++ b/arch/arm/mach-at91/generic.h
@@ -20,6 +20,7 @@ extern void __init at91_init_sram(int bank, unsigned long base,
 extern void __init at91rm9200_set_type(int type);
 extern void __init at91_initialize(unsigned long main_clock);
 extern void __init at91x40_initialize(unsigned long main_clock);
+extern void __init at91_dt_initialize(void);
 
  /* Interrupts */
 extern void __init at91_init_irq_default(void);
diff --git a/arch/arm/mach-at91/setup.c b/arch/arm/mach-at91/setup.c
index 372396c..c0bd5a6 100644
--- a/arch/arm/mach-at91/setup.c
+++ b/arch/arm/mach-at91/setup.c
@@ -9,6 +9,7 @@
 #include <linux/io.h>
 #include <linux/mm.h>
 #include <linux/pm.h>
+#include <linux/of_address.h>
 
 #include <asm/mach/map.h>
 
@@ -285,6 +286,23 @@ void __init at91_ioremap_matrix(u32 base_addr)
 		panic("Impossible to ioremap at91_matrix_base\n");
 }
 
+#if defined(CONFIG_OF)
+void __init at91_dt_initialize(void)
+{
+	/* temporary until have the ramc binding*/
+	at91_boot_soc.ioremap_registers();
+
+	/* temporary until have the pmc binding */
+	/* Init clock subsystem */
+	at91_clock_init(12000000);
+
+	/* Register the processor-specific clocks */
+	at91_boot_soc.register_clocks();
+
+	at91_boot_soc.init();
+}
+#endif
+
 void __init at91_initialize(unsigned long main_clock)
 {
 	at91_boot_soc.ioremap_registers();
-- 
1.7.7
