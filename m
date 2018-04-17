Return-Path: <SRS0=UpLl=HG=ti.com=t-kristo@kernel.org>
From: Tero Kristo <t-kristo@ti.com>
Subject: [RFC 09/13] kbuild: add support for generating FIT images
Date: Tue, 17 Apr 2018 12:10:11 +0300
Message-ID: <1523956215-28154-10-git-send-email-t-kristo@ti.com>
In-Reply-To: <1523956215-28154-1-git-send-email-t-kristo@ti.com>
References: <1523956215-28154-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: devicetree@vger.kernel.org, robh+dt@kernel.org, frowand.list@gmail.com, mark.rutland@arm.com
Cc: wmills@ti.com, tony@atomide.com, trini@konsulko.com, rmk@armlinux.org.uk
List-ID: <devicetree@vger.kernel.org>

FIT images are built with the mkimage tool, from source description
similar to that of DT files. There are a few FIT image generation
specifics that must be noted with this patch.

The dependency generation for the FIT files requires some makefile
magic, due to the build ordering; the dependency binaries must have
been built before the FIT image itself, which is different from typical
kernel build flow (source files are be built immediately and dependencies
can be generated during build.) To use the generated dependency files,
the user must manually include the local .itb-deps.d file in their makefile.

The PATH environment variable while calling the mkimage tool is tweaked
to contain the local / user provided DTC as first item, so that the
correct version of mkimage tool will be used. Otherwise, the build will
use the system default DTC, or won't find the tool at all.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 scripts/Makefile.lib | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 95f7a17..18517ea 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -295,6 +295,38 @@ $(obj)/%.dtbo: $(src)/%.dtso $(DTC) FORCE
 
 dtc-tmp = $(subst $(comma),_,$(dot-target).dts.tmp)
 
+# FIT
+# ---------------------------------------------------------------------------
+define gen_itb_deps
+	@if [ -d $(obj) ] ; then \
+		echo >> $(obj)/.itb-deps.d ; \
+		echo "$(src)/$(patsubst %.its,%.itb,$(notdir $(1))): $(srctree)/$(src)/$(notdir $(1)) \\" >> $(obj)/.itb-deps.d ; \
+		cat $(1) | grep incbin | cut -d "\"" -f 2 | awk '{ printf " $(src)/%s \\\n", $$1 }' | sed '$$s/ \\$$//' >> $(obj)/.itb-deps.d ; \
+	fi
+
+endef
+
+$(obj)/.itb-deps.d:
+	@if [ -d $(obj) ] ; then \
+		echo "$(src)/.itb-deps.d: $(src)/Makefile $(wildcard $(srctree)/$(src)/*.its)" > $(obj)/.itb-deps.d ; \
+		echo >> $(obj)/.itb-deps.d ; \
+	fi
+	$(foreach f,$(wildcard $(srctree)/$(src)/*.its),$(call gen_itb_deps,$f))
+
+DTC_FLAGS_MKIMAGE = -I dts -O dtb -p 500 -Wno-unit_address_vs_reg \
+	-i $(src)
+ifneq ($(DTC),)
+  DTC_PATH=$(dir $(DTC))
+else
+  DTC_PATH=$(objtree)/scripts/dtc
+endif
+
+quiet_cmd_mkdir = MKIMAGE -f $@
+cmd_mkfit = PATH="$(DTC_PATH):$(PATH)" $(MKIMAGE) -D "$(DTC_FLAGS_MKIMAGE)" -f $< $@
+
+$(obj)/%.itb: $(src)/%.its FORCE
+	$(call cmd,mkfit)
+
 # Bzip2
 # ---------------------------------------------------------------------------
 
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
