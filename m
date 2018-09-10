Return-Path: <SRS0=kIcW=LY=linutronix.de=bigeasy@kernel.org>
Date: Mon, 10 Sep 2018 17:42:27 +0200
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [RFC PATCH] of: allocate / free phandle cache outside of the
 devtree_lock
Message-ID: <20180910154227.xsbbqvw3cayro4gg@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, tglx@linutronix.de
List-ID: <devicetree@vger.kernel.org>

The phandle cache code allocates memory while holding devtree_lock which
is a raw_spinlock_t. Memory allocation (and free()) is not possible on
RT while a raw_spinlock_t is held.
Invoke the kfree() and kcalloc() while the lock is dropped.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---

The devtree_lock lock is raw_spin_lock_t and as of today there are a few
users which invoke a DT call via a smp_function_call and need it that
way.
If this is not acceptable, is there a reason not to use RCU lookups?
Since every lookup requires to hold devtree_lock it makes parallel
lookups not possible (not sure if it needed / happens, maybe only during
boot).
While looking through the code when the lock is held, I noticed that
of_find_last_cache_level() is using a node after dropping a reference to
it. With RCU, some modifications of the node would require making a copy
of the node and then replacing the node.

 drivers/of/base.c |   22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -108,43 +108,49 @@ void of_populate_phandle_cache(void)
 	u32 cache_entries;
 	struct device_node *np;
 	u32 phandles = 0;
+	struct device_node **shadow;
 
 	raw_spin_lock_irqsave(&devtree_lock, flags);
-
-	kfree(phandle_cache);
+	shadow = phandle_cache;
 	phandle_cache = NULL;
 
 	for_each_of_allnodes(np)
 		if (np->phandle && np->phandle != OF_PHANDLE_ILLEGAL)
 			phandles++;
 
+	raw_spin_unlock_irqrestore(&devtree_lock, flags);
+
 	cache_entries = roundup_pow_of_two(phandles);
 	phandle_cache_mask = cache_entries - 1;
 
-	phandle_cache = kcalloc(cache_entries, sizeof(*phandle_cache),
-				GFP_ATOMIC);
-	if (!phandle_cache)
-		goto out;
+	kfree(shadow);
+	shadow = kcalloc(cache_entries, sizeof(*phandle_cache), GFP_KERNEL);
+
+	if (!shadow)
+		return;
+	raw_spin_lock_irqsave(&devtree_lock, flags);
+	phandle_cache = shadow;
 
 	for_each_of_allnodes(np)
 		if (np->phandle && np->phandle != OF_PHANDLE_ILLEGAL)
 			phandle_cache[np->phandle & phandle_cache_mask] = np;
 
-out:
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
 }
 
 int of_free_phandle_cache(void)
 {
 	unsigned long flags;
+	struct device_node **shadow;
 
 	raw_spin_lock_irqsave(&devtree_lock, flags);
 
-	kfree(phandle_cache);
+	shadow = phandle_cache;
 	phandle_cache = NULL;
 
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
 
+	kfree(shadow);
 	return 0;
 }
 #if !defined(CONFIG_MODULES)
