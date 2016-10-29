From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM: BCM5301X: Add back handler ignoring external imprecise aborts
Date: Sat, 29 Oct 2016 13:12:29 +0200
Message-ID: <20161029111229.26875-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>

Since early BCM5301X days we got abort handler that was removed by
commit 937b12306ea79 ("ARM: BCM5301X: remove workaround imprecise abort
fault handler"). It assumed we need to deal only with pending aborts
left by the bootloader. Unfortunately this isn't true for BCM5301X.

When probing PCI config space (device enumeration) it is expected to
have master aborts on the PCI bus. Most bridges don't forward (or they
allow disabling it) these errors onto the AXI/AMBA bus but not the
Northstar (BCM5301X) one.

iProc PCIe controller on Northstar seems to be some older one, without
a control register for errors forwarding. It means we need to workaround
this at platform level. All newer platforms are not affected by this
issue.

Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
---
 arch/arm/mach-bcm/bcm_5301x.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/mach-bcm/bcm_5301x.c b/arch/arm/mach-bcm/bcm_5301x.c
index c8830a2..fe067f6 100644
--- a/arch/arm/mach-bcm/bcm_5301x.c
+++ b/arch/arm/mach-bcm/bcm_5301x.c
@@ -9,14 +9,42 @@
 #include <asm/hardware/cache-l2x0.h>
 
 #include <asm/mach/arch.h>
+#include <asm/siginfo.h>
+#include <asm/signal.h>
+
+#define FSR_EXTERNAL		(1 << 12)
+#define FSR_READ		(0 << 10)
+#define FSR_IMPRECISE		0x0406
 
 static const char *const bcm5301x_dt_compat[] __initconst = {
 	"brcm,bcm4708",
 	NULL,
 };
 
+static int bcm5301x_abort_handler(unsigned long addr, unsigned int fsr,
+				  struct pt_regs *regs)
+{
+	/*
+	 * We want to ignore aborts forwarded from the PCIe bus that are
+	 * expected and shouldn't really be passed by the PCIe controller.
+	 * The biggest disadvantage is the same FSR code may be reported when
+	 * reading non-existing APB register and we shouldn't ignore that.
+	 */
+	if (fsr == (FSR_EXTERNAL | FSR_READ | FSR_IMPRECISE))
+		return 0;
+
+	return 1;
+}
+
+static void __init bcm5301x_init_early(void)
+{
+	hook_fault_code(16 + 6, bcm5301x_abort_handler, SIGBUS, BUS_OBJERR,
+			"imprecise external abort");
+}
+
 DT_MACHINE_START(BCM5301X, "BCM5301X")
 	.l2c_aux_val	= 0,
 	.l2c_aux_mask	= ~0,
 	.dt_compat	= bcm5301x_dt_compat,
+	.init_early	= bcm5301x_init_early,
 MACHINE_END
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
