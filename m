From: Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/2] irqchip/renesas-intc-irqpin: List fallback compatibility last
Date: Fri,  9 Dec 2016 11:50:49 +0100
Message-ID: <1481280650-9258-2-git-send-email-horms+renesas@verge.net.au>
References: <1481280650-9258-1-git-send-email-horms+renesas@verge.net.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1481280650-9258-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>
List-Id: devicetree@vger.kernel.org

Improve readability by listing the rmobile fallback compatibility string
after the more-specific compatibility strings they provide a fallback for.

This does not effect run-time behaviour as it is the order in the DTB that
determines which compatibility string is used.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/irqchip/irq-renesas-intc-irqpin.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-renesas-intc-irqpin.c b/drivers/irqchip/irq-renesas-intc-irqpin.c
index 713177d97c7a..5fe1207a079c 100644
--- a/drivers/irqchip/irq-renesas-intc-irqpin.c
+++ b/drivers/irqchip/irq-renesas-intc-irqpin.c
@@ -374,7 +374,6 @@ static const struct intc_irqpin_config intc_irqpin_rmobile = {
 };
 
 static const struct of_device_id intc_irqpin_dt_ids[] = {
-	{ .compatible = "renesas,intc-irqpin", },
 	{ .compatible = "renesas,intc-irqpin-r8a7778",
 	  .data = &intc_irqpin_irlm_r8a777x },
 	{ .compatible = "renesas,intc-irqpin-r8a7779",
@@ -383,6 +382,7 @@ static const struct of_device_id intc_irqpin_dt_ids[] = {
 	  .data = &intc_irqpin_rmobile },
 	{ .compatible = "renesas,intc-irqpin-sh73a0",
 	  .data = &intc_irqpin_rmobile },
+	{ .compatible = "renesas,intc-irqpin", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, intc_irqpin_dt_ids);
-- 
2.7.0.rc3.207.g0ac5344
