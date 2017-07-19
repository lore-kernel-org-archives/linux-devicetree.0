From: Doug Berger <opendmb@gmail.com>
Subject: [PATCH v2 2/6] irqchip/tango: Use irq_gc_mask_disable_and_ack_set
Date: Wed, 19 Jul 2017 12:07:30 -0700
Message-ID: <20170719190734.18566-3-opendmb@gmail.com>
References: <20170719190734.18566-1-opendmb@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170719190734.18566-1-opendmb@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, Sebastian Frias <sf84@laposte.net>, Doug Berger <opendmb@gmail.com>, Jason Cooper <jason@lakedaemon.net>, linux-mips@linux-mips.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Marc Zyngier <marc.zyngier@arm.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Kevin Cernekee <cernekee@gmail.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Gregory Fong <gregory.0xf0@gmail.com>, Brian Norris <computersforpeace@gmail.com>, linux-arm-kernel@lists.infradead.org, Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
List-Id: devicetree@vger.kernel.org

From: Florian Fainelli <f.fainelli@gmail.com>

The only usage of the irq_gc_mask_disable_reg_and_ack() function
is by the Tango irqchip driver. This usage is replaced by the
irq_gc_mask_disable_and_ack_set() function since it provides the
intended functionality.

Fixes: 4bba66899ac6 ("irqchip/tango: Add support for Sigma Designs SMP86xx/SMP87xx interrupt controller")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
Acked-by: Mans Rullgard <mans@mansr.com>
Signed-off-by: Doug Berger <opendmb@gmail.com>
---
 drivers/irqchip/irq-tango.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-tango.c b/drivers/irqchip/irq-tango.c
index bdbb5c0ff7fe..0c085303a583 100644
--- a/drivers/irqchip/irq-tango.c
+++ b/drivers/irqchip/irq-tango.c
@@ -141,7 +141,7 @@ static void __init tangox_irq_init_chip(struct irq_chip_generic *gc,
 	for (i = 0; i < 2; i++) {
 		ct[i].chip.irq_ack = irq_gc_ack_set_bit;
 		ct[i].chip.irq_mask = irq_gc_mask_disable_reg;
-		ct[i].chip.irq_mask_ack = irq_gc_mask_disable_reg_and_ack;
+		ct[i].chip.irq_mask_ack = irq_gc_mask_disable_and_ack_set;
 		ct[i].chip.irq_unmask = irq_gc_unmask_enable_reg;
 		ct[i].chip.irq_set_type = tangox_irq_set_type;
 		ct[i].chip.name = gc->domain->name;
-- 
2.13.0
