From: Zhou Yanjie <zhouyanjie@zoho.com>
Subject: [PATCH v3 8/8] irqchip: Ingenic: Add support for X1500.
Date: Mon, 15 Jul 2019 20:09:55 +0800
Message-ID: <1563192595-53546-9-git-send-email-zhouyanjie@zoho.com>
References: <1548517123-60058-1-git-send-email-zhouyanjie@zoho.com>
 <1563192595-53546-1-git-send-email-zhouyanjie@zoho.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1563192595-53546-1-git-send-email-zhouyanjie@zoho.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, paul.burton@mips.com, tglx@linutronix.de, robh+dt@kernel.org, mark.rutland@arm.com, jason@lakedaemon.net, marc.zyngier@arm.com
List-Id: devicetree@vger.kernel.org

Add support for probing the irq-ingenic driver on the
X1500 Soc from Ingenic.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 drivers/irqchip/irq-ingenic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-ingenic.c b/drivers/irqchip/irq-ingenic.c
index e8f7ae7..b72430c 100644
--- a/drivers/irqchip/irq-ingenic.c
+++ b/drivers/irqchip/irq-ingenic.c
@@ -180,3 +180,4 @@ IRQCHIP_DECLARE(jz4775_intc, "ingenic,jz4775-intc", intc_2chip_of_init);
 IRQCHIP_DECLARE(jz4780_intc, "ingenic,jz4780-intc", intc_2chip_of_init);
 IRQCHIP_DECLARE(x1000_intc, "ingenic,x1000-intc", intc_2chip_of_init);
 IRQCHIP_DECLARE(x1000e_intc, "ingenic,x1000e-intc", intc_2chip_of_init);
+IRQCHIP_DECLARE(x1500_intc, "ingenic,x1500-intc", intc_2chip_of_init);
-- 
2.7.4
