From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 00/28] Early flattened DT init consolidation
Date: Mon, 16 Sep 2013 18:08:56 -0500
Message-ID: <1379372965-22359-1-git-send-email-robherring2@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Aurelien Jacquiot <a-jacquiot-l0cyMroinI0@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Chris Zankel <chris-YvXeqwSYzG2sTnJN9+BGXg@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Jonas Bonn <jonas-A9uVI2HLR7kOP4wsBPIw7w@public.gmane.org>, Mark Salter <msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Max Filippov <jcmvbkbc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Vineet Gupta <vgupta-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>

This is the first of 2 series to do some consolidation of per
architecture Device Tree code. We now have 12 architectures with DT
support. As new architectures have been added, much of the DT related
code for the early flattened DT scanning has been duplicated. Yet little
of this code is architecture specific. This series has 4 main parts:

- Create a common function to copy built-in dtb's out of init section
- Create a single, common function to scan the FDT
- Removal of early_init_dt_setup_initrd_arch
- Create common functions for machine matching with DT

The entire series is available here:
git://sources.calxeda.com/kernel/linux.git dt-cleanup

Compiled on arm, arm64, microblaze, mips, openrisc, powerpc, sparc,
xtensa.

Rob

Rob Herring (28):
  c6x: use boot_command_line instead of private c6x_command_line
  openrisc: use boot_command_line instead of private cmd_line
  of: create unflatten_and_copy_device_tree
  arc: use unflatten_and_copy_device_tree
  openrisc: use unflatten_and_copy_device_tree
  x86: use unflatten_and_copy_device_tree
  xtensa: use unflatten_and_copy_device_tree
  metag: use unflatten_and_copy_device_tree
  of: Introduce common early_init_dt_scan
  arc: use early_init_dt_scan
  arm: use early_init_dt_scan
  arm64: use early_init_dt_scan
  c6x: use early_init_dt_scan
  microblaze: use early_init_dt_scan
  mips: use early_init_dt_scan
  openrisc: use early_init_dt_scan
  xtensa: use early_init_dt_scan
  of: create default early_init_dt_add_memory_arch
  arm: set initrd_start/initrd_end for fdt scan
  arm64: set initrd_start/initrd_end for fdt scan
  of: remove early_init_dt_setup_initrd_arch
  openrisc: remove unnecessary prom.c includes
  of: introduce common FDT machine related functions
  arc: use common of_flat_dt_match_machine
  arm: use common of_flat_dt_match_machine
  arm64: use common of_flat_dt_get_machine_name
  metag: use common of_flat_dt_match_machine
  mips: use common of_flat_dt_get_machine_name

 arch/arc/include/asm/mach_desc.h |   1 -
 arch/arc/kernel/devtree.c        |  94 +++++++--------------------------
 arch/arc/kernel/setup.c          |   3 +-
 arch/arc/mm/init.c               |   7 ---
 arch/arm/kernel/devtree.c        |  57 ++++++++------------
 arch/arm/mm/init.c               |  13 ++---
 arch/arm64/kernel/setup.c        |  60 ++-------------------
 arch/arm64/mm/init.c             |  24 +++------
 arch/c6x/include/asm/setup.h     |   2 -
 arch/c6x/kernel/devicetree.c     |  29 ----------
 arch/c6x/kernel/setup.c          |  13 +----
 arch/metag/kernel/devtree.c      |  87 ++++++------------------------
 arch/metag/kernel/setup.c        |   4 +-
 arch/metag/mm/init.c             |   9 ----
 arch/microblaze/kernel/prom.c    |  31 ++---------
 arch/microblaze/kernel/setup.c   |   2 +-
 arch/mips/include/asm/prom.h     |   3 --
 arch/mips/kernel/prom.c          |  60 +--------------------
 arch/openrisc/kernel/prom.c      |  70 +-----------------------
 arch/openrisc/kernel/setup.c     |   6 +--
 arch/powerpc/kernel/prom.c       |   9 ----
 arch/x86/kernel/devicetree.c     |  42 +++------------
 arch/xtensa/kernel/setup.c       |  55 +++++--------------
 drivers/of/fdt.c                 | 111 +++++++++++++++++++++++++++++++++++++--
 include/linux/of_fdt.h           |  18 +++----
 25 files changed, 223 insertions(+), 587 deletions(-)

-- 
1.8.1.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
