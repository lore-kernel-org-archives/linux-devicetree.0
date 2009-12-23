From: Jeremy Kerr <jeremy.kerr@canonical.com>
Subject: [PATCH 2/3] of: make set_node_proc_entry private to proc_devtree.c
Date: Wed, 23 Dec 2009 09:45:18 +0800
Message-ID: <1261532718.575722.541804401419.2.gpush@pororo>
References: <1261532718.575048.365032094903.0.gpush@pororo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753623AbZLWBqB@vger.kernel.org>
In-Reply-To: <1261532718.575048.365032094903.0.gpush@pororo>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>, devicetree-discuss@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

We only need set_node_proc_entry in proc_devtree.c, so move it there.

This fixes the !HAVE_ARCH_DEVTREE_FIXUPS build, as we can't make make
the definition in linux/of.h conditional on this #define (definitions in
asm/prom.h can't be exposed to linux/of.h, due to the enforced #include
ordering).

Signed-off-by: Jeremy Kerr <jeremy.kerr@canonical.com>

---
 fs/proc/proc_devtree.c |    5 +++--
 include/linux/of.h     |    6 ------
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/fs/proc/proc_devtree.c b/fs/proc/proc_devtree.c
index 7ba79a5..31fc7e0 100644
--- a/fs/proc/proc_devtree.c
+++ b/fs/proc/proc_devtree.c
@@ -13,12 +13,13 @@
 #include <asm/uaccess.h>
 #include "internal.h"
 
-#ifndef HAVE_ARCH_DEVTREE_FIXUPS
 static inline void set_node_proc_entry(struct device_node *np,
 				       struct proc_dir_entry *de)
 {
-}
+#ifdef HAVE_ARCH_DEVTREE_FIXUPS
+	np->pde = de;
 #endif
+}
 
 static struct proc_dir_entry *proc_device_tree;
 
diff --git a/include/linux/of.h b/include/linux/of.h
index 67c9206..9078747 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -75,12 +75,6 @@ static inline void of_node_set_flag(struct device_node *n, unsigned long flag)
 	set_bit(flag, &n->_flags);
 }
 
-static inline void
-set_node_proc_entry(struct device_node *dn, struct proc_dir_entry *de)
-{
-	dn->pde = de;
-}
-
 extern struct device_node *of_find_all_nodes(struct device_node *prev);
 
 #if defined(CONFIG_SPARC)
