From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: [RFC PATCH 14/14] ARM: vexpress: add device tree build system and
	dtbuImage
Date: Wed, 18 Aug 2010 20:00:00 +0100
Message-ID: <1282158000-23081-15-git-send-email-lorenzo.pieralisi@arm.com>
References: <1282158000-23081-1-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-2-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-3-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-4-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-5-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-6-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-7-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-8-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-9-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-10-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-11-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-12-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-13-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-14-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1282158000-23081-14-git-send-email-lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, philippe.robin-5wv7dgnIgG8@public.gmane.org, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
List-Id: devicetree@vger.kernel.org

The introduction of device tree in ARM Linux kernel tree requires the
definition of a new class of machines. Board init files should be split
in DT and non-DT (static) and the Kernel build system and config files
should be updated accordingly. To allow u-boot to recognize and boot
images with a device tree embedded stub, a new image is required
(dtbuImage), which is a u-boot compressed image with an assembly stub
containing the compiled flattened device tree.

This patch modifies the kernel build and config system to take into
account the Versatile Express device tree machine port and adds a new
image file suitable for booting a DT kernel with u-boot.
An appropriate machine config is added encompassing all config
parameters needed to compile in C units for DT booting on Versatile
Express.

Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
---
 arch/arm/Kconfig                |    4 ++--
 arch/arm/Makefile               |    2 +-
 arch/arm/boot/Makefile          |   10 +++++++++-
 arch/arm/mach-vexpress/Kconfig  |    7 +++++++
 arch/arm/mach-vexpress/Makefile |    5 +++--
 arch/arm/mm/Kconfig             |    2 +-
 6 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 4ebecee..a63f7c2 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1104,10 +1104,10 @@ config SMP
 	bool "Symmetric Multi-Processing (EXPERIMENTAL)"
 	depends on EXPERIMENTAL && (REALVIEW_EB_ARM11MP || REALVIEW_EB_A9MP ||\
 		 MACH_REALVIEW_PB11MP || MACH_REALVIEW_PBX || ARCH_OMAP4 ||\
-		 ARCH_U8500 || ARCH_VEXPRESS_CA9X4)
+		 ARCH_U8500 || ARCH_VEXPRESS_CA9X4 || ARCH_VEXPRESS_CA9X4_DT)
 	depends on GENERIC_CLOCKEVENTS
 	select USE_GENERIC_SMP_HELPERS
-	select HAVE_ARM_SCU if (ARCH_REALVIEW || ARCH_OMAP4 || ARCH_U8500 || ARCH_VEXPRESS_CA9X4)
+	select HAVE_ARM_SCU if (ARCH_REALVIEW || ARCH_OMAP4 || ARCH_U8500 || ARCH_VEXPRESS_CA9X4 || ARCH_VEXPRESS_CA9X4_DT)
 	help
 	  This enables support for systems with more than one CPU. If you have
 	  a system with only one CPU, like most personal computers, say N. If
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index dab066a..3ce1751 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -264,7 +264,7 @@ archprepare:
 # Convert bzImage to zImage
 bzImage: zImage
 
-zImage Image xipImage bootpImage uImage dtbImage: vmlinux
+zImage Image xipImage bootpImage uImage dtbImage dtbuImage: vmlinux
 	$(Q)$(MAKE) $(build)=$(boot) MACHINE=$(MACHINE) $(boot)/$@
 
 zinstall install: vmlinux
diff --git a/arch/arm/boot/Makefile b/arch/arm/boot/Makefile
index c608c98..63200f1 100644
--- a/arch/arm/boot/Makefile
+++ b/arch/arm/boot/Makefile
@@ -27,7 +27,7 @@ INITRD_PHYS := $(initrd_phys-y)
 
 export ZRELADDR INITRD_PHYS PARAMS_PHYS
 
-targets := Image zImage xipImage bootpImage uImage dtbImage
+targets := Image zImage xipImage bootpImage uImage dtbuImage
 
 ifeq ($(CONFIG_XIP_KERNEL),y)
 
@@ -66,14 +66,18 @@ quiet_cmd_uimage = UIMAGE  $@
 
 ifeq ($(CONFIG_ZBOOT_ROM),y)
 $(obj)/uImage: LOADADDR=$(CONFIG_ZBOOT_ROM_TEXT)
