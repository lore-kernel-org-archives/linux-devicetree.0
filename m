From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] ARM: ux500: decomission custom SMP TWD timer init
Date: Tue, 19 Nov 2013 22:39:10 +0100
Message-ID: <1384897150-16830-1-git-send-email-linus.walleij@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Rely solely on device tree matching to detect and probe the
SMP TWD timer and remove this custom hack.

Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/mach-ux500/timer.c | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/arch/arm/mach-ux500/timer.c b/arch/arm/mach-ux500/timer.c
index 1a9051b6f932..87efda0aa348 100644
--- a/arch/arm/mach-ux500/timer.c
+++ b/arch/arm/mach-ux500/timer.c
@@ -11,31 +11,11 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 
-#include <asm/smp_twd.h>
-
 #include "setup.h"
-#include "irqs.h"
 
 #include "db8500-regs.h"
 #include "id.h"
 
-#ifdef CONFIG_HAVE_ARM_TWD
-static DEFINE_TWD_LOCAL_TIMER(u8500_twd_local_timer,
-			      U8500_TWD_BASE, IRQ_LOCALTIMER);
-
-static void __init ux500_twd_init(void)
-{
-	struct twd_local_timer *twd_local_timer;
-
-	/* Use this to switch local timer base if changed in new ASICs */
-	twd_local_timer = &u8500_twd_local_timer;
-
-	clocksource_of_init();
-}
-#else
-#define ux500_twd_init()	do { } while(0)
-#endif
-
 const static struct of_device_id prcmu_timer_of_match[] __initconst = {
 	{ .compatible = "stericsson,db8500-prcmu-timer-4", },
 	{ },
@@ -64,5 +44,5 @@ void __init ux500_timer_init(void)
 
 dt_fail:
 	clksrc_dbx500_prcmu_init(prcmu_timer_base);
-	ux500_twd_init();
+	clocksource_of_init();
 }
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
