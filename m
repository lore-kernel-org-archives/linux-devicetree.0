From: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 4/8] bus: brcmstb_gisb: Correct hooking of ARM aborts
Date: Tue, 28 Mar 2017 14:34:27 -0700
Message-ID: <20170328213431.10904-5-opendmb@gmail.com>
References: <20170328213431.10904-1-opendmb@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170328213431.10904-1-opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, wangkefeng.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, james.morse-5wv7dgnIgG8@public.gmane.org, mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sandeepa.s.prabhu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, shijie.huang-5wv7dgnIgG8@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, suzuki.poulose-5wv7dgnIgG8@public.gmane.org, bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

The fault status reporting in the FSR registers is different depending
on whether the Long Physical Address Extension (LPAE) is being used.

This commit corrects the registerring of fault handlers for arm
architecture kernels when the LPAE is enabled.  It also forces the
handler to report that the abort exception was unhandled so that the
appropriate signal is sent to the offending user process.

Signed-off-by: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/bus/brcmstb_gisb.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/bus/brcmstb_gisb.c b/drivers/bus/brcmstb_gisb.c
index a94598d0945a..9eba0143f1a4 100644
--- a/drivers/bus/brcmstb_gisb.c
+++ b/drivers/bus/brcmstb_gisb.c
@@ -225,27 +225,29 @@ static int brcmstb_gisb_arb_decode_addr(struct brcmstb_gisb_arb_device *gdev,
 static int brcmstb_bus_error_handler(unsigned long addr, unsigned int fsr,
 				     struct pt_regs *regs)
 {
-	int ret = 0;
 	struct brcmstb_gisb_arb_device *gdev;
 
 	/* iterate over each GISB arb registered handlers */
 	list_for_each_entry(gdev, &brcmstb_gisb_arb_device_list, next)
-		ret |= brcmstb_gisb_arb_decode_addr(gdev, "bus error");
+		brcmstb_gisb_arb_decode_addr(gdev, "bus error");
+
+#if !defined(CONFIG_ARM_LPAE)
 	/*
 	 * If it was an imprecise abort, then we need to correct the
 	 * return address to be _after_ the instruction.
 	*/
 	if (fsr & (1 << 10))
 		regs->ARM_pc += 4;
+#endif
 
-	return ret;
+	/* Always report unhandled exception */
+	return 1;
 }
 #endif
 
 #ifdef CONFIG_MIPS
 static int brcmstb_bus_error_handler(struct pt_regs *regs, int is_fixup)
 {
-	int ret = 0;
 	struct brcmstb_gisb_arb_device *gdev;
 	u32 cap_status;
 
@@ -258,7 +260,7 @@ static int brcmstb_bus_error_handler(struct pt_regs *regs, int is_fixup)
 			goto out;
 		}
 
-		ret |= brcmstb_gisb_arb_decode_addr(gdev, "bus error");
+		brcmstb_gisb_arb_decode_addr(gdev, "bus error");
 	}
 out:
 	return is_fixup ? MIPS_BE_FIXUP : MIPS_BE_FATAL;
@@ -379,9 +381,16 @@ static int __init brcmstb_gisb_arb_probe(struct platform_device *pdev)
 	list_add_tail(&gdev->next, &brcmstb_gisb_arb_device_list);
 
 #ifdef CONFIG_ARM
+#ifdef CONFIG_ARM_LPAE
+	hook_fault_code(16, brcmstb_bus_error_handler, SIGBUS, 0,
+			"synchronous external abort");
+	hook_fault_code(17, brcmstb_bus_error_handler, SIGBUS, 0,
+			"asynchronous external abort");
+#else
 	hook_fault_code(22, brcmstb_bus_error_handler, SIGBUS, 0,
 			"imprecise external abort");
 #endif
+#endif /* CONFIG_ARM */
 #ifdef CONFIG_MIPS
 	board_be_handler = brcmstb_bus_error_handler;
 #endif
-- 
2.12.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
