From: Zhou Yanjie <zhouyanjie@zoho.com>
Subject: [PATCH v3 6/8] irqchip: Ingenic: Add support for X1000 and X1000E.
Date: Mon, 15 Jul 2019 20:09:53 +0800
Message-ID: <1563192595-53546-7-git-send-email-zhouyanjie@zoho.com>
References: <1548517123-60058-1-git-send-email-zhouyanjie@zoho.com>
 <1563192595-53546-1-git-send-email-zhouyanjie@zoho.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1563192595-53546-1-git-send-email-zhouyanjie@zoho.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, paul.burton@mips.com, tglx@linutronix.de, robh+dt@kernel.org, mark.rutland@arm.com, jason@lakedaemon.net, marc.zyngier@arm.com
List-Id: devicetree@vger.kernel.org

Add support for probing the irq-ingenic driver on the X1000 Soc
and the X1000E Soc from Ingenic.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 drivers/irqchip/irq-ingenic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/irqchip/irq-ingenic.c b/drivers/irqchip/irq-ingenic.c
index e9e959c..e8f7ae7 100644
--- a/drivers/irqchip/irq-ingenic.c
+++ b/drivers/irqchip/irq-ingenic.c
@@ -178,3 +178,5 @@ IRQCHIP_DECLARE(jz4760b_intc, "ingenic,jz4760b-intc", intc_2chip_of_init);
 IRQCHIP_DECLARE(jz4770_intc, "ingenic,jz4770-intc", intc_2chip_of_init);
 IRQCHIP_DECLARE(jz4775_intc, "ingenic,jz4775-intc", intc_2chip_of_init);
 IRQCHIP_DECLARE(jz4780_intc, "ingenic,jz4780-intc", intc_2chip_of_init);
+IRQCHIP_DECLARE(x1000_intc, "ingenic,x1000-intc", intc_2chip_of_init);
+IRQCHIP_DECLARE(x1000e_intc, "ingenic,x1000e-intc", intc_2chip_of_init);
-- 
2.7.4
