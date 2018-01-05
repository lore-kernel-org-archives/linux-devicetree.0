From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/7] DT: consolidate bootmem support
Date: Fri,  5 Jan 2018 17:20:47 -0600
Message-ID: <20180105232054.27394-1-robh@kernel.org>
Return-path: <linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chris Zankel <chris-YvXeqwSYzG2sTnJN9+BGXg@public.gmane.org>, Max Filippov <jcmvbkbc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-xtensa-PjhNF2WwrV/0Sa2dR60CXw@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Ley Foon Tan <lftan-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, nios2-dev-g9ZBwUv/Ih/yUk5EbOjzuce+I+R0W71w@public.gmane.org, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, James Hogan <jhogan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-metag-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikael Starvik <starvik-VrBV9hrLPhE@public.gmane.org>, Jesper Nilsson <jesper.nilsson-VrBV9hrLPhE@public.gmane.org>, linux-cris-kernel-VrBV9hrLPhE@public.gmane.org
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
