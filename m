From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] of: simplify arch_find_n_match_cpu_physical_id() function
Date: Wed, 28 Oct 2015 12:05:27 +0900
Message-ID: <1446001527-6700-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

This commit does not change the function behavior.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/of/base.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 8b5a187..017dd94 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -375,10 +375,7 @@ bool __weak arch_find_n_match_cpu_physical_id(struct device_node *cpun,
 					   cpu, thread))
 		return true;
 
-	if (__of_find_n_match_cpu_property(cpun, "reg", cpu, thread))
-		return true;
-
-	return false;
+	return __of_find_n_match_cpu_property(cpun, "reg", cpu, thread);
 }
 
 /**
-- 
1.9.1
