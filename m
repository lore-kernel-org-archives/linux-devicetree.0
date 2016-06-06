From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] of: factor __used / __unused out of _OF_DECLARE()
Date: Mon,  6 Jun 2016 18:45:17 +0900
Message-ID: <1465206317-4231-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

The difference between the "#if" and "#else" is __used / __unused,
so factor it out to avoid code duplication.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 include/linux/of.h | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/include/linux/of.h b/include/linux/of.h
index c7292e8..9b33e2e 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -995,18 +995,17 @@ static inline int of_get_available_child_count(const struct device_node *np)
 }
 
 #if defined(CONFIG_OF) && !defined(MODULE)
-#define _OF_DECLARE(table, name, compat, fn, fn_type)			\
-	static const struct of_device_id __of_table_##name		\
-		__used __section(__##table##_of_table)			\
-		 = { .compatible = compat,				\
-		     .data = (fn == (fn_type)NULL) ? fn : fn  }
+#define OF_DECLARE_USED_OR_UNUSED	__used
 #else
+#define OF_DECLARE_USED_OR_UNUSED	__maybe_unused
+#endif
+
 #define _OF_DECLARE(table, name, compat, fn, fn_type)			\
 	static const struct of_device_id __of_table_##name		\
-		__attribute__((unused))					\
+		OF_DECLARE_USED_OR_UNUSED				\
+		__section(__##table##_of_table)				\
 		 = { .compatible = compat,				\
 		     .data = (fn == (fn_type)NULL) ? fn : fn }
-#endif
 
 typedef int (*of_init_fn_2)(struct device_node *, struct device_node *);
 typedef void (*of_init_fn_1)(struct device_node *);
-- 
1.9.1
