From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 3/3] ARM: brcmstb: Setup BIU control registers during boot
Date: Tue, 15 Sep 2015 11:15:00 -0700
Message-ID: <1442340900-15320-4-git-send-email-f.fainelli@gmail.com>
References: <1442340900-15320-1-git-send-email-f.fainelli@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1442340900-15320-1-git-send-email-f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Call brcmstb_biuctrl_init() in brcmstb's init_irq machine descriptor
callback since we need to setup the Bus Interface Unit before SMP in
particular, but we also need to be able to remap registers.

Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/mach-bcm/brcmstb.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/mach-bcm/brcmstb.c b/arch/arm/mach-bcm/brcmstb.c
index 3a60f7ee3f0c..99a67cfb7c0d 100644
--- a/arch/arm/mach-bcm/brcmstb.c
+++ b/arch/arm/mach-bcm/brcmstb.c
@@ -12,11 +12,19 @@
  */
 
 #include <linux/init.h>
+#include <linux/irqchip.h>
 #include <linux/of_platform.h>
+#include <linux/soc/brcmstb/brcmstb.h>
 
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
 
+static void __init brcmstb_init_irq(void)
+{
+	irqchip_init();
+	brcmstb_biuctrl_init();
+}
+
 static const char *const brcmstb_match[] __initconst = {
 	"brcm,bcm7445",
 	"brcm,brcmstb",
@@ -25,4 +33,5 @@ static const char *const brcmstb_match[] __initconst = {
 
 DT_MACHINE_START(BRCMSTB, "Broadcom STB (Flattened Device Tree)")
 	.dt_compat	= brcmstb_match,
+	.init_irq	= brcmstb_init_irq,
 MACHINE_END
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
