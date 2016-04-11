From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 2/5] genirq: Allow the affinity of a percpu interrupt to be set/retrieved
Date: Mon, 11 Apr 2016 09:57:52 +0100
Message-ID: <1460365075-7316-3-git-send-email-marc.zyngier@arm.com>
References: <1460365075-7316-1-git-send-email-marc.zyngier@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1460365075-7316-1-git-send-email-marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

In order to prepare the genirq layer for the concept of partitionned
percpu interrupts, let's allow an affinity to be associated with
such an interrupt. We introduce:

- irq_set_percpu_devid_partition: flag an interrupt as a percpu-devid
  interrupt, and associate it with an affinity
- irq_get_percpu_devid_partition: allow the affinity of that interrupt
  to be retrieved.

This will allow a driver to discover which CPUs the per-cpu interrupt
can actually fire on.

Signed-off-by: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
---
 include/linux/irq.h     |  4 ++++
 include/linux/irqdesc.h |  1 +
 kernel/irq/irqdesc.c    | 26 +++++++++++++++++++++++++-
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index c4de623..4d758a7 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -530,6 +530,10 @@ static inline void irq_set_chip_and_handler(unsigned int irq, struct irq_chip *c
 }
 
 extern int irq_set_percpu_devid(unsigned int irq);
+extern int irq_set_percpu_devid_partition(unsigned int irq,
+					  const struct cpumask *affinity);
+extern int irq_get_percpu_devid_partition(unsigned int irq,
+					  struct cpumask *affinity);
 
 extern void
 __irq_set_handler(unsigned int irq, irq_flow_handler_t handle, int is_chained,
diff --git a/include/linux/irqdesc.h b/include/linux/irqdesc.h
index dcca77c..b51beeb 100644
--- a/include/linux/irqdesc.h
+++ b/include/linux/irqdesc.h
@@ -66,6 +66,7 @@ struct irq_desc {
 	int			threads_handled_last;
 	raw_spinlock_t		lock;
 	struct cpumask		*percpu_enabled;
+	const struct cpumask	*percpu_affinity;
 #ifdef CONFIG_SMP
 	const struct cpumask	*affinity_hint;
 	struct irq_affinity_notify *affinity_notify;
diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
index 0ccd028..8731e1c 100644
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -595,7 +595,8 @@ void __irq_put_desc_unlock(struct irq_desc *desc, unsigned long flags, bool bus)
 		chip_bus_sync_unlock(desc);
 }
 
-int irq_set_percpu_devid(unsigned int irq)
+int irq_set_percpu_devid_partition(unsigned int irq,
+				   const struct cpumask *affinity)
 {
 	struct irq_desc *desc = irq_to_desc(irq);
 
@@ -610,10 +611,33 @@ int irq_set_percpu_devid(unsigned int irq)
 	if (!desc->percpu_enabled)
 		return -ENOMEM;
 
+	if (affinity)
+		desc->percpu_affinity = affinity;
+	else
+		desc->percpu_affinity = cpu_possible_mask;
+
 	irq_set_percpu_devid_flags(irq);
 	return 0;
 }
 
+int irq_set_percpu_devid(unsigned int irq)
+{
+	return irq_set_percpu_devid_partition(irq, NULL);
+}
+
+int irq_get_percpu_devid_partition(unsigned int irq, struct cpumask *affinity)
+{
+	struct irq_desc *desc = irq_to_desc(irq);
+
+	if (!desc || !desc->percpu_enabled)
+		return -EINVAL;
+
+	if (affinity)
+		cpumask_copy(affinity, desc->percpu_affinity);
+
+	return 0;
+}
+
 void kstat_incr_irq_this_cpu(unsigned int irq)
 {
 	kstat_incr_irqs_this_cpu(irq_to_desc(irq));
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
