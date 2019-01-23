From: Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH] xtensa: rename BUILTIN_DTB to BUILTIN_DTB_SOURCE
Date: Wed, 23 Jan 2019 09:49:18 +0000
Message-ID: <1548236958-17565-1-git-send-email-clabbe@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: chris@zankel.net, jcmvbkbc@gmail.com, mark.rutland@arm.com, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-xtensa@linux-xtensa.org, Corentin Labbe <clabbe@baylibre.com>
List-Id: devicetree@vger.kernel.org

When building some xtensa config, I hit the following warning:
drivers/staging/mt7621-dts/Kconfig:4:warning: 'BUILTIN_DTB' has wrong type. 'select' only accept arguments of bool and tristate type

It is due to some arch use BUILTIN_DTB as a flag for the need to builtin
dtb but xtensa use it as a string for which dtb to bulltin.
But for this (which dtb to build), it is better to use
BUILTIN_DTB_SOURCE like other arch do.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 arch/xtensa/Kconfig                         | 2 +-
 arch/xtensa/boot/dts/Makefile               | 6 +++---
 arch/xtensa/configs/audio_kc705_defconfig   | 2 +-
 arch/xtensa/configs/cadence_csp_defconfig   | 2 +-
 arch/xtensa/configs/generic_kc705_defconfig | 2 +-
 arch/xtensa/configs/nommu_kc705_defconfig   | 2 +-
 arch/xtensa/configs/smp_lx200_defconfig     | 2 +-
 7 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/xtensa/Kconfig b/arch/xtensa/Kconfig
index 48906ac5fd25..ce91682770cb 100644
--- a/arch/xtensa/Kconfig
+++ b/arch/xtensa/Kconfig
@@ -451,7 +451,7 @@ config USE_OF
 	help
 	  Include support for flattened device tree machine descriptions.
 
-config BUILTIN_DTB
+config BUILTIN_DTB_SOURCE
 	string "DTB to build into the kernel image"
 	depends on OF
 
diff --git a/arch/xtensa/boot/dts/Makefile b/arch/xtensa/boot/dts/Makefile
index f8052ba5aea8..0b8d00cdae7c 100644
--- a/arch/xtensa/boot/dts/Makefile
+++ b/arch/xtensa/boot/dts/Makefile
@@ -7,9 +7,9 @@
 #
 #
 
-BUILTIN_DTB := $(patsubst "%",%,$(CONFIG_BUILTIN_DTB)).dtb.o
-ifneq ($(CONFIG_BUILTIN_DTB),"")
-obj-$(CONFIG_OF) += $(BUILTIN_DTB)
+BUILTIN_DTB_SOURCE := $(patsubst "%",%,$(CONFIG_BUILTIN_DTB_SOURCE)).dtb.o
+ifneq ($(CONFIG_BUILTIN_DTB_SOURCE),"")
+obj-$(CONFIG_OF) += $(BUILTIN_DTB_SOURCE)
 endif
 
 # for CONFIG_OF_ALL_DTBS test
diff --git a/arch/xtensa/configs/audio_kc705_defconfig b/arch/xtensa/configs/audio_kc705_defconfig
index 2bf964df37ba..f378e56f9ce6 100644
--- a/arch/xtensa/configs/audio_kc705_defconfig
+++ b/arch/xtensa/configs/audio_kc705_defconfig
@@ -34,7 +34,7 @@ CONFIG_XTENSA_PLATFORM_XTFPGA=y
 CONFIG_CMDLINE_BOOL=y
 CONFIG_CMDLINE="earlycon=uart8250,mmio32native,0xfd050020,115200n8 console=ttyS0,115200n8 ip=dhcp root=/dev/nfs rw debug memmap=0x38000000@0"
 CONFIG_USE_OF=y
-CONFIG_BUILTIN_DTB="kc705"
+CONFIG_BUILTIN_DTB_SOURCE="kc705"
 # CONFIG_COMPACTION is not set
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 CONFIG_PM=y
diff --git a/arch/xtensa/configs/cadence_csp_defconfig b/arch/xtensa/configs/cadence_csp_defconfig
index 3221b7053fa3..62f32a902568 100644
--- a/arch/xtensa/configs/cadence_csp_defconfig
+++ b/arch/xtensa/configs/cadence_csp_defconfig
@@ -38,7 +38,7 @@ CONFIG_HIGHMEM=y
 # CONFIG_PCI is not set
 CONFIG_XTENSA_PLATFORM_XTFPGA=y
 CONFIG_USE_OF=y
-CONFIG_BUILTIN_DTB="csp"
+CONFIG_BUILTIN_DTB_SOURCE="csp"
 # CONFIG_COMPACTION is not set
 CONFIG_XTFPGA_LCD=y
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
diff --git a/arch/xtensa/configs/generic_kc705_defconfig b/arch/xtensa/configs/generic_kc705_defconfig
index 985fa8546e4e..8bebe07f1060 100644
--- a/arch/xtensa/configs/generic_kc705_defconfig
+++ b/arch/xtensa/configs/generic_kc705_defconfig
@@ -33,7 +33,7 @@ CONFIG_XTENSA_PLATFORM_XTFPGA=y
 CONFIG_CMDLINE_BOOL=y
 CONFIG_CMDLINE="earlycon=uart8250,mmio32native,0xfd050020,115200n8 console=ttyS0,115200n8 ip=dhcp root=/dev/nfs rw debug memmap=0x38000000@0"
 CONFIG_USE_OF=y
-CONFIG_BUILTIN_DTB="kc705"
+CONFIG_BUILTIN_DTB_SOURCE="kc705"
 # CONFIG_COMPACTION is not set
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 CONFIG_NET=y
diff --git a/arch/xtensa/configs/nommu_kc705_defconfig b/arch/xtensa/configs/nommu_kc705_defconfig
index f3fc4f970ca8..933ab2adf434 100644
--- a/arch/xtensa/configs/nommu_kc705_defconfig
+++ b/arch/xtensa/configs/nommu_kc705_defconfig
@@ -39,7 +39,7 @@ CONFIG_XTENSA_PLATFORM_XTFPGA=y
 CONFIG_CMDLINE_BOOL=y
 CONFIG_CMDLINE="earlycon=uart8250,mmio32native,0x9d050020,115200n8 console=ttyS0,115200n8 ip=dhcp root=/dev/nfs rw debug memmap=256M@0x60000000"
 CONFIG_USE_OF=y
-CONFIG_BUILTIN_DTB="kc705_nommu"
+CONFIG_BUILTIN_DTB_SOURCE="kc705_nommu"
 CONFIG_BINFMT_FLAT=y
 CONFIG_NET=y
 CONFIG_PACKET=y
diff --git a/arch/xtensa/configs/smp_lx200_defconfig b/arch/xtensa/configs/smp_lx200_defconfig
index 11fed6c06a7c..af9c774502f8 100644
--- a/arch/xtensa/configs/smp_lx200_defconfig
+++ b/arch/xtensa/configs/smp_lx200_defconfig
@@ -37,7 +37,7 @@ CONFIG_XTENSA_PLATFORM_XTFPGA=y
 CONFIG_CMDLINE_BOOL=y
 CONFIG_CMDLINE="earlycon=uart8250,mmio32native,0xfd050020,115200n8 console=ttyS0,115200n8 ip=dhcp root=/dev/nfs rw debug memmap=96M@0"
 CONFIG_USE_OF=y
-CONFIG_BUILTIN_DTB="lx200mx"
+CONFIG_BUILTIN_DTB_SOURCE="lx200mx"
 # CONFIG_COMPACTION is not set
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 CONFIG_NET=y
-- 
2.19.2
