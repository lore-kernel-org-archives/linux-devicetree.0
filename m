From: frowand.list@gmail.com
Subject: [PATCH v4 2/2] of: add early boot allocation of of_find_node_by_phandle() cache
Date: Wed, 28 Feb 2018 11:04:16 -0800
Message-ID: <1519844656-16443-3-git-send-email-frowand.list@gmail.com>
References: <1519844656-16443-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1519844656-16443-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, cpandya@codeaurora.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

The initial implementation of the of_find_node_by_phandle() cache
allocates the cache using kcalloc().  Add an early boot allocation
of the cache so it will be usable during early boot.  Switch over
to the kcalloc() based cache once normal memory allocation
becomes available.

Signed-off-by: Frank Rowand <frank.rowand@sony.com>
---

The previous version of this patch was a standalone patch:
[PATCH] of: add early boot allocation of of_find_node_by_phandle() cache
that was dependent on patch 1/2 of this series.

Changes from previous versions:
  - no changes


 drivers/of/base.c       | 33 +++++++++++++++++++++++++++++++++
 drivers/of/fdt.c        |  2 ++
 drivers/of/of_private.h |  2 ++
 3 files changed, 37 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index e71d157d7149..eeaa270a5135 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -16,9 +16,11 @@
 
 #define pr_fmt(fmt)	"OF: " fmt
 
+#include <linux/bootmem.h>
 #include <linux/console.h>
 #include <linux/ctype.h>
 #include <linux/cpu.h>
+#include <linux/memblock.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
@@ -134,6 +136,29 @@ static void of_populate_phandle_cache(void)
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
 }
 
+void __init of_populate_phandle_cache_early(void)
+{
+	u32 cache_entries;
+	struct device_node *np;
+	u32 phandles = 0;
+	size_t size;
+
+	for_each_of_allnodes(np)
+		if (np->phandle && np->phandle != OF_PHANDLE_ILLEGAL)
+			phandles++;
+
+	cache_entries = roundup_pow_of_two(phandles);
+	phandle_cache_mask = cache_entries - 1;
+
+	size = cache_entries * sizeof(*phandle_cache);
+	phandle_cache = memblock_virt_alloc(size, 4);
+	memset(phandle_cache, 0, size);
+
+	for_each_of_allnodes(np)
+		if (np->phandle && np->phandle != OF_PHANDLE_ILLEGAL)
+			phandle_cache[np->phandle & phandle_cache_mask] = np;
+}
+
 #ifndef CONFIG_MODULES
 static int __init of_free_phandle_cache(void)
 {
@@ -153,7 +178,15 @@ static int __init of_free_phandle_cache(void)
 
 void __init of_core_init(void)
 {
+	unsigned long flags;
 	struct device_node *np;
+	phys_addr_t size;
+
+	raw_spin_lock_irqsave(&devtree_lock, flags);
+	size = (phandle_cache_mask + 1) * sizeof(*phandle_cache);
+	memblock_free(__pa(phandle_cache), size);
+	phandle_cache = NULL;
+	raw_spin_unlock_irqrestore(&devtree_lock, flags);
 
 	of_populate_phandle_cache();
 
diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 84aa9d676375..cb320df23f26 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1264,6 +1264,8 @@ void __init unflatten_device_tree(void)
 	of_alias_scan(early_init_dt_alloc_memory_arch);
 
 	unittest_unflatten_overlay_base();
+
+	of_populate_phandle_cache_early();
 }
 
 /**
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index fa70650136b4..6720448c84cc 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -134,6 +134,8 @@ extern void __of_sysfs_remove_bin_file(struct device_node *np,
 /* illegal phandle value (set when unresolved) */
 #define OF_PHANDLE_ILLEGAL	0xdeadbeef
 
+extern void __init of_populate_phandle_cache_early(void);
+
 /* iterators for transactions, used for overlays */
 /* forward iterator */
 #define for_each_transaction_entry(_oft, _te) \
-- 
Frank Rowand <frank.rowand@sony.com>
