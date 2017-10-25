From: Ludovic Barre <ludovic.Barre-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH v2 5/9] irqchip: stm32: fix initial values
Date: Wed, 25 Oct 2017 19:11:01 +0200
Message-ID: <1508951465-17152-6-git-send-email-ludovic.Barre@st.com>
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

-After cold boot, imr default value depends on hardware configuration.
-After hot reboot the registers must be cleared to avoid residue.

Signed-off-by: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
---
 drivers/irqchip/irq-stm32-exti.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/irqchip/irq-stm32-exti.c b/drivers/irqchip/irq-stm32-exti.c
index d872dea..9715d57 100644
--- a/drivers/irqchip/irq-stm32-exti.c
+++ b/drivers/irqchip/irq-stm32-exti.c
@@ -260,7 +260,16 @@ __init stm32_exti_init(const struct stm32_exti_bank **stm32_exti_banks,
 		writel_relaxed(~0UL, base + stm32_bank->rtsr_ofst);
 		irqs_mask = readl_relaxed(base + stm32_bank->rtsr_ofst);
 		nr_exti = fls(readl_relaxed(base + stm32_bank->rtsr_ofst));
+
+		/*
+		 * This IP has no reset, so after hot reboot we should
+		 * clear registers to avoid residue
+		 */
+		writel_relaxed(0, base + stm32_bank->imr_ofst);
+		writel_relaxed(0, base + stm32_bank->emr_ofst);
 		writel_relaxed(0, base + stm32_bank->rtsr_ofst);
+		writel_relaxed(0, base + stm32_bank->ftsr_ofst);
+		writel_relaxed(~0UL, base + stm32_bank->pr_ofst);
 
 		pr_info("%s: bank%d, External IRQs available:%#x\n",
 			node->full_name, i, irqs_mask);
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
