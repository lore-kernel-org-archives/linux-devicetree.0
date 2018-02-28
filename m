From: Rob Herring <robh@kernel.org>
Subject: [PATCH 2/6] kbuild: add dtc as dependency on .dtb files
Date: Wed, 28 Feb 2018 17:32:45 -0600
Message-ID: <20180228233249.26281-3-robh@kernel.org>
References: <20180228233249.26281-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180228233249.26281-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

If dtc is rebuilt, we should rebuild .dtb files with the new dtc.

Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 scripts/Makefile.lib | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 1bc2f90cb8c0..6aeb91524c76 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -316,7 +316,7 @@ cmd_dtc = mkdir -p $(dir ${dtc-tmp}) ; \
 		-d $(depfile).dtc.tmp $(dtc-tmp) ; \
 	cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
 
-$(obj)/%.dtb: $(src)/%.dts FORCE
+$(obj)/%.dtb: $(src)/%.dts $(DTC) FORCE
 	$(call if_changed_dep,dtc)
 
 dtc-tmp = $(subst $(comma),_,$(dot-target).dts.tmp)
-- 
2.14.1
