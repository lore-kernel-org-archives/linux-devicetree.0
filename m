From: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 6/7] ARM: brcmstb: mask GIC IRQs on suspend
Date: Thu, 18 Jun 2015 17:11:35 -0700
Message-ID: <1434672696-13632-7-git-send-email-computersforpeace@gmail.com>
References: <1434672696-13632-1-git-send-email-computersforpeace@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1434672696-13632-1-git-send-email-computersforpeace@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

Lazily-masked IRQs can cause system suspend problems (e.g., spurious
wakeups from WFI), so we need to be sure non-wakeup GIC interrupts get
masked, not just disabled, during system suspend.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 arch/arm/mach-bcm/brcmstb.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/mach-bcm/brcmstb.c b/arch/arm/mach-bcm/brcmstb.c
index 3a60f7ee3f0c..8d9ec9d01306 100644
--- a/arch/arm/mach-bcm/brcmstb.c
+++ b/arch/arm/mach-bcm/brcmstb.c
@@ -12,11 +12,20 @@
  */
 
 #include <linux/init.h>
+#include <linux/irq.h>
+#include <linux/irqchip.h>
+#include <linux/irqchip/arm-gic.h>
 #include <linux/of_platform.h>
 
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
 
+static void __init brcmstb_init_irq(void)
+{
+	gic_set_irqchip_flags(IRQCHIP_MASK_ON_SUSPEND);
+	irqchip_init();
+}
+
 static const char *const brcmstb_match[] __initconst = {
 	"brcm,bcm7445",
 	"brcm,brcmstb",
@@ -25,4 +34,5 @@ static const char *const brcmstb_match[] __initconst = {
 
 DT_MACHINE_START(BRCMSTB, "Broadcom STB (Flattened Device Tree)")
 	.dt_compat	= brcmstb_match,
+	.init_irq	= brcmstb_init_irq,
 MACHINE_END
-- 
1.9.1
