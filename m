From: Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH] drivers/of: Export phandle iterators
Date: Wed, 23 Nov 2016 19:06:06 +0000
Message-ID: <a1fa1157cab10f2a6f319d431d355cef79b91820.1479927866.git.robin.murphy@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

Modular drivers may want to use of_for_each_phandle() - export its
constituent functions.

CC: Rob Herring <robh+dt@kernel.org>
CC: Frank Rowand <frowand.list@gmail.com>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/of/base.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index a0bccb54a9bd..92e35fe0189a 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1563,6 +1563,7 @@ int of_phandle_iterator_init(struct of_phandle_iterator *it,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(of_phandle_iterator_init);
 
 int of_phandle_iterator_next(struct of_phandle_iterator *it)
 {
@@ -1632,6 +1633,7 @@ int of_phandle_iterator_next(struct of_phandle_iterator *it)
 
 	return -EINVAL;
 }
+EXPORT_SYMBOL_GPL(of_phandle_iterator_next);
 
 int of_phandle_iterator_args(struct of_phandle_iterator *it,
 			     uint32_t *args,
@@ -1649,6 +1651,7 @@ int of_phandle_iterator_args(struct of_phandle_iterator *it,
 
 	return count;
 }
+EXPORT_SYMBOL_GPL(of_phandle_iterator_args);
 
 static int __of_parse_phandle_with_args(const struct device_node *np,
 					const char *list_name,
-- 
2.10.2.dirty
