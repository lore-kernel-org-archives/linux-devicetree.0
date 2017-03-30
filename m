From: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 4/6] bus: brcmstb_gisb: remove low-level ARM hooks
Date: Wed, 29 Mar 2017 17:29:12 -0700
Message-ID: <20170330002914.7371-5-opendmb@gmail.com>
References: <20170330002914.7371-1-opendmb@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170330002914.7371-1-opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, suzuki.poulose-5wv7dgnIgG8@public.gmane.org, bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The ARM architecture can provide meaningful diagnostic
output from the GISB arbiter solely from interrupts and
notifiers without the need to hook the low level fault
handlers.

Signed-off-by: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/bus/brcmstb_gisb.c | 30 ------------------------------
 1 file changed, 30 deletions(-)

diff --git a/drivers/bus/brcmstb_gisb.c b/drivers/bus/brcmstb_gisb.c
index a2e1c5c25a3a..3fbc116e6b95 100644
--- a/drivers/bus/brcmstb_gisb.c
+++ b/drivers/bus/brcmstb_gisb.c
@@ -28,11 +28,6 @@
 #include <linux/kdebug.h>
 #include <linux/notifier.h>
 
-#ifdef CONFIG_ARM
-#include <asm/bug.h>
-#include <asm/signal.h>
-#endif
-
 #ifdef CONFIG_MIPS
 #include <asm/traps.h>
 #endif
@@ -228,27 +223,6 @@ static int brcmstb_gisb_arb_decode_addr(struct brcmstb_gisb_arb_device *gdev,
 	return 0;
 }
 
-#ifdef CONFIG_ARM
-static int brcmstb_bus_error_handler(unsigned long addr, unsigned int fsr,
-				     struct pt_regs *regs)
-{
-	int ret = 0;
-	struct brcmstb_gisb_arb_device *gdev;
-
-	/* iterate over each GISB arb registered handlers */
-	list_for_each_entry(gdev, &brcmstb_gisb_arb_device_list, next)
-		ret |= brcmstb_gisb_arb_decode_addr(gdev, "bus error");
-	/*
-	 * If it was an imprecise abort, then we need to correct the
-	 * return address to be _after_ the instruction.
-	*/
-	if (fsr & (1 << 10))
-		regs->ARM_pc += 4;
-
-	return ret;
-}
-#endif
-
 #ifdef CONFIG_MIPS
 static int brcmstb_bus_error_handler(struct pt_regs *regs, int is_fixup)
 {
@@ -415,10 +389,6 @@ static int __init brcmstb_gisb_arb_probe(struct platform_device *pdev)
 
 	list_add_tail(&gdev->next, &brcmstb_gisb_arb_device_list);
 
-#ifdef CONFIG_ARM
-	hook_fault_code(22, brcmstb_bus_error_handler, SIGBUS, 0,
-			"imprecise external abort");
-#endif
 #ifdef CONFIG_MIPS
 	board_be_handler = brcmstb_bus_error_handler;
 #endif
-- 
2.12.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
