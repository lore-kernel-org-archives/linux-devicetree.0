From: Zhou Yanjie <zhouyanjie@zoho.com>
Subject: [PATCH v2 3/4] Irqchip: Ingenic: Add support for the X1000.
Date: Sun, 27 Jan 2019 23:50:31 +0800
Message-ID: <1548604232-19159-4-git-send-email-zhouyanjie@zoho.com>
References: <1548517123-60058-2-git-send-email-zhouyanjie@zoho.com>
 <1548604232-19159-1-git-send-email-zhouyanjie@zoho.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548604232-19159-1-git-send-email-zhouyanjie@zoho.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, paul.burton@mips.com, mark.rutland@arm.com, marc.zyngier@arm.com, jason@lakedaemon.net, tglx@linutronix.de, syq@debian.org, jiaxun.yang@flygoat.com, 772753199@qq.com
List-Id: devicetree@vger.kernel.org

Add support for probing the irq-ingenic driver on the X1000 Soc.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 drivers/irqchip/irq-ingenic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-ingenic.c b/drivers/irqchip/irq-ingenic.c
index 32d090a..814c68c 100644
--- a/drivers/irqchip/irq-ingenic.c
+++ b/drivers/irqchip/irq-ingenic.c
@@ -176,3 +176,4 @@ static int __init intc_2chip_of_init(struct device_node *node,
 IRQCHIP_DECLARE(jz4770_intc, "ingenic,jz4770-intc", intc_2chip_of_init);
 IRQCHIP_DECLARE(jz4775_intc, "ingenic,jz4775-intc", intc_2chip_of_init);
 IRQCHIP_DECLARE(jz4780_intc, "ingenic,jz4780-intc", intc_2chip_of_init);
+IRQCHIP_DECLARE(x1000_intc, "ingenic,x1000-intc", intc_2chip_of_init);
-- 
2.7.4
