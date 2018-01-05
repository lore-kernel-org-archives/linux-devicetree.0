From: Rob Herring <robh@kernel.org>
Subject: [PATCH 0/7] DT: consolidate bootmem support
Date: Fri,  5 Jan 2018 17:14:17 -0600
Message-ID: <20180105231424.19247-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

This series adds support for bootmem to the DT core code and removes the 
remaining arch specific early_init_dt_alloc_memory_arch implementations.

Compile tested only on arm64, mips, x86, and xtensa.

Rob

Rob Herring (7):
  of/fdt: use memblock_virt_alloc for early alloc
  cris: remove arch specific early DT functions
  metag: remove arch specific early DT functions
  mips: remove arch specific early_init_dt_alloc_memory_arch
  nios2: remove arch specific early_init_dt_alloc_memory_arch
  x86: remove arch specific early_init_dt_alloc_memory_arch
  xtensa: remove arch specific early DT functions

 arch/cris/kernel/Makefile     | 19 -------------------
 arch/cris/kernel/devicetree.c | 15 ---------------
 arch/metag/kernel/devtree.c   | 14 --------------
 arch/mips/kernel/prom.c       |  5 -----
 arch/nios2/kernel/prom.c      |  5 -----
 arch/x86/kernel/devicetree.c  |  6 ------
 arch/xtensa/kernel/setup.c    | 12 ------------
 drivers/of/fdt.c              | 16 ++++------------
 drivers/of/unittest.c         | 11 ++++++++---
 include/linux/of_fdt.h        |  1 -
 10 files changed, 12 insertions(+), 92 deletions(-)
 delete mode 100644 arch/cris/kernel/devicetree.c

-- 
2.14.1
