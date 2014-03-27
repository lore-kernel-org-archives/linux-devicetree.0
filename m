From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/2] ARM: sun7i/sun6i: irqchip: Disable NMI
 before registering the handler
Date: Thu, 27 Mar 2014 18:02:39 +0100
Message-ID: <1395939759-11135-3-git-send-email-carlo@caione.org>
References: <1395939759-11135-1-git-send-email-carlo@caione.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDWJTUUC5UCBBBFT2GMQKGQEKOBBZRA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1395939759-11135-1-git-send-email-carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

It is advisable to disable the NMI before registering the IRQ handler as
registering the IRQ handler unmasks the IRQ on the GIC, so if U-Boot has
left the NMI enabled and the NMI pin is active we will immediately get
an interrupt before any driver has claimed the downstream interrupt of
the NMI.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
---
 drivers/irqchip/irq-sunxi-nmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-sunxi-nmi.c b/drivers/irqchip/irq-sunxi-nmi.c
index 1c8566c..12f547a 100644
--- a/drivers/irqchip/irq-sunxi-nmi.c
+++ b/drivers/irqchip/irq-sunxi-nmi.c
@@ -179,12 +179,12 @@ static int __init sunxi_sc_nmi_irq_init(struct device_node *node,
 	gc->chip_types[1].regs.type		= reg_offs->ctrl;
 	gc->chip_types[1].handler		= handle_edge_irq;
 
-	irq_set_handler_data(irq, domain);
-	irq_set_chained_handler(irq, sunxi_sc_nmi_handle_irq);
-
 	sunxi_sc_nmi_write(gc, reg_offs->enable, 0);
 	sunxi_sc_nmi_write(gc, reg_offs->pend, 0x1);
 
+	irq_set_handler_data(irq, domain);
+	irq_set_chained_handler(irq, sunxi_sc_nmi_handle_irq);
+
 	return 0;
 
 fail_irqd_remove:
-- 
1.8.4.1
