From: Rob Herring <robh@kernel.org>
Subject: [PATCH] of/pdt: Remove unused of_pdt_build_more function ptr
Date: Wed,  7 Nov 2018 10:18:24 -0600
Message-ID: <20181107161824.30839-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

There are no users of of_pdt_build_more since 2012, so remove it.

Cc: Frank Rowand <frowand.list@gmail.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/of/pdt.c       | 5 -----
 include/linux/of_pdt.h | 2 --
 2 files changed, 7 deletions(-)

diff --git a/drivers/of/pdt.c b/drivers/of/pdt.c
index 013e65de074a..4fc0fd96ed04 100644
--- a/drivers/of/pdt.c
+++ b/drivers/of/pdt.c
@@ -21,8 +21,6 @@
 
 static struct of_pdt_ops *of_pdt_prom_ops __initdata;
 
-void __initdata (*of_pdt_build_more)(struct device_node *dp);
-
 #if defined(CONFIG_SPARC)
 unsigned int of_pdt_unique_id __initdata;
 
@@ -208,9 +206,6 @@ static struct device_node * __init of_pdt_build_tree(struct device_node *parent,
 
 		dp->child = of_pdt_build_tree(dp, of_pdt_prom_ops->getchild(node));
 
-		if (of_pdt_build_more)
-			of_pdt_build_more(dp);
-
 		node = of_pdt_prom_ops->getsibling(node);
 	}
 
diff --git a/include/linux/of_pdt.h b/include/linux/of_pdt.h
index d0b183ab65c6..89e4eb076a01 100644
--- a/include/linux/of_pdt.h
+++ b/include/linux/of_pdt.h
@@ -35,6 +35,4 @@ extern void *prom_early_alloc(unsigned long size);
 /* for building the device tree */
 extern void of_pdt_build_devicetree(phandle root_node, struct of_pdt_ops *ops);
 
-extern void (*of_pdt_build_more)(struct device_node *dp);
-
 #endif /* _LINUX_OF_PDT_H */
-- 
2.19.1
