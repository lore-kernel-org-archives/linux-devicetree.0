From: Rob Herring <robh@kernel.org>
Subject: [PATCH 1/6] kbuild: remove remaining use of undefined YACC_PREFIX
Date: Wed, 28 Feb 2018 17:32:44 -0600
Message-ID: <20180228233249.26281-2-robh@kernel.org>
References: <20180228233249.26281-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180228233249.26281-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Commit eea199b445f6 ("kbuild: remove unnecessary LEX_PREFIX and
YACC_PREFIX") removed YACC_PREFIX definition, but left one use of it. There
was not any build error since there is no user of "cmd_bison_h" currently.
Remove the last remaining occurrence of YACC_PREFIX.

Fixes: eea199b445f6 ("kbuild: remove unnecessary LEX_PREFIX and YACC_PREFIX")
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 scripts/Makefile.lib | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 5589bae34af6..1bc2f90cb8c0 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -217,7 +217,7 @@ $(filter %.tab.c,$(targets)): $(obj)/%.tab.c: $(src)/%.y FORCE
 	$(call if_changed,bison)
 
 quiet_cmd_bison_h = YACC    $@
-      cmd_bison_h = bison -o/dev/null --defines=$@ -t -l -p $(YACC_PREFIX) $<
+      cmd_bison_h = bison -o/dev/null --defines=$@ -t -l $<
 
 ifdef REGENERATE_PARSERS
 .PRECIOUS: $(src)/%.tab.h_shipped
-- 
2.14.1
