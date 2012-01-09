From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/2] Kbuild: Use dtc's -d (dependency) option
Date: Mon,  9 Jan 2012 11:38:15 -0700
Message-ID: <1326134295-15547-2-git-send-email-swarren@nvidia.com>
References: <1326134295-15547-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1326134295-15547-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Michal Marek <mmarek-AlSwsSmVLrQ@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-c6x-dev-jPsnJVOj+W6hPH1hqNUYSQ@public.gmane.org, Aurelien Jacquiot <a-jacquiot-l0cyMroinI0@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org, linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-ZwoEplunGu2h2975yA52AaxOck334EZe@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This hooks dtc into Kbuild's dependency system.

Thus, for example, "make dtbs" will rebuild tegra-harmony.dtb if only
tegra20.dtsi has changed yet tegra-harmony.dts has not. The previous
lack of this feature recently caused me to have very confusing "git
bisect" results.

For ARM, it's obvious what to add to $(targets). I'm not familiar enough
with other architectures to know what to add there. Powerpc appears to
already add various .dtb files into $(targets), but the other archs may
need something added to $(targets) to work.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
I have only tested this series for ARM.

 arch/arm/boot/Makefile        |    6 ++++--
 arch/c6x/boot/Makefile        |    2 +-
 arch/microblaze/boot/Makefile |    2 +-
 arch/openrisc/boot/Makefile   |    4 ++--
 arch/powerpc/boot/Makefile    |    4 ++--
 scripts/Makefile.lib          |    2 +-
 6 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/Makefile b/arch/arm/boot/Makefile
index 1338cf0..c72730d 100644
--- a/arch/arm/boot/Makefile
+++ b/arch/arm/boot/Makefile
@@ -62,9 +62,11 @@ $(obj)/zImage-dtb.%:	$(obj)/%.dtb $(obj)/zImage
 
 endif
 
+targets += $(dtb-y)
+
 # Rule to build device tree blobs
-$(obj)/%.dtb: $(src)/dts/%.dts
-	$(call cmd,dtc)
+$(obj)/%.dtb: $(src)/dts/%.dts FORCE
+	$(call if_changed_dep,dtc)
 
 $(obj)/dtbs: $(addprefix $(obj)/, $(dtb-y))
 
diff --git a/arch/c6x/boot/Makefile b/arch/c6x/boot/Makefile
index ecca820..6891257 100644
--- a/arch/c6x/boot/Makefile
+++ b/arch/c6x/boot/Makefile
@@ -13,7 +13,7 @@ obj-y += linked_dtb.o
 endif
 
 $(obj)/%.dtb: $(src)/dts/%.dts FORCE
-	$(call cmd,dtc)
+	$(call if_changed_dep,dtc)
 
 quiet_cmd_cp = CP      $< $@$2
 	cmd_cp = cat $< >$@$2 || (rm -f $@ && echo false)
diff --git a/arch/microblaze/boot/Makefile b/arch/microblaze/boot/Makefile
index 4c4e58e..0c796cf 100644
--- a/arch/microblaze/boot/Makefile
+++ b/arch/microblaze/boot/Makefile
@@ -53,6 +53,6 @@ $(obj)/simpleImage.%: vmlinux FORCE
 DTC_FLAGS := -p 1024
 
 $(obj)/%.dtb: $(src)/dts/%.dts FORCE
-	$(call cmd,dtc)
+	$(call if_changed_dep,dtc)
 
 clean-files += *.dtb simpleImage.*.unstrip linux.bin.ub
diff --git a/arch/openrisc/boot/Makefile b/arch/openrisc/boot/Makefile
index 98ca185..0995835 100644
--- a/arch/openrisc/boot/Makefile
+++ b/arch/openrisc/boot/Makefile
@@ -11,5 +11,5 @@ clean-files := *.dtb.S
 
 #DTC_FLAGS ?= -p 1024
 
-$(obj)/%.dtb: $(src)/dts/%.dts
-	$(call cmd,dtc)
+$(obj)/%.dtb: $(src)/dts/%.dts FORCE
+	$(call if_changed_dep,dtc)
diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 15986e7..8844a17 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -345,8 +345,8 @@ $(obj)/treeImage.%: vmlinux $(obj)/%.dtb $(wrapperbits)
 	$(call if_changed,wrap,treeboot-$*,,$(obj)/$*.dtb)
 
 # Rule to build device tree blobs
-$(obj)/%.dtb: $(src)/dts/%.dts
-	$(call cmd,dtc)
+$(obj)/%.dtb: $(src)/dts/%.dts FORCE
+	$(call if_changed_dep,dtc)
 
 # If there isn't a platform selected then just strip the vmlinux.
 ifeq (,$(image-y))
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 5d986d9..7bae316 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -264,7 +264,7 @@ $(obj)/%.dtb.S: $(obj)/%.dtb
 	$(call cmd,dt_S_dtb)
 
 quiet_cmd_dtc = DTC     $@
-cmd_dtc = $(objtree)/scripts/dtc/dtc -O dtb -o $@ -b 0 $(DTC_FLAGS) $<
+cmd_dtc = $(objtree)/scripts/dtc/dtc -O dtb -o $@ -b 0 $(DTC_FLAGS) -d $(depfile) $<
 
 # Bzip2
 # ---------------------------------------------------------------------------
-- 
1.7.0.4
