From: <suravee.suthikulpanit@amd.com>
Subject: [V9 PATCH 1/2] genirq: Add irq_chip_set_type_parent function
Date: Fri, 31 Oct 2014 03:26:29 -0500
Message-ID: <1414743990-28421-2-git-send-email-suravee.suthikulpanit@amd.com>
References: <1414743990-28421-1-git-send-email-suravee.suthikulpanit@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1414743990-28421-1-git-send-email-suravee.suthikulpanit@amd.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: marc.zyngier@arm.com, mark.rutland@arm.com, jason@lakedaemon.net, tglx@linutronix.de
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Catalin.Marinas@arm.com, liviu.dudau@arm.com, linux-kernel@vger.kernel.org, Will.Deacon@arm.com, Harish.Kasiviswanathan@amd.com, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>

Add a helper function to set irq type in parent irq domain.

Signed-off-by: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
---
 include/linux/irq.h |  1 +
 kernel/irq/chip.c   | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index 6159256..e3952fa 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -440,6 +440,7 @@ extern void irq_chip_ack_parent(struct irq_data *data);
 extern void irq_chip_mask_parent(struct irq_data *data);
 extern void irq_chip_unmask_parent(struct irq_data *data);
 extern void irq_chip_eoi_parent(struct irq_data *data);
+extern int irq_chip_set_type_parent(struct irq_data *data, unsigned int type);
 extern int irq_chip_set_affinity_parent(struct irq_data *data,
 				const struct cpumask *dest, bool force);
 extern int irq_chip_retrigger_hierarchy(struct irq_data *data);
diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index 0ecc270..b24eca3 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -847,6 +847,16 @@ void irq_chip_eoi_parent(struct irq_data *data)
 	data->chip->irq_eoi(data);
 }
 
+int irq_chip_set_type_parent(struct irq_data *data, unsigned int type)
+{
+	data = data->parent_data;
+
+	if (data->chip && data->chip->irq_set_type)
+		return data->chip->irq_set_type(data, type);
+
+	return -ENOSYS;
+}
+
 int irq_chip_set_affinity_parent(struct irq_data *data,
 				 const struct cpumask *dest, bool force)
 {
-- 
1.9.3
