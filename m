From: Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH 00/21] MIPS memblock: Remove bootmem code and switch to NO_BOOTMEM
Date: Mon, 19 Dec 2016 05:07:25 +0300
Message-ID: <1482113266-13207-1-git-send-email-fancer.lancer@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: ralf@linux-mips.org, paul.burton@imgtec.com, rabinv@axis.com, matt.redfearn@imgtec.com, james.hogan@imgtec.com, alexander.sverdlin@nokia.com, robh+dt@kernel.org, frowand.list@gmail.com
Cc: Sergey.Semin@t-platforms.ru, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>
List-Id: devicetree@vger.kernel.org

Most of the modern platforms supported by linux kernel have already
been cleaned up of old bootmem allocator by moving to nobootmem
interface wrapping up the memblock. This patchset is the first
attempt to do the similar improvement for MIPS for UMA systems
only.

Even though the porting was performed as much careful as possible
there still might be problem with support of some platforms,
especially Loonson3 or SGI IP27, which perform early memory manager
initialization by their self.

The patchset is split so individual patch being consistent in
functional and buildable ways. But the MIPS early memory manager
will work correctly only either with or without the whole set being
applied. For the same reason a reviewer should not pay much attention
to methods bootmem_init(), arch_mem_init(), paging_init() and
mem_init() until they are fully refactored.

The patchset is applied on top of kernel v4.9.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>

Serge Semin (21):
  MIPS memblock: Unpin dts memblock sanity check method
  MIPS memblock: Add dts mem and reserved-mem callbacks
  MIPS memblock: Alter traditional add_memory_region() method
  MIPS memblock: Alter user-defined memory parameter parser
  MIPS memblock: Alter initrd memory reservation method
  MIPS memblock: Alter kexec-crashkernel parameters parser
  MIPS memblock: Alter elfcorehdr parameters parser
  MIPS memblock: Move kernel parameters parser into individual method
  MIPS memblock: Move kernel memory reservation to individual method
  MIPS memblock: Discard bootmem allocator initialization
  MIPS memblock: Add memblock sanity check method
  MIPS memblock: Add memblock print outs in debug
  MIPS memblock: Add memblock allocator initialization
  MIPS memblock: Alter IO resources initialization method
  MIPS memblock: Alter weakened MAAR initialization method
  MIPS memblock: Alter paging initialization method
  MIPS memblock: Alter high memory freeing method
  MIPS memblock: Slightly improve buddy allocator init method
  MIPS memblock: Add print out method of kernel virtual memory layout
  MIPS memblock: Add free low memory test method call
  MIPS memblock: Deactivate old bootmem allocator

 arch/mips/Kconfig        |   2 +-
 arch/mips/kernel/prom.c  |  32 +-
 arch/mips/kernel/setup.c | 958 +++++++++++++++--------------
 arch/mips/mm/init.c      | 234 ++++---
 drivers/of/fdt.c         |  47 +-
 include/linux/of_fdt.h   |   1 +
 6 files changed, 739 insertions(+), 535 deletions(-)

-- 
2.6.6
