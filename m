From: Rob Herring <robh@kernel.org>
Subject: [PATCH] of: Fix property name in of_node_get_device_type
Date: Mon,  1 Oct 2018 11:01:04 -0500
Message-ID: <20181001160104.22573-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

Commit 0413bedabc88 ("of: Add device_type access helper functions")
added a new helper not yet used in preparation for some treewide clean
up of accesses to 'device_type' properties. Unfortunately, there's an
error and 'type' was used for the property name. Fix this.

Fixes: 0413bedabc88 ("of: Add device_type access helper functions")
Cc: Frank Rowand <frowand.list@gmail.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 include/linux/of.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/of.h b/include/linux/of.h
index f581531d797e..04cef4490efc 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -991,7 +991,7 @@ static inline struct device_node *of_find_matching_node(
 
 static inline const char *of_node_get_device_type(const struct device_node *np)
 {
-	return of_get_property(np, "type", NULL);
+	return of_get_property(np, "device_type", NULL);
 }
 
 static inline bool of_node_is_type(const struct device_node *np, const char *type)
-- 
2.17.1
