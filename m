Return-Path: <SRS0=QTuQ=ZD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77525C17441
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 Nov 2019 17:21:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5361F206BA
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 Nov 2019 17:21:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727141AbfKKRVq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 11 Nov 2019 12:21:46 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:58614 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727083AbfKKRVo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 11 Nov 2019 12:21:44 -0500
Received: from bigeasy by Galois.linutronix.de with local (Exim 4.80)
        (envelope-from <bigeasy@linutronix.de>)
        id 1iUDNm-0003Gu-81; Mon, 11 Nov 2019 18:21:42 +0100
Date:   Mon, 11 Nov 2019 18:21:42 +0100
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     devicetree@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH] of: allocate / free phandle cache outside of the devtree_lock
Message-ID: <20191111172142.ozczh7j2gmzi7o5k@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The phandle cache code allocates memory while holding devtree_lock which
is a raw_spinlock_t. Memory allocation (and free()) is not possible on
RT while a raw_spinlock_t is held.
Invoke the kfree() and kcalloc() while the lock is dropped.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---

This is a repost of:
	https://lore.kernel.org/linux-devicetree/20180910154227.xsbbqvw3cayro4gg@linutronix.de/

I mentioned this patch (briefly) to Frank, let me summarize:

of_populate_phandle_cache() triggers a warning during boot on arm64 with
RT enabled. By moving memory allocation/free outside of the locked
section (which really disables interrupts on -RT) everything is fine
again.

The lock has been made a raw_spinlock_t in RT as part pSeries bring up.
It then made its way upstream as:
   28d0e36bf9686 ("OF: Fixup resursive locking code paths")
   d6d3c4e656513 ("OF: convert devtree lock from rw_lock to raw spinlock")

I've been looking into making devtree_lock a spinlock_t which would
avoid this patch. I haven't seen an issue during boot on arm64 even
with hotplug.
However Power64/pSeries complained during boot:

| smp: Bringing up secondary CPUs ...
| BUG: sleeping function called from invalid context at kernel/locking/rtmutex.c:973
| in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 0, name: swapper/1
| 1 lock held by swapper/1/0:
|  #0: c000000000def6e0 (devtree_lock){+.+.}, at: of_find_node_opts_by_path+0x1f4/0x230
| Preemption disabled at:
| [<c0000000000557a0>] start_secondary+0xd0/0x6a0
|
| Call Trace:
| [c0000001f9667d10] [c000000000158e30] ___might_sleep+0x250/0x270
| [c0000001f9667da0] [c000000000984f40] rt_spin_lock+0x70/0x90
| [c0000001f9667de0] [c0000000007e3634] of_find_node_opts_by_path+0x1f4/0x230
| [c0000001f9667e30] [c0000000007e3844] of_get_next_cpu_node+0x144/0x180
| [c0000001f9667e70] [c0000000007e38d8] of_get_cpu_node+0x58/0x90
| [c0000001f9667eb0] [c00000000002eb00] cpu_to_chip_id+0x20/0x70
| [c0000001f9667ee0] [c000000000055858] start_secondary+0x188/0x6a0
| [c0000001f9667f90] [c00000000000b554] start_secondary_prolog+0x10/0x14

because cpu_to_chip_id() acquires devtree_lock() early in the CPU-bring
up path.

 drivers/of/base.c |   19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -138,31 +138,34 @@ static u32 phandle_cache_mask;
 /*
  * Caller must hold devtree_lock.
  */
-static void __of_free_phandle_cache(void)
+static struct device_node** __of_free_phandle_cache(void)
 {
 	u32 cache_entries = phandle_cache_mask + 1;
 	u32 k;
+	struct device_node **shadow;
 
 	if (!phandle_cache)
-		return;
+		return NULL;
 
 	for (k = 0; k < cache_entries; k++)
 		of_node_put(phandle_cache[k]);
 
-	kfree(phandle_cache);
+	shadow = phandle_cache;
 	phandle_cache = NULL;
+	return shadow;
 }
 
 int of_free_phandle_cache(void)
 {
 	unsigned long flags;
+	struct device_node **shadow;
 
 	raw_spin_lock_irqsave(&devtree_lock, flags);
 
-	__of_free_phandle_cache();
+	shadow = __of_free_phandle_cache();
 
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
-
+	kfree(shadow);
 	return 0;
 }
 #if !defined(CONFIG_MODULES)
@@ -197,10 +200,11 @@ void of_populate_phandle_cache(void)
 	u32 cache_entries;
 	struct device_node *np;
 	u32 phandles = 0;
+	struct device_node **shadow;
 
 	raw_spin_lock_irqsave(&devtree_lock, flags);
 
-	__of_free_phandle_cache();
+	shadow = __of_free_phandle_cache();
 
 	for_each_of_allnodes(np)
 		if (np->phandle && np->phandle != OF_PHANDLE_ILLEGAL)
@@ -208,12 +212,14 @@ void of_populate_phandle_cache(void)
 
 	if (!phandles)
 		goto out;
+	raw_spin_unlock_irqrestore(&devtree_lock, flags);
 
 	cache_entries = roundup_pow_of_two(phandles);
 	phandle_cache_mask = cache_entries - 1;
 
 	phandle_cache = kcalloc(cache_entries, sizeof(*phandle_cache),
 				GFP_ATOMIC);
+	raw_spin_lock_irqsave(&devtree_lock, flags);
 	if (!phandle_cache)
 		goto out;
 
@@ -225,6 +231,7 @@ void of_populate_phandle_cache(void)
 
 out:
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
+	kfree(shadow);
 }
 
 void __init of_core_init(void)
