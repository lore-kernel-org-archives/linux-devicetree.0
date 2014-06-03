From: Sricharan R <r.sricharan@ti.com>
Subject: [PATCH 01/14] irqchip: crossbar: remove IS_ERR_VALUE check
Date: Tue, 3 Jun 2014 13:12:53 +0530
Message-ID: <1401781386-4982-2-git-send-email-r.sricharan@ti.com>
References: <1401781386-4982-1-git-send-email-r.sricharan@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1401781386-4982-1-git-send-email-r.sricharan@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: tony@atomide.com, santosh.shilimkar@ti.com, nm@ti.com, rnayak@ti.com, tglx@linutronix.de, linux@arm.linux.org.uk, r.sricharan@ti.com
List-Id: devicetree@vger.kernel.org

From: Nishanth Menon <nm@ti.com>

IS_ERR_VALUE makes sense only *if* there could be valid values in
negative error range. But in the cases that we do use it, there is no
such case. Just remove the same.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 drivers/irqchip/irq-crossbar.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-crossbar.c b/drivers/irqchip/irq-crossbar.c
index de021638..c5415ae 100644
--- a/drivers/irqchip/irq-crossbar.c
+++ b/drivers/irqchip/irq-crossbar.c
@@ -110,15 +110,15 @@ static int crossbar_domain_xlate(struct irq_domain *d,
 				 unsigned long *out_hwirq,
 				 unsigned int *out_type)
 {
-	unsigned long ret;
+	int ret;
 
 	ret = get_prev_map_irq(intspec[1]);
-	if (!IS_ERR_VALUE(ret))
+	if (ret >= 0)
 		goto found;
 
 	ret = allocate_free_irq(intspec[1]);
 
-	if (IS_ERR_VALUE(ret))
+	if (ret < 0)
 		return ret;
 
 found:
-- 
1.7.9.5

