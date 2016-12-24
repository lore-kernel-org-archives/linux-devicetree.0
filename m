From: Geliang Tang <geliangtang@gmail.com>
Subject: [PATCH] of: drop duplicate headers
Date: Sat, 24 Dec 2016 23:45:06 +0800
Message-ID: <2dbc4a9165d0a1e1569dc3990cbe5567fb312c74.1482593743.git.geliangtang@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: Geliang Tang <geliangtang@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Drop duplicate headers string.h and of_platform.h.

Signed-off-by: Geliang Tang <geliangtang@gmail.com>
---
 drivers/of/overlay.c  | 1 -
 drivers/of/resolver.c | 1 -
 drivers/of/unittest.c | 1 -
 3 files changed, 3 deletions(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 0d4cda7..d4e337e 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -18,7 +18,6 @@
 #include <linux/string.h>
 #include <linux/ctype.h>
 #include <linux/errno.h>
-#include <linux/string.h>
 #include <linux/slab.h>
 #include <linux/err.h>
 #include <linux/idr.h>
diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
index 8bf12e9..7ae9863 100644
--- a/drivers/of/resolver.c
+++ b/drivers/of/resolver.c
@@ -18,7 +18,6 @@
 #include <linux/string.h>
 #include <linux/ctype.h>
 #include <linux/errno.h>
-#include <linux/string.h>
 #include <linux/slab.h>
 
 /* illegal phandle value (set when unresolved) */
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 53c83d6..b4e8236 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -17,7 +17,6 @@
 #include <linux/slab.h>
 #include <linux/device.h>
 #include <linux/platform_device.h>
-#include <linux/of_platform.h>
 
 #include <linux/i2c.h>
 #include <linux/i2c-mux.h>
-- 
2.9.3
