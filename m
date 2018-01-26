From: Chintan Pandya <cpandya@codeaurora.org>
Subject: [PATCH v2] of: use hash based search in of_find_node_by_phandle
Date: Fri, 26 Jan 2018 14:01:36 +0530
Message-ID: <1516955496-17236-1-git-send-email-cpandya@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, frowand.list@gmail.com, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Chintan Pandya <cpandya@codeaurora.org>
List-Id: devicetree@vger.kernel.org

of_find_node_by_phandle() takes a lot of time (1ms per
call) to find right node when your intended device is
too deeper in the fdt. Reason is, we search for each
device serially in the fdt. See this,

struct device_node *__of_find_all_nodes(struct device_node *prev)
{
        struct device_node *np;
        if (!prev) {
                np = of_root;
        } else if (prev->child) {
                np = prev->child;
        } else {
                /* Walk back up looking for a sibling, or the end of the structure */
                np = prev;
                while (np->parent && !np->sibling)
                        np = np->parent;
                np = np->sibling; /* Might be null at the end of the tree */
        }
        return np;
}

#define for_each_of_allnodes_from(from, dn) \
        for (dn = __of_find_all_nodes(from); dn; dn = __of_find_all_nodes(dn))
#define for_each_of_allnodes(dn) for_each_of_allnodes_from(NULL, dn)

Implement, device-phandle relation in hash-table so
that look up can be faster, irrespective of where my
device is defined in the DT.

There are ~6.7k calls to of_find_node_by_phandle() and
total improvement observed during boot is 400ms.

Signed-off-by: Chintan Pandya <cpandya@codeaurora.org>
---
 drivers/of/base.c  |  8 ++++++--
 drivers/of/fdt.c   | 18 ++++++++++++++++++
 include/linux/of.h |  6 ++++++
 3 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 26618ba..bfbfa99 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1005,10 +1005,14 @@ struct device_node *of_find_node_by_phandle(phandle handle)
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
index 4675e5a..62a9a4c 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -33,6 +33,10 @@
 
 #include "of_private.h"
 
+static bool dt_hash_needs_init = true;
+DECLARE_HASHTABLE(dt_hash_table, DT_HASH_BITS);
+DEFINE_SPINLOCK(dt_hash_spinlock);
+
 /*
  * of_fdt_limit_memory - limit the number of regions in the /memory node
  * @limit: maximum entries
@@ -242,6 +246,20 @@ static void populate_properties(const void *blob,
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
index d3dea1d..2e3ba84 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -25,6 +25,7 @@
 #include <linux/notifier.h>
 #include <linux/property.h>
 #include <linux/list.h>
+#include <linux/hashtable.h>
 
 #include <asm/byteorder.h>
 #include <asm/errno.h>
@@ -69,6 +70,7 @@ struct device_node {
 #endif
 	unsigned long _flags;
 	void	*data;
+	struct hlist_node hash;
 #if defined(CONFIG_SPARC)
 	const char *path_component_name;
 	unsigned int unique_id;
@@ -76,6 +78,10 @@ struct device_node {
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
