From: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Subject: [PATCHv4 03/13] ARM: vic: MULTI_IRQ_HANDLER handler
Date: Fri,  4 Nov 2011 01:10:00 +0000
Message-ID: <1320369010-23428-4-git-send-email-jamie@jamieiles.com>
References: <1320369010-23428-1-git-send-email-jamie@jamieiles.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1320369010-23428-1-git-send-email-jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
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
Cc: viresh.kumar-qxv4g6HH51o@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, hsweeten-3FF4nKcrg1dE2c76skzGb0EOCMrvLtNR@public.gmane.org, rajeev-dlh.kumar-qxv4g6HH51o@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, rubini-9wsNiZum9E8@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add a handler for the VIC that is suitable for MULTI_IRQ_HANDLER
platforms.  This can replace the ASM entry macros for platforms that use
the VIC.

v4:	- rebase ontop of move __exception and friends to
	  asm/exception.h
	- rework polling loop to handle as many irqs as possible in one go
v3:	- simplify irq handling loop as suggested by Grant
	- service interrupts from msb->lsb order
v2:	- allow the handler be used for !CONFIG_OF
	- use irq_domain_to_irq()

Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Signed-off-by: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
---
 arch/arm/common/vic.c               |   38 +++++++++++++++++++++++++++++++++++
 arch/arm/include/asm/hardware/vic.h |    3 ++
 2 files changed, 41 insertions(+), 0 deletions(-)

diff --git a/arch/arm/common/vic.c b/arch/arm/common/vic.c
index e689975..a82e3e0 100644
--- a/arch/arm/common/vic.c
+++ b/arch/arm/common/vic.c
@@ -30,6 +30,7 @@
 #include <linux/device.h>
 #include <linux/amba/bus.h>
 
+#include <asm/exception.h>
 #include <asm/mach/irq.h>
 #include <asm/hardware/vic.h>
 
@@ -427,3 +428,40 @@ int __init vic_of_init(struct device_node *node, struct device_node *parent)
 	return -EIO;
 }
 #endif /* CONFIG OF */
+
+#ifdef CONFIG_MULTI_IRQ_HANDLER
+/*
+ * Handle each interrupt in a single VIC.  Returns non-zero if we've
+ * handled at least one interrupt.  This does a single read of the
+ * status register and handles all interrupts in order from LSB first.
+ */
+static int handle_one_vic(struct vic_device *vic, struct pt_regs *regs)
+{
+	u32 stat, irq;
+	int handled = 0;
+
+	stat = readl_relaxed(vic->base + VIC_IRQ_STATUS);
+	while (stat) {
+		irq = ffs(stat) - 1;
+		handle_IRQ(irq_domain_to_irq(&vic->domain, irq), regs);
+		stat &= ~(1 << irq);
+		handled = 1;
+	}
+
+	return handled;
+}
+
+/*
+ * Keep iterating over all registered VIC's until there are no pending
+ * interrupts.
+ */
+asmlinkage void __exception_irq_entry vic_handle_irq(struct pt_regs *regs)
+{
+	int i, handled;
+
+	do {
+		for (i = 0, handled = 0; i < vic_id; ++i)
+			handled |= handle_one_vic(&vic_devices[i], regs);
+	} while (handled);
+}
+#endif /* CONFIG_MULTI_IRQ_HANDLER */
diff --git a/arch/arm/include/asm/hardware/vic.h b/arch/arm/include/asm/hardware/vic.h
index b348a54..f42ebd6 100644
--- a/arch/arm/include/asm/hardware/vic.h
+++ b/arch/arm/include/asm/hardware/vic.h
@@ -45,8 +45,11 @@
 #include <linux/types.h>
 
 struct device_node;
+struct pt_regs;
+
 void vic_init(void __iomem *base, unsigned int irq_start, u32 vic_sources, u32 resume_sources);
 int vic_of_init(struct device_node *node, struct device_node *parent);
+void vic_handle_irq(struct pt_regs *regs);
 
 #endif /* __ASSEMBLY__ */
 #endif
-- 
1.7.5.4
