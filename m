Return-Path: <SRS0=12Nb=ZV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9343C432C0
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 Nov 2019 14:04:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A5C0B217BC
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 Nov 2019 14:04:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726808AbfK2OEs convert rfc822-to-8bit (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 29 Nov 2019 09:04:48 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:48868 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726763AbfK2OEs (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 29 Nov 2019 09:04:48 -0500
Received: from bigeasy by Galois.linutronix.de with local (Exim 4.80)
        (envelope-from <bigeasy@linutronix.de>)
        id 1iagt4-0007ze-5d; Fri, 29 Nov 2019 15:04:46 +0100
Date:   Fri, 29 Nov 2019 15:04:46 +0100
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     Frank Rowand <frowand.list@gmail.com>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v2] of: allocate / free phandle cache outside of the
 devtree_lock
Message-ID: <20191129140446.dqb5y4uzv57cislp@linutronix.de>
References: <20191111172142.ozczh7j2gmzi7o5k@linutronix.de>
 <e62e6a76-c614-80c4-2c9b-cd4326105fd9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <e62e6a76-c614-80c4-2c9b-cd4326105fd9@gmail.com>
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
v1…v2:
  - Add comments regarding memory allocation under the raw_spinlock_t
  - use a temporary variable for the memory allocation.

 drivers/of/base.c |   32 +++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -136,33 +136,37 @@ static struct device_node **phandle_cach
 static u32 phandle_cache_mask;
 
 /*
- * Caller must hold devtree_lock.
+ * Caller must hold devtree_lock under which kfree() can't be used so caller
+ * needs to kfree() the returned pointer.
  */
-static void __of_free_phandle_cache(void)
+static struct device_node **__of_free_phandle_cache(void)
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
@@ -197,10 +201,12 @@ void of_populate_phandle_cache(void)
 	u32 cache_entries;
 	struct device_node *np;
 	u32 phandles = 0;
+	struct device_node **shadow;
+	struct device_node **tmp_phandle_cache;
 
 	raw_spin_lock_irqsave(&devtree_lock, flags);
 
-	__of_free_phandle_cache();
+	shadow = __of_free_phandle_cache();
 
 	for_each_of_allnodes(np)
 		if (np->phandle && np->phandle != OF_PHANDLE_ILLEGAL)
@@ -208,12 +214,19 @@ void of_populate_phandle_cache(void)
 
 	if (!phandles)
 		goto out;
+	/*
+	 * kcalloc() can't be used while a raw_spinlock_t held so it is dropped
+	 * for the allocation.
+	 */
+	raw_spin_unlock_irqrestore(&devtree_lock, flags);
 
 	cache_entries = roundup_pow_of_two(phandles);
 	phandle_cache_mask = cache_entries - 1;
 
-	phandle_cache = kcalloc(cache_entries, sizeof(*phandle_cache),
-				GFP_ATOMIC);
+	tmp_phandle_cache = kcalloc(cache_entries, sizeof(*phandle_cache),
+				    GFP_ATOMIC);
+	raw_spin_lock_irqsave(&devtree_lock, flags);
+	phandle_cache = tmp_phandle_cache;
 	if (!phandle_cache)
 		goto out;
 
@@ -225,6 +238,7 @@ void of_populate_phandle_cache(void)
 
 out:
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
+	kfree(shadow);
 }
 
 void __init of_core_init(void)
