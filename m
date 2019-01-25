From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] libfdt: prefix header search paths with $(srctree)/
Date: Fri, 25 Jan 2019 12:41:38 +0900
Message-ID: <1548387699-9222-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Currently, the Kbuild core manipulates header search paths in a crazy
way [1].

To fix this mess, I want all Makefiles to add explicit $(srctree)/ to
the search paths in the srctree. Some Makefiles are already written in
that way, but not all. The goal of this work is to make the notation
consistent, and finally get rid of the gross hacks.

Having whitespaces after -I does not matter since commit 48f6e3cf5bc6
("kbuild: do not drop -I without parameter").

[1]: https://patchwork.kernel.org/patch/9632347/

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 lib/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/Makefile b/lib/Makefile
index e1b59da..05973c1 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -208,7 +208,7 @@ KCOV_INSTRUMENT_stackdepot.o := n
 libfdt_files = fdt.o fdt_ro.o fdt_wip.o fdt_rw.o fdt_sw.o fdt_strerror.o \
 	       fdt_empty_tree.o
 $(foreach file, $(libfdt_files), \
-	$(eval CFLAGS_$(file) = -I$(src)/../scripts/dtc/libfdt))
+	$(eval CFLAGS_$(file) = -I $(srctree)/scripts/dtc/libfdt))
 lib-$(CONFIG_LIBFDT) += $(libfdt_files)
 
 obj-$(CONFIG_RBTREE_TEST) += rbtree_test.o
-- 
2.7.4
