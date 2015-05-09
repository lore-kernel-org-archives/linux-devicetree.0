From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH v6 02/12] genirq: generic chip: support hierarchy domain
Date: Sat,  9 May 2015 22:39:32 +0200
Message-ID: <1431203982-13217-3-git-send-email-stefan@agner.ch>
References: <1431203982-13217-1-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1431203982-13217-1-git-send-email-stefan@agner.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawn.guo@linaro.org, kernel@pengutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, pawel.moll@arm.com, arnd@arndb.de, ijc+devicetree@hellion.org.uk, daniel.lezcano@linaro.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>, robh+dt@kernel.org, mcoquelin.stm32@gmail.com, u.kleine-koenig@pengutronix.de, olof@lixom.net, galak@codeaurora.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Use the new helper function irq_domain_set_info to make sure the
function irq_domain_set_hwirq_and_chip is being called, which is
crucial to save irqdomain specific data to irq_data.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 kernel/irq/generic-chip.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/kernel/irq/generic-chip.c b/kernel/irq/generic-chip.c
index 61024e8..15b370d 100644
--- a/kernel/irq/generic-chip.c
+++ b/kernel/irq/generic-chip.c
@@ -360,7 +360,7 @@ static struct lock_class_key irq_nested_lock_class;
 int irq_map_generic_chip(struct irq_domain *d, unsigned int virq,
 			 irq_hw_number_t hw_irq)
 {
-	struct irq_data *data = irq_get_irq_data(virq);
+	struct irq_data *data = irq_domain_get_irq_data(d, virq);
 	struct irq_domain_chip_generic *dgc = d->gc;
 	struct irq_chip_generic *gc;
 	struct irq_chip_type *ct;
@@ -405,8 +405,7 @@ int irq_map_generic_chip(struct irq_domain *d, unsigned int virq,
 	else
 		data->mask = 1 << idx;
 
-	irq_set_chip_and_handler(virq, chip, ct->handler);
-	irq_set_chip_data(virq, gc);
+	irq_domain_set_info(d, virq, hw_irq, chip, gc, ct->handler, NULL, NULL);
 	irq_modify_status(virq, dgc->irq_flags_to_clear, dgc->irq_flags_to_set);
 	return 0;
 }
-- 
2.4.0
