Return-Path: <SRS0=vThj=SN=flygoat.com=jiaxun.yang@kernel.org>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 3/6] MIPS: Loongson32: Kconfig merge CPU_LOONGSON1B&C
Date: Thu, 11 Apr 2019 20:19:12 +0800
Message-Id: <20190411121915.8040-4-jiaxun.yang@flygoat.com>
In-Reply-To: <20190411121915.8040-1-jiaxun.yang@flygoat.com>
References: <20190312091520.8863-2-jiaxun.yang@flygoat.com>
 <20190411121915.8040-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: linux-mips@vger.kernel.org
Cc: devicetree@vger.kernel.org, paul.burton@mips.com, robh+dt@kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
List-ID: <devicetree@vger.kernel.org>

Loongson-1B&C have totally identical GS232 core, so merge
them into same CPU config.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Kconfig                | 38 +++++++++-----------------------
 arch/mips/include/asm/cpu-type.h |  3 +--
 arch/mips/loongson32/Kconfig     |  4 ++--
 3 files changed, 14 insertions(+), 31 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 15f8cc3c965f..ac0b93e57ca3 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1429,26 +1429,22 @@ config CPU_LOONGSON2F
 	  have a similar programming interface with FPGA northbridge used in
 	  Loongson2E.
 
-config CPU_LOONGSON1B
-	bool "Loongson 1B"
-	depends on SYS_HAS_CPU_LOONGSON1B
-	select CPU_LOONGSON1
+config CPU_LOONGSON1
+	bool "Loongson 1"
+	depends on SYS_HAS_CPU_LOONGSON1
+	select CPU_MIPS32
+	select CPU_MIPSR2
+	select CPU_HAS_PREFETCH
+	select CPU_HAS_LOAD_STORE_LR
+	select CPU_SUPPORTS_32BIT_KERNEL
+	select CPU_SUPPORTS_HIGHMEM
+	select CPU_SUPPORTS_CPUFREQ
 	select LEDS_GPIO_REGISTER
 	help
 	  The Loongson 1B is a 32-bit SoC, which implements the MIPS32
 	  Release 1 instruction set and part of the MIPS32 Release 2
 	  instruction set.
 
-config CPU_LOONGSON1C
-	bool "Loongson 1C"
-	depends on SYS_HAS_CPU_LOONGSON1C
-	select CPU_LOONGSON1
-	select LEDS_GPIO_REGISTER
-	help
-	  The Loongson 1C is a 32-bit SoC, which implements the MIPS32
-	  Release 1 instruction set and part of the MIPS32 Release 2
-	  instruction set.
-
 config CPU_MIPS32_R1
 	bool "MIPS32 Release 1"
 	depends on SYS_HAS_CPU_MIPS32_R1
@@ -1866,15 +1862,6 @@ config CPU_LOONGSON2
 	select ARCH_HAS_PHYS_TO_DMA
 	select CPU_HAS_LOAD_STORE_LR
 
-config CPU_LOONGSON1
-	bool
-	select CPU_MIPS32
-	select CPU_MIPSR2
-	select CPU_HAS_PREFETCH
-	select CPU_HAS_LOAD_STORE_LR
-	select CPU_SUPPORTS_32BIT_KERNEL
-	select CPU_SUPPORTS_HIGHMEM
-	select CPU_SUPPORTS_CPUFREQ
 
 config CPU_BMIPS32_3300
 	select SMP_UP if SMP
@@ -1914,10 +1901,7 @@ config SYS_HAS_CPU_LOONGSON2F
 	select CPU_SUPPORTS_ADDRWINCFG if 64BIT
 	select CPU_SUPPORTS_UNCACHED_ACCELERATED
 
-config SYS_HAS_CPU_LOONGSON1B
-	bool
-
-config SYS_HAS_CPU_LOONGSON1C
+config SYS_HAS_CPU_LOONGSON1
 	bool
 
 config SYS_HAS_CPU_MIPS32_R1
diff --git a/arch/mips/include/asm/cpu-type.h b/arch/mips/include/asm/cpu-type.h
index a45af3de075d..ee17f02419a3 100644
--- a/arch/mips/include/asm/cpu-type.h
+++ b/arch/mips/include/asm/cpu-type.h
@@ -24,8 +24,7 @@ static inline int __pure __get_cpu_type(const int cpu_type)
 	case CPU_LOONGSON3:
 #endif
 
-#if defined(CONFIG_SYS_HAS_CPU_LOONGSON1B) || \
-    defined(CONFIG_SYS_HAS_CPU_LOONGSON1C)
+#if defined(CONFIG_SYS_HAS_CPU_LOONGSON1)
 	case CPU_LOONGSON1:
 #endif
 
diff --git a/arch/mips/loongson32/Kconfig b/arch/mips/loongson32/Kconfig
index 6dacc1438906..a0a00c3e2187 100644
--- a/arch/mips/loongson32/Kconfig
+++ b/arch/mips/loongson32/Kconfig
@@ -8,7 +8,7 @@ config LOONGSON1_LS1B
 	bool "Loongson LS1B board"
 	select CEVT_R4K if !MIPS_EXTERNAL_TIMER
 	select CSRC_R4K if !MIPS_EXTERNAL_TIMER
-	select SYS_HAS_CPU_LOONGSON1B
+	select SYS_HAS_CPU_LOONGSON1
 	select DMA_NONCOHERENT
 	select BOOT_ELF32
 	select IRQ_MIPS_CPU
@@ -23,7 +23,7 @@ config LOONGSON1_LS1C
 	bool "Loongson LS1C board"
 	select CEVT_R4K if !MIPS_EXTERNAL_TIMER
 	select CSRC_R4K if !MIPS_EXTERNAL_TIMER
-	select SYS_HAS_CPU_LOONGSON1C
+	select SYS_HAS_CPU_LOONGSON1
 	select DMA_NONCOHERENT
 	select BOOT_ELF32
 	select IRQ_MIPS_CPU
-- 
2.21.0
