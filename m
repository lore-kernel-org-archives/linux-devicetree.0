From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 2/2] irqchip: sun4i: simplify sun4i_irq_ack
Date: Sat, 15 Mar 2014 16:04:54 +0100
Message-ID: <1394895894-8891-3-git-send-email-hdegoede@redhat.com>
References: <1394895894-8891-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDL4X2GMZUKRBH6YSGMQKGQEQEBXVZQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1394895894-8891-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Now that we only ack irq 0 the code can be simplified a lot.

Also switch from read / modify / write to a simple write clear:
1) This is what the android code does (it has a hack for acking irq 0
  in its unmask code doing this)
2) read / modify / write simply does not make sense for an irq status
  register like this, if the other bits are writeable (and the data sheet says
  they are not) they should be write 1 to clear, since otherwise a read /
  modify / write can race with a device raising an interrupt and then clear
  the pending bit unintentionally

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/irqchip/irq-sun4i.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-sun4i.c b/drivers/irqchip/irq-sun4i.c
index 6a8c88d..75615b5 100644
--- a/drivers/irqchip/irq-sun4i.c
+++ b/drivers/irqchip/irq-sun4i.c
@@ -41,16 +41,11 @@ static asmlinkage void __exception_irq_entry sun4i_handle_irq(struct pt_regs *re
 static void sun4i_irq_ack(struct irq_data *irqd)
 {
 	unsigned int irq = irqd_to_hwirq(irqd);
-	unsigned int irq_off = irq % 32;
-	int reg = irq / 32;
-	u32 val;
 
 	if (irq != 0)
 		return; /* Only IRQ 0 / the ENMI needs to be acked */
 
-	val = readl(sun4i_irq_base + SUN4I_IRQ_PENDING_REG(reg));
-	writel(val | (1 << irq_off),
-	       sun4i_irq_base + SUN4I_IRQ_PENDING_REG(reg));
+	writel(BIT(0), sun4i_irq_base + SUN4I_IRQ_PENDING_REG(0));
 }
 
 static void sun4i_irq_mask(struct irq_data *irqd)
-- 
1.9.0
