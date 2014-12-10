From: Eddie Huang <eddie.huang@mediatek.com>
Subject: [PATCH 2/4] irqchip: mediatek: Add support for mt8173
Date: Wed, 10 Dec 2014 18:50:00 +0800
Message-ID: <1418208602-35584-3-git-send-email-eddie.huang@mediatek.com>
References: <1418208602-35584-1-git-send-email-eddie.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1418208602-35584-1-git-send-email-eddie.huang@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Jason Cooper <jason@lakedaemon.net>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, srv_heupstream@mediatek.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@linaro.org>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Robert Richter <rrichter@cavium.com>, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Olof Johansson <olof@lixom.net>, "Joe.C" <yingjoe.chen@mediatek.com>, Thomas Gleixner <tglx@linutronix.de>, Eddie Huang <eddie.huang@mediatek.com>, linux-arm-kernel@lists.infradead.org, yh.chen@mediatek.com
List-Id: devicetree@vger.kernel.org

From: Yingjoe Chen <yingjoe.chen@mediatek.com>

MT8173 intpol have 32 more irq pins, add support to it.

Signed-off-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
Signed-off-by: Eddie Huang <eddie.huang@mediatek.com>
---
 drivers/irqchip/irq-mtk-sysirq.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-mtk-sysirq.c b/drivers/irqchip/irq-mtk-sysirq.c
index 7e342df..c8c0cdb 100644
--- a/drivers/irqchip/irq-mtk-sysirq.c
+++ b/drivers/irqchip/irq-mtk-sysirq.c
@@ -24,6 +24,7 @@
 #include "irqchip.h"
 
 #define MT6577_SYS_INTPOL_NUM	(224)
+#define MT8173_SYS_INTPOL_NUM	(256)
 
 struct mtk_sysirq_chip_data {
 	spinlock_t lock;
@@ -120,7 +121,8 @@ static struct irq_domain_ops sysirq_domain_ops = {
 };
 
 static int __init mtk_sysirq_of_init(struct device_node *node,
-				     struct device_node *parent)
+				     struct device_node *parent,
+				     int intpol_num)
 {
 	struct irq_domain *domain, *domain_parent;
 	struct mtk_sysirq_chip_data *chip_data;
@@ -143,8 +145,7 @@ static int __init mtk_sysirq_of_init(struct device_node *node,
 		goto out_free;
 	}
 
-	domain = irq_domain_add_hierarchy(domain_parent, 0,
-					  MT6577_SYS_INTPOL_NUM, node,
+	domain = irq_domain_add_hierarchy(domain_parent, 0, intpol_num, node,
 					  &sysirq_domain_ops, chip_data);
 	if (!domain) {
 		ret = -ENOMEM;
@@ -160,4 +161,17 @@ out_free:
 	kfree(chip_data);
 	return ret;
 }
-IRQCHIP_DECLARE(mtk_sysirq, "mediatek,mt6577-sysirq", mtk_sysirq_of_init);
+
+static int __init mt6577_sysirq_of_init(struct device_node *node,
+					struct device_node *parent)
+{
+	return mtk_sysirq_of_init(node, parent, MT6577_SYS_INTPOL_NUM);
+}
+
+static int __init mt8173_sysirq_of_init(struct device_node *node,
+					struct device_node *parent)
+{
+	return mtk_sysirq_of_init(node, parent, MT8173_SYS_INTPOL_NUM);
+}
+IRQCHIP_DECLARE(mt6577_sysirq, "mediatek,mt6577-sysirq", mt6577_sysirq_of_init);
+IRQCHIP_DECLARE(mt8173_sysirq, "mediatek,mt8173-sysirq", mt8173_sysirq_of_init);
-- 
1.8.1.1.dirty
