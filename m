From: Rob Herring <robh@kernel.org>
Subject: [PATCH] dt-bindings: Pass binding directory to validation tools
Date: Tue, 21 May 2019 17:34:21 -0500
Message-ID: <20190521223421.10514-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org
List-Id: devicetree@vger.kernel.org

In order to have $ref's to schema files within the kernel, we need to
pass the base path of bindings to the schema validation tools.

Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: devicetree@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/Makefile | 2 +-
 scripts/Makefile.lib                       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/Makefile b/Documentation/devicetree/bindings/Makefile
index 63b139f9ae28..8a2774b5834b 100644
--- a/Documentation/devicetree/bindings/Makefile
+++ b/Documentation/devicetree/bindings/Makefile
@@ -5,7 +5,7 @@ DT_MK_SCHEMA ?= dt-mk-schema
 DT_MK_SCHEMA_FLAGS := $(if $(DT_SCHEMA_FILES), -u)
 
 quiet_cmd_chk_binding = CHKDT   $(patsubst $(srctree)/%,%,$<)
-      cmd_chk_binding = $(DT_DOC_CHECKER) $< ; \
+      cmd_chk_binding = $(DT_DOC_CHECKER) -u $(srctree)/$(src) $< ; \
                         $(DT_EXTRACT_EX) $< > $@
 
 $(obj)/%.example.dts: $(src)/%.yaml FORCE
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 1b412d4394ae..f1f38c8cdc74 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -298,7 +298,7 @@ DT_BINDING_DIR := Documentation/devicetree/bindings
 DT_TMP_SCHEMA := $(objtree)/$(DT_BINDING_DIR)/processed-schema.yaml
 
 quiet_cmd_dtb_check =	CHECK   $@
-      cmd_dtb_check =	$(DT_CHECKER) -p $(DT_TMP_SCHEMA) $@ ;
+      cmd_dtb_check =	$(DT_CHECKER) -u $(srctree)/$(DT_BINDING_DIR) -p $(DT_TMP_SCHEMA) $@ ;
 
 define rule_dtc_dt_yaml
 	$(call cmd_and_fixdep,dtc,yaml)
-- 
2.20.1
