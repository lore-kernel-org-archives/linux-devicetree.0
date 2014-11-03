From: <suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org>
Subject: [V10 PATCH 1/2] genirq: Add irq_chip_set_type_parent function
Date: Mon, 3 Nov 2014 16:16:16 -0600
Message-ID: <1415052977-26036-2-git-send-email-suravee.suthikulpanit@amd.com>
References: <1415052977-26036-1-git-send-email-suravee.suthikulpanit@amd.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415052977-26036-1-git-send-email-suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: marc.zyngier-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org
Cc: Catalin.Marinas-5wv7dgnIgG8@public.gmane.org, Will.Deacon-5wv7dgnIgG8@public.gmane.org, liviu.dudau-5wv7dgnIgG8@public.gmane.org, Harish.Kasiviswanathan-5C7GfCeVMHo@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>, Suravee Suthikulpanit <suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>

Add a helper function to set irq type in parent irq domain.

Signed-off-by: Suravee Suthikulpanit <suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org>
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
