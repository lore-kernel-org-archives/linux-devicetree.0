From: Joe.C <yingjoe.chen@mediatek.com>
Subject: [PATCH v3 2/7] genirq: Add more helper functions to support stacked
 irq_chip
Date: Thu, 9 Oct 2014 22:29:35 +0800
Message-ID: <1412864980-20273-3-git-send-email-yingjoe.chen@mediatek.com>
References: <1412864980-20273-1-git-send-email-yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1412864980-20273-1-git-send-email-yingjoe.chen@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arm@kernel.org, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jiang Liu <jiang.liu@linux.intel.com>, Marc Zyngier <marc.zyngier@arm.com>, Mark Rutland <mark.rutland@arm.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Sricharan R <r.sricharan@ti.com>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@arm.linux.org.uk>, yingjoe.chen@gmail.com, yh.chen@mediatek.com, nathan.chung@mediatek.com, Grant Likely <grant.likely@linaro.org>, "Joe.C" <yingjoe.chen@mediatek.com>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, Matt Porter <mporter@linaro.org>, Marc Carino <marc.ceeeee@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com, hc.yen@mediatek.com, linux-kernel@vger.kernel.org, Santosh Shilimkar <santosh.shilimkar@ti.com>, Sascha Hauer <kernel@pengutronix.de>, Olof Johansson <olof@lixom.net>
List-Id: devicetree@vger.kernel.org

From: "Joe.C" <yingjoe.chen@mediatek.com>

Add more helper function for stacked irq_chip to just call parent's
function.

Signed-off-by: Joe.C <yingjoe.chen@mediatek.com>
---
 include/linux/irq.h |  5 +++++
 kernel/irq/chip.c   | 28 ++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index 07abf5a..6159256 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -437,6 +437,11 @@ extern void handle_nested_irq(unsigned int irq);
 
 #ifdef	CONFIG_IRQ_DOMAIN_HIERARCHY
 extern void irq_chip_ack_parent(struct irq_data *data);
+extern void irq_chip_mask_parent(struct irq_data *data);
+extern void irq_chip_unmask_parent(struct irq_data *data);
+extern void irq_chip_eoi_parent(struct irq_data *data);
+extern int irq_chip_set_affinity_parent(struct irq_data *data,
+				const struct cpumask *dest, bool force);
 extern int irq_chip_retrigger_hierarchy(struct irq_data *data);
 #endif
 
diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index 58ed9ed..0ecc270 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -829,6 +829,34 @@ void irq_chip_ack_parent(struct irq_data *data)
 	data->chip->irq_ack(data);
 }
 
+void irq_chip_mask_parent(struct irq_data *data)
+{
+	data = data->parent_data;
+	data->chip->irq_mask(data);
+}
+
+void irq_chip_unmask_parent(struct irq_data *data)
+{
+	data = data->parent_data;
+	data->chip->irq_unmask(data);
+}
+
+void irq_chip_eoi_parent(struct irq_data *data)
+{
+	data = data->parent_data;
+	data->chip->irq_eoi(data);
+}
+
+int irq_chip_set_affinity_parent(struct irq_data *data,
+				 const struct cpumask *dest, bool force)
+{
+	data = data->parent_data;
+	if (data->chip->irq_set_affinity)
+		return data->chip->irq_set_affinity(data, dest, force);
+
+	return -ENOSYS;
+}
+
 int irq_chip_retrigger_hierarchy(struct irq_data *data)
 {
 	for (data = data->parent_data; data; data = data->parent_data)
-- 
1.8.1.1.dirty