+$(obj)/dtbuImage: LOADADDR=$(CONFIG_ZBOOT_ROM_TEXT)
 else
 $(obj)/uImage: LOADADDR=$(ZRELADDR)
+$(obj)/dtbuImage: LOADADDR=$(ZRELADDR)
 endif
 
 ifeq ($(CONFIG_THUMB2_KERNEL),y)
 # Set bit 0 to 1 so that "mov pc, rx" switches to Thumb-2 mode
 $(obj)/uImage: STARTADDR=$(shell echo $(LOADADDR) | sed -e "s/.$$/1/")
+$(obj)/dtbuImage: STARTADDR=$(shell echo $(LOADADDR) | sed -e "s/.$$/1/")
 else
+$(obj)/dtbuImage: STARTADDR=$(LOADADDR)
 $(obj)/uImage: STARTADDR=$(LOADADDR)
 endif
 
@@ -81,6 +85,10 @@ $(obj)/uImage:	$(obj)/zImage FORCE
 	$(call if_changed,uimage)
 	@echo '  Image $@ is ready'
 
+$(obj)/dtbuImage:	$(obj)/dtbImage FORCE
+	$(call if_changed,uimage)
+	@echo '  Image $@ is ready'
+
 $(obj)/bootp/bootp: $(obj)/zImage initrd FORCE
 	$(Q)$(MAKE) $(build)=$(obj)/bootp $@
 	@:
diff --git a/arch/arm/mach-vexpress/Kconfig b/arch/arm/mach-vexpress/Kconfig
index 3f19b66..1d35a11 100644
--- a/arch/arm/mach-vexpress/Kconfig
+++ b/arch/arm/mach-vexpress/Kconfig
@@ -6,4 +6,11 @@ config ARCH_VEXPRESS_CA9X4
 	select CPU_V7
 	select ARM_GIC
 
+config ARCH_VEXPRESS_CA9X4_DT
+	bool "Versatile Express Cortex-A9x4 tile - DT enabled"
+	select CPU_V7
+	select ARM_GIC
+	select OF
+	select OF_FLATTREE
+
 endmenu
diff --git a/arch/arm/mach-vexpress/Makefile b/arch/arm/mach-vexpress/Makefile
index 1b71b77..c6bc159 100644
--- a/arch/arm/mach-vexpress/Makefile
+++ b/arch/arm/mach-vexpress/Makefile
@@ -2,7 +2,8 @@
 # Makefile for the linux kernel.
 #
 
-obj-y					:= v2m.o
-obj-$(CONFIG_ARCH_VEXPRESS_CA9X4)	+= ct-ca9x4.o
+obj-y					:= v2m-base.o ct-ca9x4-base.o
+obj-$(CONFIG_ARCH_VEXPRESS_CA9X4)	+= ct-ca9x4.o v2m.o
+obj-$(CONFIG_ARCH_VEXPRESS_CA9X4_DT)	+= ct-ca9x4-of.o v2m-of.o
 obj-$(CONFIG_SMP)			+= platsmp.o headsmp.o
 obj-$(CONFIG_LOCAL_TIMERS)		+= localtimer.o
diff --git a/arch/arm/mm/Kconfig b/arch/arm/mm/Kconfig
index 101105e..97bc19e 100644
--- a/arch/arm/mm/Kconfig
+++ b/arch/arm/mm/Kconfig
@@ -782,7 +782,7 @@ config CACHE_L2X0
 	bool "Enable the L2x0 outer cache controller"
 	depends on REALVIEW_EB_ARM11MP || MACH_REALVIEW_PB11MP || MACH_REALVIEW_PB1176 || \
 		   REALVIEW_EB_A9MP || ARCH_MX35 || ARCH_MX31 || MACH_REALVIEW_PBX || \
-		   ARCH_NOMADIK || ARCH_OMAP4 || ARCH_U8500 || ARCH_VEXPRESS_CA9X4
+		   ARCH_NOMADIK || ARCH_OMAP4 || ARCH_U8500 || ARCH_VEXPRESS_CA9X4 || ARCH_VEXPRESS_CA9X4_DT
 	default y
 	select OUTER_CACHE
 	select OUTER_CACHE_SYNC
-- 
1.6.3.3
