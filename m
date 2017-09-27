From: Palmer Dabbelt <palmer-96lFi9zoCfxBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v9 12/12] RISC-V: Build Infrastructure
Date: Tue, 26 Sep 2017 18:56:38 -0700
Message-ID: <20170927015638.19443-13-palmer@dabbelt.com>
References: <20170927015638.19443-1-palmer@dabbelt.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170927015638.19443-1-palmer-96lFi9zoCfxBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-q3qR2WxjNRFS9aJRtSZj7A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, albert-SpMDHPYPyPbQT0dZR+AlfA@public.gmane.org, yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, mmarek-IBi9RG/b67k@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, boqun.feng-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Palmer Dabbelt <palmer-96lFi9zoCfxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch contains all the build infrastructure that actually enables
the RISC-V port.  This includes Makefiles, linker scripts, and Kconfig
files.  It also contains the only top-level change, which adds RISC-V to
the list of architectures that need a sed run to produce the ARCH
variable when building locally.

Signed-off-by: Palmer Dabbelt <palmer-96lFi9zoCfxBDgjK7y7TUQ@public.gmane.org>
---
 Makefile                        |   3 +-
 arch/riscv/Kconfig              | 310 ++++++++++++++++++++++++++++++++++++++++
 arch/riscv/Makefile             |  72 ++++++++++
 arch/riscv/configs/defconfig    |   0
 arch/riscv/include/asm/Kbuild   |  61 ++++++++
 arch/riscv/kernel/.gitignore    |   1 +
 arch/riscv/kernel/Makefile      |  33 +++++
 arch/riscv/kernel/vmlinux.lds.S |  92 ++++++++++++
 arch/riscv/lib/Makefile         |   6 +
 arch/riscv/mm/Makefile          |   4 +
 10 files changed, 581 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/Kconfig
 create mode 100644 arch/riscv/Makefile
 create mode 100644 arch/riscv/configs/defconfig
 create mode 100644 arch/riscv/include/asm/Kbuild
 create mode 100644 arch/riscv/kernel/.gitignore
 create mode 100644 arch/riscv/kernel/Makefile
 create mode 100644 arch/riscv/kernel/vmlinux.lds.S
 create mode 100644 arch/riscv/lib/Makefile
 create mode 100644 arch/riscv/mm/Makefile

