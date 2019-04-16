From: Nishad Kamdar <nishadkamdar@gmail.com>
Subject: [PATCH v3 0/5] ARCH: Use the correct style for SPDX License
 Identifier
Date: Tue, 16 Apr 2019 20:47:57 +0530
Message-ID: <cover.1555427418.git.nishadkamdar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch corrects the SPDX License Identifier style
in the Hardware Architecture subsystem. For C header files
Documentation/process/license-rules.rst mandates C-like comments
(opposed to C source files where C++ style should be used)

Changes made by using a script provided by Joe Perches here:
https://lkml.org/lkml/2019/2/7/46
and making some manual changes.

Changes in v3:
 - Split the patch by architecture so that the repective maintainers
   can pick it up.
Changes in v2:
 - Added a note in the patch description.

Nishad Kamdar (5):
  arm64: Use the correct style for SPDX License Identifier
  nds32: Use the correct style for SPDX License Identifier
  powerpc: Use the correct style for SPDX License Identifier
  sh: Use the correct style for SPDX License Identifier
  x86: Use the correct style for SPDX License Identifier

 arch/arm64/boot/dts/mediatek/mt2712-pinfunc.h     | 2 +-
 arch/arm64/include/asm/pointer_auth.h             | 2 +-
 arch/arm64/include/asm/sdei.h                     | 2 +-
 arch/arm64/include/asm/vmap_stack.h               | 2 +-
 arch/nds32/include/asm/assembler.h                | 2 +-
 arch/nds32/include/asm/barrier.h                  | 2 +-
 arch/nds32/include/asm/bitfield.h                 | 2 +-
 arch/nds32/include/asm/cache.h                    | 2 +-
 arch/nds32/include/asm/cache_info.h               | 2 +-
 arch/nds32/include/asm/cacheflush.h               | 2 +-
 arch/nds32/include/asm/current.h                  | 2 +-
 arch/nds32/include/asm/delay.h                    | 2 +-
 arch/nds32/include/asm/elf.h                      | 2 +-
 arch/nds32/include/asm/fixmap.h                   | 2 +-
 arch/nds32/include/asm/futex.h                    | 2 +-
 arch/nds32/include/asm/highmem.h                  | 2 +-
 arch/nds32/include/asm/io.h                       | 2 +-
 arch/nds32/include/asm/irqflags.h                 | 2 +-
 arch/nds32/include/asm/l2_cache.h                 | 2 +-
 arch/nds32/include/asm/linkage.h                  | 2 +-
 arch/nds32/include/asm/memory.h                   | 2 +-
 arch/nds32/include/asm/mmu.h                      | 2 +-
 arch/nds32/include/asm/mmu_context.h              | 2 +-
 arch/nds32/include/asm/module.h                   | 2 +-
 arch/nds32/include/asm/nds32.h                    | 2 +-
 arch/nds32/include/asm/page.h                     | 2 +-
 arch/nds32/include/asm/pgalloc.h                  | 2 +-
 arch/nds32/include/asm/pgtable.h                  | 2 +-
 arch/nds32/include/asm/proc-fns.h                 | 2 +-
 arch/nds32/include/asm/processor.h                | 2 +-
 arch/nds32/include/asm/ptrace.h                   | 2 +-
 arch/nds32/include/asm/shmparam.h                 | 2 +-
 arch/nds32/include/asm/string.h                   | 2 +-
 arch/nds32/include/asm/swab.h                     | 2 +-
 arch/nds32/include/asm/syscall.h                  | 2 +-
 arch/nds32/include/asm/syscalls.h                 | 2 +-
 arch/nds32/include/asm/thread_info.h              | 2 +-
 arch/nds32/include/asm/tlb.h                      | 2 +-
 arch/nds32/include/asm/tlbflush.h                 | 2 +-
 arch/nds32/include/asm/uaccess.h                  | 2 +-
 arch/nds32/include/asm/unistd.h                   | 2 +-
 arch/nds32/include/asm/vdso.h                     | 2 +-
 arch/nds32/include/asm/vdso_datapage.h            | 2 +-
 arch/nds32/include/asm/vdso_timer_info.h          | 2 +-
 arch/nds32/include/uapi/asm/auxvec.h              | 2 +-
 arch/nds32/include/uapi/asm/byteorder.h           | 2 +-
 arch/nds32/include/uapi/asm/cachectl.h            | 2 +-
 arch/nds32/include/uapi/asm/param.h               | 2 +-
 arch/nds32/include/uapi/asm/ptrace.h              | 2 +-
 arch/nds32/include/uapi/asm/sigcontext.h          | 2 +-
 arch/nds32/include/uapi/asm/unistd.h              | 2 +-
 arch/powerpc/include/asm/pnv-ocxl.h               | 2 +-
 arch/sh/drivers/pci/pci-sh5.h                     | 4 ++--
 arch/sh/drivers/pci/pci-sh7751.h                  | 4 ++--
 arch/sh/drivers/pci/pci-sh7780.h                  | 4 ++--
 arch/sh/drivers/pci/pcie-sh7786.h                 | 4 ++--
 arch/sh/include/asm/addrspace.h                   | 4 ++--
 arch/sh/include/asm/bl_bit_64.h                   | 4 ++--
 arch/sh/include/asm/cache_insns_64.h              | 4 ++--
 arch/sh/include/asm/device.h                      | 4 ++--
 arch/sh/include/asm/dma-register.h                | 4 ++--
 arch/sh/include/asm/dma.h                         | 4 ++--
 arch/sh/include/asm/dwarf.h                       | 4 ++--
 arch/sh/include/asm/fixmap.h                      | 4 ++--
 arch/sh/include/asm/flat.h                        | 4 ++--
 arch/sh/include/asm/freq.h                        | 4 ++--
 arch/sh/include/asm/gpio.h                        | 4 ++--
 arch/sh/include/asm/machvec.h                     | 4 ++--
 arch/sh/include/asm/pgtable.h                     | 4 ++--
 arch/sh/include/asm/sfp-machine.h                 | 4 ++--
 arch/sh/include/asm/shmparam.h                    | 4 ++--
 arch/sh/include/asm/siu.h                         | 4 ++--
 arch/sh/include/asm/spinlock-cas.h                | 4 ++--
 arch/sh/include/asm/spinlock-llsc.h               | 4 ++--
 arch/sh/include/asm/spinlock.h                    | 4 ++--
 arch/sh/include/asm/switch_to.h                   | 4 ++--
 arch/sh/include/asm/switch_to_64.h                | 4 ++--
 arch/sh/include/asm/tlb_64.h                      | 4 ++--
 arch/sh/include/asm/traps_64.h                    | 4 ++--
 arch/sh/include/asm/watchdog.h                    | 4 ++--
 arch/sh/include/cpu-common/cpu/addrspace.h        | 4 ++--
 arch/sh/include/cpu-common/cpu/mmu_context.h      | 4 ++--
 arch/sh/include/cpu-common/cpu/pfc.h              | 4 ++--
 arch/sh/include/cpu-sh2/cpu/cache.h               | 4 ++--
 arch/sh/include/cpu-sh2/cpu/freq.h                | 4 ++--
 arch/sh/include/cpu-sh2/cpu/watchdog.h            | 4 ++--
 arch/sh/include/cpu-sh2a/cpu/cache.h              | 4 ++--
 arch/sh/include/cpu-sh2a/cpu/freq.h               | 4 ++--
 arch/sh/include/cpu-sh3/cpu/cache.h               | 4 ++--
 arch/sh/include/cpu-sh3/cpu/dma-register.h        | 4 ++--
 arch/sh/include/cpu-sh3/cpu/freq.h                | 4 ++--
 arch/sh/include/cpu-sh3/cpu/gpio.h                | 4 ++--
 arch/sh/include/cpu-sh3/cpu/mmu_context.h         | 4 ++--
 arch/sh/include/cpu-sh3/cpu/watchdog.h            | 4 ++--
 arch/sh/include/cpu-sh4/cpu/addrspace.h           | 4 ++--
 arch/sh/include/cpu-sh4/cpu/cache.h               | 4 ++--
 arch/sh/include/cpu-sh4/cpu/dma-register.h        | 4 ++--
 arch/sh/include/cpu-sh4/cpu/fpu.h                 | 4 ++--
 arch/sh/include/cpu-sh4/cpu/freq.h                | 4 ++--
 arch/sh/include/cpu-sh4/cpu/mmu_context.h         | 4 ++--
 arch/sh/include/cpu-sh4/cpu/sh7786.h              | 4 ++--
 arch/sh/include/cpu-sh4/cpu/sq.h                  | 4 ++--
 arch/sh/include/cpu-sh4/cpu/watchdog.h            | 4 ++--
 arch/sh/include/mach-common/mach/hp6xx.h          | 4 ++--
 arch/sh/include/mach-common/mach/magicpanelr2.h   | 4 ++--
 arch/sh/include/mach-common/mach/mangle-port.h    | 4 ++--
 arch/sh/include/mach-common/mach/microdev.h       | 4 ++--
 arch/sh/include/mach-common/mach/secureedge5410.h | 4 ++--
 arch/sh/include/mach-dreamcast/mach/dma.h         | 4 ++--
 arch/sh/include/mach-dreamcast/mach/pci.h         | 4 ++--
 arch/sh/include/mach-dreamcast/mach/sysasic.h     | 4 ++--
 arch/sh/include/mach-se/mach/se7721.h             | 4 ++--
 arch/x86/include/asm/cpu_entry_area.h             | 2 +-
 arch/x86/include/asm/pti.h                        | 2 +-
 arch/x86/kernel/process.h                         | 2 +-
 115 files changed, 175 insertions(+), 175 deletions(-)

-- 
2.17.1
