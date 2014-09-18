From: <suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org>
Subject: [PATCH 1/2 V7] irqchip: gic: Add support for multiple MSI for ARM64
Date: Wed, 17 Sep 2014 19:08:25 -0700
Message-ID: <1411006106-17339-2-git-send-email-suravee.suthikulpanit@amd.com>
References: <1411006106-17339-1-git-send-email-suravee.suthikulpanit@amd.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411006106-17339-1-git-send-email-suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: marc.zyngier-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org
Cc: pawel.moll-5wv7dgnIgG8@public.gmane.org, Catalin.Marinas-5wv7dgnIgG8@public.gmane.org, Will.Deacon-5wv7dgnIgG8@public.gmane.org, liviu.dudau-5wv7dgnIgG8@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, Harish.Kasiviswanathan-5C7GfCeVMHo@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <Marc.Zyngier-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>

This patch implelments the ARM64 version of arch_setup_msi_irqs(),
which does not return 1 for when PCI_CAP_ID_MSI and nvec > 1.

Cc: Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Marc Zyngier <Marc.Zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>
Cc: Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>
Signed-off-by: Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>
---
 arch/arm64/kernel/Makefile |  1 +
 arch/arm64/kernel/msi.c    | 41 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 arch/arm64/kernel/msi.c

diff --git a/arch/arm64/kernel/Makefile b/arch/arm64/kernel/Makefile
index df7ef87..a921c42 100644
--- a/arch/arm64/kernel/Makefile
+++ b/arch/arm64/kernel/Makefile
@@ -29,6 +29,7 @@ arm64-obj-$(CONFIG_ARM64_CPU_SUSPEND)	+= sleep.o suspend.o
 arm64-obj-$(CONFIG_JUMP_LABEL)		+= jump_label.o
 arm64-obj-$(CONFIG_KGDB)		+= kgdb.o
 arm64-obj-$(CONFIG_EFI)			+= efi.o efi-stub.o efi-entry.o
+arm64-obj-$(CONFIG_PCI_MSI)		+= msi.o
 
 obj-y					+= $(arm64-obj-y) vdso/
 obj-m					+= $(arm64-obj-m)
diff --git a/arch/arm64/kernel/msi.c b/arch/arm64/kernel/msi.c
new file mode 100644
index 0000000..a295862
--- /dev/null
+++ b/arch/arm64/kernel/msi.c
@@ -0,0 +1,41 @@
+/*
+ * ARM64 architectural MSI implemention
+ *
+ * Support for Message Signalelled Interrupts for systems that
+ * implement ARM Generic Interrupt Controller: GICv2m.
+ *
+ * Copyright (C) 2014 Advanced Micro Devices, Inc.
+ * Authors: Suravee Suthikulpanit <suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published
+ * by the Free Software Foundation.
+ */
+
+#include <linux/irq.h>
+#include <linux/msi.h>
+#include <linux/pci.h>
+
+/*
+ * ARM64 function for seting up MSI irqs.
+ * Based on driver/pci/msi.c: arch_setup_msi_irqs().
+ *
+ * Note:
+ * Current implementation assumes that all interrupt controller used in
+ * ARM64 architecture _MUST_ supports multi-MSI.
+ */
+int arm64_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
+{
+	struct msi_desc *entry;
+	int ret;
+
+	list_for_each_entry(entry, &dev->msi_list, list) {
+		ret = arch_setup_msi_irq(dev, entry);
+		if (ret < 0)
+			return ret;
+		if (ret > 0)
+			return -ENOSPC;
+	}
+
+	return 0;
+}
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
