From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] DeviceTree updates for 4.6
Date: Fri, 18 Mar 2016 10:58:40 -0500
Message-ID: <CAL_JsqLNrUJoJuyvS4-oHTYejvYhi+6arBOjxpQWKF+E=hPm8Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

Please pull DeviceTree updates for 4.6. Details below.

Rob


The following changes since commit 92e963f50fc74041b5e9e744c330dca48e04f08d:

  Linux 4.5-rc1 (2016-01-24 13:06:47 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/devicetree-for-4.6

for you to fetch changes up to 5027e19db8cee24e189f8afa53b548e1ac5d0c1d:

  of: Add vendor prefix for eGalax_eMPIA Technology Inc (2016-03-18
09:38:22 -0500)

----------------------------------------------------------------
DeviceTree updates for 4.6:

- New tool dtx_diff to diff DT files.

- Sync kernel's dtc/libfdt to current dtc repo master.

- Fix for reserved memory regions located in highmem.

- Document standard unit suffixes for DT properties.

- Various DT binding doc updates.

----------------------------------------------------------------
Alexander Stein (1):
      Input: ads7846: Add description how to use internal reference (ADS7846)

Amitoj Kaur Chawla (1):
      of: resolver: Add missing of_node_get and of_node_put

David Rivshin (1):
      of: add 'const' for of_property_*_string*() parameter '*np'

Fabio Estevam (2):
      serial: fsl-imx-uart: Fix typo in fsl,dte-mode description
      of: Add vendor prefix for eGalax_eMPIA Technology Inc

Frank Rowand (2):
      dtc: create tool to diff device trees
      scripts/dtc: dtx_diff - add info to error message

Geert Uytterhoeven (1):
      devicetree: bindings: ARM: Use "uV" for micro-volt

Linus Walleij (1):
      ARM: realview: add EB syscon variants to bindings

Maciej S. Szmigiero (1):
      of: Add United Radiant Technology Corporation vendor prefix

Rob Herring (4):
      ARM: boot: Add an implementation of strnlen for libfdt
      scripts/dtc: Update to upstream commit b06e55c88b9b
      dt/bindings: add documentation on standard property unit suffixes
      kbuild: Allow using host dtc instead of kernel's copy

Sergey Senozhatsky (1):
      of/unittest: fix infinite loop in of_unittest_destroy_tracked_overlays()

Vinayak Menon (1):
      of: alloc anywhere from memblock if range not specified

 Documentation/devicetree/bindings/arm/arm-boards   |   4 +-
 Documentation/devicetree/bindings/arm/cpus.txt     |   2 +-
 .../devicetree/bindings/input/ads7846.txt          |   2 +
 .../devicetree/bindings/property-units.txt         |  39 +++
 .../devicetree/bindings/serial/fsl-imx-uart.txt    |   2 +-
 .../devicetree/bindings/vendor-prefixes.txt        |   2 +
 arch/arm/boot/compressed/string.c                  |   9 +
 drivers/of/base.c                                  |  15 +-
 drivers/of/of_reserved_mem.c                       |   4 +-
 drivers/of/resolver.c                              |   7 +-
 drivers/of/unittest.c                              |   5 +
 include/linux/of.h                                 |  18 +-
 scripts/Makefile.lib                               |   3 +-
 scripts/dtc/checks.c                               |   2 +-
 scripts/dtc/dtc-lexer.l                            |  39 ++-
 scripts/dtc/dtc-lexer.lex.c_shipped                | 101 +++---
 scripts/dtc/dtc-parser.tab.c_shipped               |  84 ++---
 scripts/dtc/dtc-parser.y                           |  20 +-
 scripts/dtc/dtc.c                                  |  62 +++-
 scripts/dtc/dtx_diff                               | 349 +++++++++++++++++++++
 scripts/dtc/libfdt/fdt.c                           |  13 +-
 scripts/dtc/libfdt/fdt_ro.c                        | 100 ++++++
 scripts/dtc/libfdt/fdt_rw.c                        |   2 +
 scripts/dtc/libfdt/libfdt.h                        |  73 ++++-
 scripts/dtc/util.c                                 |   3 +-
 scripts/dtc/version_gen.h                          |   2 +-
 26 files changed, 828 insertions(+), 134 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/property-units.txt
 create mode 100755 scripts/dtc/dtx_diff
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
