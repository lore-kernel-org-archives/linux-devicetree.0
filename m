From: Chintan Pandya <cpandya@codeaurora.org>
Subject: [PATCH] of: use hash based search in of_find_node_by_phandle
Date: Thu, 25 Jan 2018 15:44:07 +0530
Message-ID: <1516875247-19599-1-git-send-email-cpandya@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, frowand.list@gmail.com, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Chintan Pandya <cpandya@codeaurora.org>
List-Id: devicetree@vger.kernel.org

of_find_node_by_phandle() takes a lot of time finding
right node when your intended device is too right-side
in the fdt. Reason is, we search each device serially
from the fdt, starting from left-most to right-most.

Implement, device-phandle relation in hash-table so
that look up can be faster.

Change-Id: I4a2bc7eff6de142e4f91a7bf474893a45e61c128
Signed-off-by: Chintan Pandya <cpandya@codeaurora.org>
---
 drivers/of/base.c  |  9 +++++++--
 drivers/of/fdt.c   | 18 ++++++++++++++++++
 include/linux/of.h |  6 ++++++
 3 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index a0bccb5..3e06316 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -25,6 +25,7 @@
 #include <linux/cpu.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/hashtable.h>
 #include <linux/of_graph.h>
 #include <linux/spinlock.h>
 #include <linux/slab.h>
@@ -1099,10 +1100,14 @@ struct device_node *of_find_node_by_phandle(phandle handle)
 	if (!handle)
 		return NULL;
 
-	raw_spin_lock_irqsave(&devtree_lock, flags);
-	for_each_of_allnodes(np)
+	spin_lock(&dt_hash_spinlock);
+	hash_for_each_possible(dt_hash_table, np, hash, handle)
 		if (np->phandle == handle)
 			break;
+
+	spin_unlock(&dt_hash_spinlock);
+
+	raw_spin_lock_irqsave(&devtree_lock, flags);
 	of_node_get(np);
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
 	return np;
diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index c0914fb..f0e78a7 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -31,6 +31,10 @@
 #include <asm/setup.h>  /* for COMMAND_LINE_SIZE */
 #include <asm/page.h>
 
+static bool dt_hash_needs_init = true;
+DECLARE_HASHTABLE(dt_hash_table, DT_HASH_BITS);
+DEFINE_SPINLOCK(dt_hash_spinlock);
+
 /*
  * of_fdt_limit_memory - limit the number of regions in the /memory node
  * @limit: maximum entries
@@ -227,6 +231,20 @@ static void populate_properties(const void *blob,
 		pprev      = &pp->next;
 	}
 
+	/*
+	 * In 'dryrun = true' cases, np is some non-NULL junk. So, protect
+	 * against those cases.
+	 */
+	if (!dryrun && np->phandle) {
+		spin_lock(&dt_hash_spinlock);
+		if (dt_hash_needs_init) {
+			dt_hash_needs_init = false;
+			hash_init(dt_hash_table);
+		}
+		hash_add(dt_hash_table, &np->hash, np->phandle);
+		spin_unlock(&dt_hash_spinlock);
+	}
+
 	/* With version 0x10 we may not have the name property,
 	 * recreate it here from the unit name if absent
 	 */
diff --git a/include/linux/of.h b/include/linux/of.h
index 299aeb1..5b3f4f1 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -25,6 +25,7 @@
 #include <linux/notifier.h>
 #include <linux/property.h>
 #include <linux/list.h>
+#include <linux/hashtable.h>
 
 #include <asm/byteorder.h>
 #include <asm/errno.h>
@@ -61,6 +62,7 @@ struct device_node {
 	struct	kobject kobj;
 	unsigned long _flags;
 	void	*data;
+	struct hlist_node hash;
 #if defined(CONFIG_SPARC)
 	const char *path_component_name;
 	unsigned int unique_id;
@@ -68,6 +70,10 @@ struct device_node {
 #endif
 };
 
+#define DT_HASH_BITS 6
+extern DECLARE_HASHTABLE(dt_hash_table, DT_HASH_BITS);
+extern spinlock_t dt_hash_spinlock;
+
 #define MAX_PHANDLE_ARGS 16
 struct of_phandle_args {
 	struct device_node *np;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
