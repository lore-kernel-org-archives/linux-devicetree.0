From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 2/4] irqchip: sun4i: Fix irq 0 not working
Date: Thu, 13 Mar 2014 19:03:52 +0100
Message-ID: <1394733834-26839-3-git-send-email-hdegoede@redhat.com>
References: <1394733834-26839-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDL4X2GMZUKRBFPGQ6MQKGQEHAAON6I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1394733834-26839-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

SUN4I_IRQ_VECTOR_REG containing 0 can mean one of 3 things:
1) no more irqs pending
2) irq 0 pending
3) spurious irq

So if we immediately get a reading of 0, check the irq-pending reg
to differentiate between 2 and 3. We only do this once to avoid
the extra check in the common case of 1) hapening after having
read the vector-reg once.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/irqchip/irq-sun4i.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-sun4i.c b/drivers/irqchip/irq-sun4i.c
index a5438d8..5c25048 100644
--- a/drivers/irqchip/irq-sun4i.c
+++ b/drivers/irqchip/irq-sun4i.c
@@ -140,10 +140,24 @@ static asmlinkage void __exception_irq_entry sun4i_handle_irq(struct pt_regs *re
 {
 	u32 irq, hwirq;
 
+	/*
+	 * hwirq == 0 can mean one of 3 things:
+	 * 1) no more irqs pending
+	 * 2) irq 0 pending
+	 * 3) spurious irq
+	 * So if we immediately get a reading of 0, check the irq-pending reg
+	 * to differentiate between 2 and 3. We only do this once to avoid
+	 * the extra check in the common case of 1 hapening after having
+	 * read the vector-reg once.
+	 */
 	hwirq = readl(sun4i_irq_base + SUN4I_IRQ_VECTOR_REG) >> 2;
-	while (hwirq != 0) {
+	if (hwirq == 0 &&
+		  !(readl(sun4i_irq_base + SUN4I_IRQ_PENDING_REG(0)) & BIT(0)))
+		return;
+
+	do {
 		irq = irq_find_mapping(sun4i_irq_domain, hwirq);
 		handle_IRQ(irq, regs);
 		hwirq = readl(sun4i_irq_base + SUN4I_IRQ_VECTOR_REG) >> 2;
-	}
+	} while (hwirq != 0);
 }
-- 
1.9.0
