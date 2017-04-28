From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 2/2] of: fix unittest build without CONFIG_OF_OVERLAY
Date: Fri, 28 Apr 2017 11:44:12 +0200
Message-ID: <20170428094429.2396195-2-arnd@arndb.de>
References: <20170428094429.2396195-1-arnd@arndb.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170428094429.2396195-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

We get a link error when the new tests are used by overlays
are not:

drivers/of/built-in.o: In function `unflatten_device_tree':
(.init.text+0x967): undefined reference to `unittest_unflatten_overlay_base'

This makes the #ifdef check match the symbols that lead to building
the unittest_unflatten_overlay_base function.

Fixes: 81d0848fc8d2 ("of: Add unit tests for applying overlays")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/of/of_private.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index de5c604f5cc4..4ebb0149d118 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -55,7 +55,7 @@ static inline int of_property_notify(int action, struct device_node *np,
 }
 #endif /* CONFIG_OF_DYNAMIC */
 
-#ifdef CONFIG_OF_UNITTEST
+#if defined(CONFIG_OF_UNITTEST) && defined(CONFIG_OF_OVERLAY)
 extern void __init unittest_unflatten_overlay_base(void);
 #else
 static inline void unittest_unflatten_overlay_base(void) {};
-- 
2.9.0
