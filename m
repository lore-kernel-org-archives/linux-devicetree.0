From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 3/6] arch: Define ARCH_HAS_PHYS_INITRD for ARM and Unicore32
Date: Mon, 29 Oct 2018 16:52:03 -0700
Message-ID: <20181029235206.30060-4-f.fainelli@gmail.com>
References: <20181029235206.30060-1-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181029235206.30060-1-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Marc Zyngier <marc.zyngier@arm.com>, Russell King <rmk+kernel@armlinux.org.uk>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Andrey Konovalov <andreyknvl@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Robin Murphy <robin.murphy@arm.com>, Laura Abbott <labbott@redhat.com>, Stefan Agner <stefan@agner.ch>, Johannes Weiner <hannes@cmpxchg.org>, Greg Hackmann <ghackmann@android.com>, Kristina Martsenko <kristina.martsenko@arm.com>, CHANDAN VN <chandan.vn@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Make ARM and Unicore32 select ARCH_HAS_PHYS_INITRD meaning that they do
define phys_initrd_start/phys_initrd_size and make use of it.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/Kconfig           | 7 +++++++
 arch/arm/Kconfig       | 1 +
 arch/unicore32/Kconfig | 1 +
 3 files changed, 9 insertions(+)

diff --git a/arch/Kconfig b/arch/Kconfig
index 9d329608913e..0926f8291782 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -865,6 +865,13 @@ config HAVE_ARCH_PREL32_RELOCATIONS
 	  architectures, and don't require runtime relocation on relocatable
 	  kernels.
 
+config ARCH_HAS_PHYS_INITRD
+	bool
+	help
+	  An architecture selects this when it needs to act on the physical
+	  address of the initial ramdisk and allow generic code such as
+	  FDT to populate that address.
+
 source "kernel/gcov/Kconfig"
 
 source "scripts/gcc-plugins/Kconfig"
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index e8cd55a5b04c..b87c40701b0e 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -11,6 +11,7 @@ config ARM
 	select ARCH_HAS_KCOV
 	select ARCH_HAS_MEMBARRIER_SYNC_CORE
 	select ARCH_HAS_PTE_SPECIAL if ARM_LPAE
+	select ARCH_HAS_PHYS_INITRD
 	select ARCH_HAS_PHYS_TO_DMA
 	select ARCH_HAS_SET_MEMORY
 	select ARCH_HAS_STRICT_KERNEL_RWX if MMU && !XIP_KERNEL
diff --git a/arch/unicore32/Kconfig b/arch/unicore32/Kconfig
index 0c5111b206bd..28a66ae61dcf 100644
--- a/arch/unicore32/Kconfig
+++ b/arch/unicore32/Kconfig
@@ -2,6 +2,7 @@
 config UNICORE32
 	def_bool y
 	select ARCH_HAS_DEVMEM_IS_ALLOWED
+	select ARCH_HAS_PHYS_INITRD
 	select ARCH_MIGHT_HAVE_PC_PARPORT
 	select ARCH_MIGHT_HAVE_PC_SERIO
 	select DMA_DIRECT_OPS
-- 
2.17.1
