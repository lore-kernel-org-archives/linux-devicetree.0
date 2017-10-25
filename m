From: Ludovic Barre <ludovic.Barre-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH v2 6/9] irqchip: stm32: move the wakeup on interrupt mask
Date: Wed, 25 Oct 2017 19:11:02 +0200
Message-ID: <1508951465-17152-7-git-send-email-ludovic.Barre@st.com>
References: <1508951465-17152-1-git-send-email-ludovic.Barre@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1508951465-17152-1-git-send-email-ludovic.Barre-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>

Move irq_set_wake on interrupt mask, needed to wake up from
low power mode as the event mask is not able to do so.

Signed-off-by: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
---
 drivers/irqchip/irq-stm32-exti.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-stm32-exti.c b/drivers/irqchip/irq-stm32-exti.c
index 9715d57..3e4ee25 100644
--- a/drivers/irqchip/irq-stm32-exti.c
+++ b/drivers/irqchip/irq-stm32-exti.c
@@ -156,16 +156,16 @@ static int stm32_irq_set_wake(struct irq_data *data, unsigned int on)
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(data);
 	const struct stm32_exti_bank *stm32_bank = gc->private;
 	int pin = data->hwirq % IRQS_PER_BANK;
-	u32 emr;
+	u32 imr;
 
 	irq_gc_lock(gc);
 
-	emr = irq_reg_readl(gc, stm32_bank->emr_ofst);
+	imr = irq_reg_readl(gc, stm32_bank->imr_ofst);
 	if (on)
-		emr |= BIT(pin);
+		imr |= BIT(pin);
 	else
-		emr &= ~BIT(pin);
-	irq_reg_writel(gc, emr, stm32_bank->emr_ofst);
+		imr &= ~BIT(pin);
+	irq_reg_writel(gc, imr, stm32_bank->imr_ofst);
 
 	irq_gc_unlock(gc);
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
