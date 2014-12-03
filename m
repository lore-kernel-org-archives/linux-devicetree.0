From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH 05/12] irqchip: nvic: increase number of external interrupts
 to 112
Date: Wed,  3 Dec 2014 01:12:04 +0100
Message-ID: <1417565531-4507-6-git-send-email-stefan@agner.ch>
References: <1417565531-4507-1-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1417565531-4507-1-git-send-email-stefan@agner.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawn.guo@linaro.org, kernel@pengutronix.de, linux@arm.linux.org.uk, u.kleine-koenig@pengutronix.de, jason@lakedaemon.net, olof@lixom.net, arnd@arndb.de, daniel.lezcano@linaro.org, tglx@linutronix.de, mark.rutland@arm.com, pawel.moll@arm.com, robh+dt@kernel.org, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: devicetree@vger.kernel.org, Stefan Agner <stefan@agner.ch>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

So far only vectors for up to 48 external interrupts have been
registred in the vector table. Increase the amount of registred
external vectors to 112. Also, add a warning in case NVIC reports
support for more interrupts than 128.

Note: the vector table must align to the number of entires in the
vector table, hence increase the alignment to 0x200.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm/kernel/entry-v7m.S | 6 +++---
 drivers/irqchip/irq-nvic.c  | 2 ++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm/kernel/entry-v7m.S b/arch/arm/kernel/entry-v7m.S
index 2260f18..754a1fa 100644
--- a/arch/arm/kernel/entry-v7m.S
+++ b/arch/arm/kernel/entry-v7m.S
@@ -115,7 +115,7 @@ ENTRY(__switch_to)
 ENDPROC(__switch_to)
 
 	.data
-	.align	8
+	.align	9
 /*
  * Vector table (64 words => 256 bytes natural alignment)
  */
@@ -136,6 +136,6 @@ ENTRY(vector_table)
 	.long	__invalid_entry		@ 13 - Reserved
 	.long	__pendsv_entry		@ 14 - PendSV
 	.long	__invalid_entry		@ 15 - SysTick
-	.rept	64 - 16
-	.long	__irq_entry		@ 16..64 - External Interrupts
+	.rept	128 - 16
+	.long	__irq_entry		@ 16..128 - External Interrupts
 	.endr
diff --git a/drivers/irqchip/irq-nvic.c b/drivers/irqchip/irq-nvic.c
index dbfb5be..40f62a9 100644
--- a/drivers/irqchip/irq-nvic.c
+++ b/drivers/irqchip/irq-nvic.c
@@ -137,6 +137,8 @@ static int __init nvic_of_init(struct device_node *node,
 	if (irqs > NVIC_MAX_IRQ)
 		irqs = NVIC_MAX_IRQ;
 
+	WARN(irqs > 128, "vector table in entry-v7m.S configured for 128 irqs");
+
 	nvic_irq_domain =
 		irq_domain_add_linear(node, irqs, &nvic_irq_domain_ops, NULL);
 	if (!nvic_irq_domain) {
-- 
2.1.3
