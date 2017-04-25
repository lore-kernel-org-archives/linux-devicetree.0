From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] of: Introduce of_node_get_match_data() helper
Date: Tue, 25 Apr 2017 19:40:07 +0200
Message-ID: <1493142007-29347-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

If CONFIG_OF=n, code using

    info = of_match_node(matchs, np)->data;

fails to compile:

    warning: dereferencing ‘void *’ pointer
    error: request for member ‘data’ in something not a structure or union

Follow the example set by of_device_get_match_data(), and introduce a
new helper of_node_get_match_data().  This will allow to increase
compile-testing coverage later.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/of/base.c  | 13 +++++++++++++
 include/linux/of.h |  7 +++++--
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index d7c4629a3a2decb6..473d002ba7203115 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1022,6 +1022,19 @@ const struct of_device_id *of_match_node(const struct of_device_id *matches,
 }
 EXPORT_SYMBOL(of_match_node);
 
+const void *of_node_get_match_data(const struct of_device_id *matches,
+				   const struct device_node *node)
+{
+	const struct of_device_id *match;
+
+	match = of_match_node(matches, node);
+	if (!match)
+		return NULL;
+
+	return match->data;
+}
+EXPORT_SYMBOL(of_node_get_match_data);
+
 /**
  *	of_find_matching_node_and_match - Find a node based on an of_device_id
  *					  match table.
diff --git a/include/linux/of.h b/include/linux/of.h
index bfd1a23221735161..214e41eac4e5634f 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -337,6 +337,8 @@ extern int of_n_addr_cells(struct device_node *np);
 extern int of_n_size_cells(struct device_node *np);
 extern const struct of_device_id *of_match_node(
 	const struct of_device_id *matches, const struct device_node *node);
+extern const void *of_node_get_match_data(const struct of_device_id *matches,
+					  const struct device_node *node);
 extern int of_modalias_node(struct device_node *node, char *modalias, int len);
 extern void of_print_phandle_args(const char *msg, const struct of_phandle_args *args);
 extern struct device_node *of_parse_phandle(const struct device_node *np,
@@ -844,8 +846,9 @@ static inline void of_property_clear_flag(struct property *p, unsigned long flag
 {
 }
 
-#define of_match_ptr(_ptr)	NULL
-#define of_match_node(_matches, _node)	NULL
+#define of_match_ptr(_ptr)			NULL
+#define of_match_node(_matches, _node)		NULL
+#define of_node_get_match_data(_matches, _node)	NULL
 #endif /* CONFIG_OF */
 
 /* Default string compare functions, Allow arch asm/prom.h to override */
-- 
2.7.4
