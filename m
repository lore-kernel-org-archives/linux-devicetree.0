From: Rob Herring <robh@kernel.org>
Subject: [PATCH v2 13/13] xtensa: enable building of all dtbs
Date: Thu,  8 Oct 2015 12:53:47 -0500
Message-ID: <1444326827-3565-14-git-send-email-robh@kernel.org>
References: <1444326827-3565-1-git-send-email-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444326827-3565-1-git-send-email-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Grant Likely <grant.likely@linaro.org>, Frank Rowand <frowand.list@gmail.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Olof Johansson <olof@lixom.net>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, linux-xtensa@linux-xtensa.org
List-Id: devicetree@vger.kernel.org

Enable building all dtb files when CONFIG_OF_ALL_DTBS is enabled. The dtbs
are not really dependent on a platform being enabled or any other kernel
config, so for testing coverage it is convenient to build all of the dtbs.
This builds all dts files in the tree, not just targets listed.

Signed-off-by: Rob Herring <robh@kernel.org>
Cc: Chris Zankel <chris@zankel.net>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: linux-xtensa@linux-xtensa.org
---
 arch/xtensa/Makefile          | 4 ++++
 arch/xtensa/boot/dts/Makefile | 7 ++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/xtensa/Makefile b/arch/xtensa/Makefile
index f9e6a06..709b574 100644
--- a/arch/xtensa/Makefile
+++ b/arch/xtensa/Makefile
@@ -101,6 +101,10 @@ zImage: vmlinux
 %.dtb:
 	$(Q)$(MAKE) $(build)=$(boot)/dts $(boot)/dts/$@
 
+dtbs: scripts
+	$(Q)$(MAKE) $(build)=$(boot)/dts
+
 define archhelp
   @echo '* zImage      - Compressed kernel image (arch/xtensa/boot/images/zImage.*)'
+  @echo '  dtbs        - Build device tree blobs for enabled boards'
 endef
diff --git a/arch/xtensa/boot/dts/Makefile b/arch/xtensa/boot/dts/Makefile
index 5f711bb..a15e241 100644
--- a/arch/xtensa/boot/dts/Makefile
+++ b/arch/xtensa/boot/dts/Makefile
@@ -12,4 +12,9 @@ ifneq ($(CONFIG_BUILTIN_DTB),"")
 obj-$(CONFIG_OF) += $(BUILTIN_DTB)
 endif
 
-clean-files := *.dtb.S
+dtstree := $(srctree)/$(src)
+dtb-$(CONFIG_OF_ALL_DTBS) := $(patsubst $(dtstree)/%.dts,%.dtb, $(wildcard $(dtstree)/*.dts))
+
+always += $(dtb-y)
+clean-files += *.dtb *.dtb.S
+
-- 
2.1.4
