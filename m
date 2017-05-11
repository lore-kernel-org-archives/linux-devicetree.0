From: Rob Herring <robh@kernel.org>
Subject: [PATCH] Partially Revert "of: fix sparse warnings in fdt, irq, reserved mem, and resolver code"
Date: Thu, 11 May 2017 10:30:48 -0500
Message-ID: <20170511153048.3586-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: devicetree@vger.kernel.org

A change to function pointers that was meant to address a sparse warning
turned out to cause hundreds of new gcc-7 warnings:

include/linux/of_irq.h:11:13: error: type qualifiers ignored on function return type [-Werror=ignored-qualifiers]
drivers/of/of_reserved_mem.c: In function '__reserved_mem_init_node':
drivers/of/of_reserved_mem.c:200:7: error: type qualifiers ignored on function return type [-Werror=ignored-qualifiers]
   int const (*initfn)(struct reserved_mem *rmem) = i->data;

Turns out the sparse warnings were spurious and have been fixed in
upstream sparse since 0.5.0 in commit "sparse: treat function pointers
as pointers to const data".

This partially reverts commit 17a70355ea576843a7ac851f1db26872a50b2850.

Fixes: 17a70355ea57 ("of: fix sparse warnings in fdt, irq, reserved mem, and resolver code")
Reported-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Rob Herring <robh@kernel.org>
---
Arnd,

Doing this as a partial revert instead and added sparse version 
information to the commit msg.

Rob

 drivers/of/of_reserved_mem.c | 2 +-
 include/linux/of_irq.h       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 4dec07ea510f..d507c3569a88 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -197,7 +197,7 @@ static int __init __reserved_mem_init_node(struct reserved_mem *rmem)
 	const struct of_device_id *i;
 
 	for (i = __reservedmem_of_table; i < &__rmem_of_table_sentinel; i++) {
-		int const (*initfn)(struct reserved_mem *rmem) = i->data;
+		reservedmem_of_init_fn initfn = i->data;
 		const char *compat = i->compatible;
 
 		if (!of_flat_dt_is_compatible(rmem->fdt_node, compat))
diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
index ec6b11deb773..1e0deb8e8494 100644
--- a/include/linux/of_irq.h
+++ b/include/linux/of_irq.h
@@ -8,7 +8,7 @@
 #include <linux/ioport.h>
 #include <linux/of.h>
 
-typedef int const (*of_irq_init_cb_t)(struct device_node *, struct device_node *);
+typedef int (*of_irq_init_cb_t)(struct device_node *, struct device_node *);
 
 /*
  * Workarounds only applied to 32bit powermac machines
-- 
2.11.0
