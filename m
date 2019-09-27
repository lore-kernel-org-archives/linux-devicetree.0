From: Nayna Jain <nayna@linux.ibm.com>
Subject: [PATCH v6 2/9] powerpc: detect the secure boot mode of the system
Date: Fri, 27 Sep 2019 10:25:53 -0400
Message-ID: <1569594360-7141-3-git-send-email-nayna@linux.ibm.com>
References: <1569594360-7141-1-git-send-email-nayna@linux.ibm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1569594360-7141-1-git-send-email-nayna@linux.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linuxppc-dev@ozlabs.org, linux-efi@vger.kernel.org, linux-integrity@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Jeremy Kerr <jk@ozlabs.org>, Matthew Garret <matthew.garret@nebula.com>, Mimi Zohar <zohar@linux.ibm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Claudio Carvalho <cclaudio@linux.ibm.com>, George Wilson <gcwilson@linux.ibm.com>, Elaine Palmer <erpalmer@us.ibm.com>, Eric Ricther <erichte@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Nayna Jain <nayna@linux.ibm.com>
List-Id: devicetree@vger.kernel.org

Secure boot on PowerNV defines different IMA policies based on the secure
boot state of the system.

This patch defines a function to detect the secure boot state of the
system.

The PPC_SECURE_BOOT config represents the base enablement of secureboot
on POWER.

Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
---
 arch/powerpc/Kconfig                   | 10 ++++
 arch/powerpc/include/asm/secure_boot.h | 31 ++++++++++
 arch/powerpc/kernel/Makefile           |  2 +
 arch/powerpc/kernel/secure_boot.c      | 82 ++++++++++++++++++++++++++
 4 files changed, 125 insertions(+)
 create mode 100644 arch/powerpc/include/asm/secure_boot.h
 create mode 100644 arch/powerpc/kernel/secure_boot.c

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 77f6ebf97113..2c54beb29f1a 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -912,6 +912,16 @@ config PPC_MEM_KEYS
 
 	  If unsure, say y.
 
+config PPC_SECURE_BOOT
+	prompt "Enable secure boot support"
+	bool
+	depends on PPC_POWERNV
+	help
+	  Systems with firmware secure boot enabled needs to define security
+	  policies to extend secure boot to the OS. This config allows user
+	  to enable OS secure boot on systems that have firmware support for
+	  it. If in doubt say N.
+
 endmenu
 
 config ISA_DMA_API
diff --git a/arch/powerpc/include/asm/secure_boot.h b/arch/powerpc/include/asm/secure_boot.h
new file mode 100644
index 000000000000..4e8e2b08a993
--- /dev/null
+++ b/arch/powerpc/include/asm/secure_boot.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Secure boot definitions
+ *
+ * Copyright (C) 2019 IBM Corporation
+ * Author: Nayna Jain
+ */
+#ifndef _ASM_POWER_SECURE_BOOT_H
+#define _ASM_POWER_SECURE_BOOT_H
+
+#ifdef CONFIG_PPC_SECURE_BOOT
+
+#define SECURE_BOOT_MASK	0xFFFFFFFF00000000
+
+bool is_powerpc_os_secureboot_enabled(void);
+int get_powerpc_os_sb_node(struct device_node **node);
+
+#else
+
+static inline bool is_powerpc_os_secureboot_enabled(void)
+{
+	return false;
+}
+
+static inline int get_powerpc_os_sb_node(struct device_node **node)
+{
+	return -ENOENT;
+}
+
+#endif
+#endif
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index ea0c69236789..875b0785a20e 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -157,6 +157,8 @@ endif
 obj-$(CONFIG_EPAPR_PARAVIRT)	+= epapr_paravirt.o epapr_hcalls.o
 obj-$(CONFIG_KVM_GUEST)		+= kvm.o kvm_emul.o
 
+obj-$(CONFIG_PPC_SECURE_BOOT)	+= secure_boot.o
+
 # Disable GCOV, KCOV & sanitizers in odd or sensitive code
 GCOV_PROFILE_prom_init.o := n
 KCOV_INSTRUMENT_prom_init.o := n
diff --git a/arch/powerpc/kernel/secure_boot.c b/arch/powerpc/kernel/secure_boot.c
new file mode 100644
index 000000000000..45ca19f5e836
--- /dev/null
+++ b/arch/powerpc/kernel/secure_boot.c
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 IBM Corporation
+ * Author: Nayna Jain
+ */
+#include <linux/types.h>
+#include <linux/of.h>
+#include <asm/secure_boot.h>
+
+static struct device_node *get_powerpc_fw_sb_node(void)
+{
+	return of_find_node_by_name(NULL, "ibm,secureboot");
+}
+
+bool is_powerpc_os_sb_supported(void)
+{
+	struct device_node *node = NULL;
+
+	node = get_powerpc_fw_sb_node();
+	if (node && of_device_is_compatible(node, "ibm,secureboot-v3"))
+		return true;
+
+	return false;
+}
+
+int get_powerpc_os_sb_node(struct device_node **node)
+{
+	struct device_node *fwsbnode;
+
+	if (!is_powerpc_os_sb_supported())
+		return -ENOTSUPP;
+
+	fwsbnode = get_powerpc_fw_sb_node();
+	if (!fwsbnode)
+		return -ENOENT;
+
+	*node = of_find_node_by_name(fwsbnode, "secvar");
+	if (*node)
+		return 0;
+
+	return -ENOENT;
+}
+
+bool is_powerpc_os_secureboot_enabled(void)
+{
+	struct device_node *node;
+	u64 sbmode = 0;
+	int rc;
+
+	rc = get_powerpc_os_sb_node(&node);
+	if (rc == -ENOTSUPP)
+		goto disabled;
+
+	/* Fail secure for any failure related to secvar */
+	if (rc) {
+		pr_err("Expected secure variables support, fail secure\n");
+		goto enabled;
+	}
+
+	if (!of_device_is_available(node)) {
+		pr_err("Secure variables support is in error state, fail secure\n");
+		goto enabled;
+	}
+
+	rc = of_property_read_u64(node, "os-secure-mode", &sbmode);
+	if (rc)
+		goto enabled;
+
+	sbmode = be64_to_cpu(sbmode);
+
+	/* checks for the secure mode enforcing bit */
+	if (!(sbmode & SECURE_BOOT_MASK))
+		goto disabled;
+
+enabled:
+	pr_info("secureboot mode enabled\n");
+	return true;
+
+disabled:
+	pr_info("secureboot mode disabled\n");
+	return false;
+}
-- 
2.20.1
