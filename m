From: Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: [PATCH v4 2/7] irqdomain: Add back xlate and set_type for hierarchy
 irq domain
Date: Thu, 23 Oct 2014 23:53:10 +0800
Message-ID: <1414079595-26129-3-git-send-email-yingjoe.chen@mediatek.com>
References: <1414079595-26129-1-git-send-email-yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1414079595-26129-1-git-send-email-yingjoe.chen@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Jiang Liu <jiang.liu@linux.intel.com>, Marc Zyngier <marc.zyngier@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, arm@kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, yingjoe.chen@gmail.com, Boris BREZILLON <boris.brezillon@free-electrons.com>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, yh.chen@mediatek.com, nathan.chung@mediatek.com, Grant Likely <grant.likely@linaro.org>, Yingjoe Chen <yingjoe.chen@mediatek.com>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Hans de Goede <hdegoede@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com, hc.yen@mediatek.com, linux-kernel@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Olof Johansson <olof@lixom.net>
List-Id: devicetree@vger.kernel.org

Move xlate and set_type out to common code for hierarchy irq domain.
Withouth this common code, all outermost irq domain will have to duplicate
these function.

Signed-off-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
---
 kernel/irq/irqdomain.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index dd8d3ab..b3288e8 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -478,11 +478,6 @@ unsigned int irq_create_of_mapping(struct of_phandle_args *irq_data)
 		return 0;
 	}
 
-	if (irq_domain_is_hierarchy(domain)) {
-		virq = irq_domain_alloc_irqs(domain, 1, NUMA_NO_NODE, irq_data);
-		return virq <= 0 ? 0 : virq;
-	}
-
 	/* If domain has no translation, then we assume interrupt line */
 	if (domain->ops->xlate == NULL)
 		hwirq = irq_data->args[0];
@@ -492,10 +487,26 @@ unsigned int irq_create_of_mapping(struct of_phandle_args *irq_data)
 			return 0;
 	}
 
-	/* Create mapping */
-	virq = irq_create_mapping(domain, hwirq);
-	if (!virq)
-		return virq;
+	if (irq_domain_is_hierarchy(domain)) {
+		if (domain->ops->xlate) {
+			/*
+			 * If we've already configured this interrupt,
+			 * don't do it again, or hell will break loose.
+			 */
+			virq = irq_find_mapping(domain, hwirq);
+			if (virq)
+				return virq;
+		}
+
+		virq = irq_domain_alloc_irqs(domain, 1, NUMA_NO_NODE, irq_data);
+		if (virq <= 0)
+			return 0;
+	} else {
+		/* Create mapping */
+		virq = irq_create_mapping(domain, hwirq);
+		if (!virq)
+			return virq;
+	}
 
 	/* Set type if specified and different than the current one */
 	if (type != IRQ_TYPE_NONE &&
-- 
1.8.1.1.dirty
