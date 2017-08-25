From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: [PATCH v2] OF: move extern declarations of of_stdout inside ifdef
Date: Fri, 25 Aug 2017 19:56:44 +0300
Message-ID: <20170825165644.30800-1-Eugeniy.Paltsev@synopsys.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
List-Id: devicetree@vger.kernel.org

Move extern declarations of "of_stdout" pointer inside "CONFIG_OF"
ifdef to be able to get rid of "CONFIG_OF" ifdef in its usage places.

Suggested-by: Steven Rostedt <rostedt@goodmis.org>

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
For example see: https://lkml.org/lkml/2017/8/25/337

Changes v1->v2:
 * Move only "of_stdout" declarations instead of all entry pointers
   declarations

 include/linux/of.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/of.h b/include/linux/of.h
index cfc3411..be28cb9 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -135,7 +135,6 @@ static inline void of_node_put(struct device_node *node) { }
 extern struct device_node *of_root;
 extern struct device_node *of_chosen;
 extern struct device_node *of_aliases;
-extern struct device_node *of_stdout;
 extern raw_spinlock_t devtree_lock;
 
 /* flag descriptions (need to be visible even when !CONFIG_OF) */
@@ -147,6 +146,8 @@ extern raw_spinlock_t devtree_lock;
 #define OF_BAD_ADDR	((u64)-1)
 
 #ifdef CONFIG_OF
+extern struct device_node *of_stdout;
+
 void of_core_init(void);
 
 static inline bool is_of_node(const struct fwnode_handle *fwnode)
@@ -539,6 +540,7 @@ const char *of_prop_next_string(struct property *prop, const char *cur);
 bool of_console_check(struct device_node *dn, char *name, int index);
 
 #else /* CONFIG_OF */
+#define of_stdout	NULL
 
 static inline void of_core_init(void)
 {
-- 
2.9.3
