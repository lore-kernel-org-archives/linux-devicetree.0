From: Ludovic Barre <ludovic.Barre@st.com>
Subject: [PATCH 1/1] irqchip/stm32: add exti0 translation for stm32mp1
Date: Tue, 17 Jul 2018 14:14:27 +0200
Message-ID: <1531829667-22928-1-git-send-email-ludovic.Barre@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Ludovic Barre <ludovic.barre@st.com>
List-Id: devicetree@vger.kernel.org

From: Ludovic Barre <ludovic.barre@st.com>

This patch fixes a datasheet issue, in the draft version the "exti0"
was not connected whereas is it.

Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
---
 drivers/irqchip/irq-stm32-exti.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-stm32-exti.c b/drivers/irqchip/irq-stm32-exti.c
index 3a7e890..3df527f 100644
--- a/drivers/irqchip/irq-stm32-exti.c
+++ b/drivers/irqchip/irq-stm32-exti.c
@@ -159,6 +159,7 @@ static const struct stm32_exti_bank *stm32mp1_exti_banks[] = {
 };
 
 static const struct stm32_desc_irq stm32mp1_desc_irq[] = {
+	{ .exti = 0, .irq_parent = 6 },
 	{ .exti = 1, .irq_parent = 7 },
 	{ .exti = 2, .irq_parent = 8 },
 	{ .exti = 3, .irq_parent = 9 },
-- 
2.7.4
