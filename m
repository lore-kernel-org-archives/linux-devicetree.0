From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] scripts/dtc: consolidate include path options in Makefile
Date: Wed,  4 Jul 2018 10:59:23 +0900
Message-ID: <1530669563-32637-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Frank Rowand <frowand.list@gmail.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

It is tedious to specify extra compiler options for every file.
HOST_EXTRACFLAGS is useful to add options to all files in a
directory.

-I$(src)/libfdt is needed for all the files in this directory
to include libfdt_env.h etc. from scripts/dtc/libfdt/.

On the other hand, -I$(src) is used to include check-in headers
from generated C files.  Thus, I added it only to dtc-lexer.lex.o
and dtc-parser.tab.o .

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/dtc/Makefile | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/scripts/dtc/Makefile b/scripts/dtc/Makefile
index 9cac65b..1c943e0 100644
--- a/scripts/dtc/Makefile
+++ b/scripts/dtc/Makefile
@@ -9,21 +9,11 @@ dtc-objs	:= dtc.o flattree.o fstree.o data.o livetree.o treesource.o \
 dtc-objs	+= dtc-lexer.lex.o dtc-parser.tab.o
 
 # Source files need to get at the userspace version of libfdt_env.h to compile
+HOST_EXTRACFLAGS := -I$(src)/libfdt
 
-HOSTCFLAGS_DTC := -I$(src) -I$(src)/libfdt
-
-HOSTCFLAGS_checks.o := $(HOSTCFLAGS_DTC)
-HOSTCFLAGS_data.o := $(HOSTCFLAGS_DTC)
-HOSTCFLAGS_dtc.o := $(HOSTCFLAGS_DTC)
-HOSTCFLAGS_flattree.o := $(HOSTCFLAGS_DTC)
-HOSTCFLAGS_fstree.o := $(HOSTCFLAGS_DTC)
-HOSTCFLAGS_livetree.o := $(HOSTCFLAGS_DTC)
-HOSTCFLAGS_srcpos.o := $(HOSTCFLAGS_DTC)
-HOSTCFLAGS_treesource.o := $(HOSTCFLAGS_DTC)
-HOSTCFLAGS_util.o := $(HOSTCFLAGS_DTC)
-
-HOSTCFLAGS_dtc-lexer.lex.o := $(HOSTCFLAGS_DTC)
-HOSTCFLAGS_dtc-parser.tab.o := $(HOSTCFLAGS_DTC)
+# Generated files need one more search path to include headers in source tree
+HOSTCFLAGS_dtc-lexer.lex.o := -I$(src)
+HOSTCFLAGS_dtc-parser.tab.o := -I$(src)
 
 # dependencies on generated files need to be listed explicitly
 $(obj)/dtc-lexer.lex.o: $(obj)/dtc-parser.tab.h
-- 
2.7.4
