From: Mukesh Ojha <mojha@codeaurora.org>
Subject: [PATCH] of: Drop redundant check in linker section OF match table
Date: Wed, 20 Mar 2019 16:19:00 +0530
Message-ID: <1553078940-9907-1-git-send-email-mojha@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Mukesh Ojha <mojha@codeaurora.org>, Rob Herring <robh@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Existing check of `fn` against NULL inside OF match table
is redundant. Remove the check.

Signed-off-by: Mukesh Ojha <mojha@codeaurora.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: devicetree@vger.kernel.org
---
 include/linux/of.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/of.h b/include/linux/of.h
index e240992..b86c00a 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -1283,13 +1283,13 @@ static inline int of_get_available_child_count(const struct device_node *np)
 	static const struct of_device_id __of_table_##name		\
 		__used __section(__##table##_of_table)			\
 		 = { .compatible = compat,				\
-		     .data = (fn == (fn_type)NULL) ? fn : fn  }
+		     .data = fn }
 #else
 #define _OF_DECLARE(table, name, compat, fn, fn_type)			\
 	static const struct of_device_id __of_table_##name		\
 		__attribute__((unused))					\
 		 = { .compatible = compat,				\
-		     .data = (fn == (fn_type)NULL) ? fn : fn }
+		     .data = fn }
 #endif
 
 typedef int (*of_init_fn_2)(struct device_node *, struct device_node *);
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center,
Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project
