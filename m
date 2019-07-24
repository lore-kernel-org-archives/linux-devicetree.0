From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Subject: [PATCH v2 1/3] ARCv2: IDU-intc: Add support for edge-triggered interrupts
Date: Wed, 24 Jul 2019 14:04:34 +0200
Message-ID: <20190724120436.8537-1-mischa.jonker@synopsys.com>
References: <CY4PR1201MB0120EDD4173511912A9FC99EA1C60@CYPR1201MB0120.namprd12.prod.outlook.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CY4PR1201MB0120EDD4173511912A9FC99EA1C60@CYPR1201MB0120.namprd12.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexey.Brodkin@synopsys.com, Vineet.Gupta1@synopsys.com, kstewart@linuxfoundation.org, tglx@linutronix.de, robh+dt@kernel.org, linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Mischa Jonker <Mischa.Jonker@synopsys.com>
List-Id: devicetree@vger.kernel.org

This adds support for an optional extra interrupt cell to specify edge
vs level triggered. It is backward compatible with dts files with only
one cell, and will default to level-triggered in such a case.

Note that I had to make a change to idu_irq_set_affinity as well, as
this function was setting the interrupt type to "level" unconditionally,
since this was the only type supported previously.

Signed-off-by: Mischa Jonker <mischa.jonker@synopsys.com>
---
 arch/arc/kernel/mcip.c | 60 +++++++++++++++++++++++++++++++++++++++++++++-----
 include/soc/arc/mcip.h | 11 +++++++++
 2 files changed, 65 insertions(+), 6 deletions(-)

diff --git a/arch/arc/kernel/mcip.c b/arch/arc/kernel/mcip.c
index 18b493d..abf9398 100644
--- a/arch/arc/kernel/mcip.c
+++ b/arch/arc/kernel/mcip.c
@@ -202,8 +202,8 @@ static void idu_set_dest(unsigned int cmn_irq, unsigned int cpu_mask)
 	__mcip_cmd_data(CMD_IDU_SET_DEST, cmn_irq, cpu_mask);
 }
 
-static void idu_set_mode(unsigned int cmn_irq, unsigned int lvl,
-			   unsigned int distr)
+static void idu_set_mode(unsigned int cmn_irq, bool set_lvl, unsigned int lvl,
+			 bool set_distr, unsigned int distr)
 {
 	union {
 		unsigned int word;
@@ -212,8 +212,11 @@ static void idu_set_mode(unsigned int cmn_irq, unsigned int lvl,
 		};
 	} data;
 
-	data.distr = distr;
-	data.lvl = lvl;
+	data.word = __mcip_cmd_read(CMD_IDU_READ_MODE, cmn_irq);
+	if (set_distr)
+		data.distr = distr;
+	if (set_lvl)
+		data.lvl = lvl;
 	__mcip_cmd_data(CMD_IDU_SET_MODE, cmn_irq, data.word);
 }
 
@@ -240,6 +243,25 @@ static void idu_irq_unmask(struct irq_data *data)
 	raw_spin_unlock_irqrestore(&mcip_lock, flags);
 }
 
+static void idu_irq_ack(struct irq_data *data)
+{
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&mcip_lock, flags);
+	__mcip_cmd(CMD_IDU_ACK_CIRQ, data->hwirq);
+	raw_spin_unlock_irqrestore(&mcip_lock, flags);
+}
+
+static void idu_irq_mask_ack(struct irq_data *data)
+{
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&mcip_lock, flags);
+	__mcip_cmd_data(CMD_IDU_SET_MASK, data->hwirq, 1);
+	__mcip_cmd(CMD_IDU_ACK_CIRQ, data->hwirq);
+	raw_spin_unlock_irqrestore(&mcip_lock, flags);
+}
+
 static int
 idu_irq_set_affinity(struct irq_data *data, const struct cpumask *cpumask,
 		     bool force)
@@ -263,13 +285,36 @@ idu_irq_set_affinity(struct irq_data *data, const struct cpumask *cpumask,
 	else
 		distribution_mode = IDU_M_DISTRI_RR;
 
-	idu_set_mode(data->hwirq, IDU_M_TRIG_LEVEL, distribution_mode);
+	idu_set_mode(data->hwirq, false, 0, true, distribution_mode);
 
 	raw_spin_unlock_irqrestore(&mcip_lock, flags);
 
 	return IRQ_SET_MASK_OK;
 }
 
+static int idu_irq_set_type(struct irq_data *data, u32 type)
+{
+	unsigned long flags;
+
+	/*
+	 * ARCv2 IDU HW does not support inverse polarity, so these are the
+	 * only interrupt types supported.
+	 */
+	if (type & ~(IRQ_TYPE_EDGE_RISING | IRQ_TYPE_LEVEL_HIGH))
+		return -EINVAL;
+
+	raw_spin_lock_irqsave(&mcip_lock, flags);
+
+	idu_set_mode(data->hwirq, true,
+		     type & IRQ_TYPE_EDGE_RISING ? IDU_M_TRIG_EDGE :
+						   IDU_M_TRIG_LEVEL,
+		     false, 0);
+
+	raw_spin_unlock_irqrestore(&mcip_lock, flags);
+
+	return 0;
+}
+
 static void idu_irq_enable(struct irq_data *data)
 {
 	/*
@@ -289,7 +334,10 @@ static struct irq_chip idu_irq_chip = {
 	.name			= "MCIP IDU Intc",
 	.irq_mask		= idu_irq_mask,
 	.irq_unmask		= idu_irq_unmask,
+	.irq_ack		= idu_irq_ack,
+	.irq_mask_ack		= idu_irq_mask_ack,
 	.irq_enable		= idu_irq_enable,
+	.irq_set_type		= idu_irq_set_type,
 #ifdef CONFIG_SMP
 	.irq_set_affinity       = idu_irq_set_affinity,
 #endif
@@ -317,7 +365,7 @@ static int idu_irq_map(struct irq_domain *d, unsigned int virq, irq_hw_number_t
 }
 
 static const struct irq_domain_ops idu_irq_ops = {
-	.xlate	= irq_domain_xlate_onecell,
+	.xlate	= irq_domain_xlate_onetwocell,
 	.map	= idu_irq_map,
 };
 
diff --git a/include/soc/arc/mcip.h b/include/soc/arc/mcip.h
index 50f49e0..d1a93c7 100644
--- a/include/soc/arc/mcip.h
+++ b/include/soc/arc/mcip.h
@@ -46,7 +46,9 @@ struct mcip_cmd {
 #define CMD_IDU_ENABLE			0x71
 #define CMD_IDU_DISABLE			0x72
 #define CMD_IDU_SET_MODE		0x74
+#define CMD_IDU_READ_MODE		0x75
 #define CMD_IDU_SET_DEST		0x76
+#define CMD_IDU_ACK_CIRQ		0x79
 #define CMD_IDU_SET_MASK		0x7C
 
 #define IDU_M_TRIG_LEVEL		0x0
@@ -119,4 +121,13 @@ static inline void __mcip_cmd_data(unsigned int cmd, unsigned int param,
 	__mcip_cmd(cmd, param);
 }
 
+/*
+ * Read MCIP register
+ */
+static inline unsigned int __mcip_cmd_read(unsigned int cmd, unsigned int param)
+{
+	__mcip_cmd(cmd, param);
+	return read_aux_reg(ARC_REG_MCIP_READBACK);
+}
+
 #endif
-- 
2.8.3
