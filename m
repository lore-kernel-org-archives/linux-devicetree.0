From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] of: unittest: move misplaced function declaration
Date: Tue, 13 Mar 2018 14:15:42 +0100
Message-ID: <20180313131600.85356-1-arnd@arndb.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The overlay_data_apply() declaration is outside of the #ifdef that contains
both the user and the definition, causing a compile-time warning in
some configurations:

drivers/of/unittest.c:48:19: error: 'overlay_data_apply' declared 'static' but never defined [-Werror=unused-function]
 static int __init overlay_data_apply(const char *overlay_name, int *overlay_id);

This moves the declaration into the #ifdef section.

Fixes: 39a751a4cb7e ("of: change overlay apply input data from unflattened to FDT")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/of/unittest.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index dede77a79820..260d5245491b 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -45,8 +45,6 @@ static struct unittest_results {
 	failed; \
 })
 
-static int __init overlay_data_apply(const char *overlay_name, int *overlay_id);
-
 static void __init of_unittest_find_node_by_name(void)
 {
 	struct device_node *np;
@@ -1185,6 +1183,7 @@ static int __init unittest_data_add(void)
 }
 
 #ifdef CONFIG_OF_OVERLAY
+static int __init overlay_data_apply(const char *overlay_name, int *overlay_id);
 
 static int unittest_probe(struct platform_device *pdev)
 {
-- 
2.9.0
