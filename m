From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] libfdt: reduce the number of headers included from libfdt_env.h
Date: Tue, 18 Jun 2019 01:21:23 +0900
Message-ID: <20190617162123.24920-1-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

Currently, libfdt_env.h includes <linux/kernel.h> just for INT_MAX.

<linux/kernel.h> pulls in a lots of broat.

Thanks to commit 54d50897d544 ("linux/kernel.h: split *_MAX and *_MIN
macros into <linux/limits.h>"), <linux/kernel.h> can be replaced with
<linux/limits.h>.

This saves including dozens of headers.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 include/linux/libfdt_env.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/libfdt_env.h b/include/linux/libfdt_env.h
index edb0f0c30904..2231eb855e8f 100644
--- a/include/linux/libfdt_env.h
+++ b/include/linux/libfdt_env.h
@@ -2,7 +2,7 @@
 #ifndef LIBFDT_ENV_H
 #define LIBFDT_ENV_H
 
-#include <linux/kernel.h>	/* For INT_MAX */
+#include <linux/limits.h>	/* For INT_MAX */
 #include <linux/string.h>
 
 #include <asm/byteorder.h>
-- 
2.17.1
