From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [GIT PULL] Devicetree changes for v4.1
Date: Wed, 1 Jul 2015 17:11:23 +0100
Message-ID: <CACxGe6vix+c3zdJWvuiZVpR+SZA3RDNhC7pGHx5KX2hyXUeR=g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

Nothing exciting here. Mostly devicetree bug fixes. Please pull.

g.

The following changes since commit ba155e2d21f6bf05de86a78dbe5bfd8757604a65:

  Linux 4.1-rc5 (2015-05-24 18:22:35 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/glikely/linux.git
tags/devicetree-for-linus

for you to fetch changes up to 48a9b733e644ab4cc8e2a98950a36ddb12b8c54e:

  of/irq: Rename "intc_desc" to "of_intc_desc" to fix OF on sh
(2015-06-30 17:03:57 +0100)

----------------------------------------------------------------
Devicetree changes for v4.2

A whole lot of bug fixes. Nothing stands out here except the ability to
enable CONFIG_OF on every architecture, and an import of a newer version
of dtc.

----------------------------------------------------------------
Andrew Lunn (1):
      of: Add vendor prefix for Zodiac Inflight Innovations

Gaurav Minocha (1):
      scripts/dtc: add missing libfdt and fixups to import script

Geert Uytterhoeven (4):
      of: Grammar s/property exist/property exists/
      of/fdt: Make fdt blob input parameters of unflatten functions const
      of/overlay: Grammar s/an negative/a negative/
      of/irq: Rename "intc_desc" to "of_intc_desc" to fix OF on sh

Grant Likely (1):
      Merge remote-tracking branch 'robh/for-next' into devicetree/next

Jeremy Linton (1):
      of/irq: Fix pSeries boot failure

Jingoo Han (1):
      of/address: use atomic allocation in pci_register_io_range()

Joachim Eastwood (1):
      of: add helper function to retrive match data

Joe Perches (1):
      tps6507x.txt: Remove executable permission

Konstantin Khlebnikov (1):
      of: return NUMA_NO_NODE from fallback of_node_to_nid()

Masahiro Yamada (1):
      of/fdt: fix argument name and add comments of unflatten_dt_node()

Pantelis Antoniou (1):
      of: Move OF flags to be visible even when !CONFIG_OF

Rob Herring (7):
      libfdt: add fdt type definitions
      scripts/dtc: Update to upstream version 9d3649bd3be245c9
      MIPS: prepare for user enabling of CONFIG_OF
      of: make CONFIG_OF user selectable
      of: make unittest select OF_EARLY_FLATTREE instead of depend on it
      of: clean-up unnecessary libfdt include paths
      dt/fdt: add empty versions of early_init_dt_*_memory_arch

Suman Anna (1):
      of: define of_find_node_by_phandle for !CONFIG_OF

Thomas Langer (1):
      Documentation: DT: Fix a typo in the filename "lantiq,<chip>-pinumx.txt"

 Documentation/devicetree/bindings/mfd/tps6507x.txt |    0
 ...falcon-pinumx.txt => lantiq,pinctrl-falcon.txt} |    0
 ...tiq,xway-pinumx.txt => lantiq,pinctrl-xway.txt} |    0
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 arch/arm/boot/compressed/libfdt_env.h              |    4 +
 arch/mips/cavium-octeon/Makefile                   |    3 -
 arch/mips/include/asm/prom.h                       |    2 +-
 arch/mips/kernel/prom.c                            |    1 +
 arch/mips/mti-sead3/Makefile                       |    2 -
 arch/powerpc/boot/libfdt_env.h                     |    4 +
 arch/powerpc/boot/of.h                             |    2 +
 arch/powerpc/kernel/Makefile                       |    1 -
 drivers/firmware/efi/libstub/Makefile              |    2 -
 drivers/of/Kconfig                                 |   17 +-
 drivers/of/Makefile                                |    3 -
 drivers/of/address.c                               |    2 +-
 drivers/of/base.c                                  |    2 +-
 drivers/of/device.c                                |   12 +
 drivers/of/fdt.c                                   |   22 +-
 drivers/of/irq.c                                   |    9 +-
 drivers/of/overlay.c                               |    6 +-
 include/linux/libfdt_env.h                         |    4 +
 include/linux/of.h                                 |   24 +-
 include/linux/of_device.h                          |    7 +
 include/linux/of_fdt.h                             |    2 +-
 scripts/dtc/checks.c                               |   31 +-
 scripts/dtc/data.c                                 |   12 +-
 scripts/dtc/dtc-lexer.l                            |   65 +-
 scripts/dtc/dtc-lexer.lex.c_shipped                |  516 +++---
 scripts/dtc/dtc-parser.tab.c_shipped               | 1773 +++++++++-----------
 scripts/dtc/dtc-parser.tab.h_shipped               |  114 +-
 scripts/dtc/dtc-parser.y                           |  147 +-
 scripts/dtc/dtc.c                                  |   14 +-
 scripts/dtc/dtc.h                                  |   18 +-
 scripts/dtc/flattree.c                             |    4 +-
 scripts/dtc/fstree.c                               |   17 +-
 scripts/dtc/libfdt/Makefile.libfdt                 |    3 +-
 scripts/dtc/libfdt/fdt.c                           |   30 +-
 scripts/dtc/libfdt/fdt.h                           |   93 +-
 scripts/dtc/libfdt/fdt_empty_tree.c                |    1 +
 scripts/dtc/libfdt/fdt_ro.c                        |   29 +-
 scripts/dtc/libfdt/fdt_rw.c                        |   10 +-
 scripts/dtc/libfdt/fdt_sw.c                        |   36 +-
 scripts/dtc/libfdt/fdt_wip.c                       |    2 +-
 scripts/dtc/libfdt/libfdt.h                        |  148 +-
 scripts/dtc/libfdt/libfdt_env.h                    |  104 +-
 scripts/dtc/libfdt/libfdt_internal.h               |    6 +-
 scripts/dtc/livetree.c                             |    4 +-
 scripts/dtc/srcpos.c                               |   49 +-
 scripts/dtc/srcpos.h                               |   15 +-
 scripts/dtc/treesource.c                           |   15 +-
 scripts/dtc/update-dtc-source.sh                   |    9 +
 scripts/dtc/util.c                                 |   18 +-
 scripts/dtc/util.h                                 |    4 +-
 scripts/dtc/version_gen.h                          |    2 +-
 55 files changed, 1845 insertions(+), 1576 deletions(-)
 mode change 100755 => 100644 Documentation/devicetree/bindings/mfd/tps6507x.txt
 rename Documentation/devicetree/bindings/pinctrl/{lantiq,falcon-pinumx.txt
=> lantiq,pinctrl-falcon.txt} (100%)
 rename Documentation/devicetree/bindings/pinctrl/{lantiq,xway-pinumx.txt
=> lantiq,pinctrl-xway.txt} (100%)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
