From: Reza Arbab <arbab@linux.vnet.ibm.com>
Subject: [PATCH v7 4/5] of/fdt: mark hotpluggable memory
Date: Mon, 14 Nov 2016 16:02:40 -0600
Message-ID: <1479160961-25840-5-git-send-email-arbab@linux.vnet.ibm.com>
References: <1479160961-25840-1-git-send-email-arbab@linux.vnet.ibm.com>
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <1479160961-25840-1-git-send-email-arbab@linux.vnet.ibm.com>
Sender: owner-linux-mm@kvack.org
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org, devicetree@vger.kernel.org, Bharata B Rao <bharata@linux.vnet.ibm.com>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, Stewart Smith <stewart@linux.vnet.ibm.com>, Alistair Popple <apopple@au1.ibm.com>, Balbir Singh <bsingharora@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

When movable nodes are enabled, any node containing only hotpluggable
memory is made movable at boot time.

On x86, hotpluggable memory is discovered by parsing the ACPI SRAT,
making corresponding calls to memblock_mark_hotplug().

If we introduce a dt property to describe memory as hotpluggable,
configs supporting early fdt may then also do this marking and use
movable nodes.

Signed-off-by: Reza Arbab <arbab@linux.vnet.ibm.com>
Tested-by: Balbir Singh <bsingharora@gmail.com>
---
 drivers/of/fdt.c       | 19 +++++++++++++++++++
 include/linux/of_fdt.h |  1 +
 mm/Kconfig             |  2 +-
 3 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index c89d5d2..c9b5cac 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1015,6 +1015,7 @@ int __init early_init_dt_scan_memory(unsigned long node, const char *uname,
 	const char *type = of_get_flat_dt_prop(node, "device_type", NULL);
 	const __be32 *reg, *endp;
 	int l;
+	bool hotpluggable;
 
 	/* We are scanning "memory" nodes only */
 	if (type == NULL) {
@@ -1034,6 +1035,7 @@ int __init early_init_dt_scan_memory(unsigned long node, const char *uname,
 		return 0;
 
 	endp = reg + (l / sizeof(__be32));
+	hotpluggable = of_get_flat_dt_prop(node, "hotpluggable", NULL);
 
 	pr_debug("memory scan node %s, reg size %d,\n", uname, l);
 
@@ -1049,6 +1051,13 @@ int __init early_init_dt_scan_memory(unsigned long node, const char *uname,
 		    (unsigned long long)size);
 
 		early_init_dt_add_memory_arch(base, size);
+
+		if (!hotpluggable)
+			continue;
+
+		if (early_init_dt_mark_hotplug_memory_arch(base, size))
+			pr_warn("failed to mark hotplug range 0x%llx - 0x%llx\n",
+				base, base + size);
 	}
 
 	return 0;
@@ -1146,6 +1155,11 @@ void __init __weak early_init_dt_add_memory_arch(u64 base, u64 size)
 	memblock_add(base, size);
 }
 
+int __init __weak early_init_dt_mark_hotplug_memory_arch(u64 base, u64 size)
+{
+	return memblock_mark_hotplug(base, size);
+}
+
 int __init __weak early_init_dt_reserve_memory_arch(phys_addr_t base,
 					phys_addr_t size, bool nomap)
 {
@@ -1168,6 +1182,11 @@ void __init __weak early_init_dt_add_memory_arch(u64 base, u64 size)
 	WARN_ON(1);
 }
 
+int __init __weak early_init_dt_mark_hotplug_memory_arch(u64 base, u64 size)
+{
+	return -ENOSYS;
+}
+
 int __init __weak early_init_dt_reserve_memory_arch(phys_addr_t base,
 					phys_addr_t size, bool nomap)
 {
diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
index 4341f32..271b3fd 100644
--- a/include/linux/of_fdt.h
+++ b/include/linux/of_fdt.h
@@ -71,6 +71,7 @@ extern int early_init_dt_scan_memory(unsigned long node, const char *uname,
 extern void early_init_fdt_scan_reserved_mem(void);
 extern void early_init_fdt_reserve_self(void);
 extern void early_init_dt_add_memory_arch(u64 base, u64 size);
+extern int early_init_dt_mark_hotplug_memory_arch(u64 base, u64 size);
 extern int early_init_dt_reserve_memory_arch(phys_addr_t base, phys_addr_t size,
 					     bool no_map);
 extern void * early_init_dt_alloc_memory_arch(u64 size, u64 align);
diff --git a/mm/Kconfig b/mm/Kconfig
index 061b46b..33a9b06 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -153,7 +153,7 @@ config MOVABLE_NODE
 	bool "Enable to assign a node which has only movable memory"
 	depends on HAVE_MEMBLOCK
 	depends on NO_BOOTMEM
-	depends on X86_64 || MEMORY_HOTPLUG
+	depends on X86_64 || OF_EARLY_FLATTREE || MEMORY_HOTPLUG
 	depends on NUMA
 	default n
 	help
-- 
1.8.3.1

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
