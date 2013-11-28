From: Boris BREZILLON <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v4 1/6] ARM: at91: prepare sama5 dt boards transition to common clk
Date: Thu, 28 Nov 2013 15:50:03 +0100
Message-ID: <1385650204-8834-1-git-send-email-b.brezillon@overkiz.com>
References: <1385650171-8756-1-git-send-email-b.brezillon@overkiz.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1385650171-8756-1-git-send-email-b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Boris BREZILLON <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch prepare the transition to common clk for sama5 dt boards by
replacing the timer init callback.

Clocks registration cannot be done in early init callback (as formerly done
by the old clk implementation) because it requires dynamic allocation
which is not ready yet during early init.

In the other hand, at91 clocks must be registered before
at91sam926x_pit_init is called because PIT (Periodic Interval Timer) driver
request the master clk (mck).

A new function (at91sama5_dt_timer_init) is created to fullfil these needs.
This function registers all at91 clks using the dt definition before
calling the PIT init function.
The device tree clock registration is enabled only if common clk is
selected. Else the old clk registration is been done during
at91_dt_initialize call.

Signed-off-by: Boris BREZILLON <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
---
 arch/arm/mach-at91/board-dt-sama5.c |   10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-at91/board-dt-sama5.c b/arch/arm/mach-at91/board-dt-sama5.c
index bf00d15..075ec05 100644
--- a/arch/arm/mach-at91/board-dt-sama5.c
+++ b/arch/arm/mach-at91/board-dt-sama5.c
@@ -16,6 +16,7 @@
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/phy.h>
+#include <linux/clk-provider.h>
 
 #include <asm/setup.h>
 #include <asm/irq.h>
@@ -26,6 +27,13 @@
 #include "at91_aic.h"
 #include "generic.h"
 
+static void __init sama5_dt_timer_init(void)
+{
+#if defined(CONFIG_COMMON_CLK)
+	of_clk_init(NULL);
+#endif
+	at91sam926x_pit_init();
+}
 
 static const struct of_device_id irq_of_match[] __initconst = {
 
@@ -72,7 +80,7 @@ static const char *sama5_dt_board_compat[] __initdata = {
 
 DT_MACHINE_START(sama5_dt, "Atmel SAMA5 (Device Tree)")
 	/* Maintainer: Atmel */
-	.init_time	= at91sam926x_pit_init,
+	.init_time	= sama5_dt_timer_init,
 	.map_io		= at91_map_io,
 	.handle_irq	= at91_aic5_handle_irq,
 	.init_early	= at91_dt_initialize,
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
