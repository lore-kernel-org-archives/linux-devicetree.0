From: Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH RESEND v1 5/5] irqchip/gic-v3: Allow interrupt to be configured as wake-up sources
Date: Fri, 17 Aug 2018 13:10:26 -0600
Message-ID: <20180817191026.32245-6-ilina@codeaurora.org>
References: <20180817191026.32245-1-ilina@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180817191026.32245-1-ilina@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: marc.zyngier@arm.com, bjorn.andersson@linaro.org, sboyd@kernel.org, evgreen@chromium.org, linus.walleij@linaro.org
Cc: rplsssn@codeaurora.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, rnayak@codeaurora.org, devicetree@vger.kernel.org, andy.gross@linaro.org, dianders@chromium.org
List-Id: devicetree@vger.kernel.org

From: Marc Zyngier <marc.zyngier@arm.com>

Although GICv3 doesn't directly offers support for wake-up interrupts
and relies on external HW for this, it shouldn't prevent the driver
for such HW from doing it work.

Let's set the required flags on the irq_chip structures.

Reported-by: Lina Iyer <ilina@codeaurora.org>
Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
---
 drivers/irqchip/irq-gic-v3.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 76ea56d779a1..2d71c79bc698 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -861,7 +861,9 @@ static struct irq_chip gic_chip = {
 	.irq_set_affinity	= gic_set_affinity,
 	.irq_get_irqchip_state	= gic_irq_get_irqchip_state,
 	.irq_set_irqchip_state	= gic_irq_set_irqchip_state,
-	.flags			= IRQCHIP_SET_TYPE_MASKED,
+	.flags			= IRQCHIP_SET_TYPE_MASKED |
+				  IRQCHIP_SKIP_SET_WAKE |
+				  IRQCHIP_MASK_ON_SUSPEND,
 };
 
 static struct irq_chip gic_eoimode1_chip = {
@@ -874,7 +876,9 @@ static struct irq_chip gic_eoimode1_chip = {
 	.irq_get_irqchip_state	= gic_irq_get_irqchip_state,
 	.irq_set_irqchip_state	= gic_irq_set_irqchip_state,
 	.irq_set_vcpu_affinity	= gic_irq_set_vcpu_affinity,
-	.flags			= IRQCHIP_SET_TYPE_MASKED,
+	.flags			= IRQCHIP_SET_TYPE_MASKED |
+				  IRQCHIP_SKIP_SET_WAKE |
+				  IRQCHIP_MASK_ON_SUSPEND,
 };
 
 #define GIC_ID_NR		(1U << gic_data.rdists.id_bits)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
