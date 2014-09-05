From: Andrew Bresticker <abrestic@chromium.org>
Subject: [PATCH v2 08/16] irqchip: mips-gic: Implement generic irq_ack/irq_eoi callbacks
Date: Fri,  5 Sep 2014 10:30:10 -0700
Message-ID: <1409938218-9026-9-git-send-email-abrestic@chromium.org>
References: <1409938218-9026-1-git-send-email-abrestic@chromium.org>
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1409938218-9026-1-git-send-email-abrestic@chromium.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>
Cc: Andrew Bresticker <abrestic@chromium.org>, Jeffrey Deans <jeffrey.deans@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, Arnd Bergmann <arnd@arndb.de>, John Crispin <blogic@openwrt.org>, David Daney <ddaney.cavm@gmail.com>, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Implement a default gic_irq_ack() and gic_finish_irq().  These are
suitable for handling IPIs on Malta and the upcoming Danube board.

Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
---
No changes from v1.
---
 drivers/irqchip/irq-mips-gic.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index f29bb4e..0549768 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -239,6 +239,20 @@ static void gic_unmask_irq(struct irq_data *d)
 	GIC_SET_INTR_MASK(d->irq - gic_irq_base);
 }
 
+void __weak gic_irq_ack(struct irq_data *d)
+{
+	GIC_CLR_INTR_MASK(d->irq - gic_irq_base);
+
+	/* Clear edge detector */
+	if (gic_irq_flags[d->irq - gic_irq_base] & GIC_TRIG_EDGE)
+		GICWRITE(GIC_REG(SHARED, GIC_SH_WEDGE), d->irq - gic_irq_base);
+}
+
+void __weak gic_finish_irq(struct irq_data *d)
+{
+	GIC_SET_INTR_MASK(d->irq - gic_irq_base);
+}
+
 static int gic_set_type(struct irq_data *d, unsigned int type)
 {
 	unsigned int irq = d->irq - gic_irq_base;
-- 
2.1.0.rc2.206.gedb03e5
