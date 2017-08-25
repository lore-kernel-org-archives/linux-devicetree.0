From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: [PATCH] OF: move extern declarations of entry pointers inside ifdef
Date: Fri, 25 Aug 2017 18:00:26 +0300
Message-ID: <20170825150027.25341-1-Eugeniy.Paltsev@synopsys.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
List-Id: devicetree@vger.kernel.org

Move extern declarations of "of_root", "of_chosen", "of_aliases",
"of_stdout" pointers inside "CONFIG_OF" ifdef to be able to get rid
of "CONFIG_OF" ifdef in their usage places.

Suggested-by: Steven Rostedt <rostedt@goodmis.org>

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
For example see: https://lkml.org/lkml/2017/8/25/337

 include/linux/of.h | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/include/linux/of.h b/include/linux/of.h
index cfc3411..d117bf1 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -131,11 +131,6 @@ static inline struct device_node *of_node_get(struct device_node *node)
 static inline void of_node_put(struct device_node *node) { }
 #endif /* !CONFIG_OF_DYNAMIC */
 
-/* Pointer for first entry in chain of all nodes. */
-extern struct device_node *of_root;
-extern struct device_node *of_chosen;
-extern struct device_node *of_aliases;
-extern struct device_node *of_stdout;
 extern raw_spinlock_t devtree_lock;
 
 /* flag descriptions (need to be visible even when !CONFIG_OF) */
@@ -147,6 +142,12 @@ extern raw_spinlock_t devtree_lock;
 #define OF_BAD_ADDR	((u64)-1)
 
 #ifdef CONFIG_OF
+/* Pointer for first entry in chain of all nodes. */
+extern struct device_node *of_root;
+extern struct device_node *of_chosen;
+extern struct device_node *of_aliases;
+extern struct device_node *of_stdout;
+
 void of_core_init(void);
 
 static inline bool is_of_node(const struct fwnode_handle *fwnode)
@@ -539,6 +540,10 @@ const char *of_prop_next_string(struct property *prop, const char *cur);
 bool of_console_check(struct device_node *dn, char *name, int index);
 
 #else /* CONFIG_OF */
+#define of_root		NULL
+#define of_chosen	NULL
+#define of_aliases	NULL
+#define of_stdout	NULL
 
 static inline void of_core_init(void)
 {
-- 
2.9.3
