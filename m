From: Rob Herring <robh@kernel.org>
Subject: [PATCH 3/6] of: make struct property _flags field configurable
Date: Thu,  5 Oct 2017 14:44:19 -0500
Message-ID: <20171005194422.26224-4-robh@kernel.org>
References: <20171005194422.26224-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171005194422.26224-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Nicolas Pitre <nico@linaro.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <glikely@secretlab.ca>
List-Id: devicetree@vger.kernel.org

Only Sparc and CONFIG_OF_DYNAMIC use the struct property._flags field,
so make it conditional shrinking struct property a bit.

Cc: Nicolas Pitre <nico@linaro.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 include/linux/of.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/of.h b/include/linux/of.h
index 8f9e96752837..7eb94b7fbcf3 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -37,7 +37,9 @@ struct property {
 	int	length;
 	void	*value;
 	struct property *next;
+#if defined(CONFIG_OF_DYNAMIC) || defined(CONFIG_SPARC)
 	unsigned long _flags;
+#endif
 #if defined(CONFIG_OF_PROMTREE)
 	unsigned int unique_id;
 #endif
@@ -205,6 +207,7 @@ static inline void of_node_clear_flag(struct device_node *n, unsigned long flag)
 	clear_bit(flag, &n->_flags);
 }
 
+#if defined(CONFIG_OF_DYNAMIC) || defined(CONFIG_SPARC)
 static inline int of_property_check_flag(struct property *p, unsigned long flag)
 {
 	return test_bit(flag, &p->_flags);
@@ -219,6 +222,7 @@ static inline void of_property_clear_flag(struct property *p, unsigned long flag
 {
 	clear_bit(flag, &p->_flags);
 }
+#endif
 
 extern struct device_node *__of_find_all_nodes(struct device_node *prev);
 extern struct device_node *of_find_all_nodes(struct device_node *prev);
-- 
2.11.0