diff --git a/Makefile b/Makefile
index d1119941261c..08ffcb172bec 100644
--- a/Makefile
+++ b/Makefile
@@ -225,7 +225,8 @@ SUBARCH := $(shell uname -m | sed -e s/i.86/x86/ -e s/x86_64/x86/ \
 				  -e s/arm.*/arm/ -e s/sa110/arm/ \
 				  -e s/s390x/s390/ -e s/parisc64/parisc/ \
 				  -e s/ppc.*/powerpc/ -e s/mips.*/mips/ \
-				  -e s/sh[234].*/sh/ -e s/aarch64.*/arm64/ )
+				  -e s/sh[234].*/sh/ -e s/aarch64.*/arm64/ \
+				  -e s/riscv.*/riscv/)
 
 # Cross compiling and selecting different set of gcc/bin-utils
 # ---------------------------------------------------------------------------
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
new file mode 100644
index 000000000000..2c6adf12713a
--- /dev/null
+++ b/arch/riscv/Kconfig
@@ -0,0 +1,310 @@
+#
+# For a description of the syntax of this configuration file,
+# see Documentation/kbuild/kconfig-language.txt.
+#
+
+config RISCV
+	def_bool y
+	select OF
+	select OF_EARLY_FLATTREE
+	select OF_IRQ
+	select ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE
+	select ARCH_WANT_FRAME_POINTERS
+	select CLONE_BACKWARDS
+	select COMMON_CLK
+	select GENERIC_CLOCKEVENTS
+	select GENERIC_CPU_DEVICES
+	select GENERIC_IRQ_SHOW
+	select GENERIC_PCI_IOMAP
+	select GENERIC_STRNCPY_FROM_USER
+	select GENERIC_STRNLEN_USER
+	select GENERIC_SMP_IDLE_THREAD
+	select GENERIC_ATOMIC64 if !64BIT || !RISCV_ISA_A
+	select ARCH_WANT_OPTIONAL_GPIOLIB
+	select HAVE_MEMBLOCK
+	select HAVE_DMA_API_DEBUG
+	select HAVE_DMA_CONTIGUOUS
+	select HAVE_GENERIC_DMA_COHERENT
+	select IRQ_DOMAIN
+	select NO_BOOTMEM
+	select RISCV_ISA_A if SMP
+	select SPARSE_IRQ
+	select SYSCTL_EXCEPTION_TRACE
+	select HAVE_ARCH_TRACEHOOK
+	select MODULES_USE_ELF_RELA if MODULES
+	select THREAD_INFO_IN_TASK
+	select RISCV_IRQ_INTC
+	select RISCV_TIMER
+
+config MMU
+	def_bool y
+
+# even on 32-bit, physical (and DMA) addresses are > 32-bits
+config ARCH_PHYS_ADDR_T_64BIT
+	def_bool y
+
+config ARCH_DMA_ADDR_T_64BIT
+	def_bool y
+
+config PAGE_OFFSET
+	hex
+	default 0xC0000000 if 32BIT && MAXPHYSMEM_2GB
+	default 0xffffffff80000000 if 64BIT && MAXPHYSMEM_2GB
+	default 0xffffffe000000000 if 64BIT && MAXPHYSMEM_128GB
+
+config STACKTRACE_SUPPORT
+	def_bool y
+
+config RWSEM_GENERIC_SPINLOCK
+	def_bool y
+
+config GENERIC_BUG
+	def_bool y
+	depends on BUG
+	select GENERIC_BUG_RELATIVE_POINTERS if 64BIT
+
+config GENERIC_BUG_RELATIVE_POINTERS
+	bool
+
+config GENERIC_CALIBRATE_DELAY
+	def_bool y
+
+config GENERIC_CSUM
+	def_bool y
+
+config GENERIC_HWEIGHT
+	def_bool y
+
+config PGTABLE_LEVELS
+	int
+	default 3 if 64BIT
+	default 2
+
+config HAVE_KPROBES
+	def_bool n
+
+config DMA_NOOP_OPS
+	def_bool y
+
+menu "Platform type"
+
+choice
+	prompt "Base ISA"
+	default ARCH_RV64I
+	help
+	  This selects the base ISA that this kernel will traget and must match
+	  the target platform.
+
+config ARCH_RV32I
+	bool "RV32I"
+	select CPU_SUPPORTS_32BIT_KERNEL
+	select 32BIT
+	select GENERIC_ASHLDI3
+	select GENERIC_ASHRDI3
+	select GENERIC_LSHRDI3
+
+config ARCH_RV64I
+	bool "RV64I"
+	select CPU_SUPPORTS_64BIT_KERNEL
+	select 64BIT
+
+endchoice
+
+# We must be able to map all physical memory into the kernel, but the compiler
+# is still a bit more efficient when generating code if it's setup in a manner
+# such that it can only map 2GiB of memory.
+choice
+	prompt "Kernel Code Model"
+	default CMODEL_MEDLOW if 32BIT
+	default CMODEL_MEDANY if 64BIT
+
+	config CMODEL_MEDLOW
+		bool "medium low code model"
+	config CMODEL_MEDANY
+		bool "medium any code model"
+endchoice
+
+choice
+	prompt "Maximum Physical Memory"
+	default MAXPHYSMEM_2GB if 32BIT
+	default MAXPHYSMEM_2GB if 64BIT && CMODEL_MEDLOW
+	default MAXPHYSMEM_128GB if 64BIT && CMODEL_MEDANY
+
+	config MAXPHYSMEM_2GB
+		bool "2GiB"
+	config MAXPHYSMEM_128GB
+		depends on 64BIT && CMODEL_MEDANY
+		bool "128GiB"
+endchoice
+
+
+config SMP
+	bool "Symmetric Multi-Processing"
+	help
+	  This enables support for systems with more than one CPU.  If
+	  you say N here, the kernel will run on single and
+	  multiprocessor machines, but will use only one CPU of a
+	  multiprocessor machine. If you say Y here, the kernel will run
+	  on many, but not all, single processor machines. On a single
+	  processor machine, the kernel will run faster if you say N
+	  here.
+
+	  If you don't know what to do here, say N.
+
+config NR_CPUS
+	int "Maximum number of CPUs (2-32)"
+	range 2 32
+	depends on SMP
+	default "8"
+
+config CPU_SUPPORTS_32BIT_KERNEL
+	bool
+config CPU_SUPPORTS_64BIT_KERNEL
+	bool
+
+choice
+	prompt "CPU Tuning"
+	default TUNE_GENERIC
+
+config TUNE_GENERIC
+	bool "generic"
+
+endchoice
+
+config RISCV_ISA_C
+	bool "Emit compressed instructions when building Linux"
+	default y
+	help
+	   Adds "C" to the ISA subsets that the toolchain is allowed to emit
+	   when building Linux, which results in compressed instructions in the
+	   Linux binary.
+
+	   If you don't know what to do here, say Y.
+
+config RISCV_ISA_A
+	def_bool y
+
+endmenu
+
+menu "Kernel type"
+
+choice
+	prompt "Kernel code model"
+	default 64BIT
+
+config 32BIT
+	bool "32-bit kernel"
+	depends on CPU_SUPPORTS_32BIT_KERNEL
+	help
+	  Select this option to build a 32-bit kernel.
+
+config 64BIT
+	bool "64-bit kernel"
+	depends on CPU_SUPPORTS_64BIT_KERNEL
+	help
+	  Select this option to build a 64-bit kernel.
+
+endchoice
+
+source "mm/Kconfig"
+
+source "kernel/Kconfig.preempt"
+
+source "kernel/Kconfig.hz"
+
+endmenu
+
+menu "Bus support"
+
+config PCI
+	bool "PCI support"
+	select PCI_MSI
+	help
+	  This feature enables support for PCI bus system. If you say Y
+	  here, the kernel will include drivers and infrastructure code
+	  to support PCI bus devices.
+
+	  If you don't know what to do here, say Y.
+
+config PCI_DOMAINS
+	def_bool PCI
+
+config PCI_DOMAINS_GENERIC
+	def_bool PCI
+
+source "drivers/pci/Kconfig"
+
+endmenu
+
+source "init/Kconfig"
+
+source "kernel/Kconfig.freezer"
+
+menu "Executable file formats"
+
+source "fs/Kconfig.binfmt"
+
+endmenu
+
+menu "Power management options"
+
+source kernel/power/Kconfig
+
+endmenu
+
+source "net/Kconfig"
+
+source "drivers/Kconfig"
+
+source "fs/Kconfig"
+
+menu "Kernel hacking"
+
+config CMDLINE_BOOL
+	bool "Built-in kernel command line"
+	help
+	  For most platforms, it is firmware or second stage bootloader
+	  that by default specifies the kernel command line options.
+	  However, it might be necessary or advantageous to either override
+	  the default kernel command line or add a few extra options to it.
+	  For such cases, this option allows hardcoding command line options
+	  directly into the kernel.
+
+	  For that, choose 'Y' here and fill in the extra boot parameters
+	  in CONFIG_CMDLINE.
+
+	  The built-in options will be concatenated to the default command
+	  line if CMDLINE_OVERRIDE is set to 'N'. Otherwise, the default
+	  command line will be ignored and replaced by the built-in string.
+
+config CMDLINE
+	string "Built-in kernel command string"
+	depends on CMDLINE_BOOL
+	default ""
+	help
+	  Supply command-line options at build time by entering them here.
+
+config CMDLINE_OVERRIDE
+	bool "Built-in command line overrides bootloader arguments"
+	depends on CMDLINE_BOOL
+	help
+	  Set this option to 'Y' to have the kernel ignore the bootloader
+	  or firmware command line.  Instead, the built-in command line
+	  will be used exclusively.
+
+	  If you don't know what to do here, say N.
+
+config EARLY_PRINTK
+	def_bool y
+
+source "lib/Kconfig.debug"
+
+config CMDLINE_BOOL
+	bool
+endmenu
+
+source "security/Kconfig"
+
+source "crypto/Kconfig"
+
+source "lib/Kconfig"
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
new file mode 100644
index 000000000000..6719dd30ec5b
--- /dev/null
+++ b/arch/riscv/Makefile
@@ -0,0 +1,72 @@
+# This file is included by the global makefile so that you can add your own
+# architecture-specific flags and dependencies. Remember to do have actions
+# for "archclean" and "archdep" for cleaning up and making dependencies for
+# this architecture
+#
+# This file is subject to the terms and conditions of the GNU General Public
+# License.  See the file "COPYING" in the main directory of this archive
+# for more details.
+#
+
+LDFLAGS         :=
+OBJCOPYFLAGS    := -O binary
+LDFLAGS_vmlinux :=
+KBUILD_AFLAGS_MODULE += -fPIC
+KBUILD_CFLAGS_MODULE += -fPIC
+
+KBUILD_DEFCONFIG = defconfig
+
+export BITS
+ifeq ($(CONFIG_ARCH_RV64I),y)
+	BITS := 64
+	UTS_MACHINE := riscv64
+
+	KBUILD_CFLAGS += -mabi=lp64
+	KBUILD_AFLAGS += -mabi=lp64
+	KBUILD_MARCH = rv64im
+	LDFLAGS += -melf64lriscv
+else
+	BITS := 32
+	UTS_MACHINE := riscv32
+
+	KBUILD_CFLAGS += -mabi=ilp32
+	KBUILD_AFLAGS += -mabi=ilp32
+	KBUILD_MARCH = rv32im
+	LDFLAGS += -melf32lriscv
+endif
+
+KBUILD_CFLAGS += -Wall
+
+ifeq ($(CONFIG_RISCV_ISA_A),y)
+	KBUILD_ARCH_A = a
+endif
+ifeq ($(CONFIG_RISCV_ISA_C),y)
+	KBUILD_ARCH_C = c
+endif
+
+KBUILD_AFLAGS += -march=$(KBUILD_MARCH)$(KBUILD_ARCH_A)fd$(KBUILD_ARCH_C)
+
+KBUILD_CFLAGS += -march=$(KBUILD_MARCH)$(KBUILD_ARCH_A)$(KBUILD_ARCH_C)
+KBUILD_CFLAGS += -mno-save-restore
+KBUILD_CFLAGS += -DCONFIG_PAGE_OFFSET=$(CONFIG_PAGE_OFFSET)
+
+ifeq ($(CONFIG_CMODEL_MEDLOW),y)
+	KBUILD_CFLAGS += -mcmodel=medlow
+endif
+ifeq ($(CONFIG_CMODEL_MEDANY),y)
+	KBUILD_CFLAGS += -mcmodel=medany
+endif
+
+# GCC versions that support the "-mstrict-align" option default to allowing
+# unaligned accesses.  While unaligned accesses are explicitly allowed in the
+# RISC-V ISA, they're emulated by machine mode traps on all extant
+# architectures.  It's faster to have GCC emit only aligned accesses.
+KBUILD_CFLAGS += $(call cc-option,-mstrict-align)
+
+head-y := arch/riscv/kernel/head.o
+
+core-y += arch/riscv/kernel/ arch/riscv/mm/
+
+libs-y += arch/riscv/lib/
+
+all: vmlinux
diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild
new file mode 100644
index 000000000000..18158be62a2b
--- /dev/null
+++ b/arch/riscv/include/asm/Kbuild
@@ -0,0 +1,61 @@
+generic-y += bugs.h
+generic-y += cacheflush.h
+generic-y += checksum.h
+generic-y += clkdev.h
+generic-y += cputime.h
+generic-y += device.h
+generic-y += div64.h
+generic-y += dma.h
+generic-y += dma-contiguous.h
+generic-y += emergency-restart.h
+generic-y += errno.h
+generic-y += exec.h
+generic-y += fb.h
+generic-y += fcntl.h
+generic-y += ftrace.h
+generic-y += futex.h
+generic-y += hardirq.h
+generic-y += hash.h
+generic-y += hw_irq.h
+generic-y += ioctl.h
+generic-y += ioctls.h
+generic-y += ipcbuf.h
+generic-y += irq_regs.h
+generic-y += irq_work.h
+generic-y += kdebug.h
+generic-y += kmap_types.h
+generic-y += kvm_para.h
+generic-y += local.h
+generic-y += mm-arch-hooks.h
+generic-y += mman.h
+generic-y += module.h
+generic-y += msgbuf.h
+generic-y += mutex.h
+generic-y += param.h
+generic-y += percpu.h
+generic-y += poll.h
+generic-y += posix_types.h
+generic-y += preempt.h
+generic-y += resource.h
+generic-y += scatterlist.h
+generic-y += sections.h
+generic-y += sembuf.h
+generic-y += setup.h
+generic-y += shmbuf.h
+generic-y += shmparam.h
+generic-y += signal.h
+generic-y += socket.h
+generic-y += sockios.h
+generic-y += stat.h
+generic-y += statfs.h
+generic-y += swab.h
+generic-y += termbits.h
+generic-y += termios.h
+generic-y += topology.h
+generic-y += trace_clock.h
+generic-y += types.h
+generic-y += unaligned.h
+generic-y += user.h
+generic-y += vga.h
+generic-y += vmlinux.lds.h
+generic-y += xor.h
diff --git a/arch/riscv/kernel/.gitignore b/arch/riscv/kernel/.gitignore
new file mode 100644
index 000000000000..b51634f6a7cd
--- /dev/null
+++ b/arch/riscv/kernel/.gitignore
@@ -0,0 +1 @@
+/vmlinux.lds
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
new file mode 100644
index 000000000000..ab8baf7bd142
--- /dev/null
+++ b/arch/riscv/kernel/Makefile
@@ -0,0 +1,33 @@
+#
+# Makefile for the RISC-V Linux kernel
+#
+
+extra-y += head.o
+extra-y += vmlinux.lds
+
+obj-y	+= cpu.o
+obj-y	+= cpufeature.o
+obj-y	+= entry.o
+obj-y	+= irq.o
+obj-y	+= process.o
+obj-y	+= ptrace.o
+obj-y	+= reset.o
+obj-y	+= setup.o
+obj-y	+= signal.o
+obj-y	+= syscall_table.o
+obj-y	+= sys_riscv.o
+obj-y	+= time.o
+obj-y	+= traps.o
+obj-y	+= riscv_ksyms.o
+obj-y	+= stacktrace.o
+obj-y	+= vdso.o
+obj-y	+= cacheinfo.o
+obj-y	+= vdso/
+
+CFLAGS_setup.o := -mcmodel=medany
+
+obj-$(CONFIG_SMP)		+= smpboot.o
+obj-$(CONFIG_SMP)		+= smp.o
+obj-$(CONFIG_MODULES)		+= module.o
+
+clean:
diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
new file mode 100644
index 000000000000..ece84991609c
--- /dev/null
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -0,0 +1,92 @@
+/*
+ * Copyright (C) 2012 Regents of the University of California
+ * Copyright (C) 2017 SiFive
+ *
+ *   This program is free software; you can redistribute it and/or
+ *   modify it under the terms of the GNU General Public License
+ *   as published by the Free Software Foundation, version 2.
+ *
+ *   This program is distributed in the hope that it will be useful,
+ *   but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *   GNU General Public License for more details.
+ */
+
+#define LOAD_OFFSET PAGE_OFFSET
+#include <asm/vmlinux.lds.h>
+#include <asm/page.h>
+#include <asm/cache.h>
+#include <asm/thread_info.h>
+
+OUTPUT_ARCH(riscv)
+ENTRY(_start)
+
+jiffies = jiffies_64;
+
+SECTIONS
+{
+	/* Beginning of code and text segment */
+	. = LOAD_OFFSET;
+	_start = .;
+	__init_begin = .;
+	HEAD_TEXT_SECTION
+	INIT_TEXT_SECTION(PAGE_SIZE)
+	INIT_DATA_SECTION(16)
+	/* we have to discard exit text and such at runtime, not link time */
+	.exit.text :
+	{
+		EXIT_TEXT
+	}
+	.exit.data :
+	{
+		EXIT_DATA
+	}
+	PERCPU_SECTION(L1_CACHE_BYTES)
+	__init_end = .;
+
+	.text : {
+		_text = .;
+		_stext = .;
+		TEXT_TEXT
+		SCHED_TEXT
+		CPUIDLE_TEXT
+		LOCK_TEXT
+		KPROBES_TEXT
+		ENTRY_TEXT
+		IRQENTRY_TEXT
+		*(.fixup)
+		_etext = .;
+	}
+
+	/* Start of data section */
+	_sdata = .;
+	RO_DATA_SECTION(L1_CACHE_BYTES)
+	.srodata : {
+		*(.srodata*)
+	}
+
+	RW_DATA_SECTION(L1_CACHE_BYTES, PAGE_SIZE, THREAD_SIZE)
+	.sdata : {
+		__global_pointer$ = . + 0x800;
+		*(.sdata*)
+		/* End of data section */
+		_edata = .;
+		*(.sbss*)
+	}
+
+	BSS_SECTION(0, 0, 0)
+
+	EXCEPTION_TABLE(0x10)
+	NOTES
+
+	.rel.dyn : {
+		*(.rel.dyn*)
+	}
+
+	_end = .;
+
+	STABS_DEBUG
+	DWARF_DEBUG
+
+	DISCARDS
+}
diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
new file mode 100644
index 000000000000..596c2ca40d63
--- /dev/null
+++ b/arch/riscv/lib/Makefile
@@ -0,0 +1,6 @@
+lib-y	+= delay.o
+lib-y	+= memcpy.o
+lib-y	+= memset.o
+lib-y	+= uaccess.o
+
+lib-$(CONFIG_32BIT) += udivdi3.o
diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
new file mode 100644
index 000000000000..81f7d9ce6d88
--- /dev/null
+++ b/arch/riscv/mm/Makefile
@@ -0,0 +1,4 @@
+obj-y += init.o
+obj-y += fault.o
+obj-y += extable.o
+obj-y += ioremap.o
-- 
2.13.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
