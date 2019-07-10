From: Rob Herring <robh@kernel.org>
Subject: [GIT PULL] Devicetree updates for 5.3
Date: Wed, 10 Jul 2019 14:50:01 -0600
Message-ID: <CAL_JsqJAydO3Zjx_9S+r8h5YAQbDBJjqHSFV-aKkN9n=MH7erg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Frank Rowand <frowand.list@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, David Miller <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org

Hi Linus,

Please pull. There's 2 conflicts. The first is with your tree and SPDX
tags in scripts/dtc/. The correct resolution is to take the version
from my tree as that has the correct licenses from upstream dtc. The
2nd conflict is with the netdev tree. It's fine to just delete
ethernet.txt. The necessary changes are already in the new schema
file.

Rob

The following changes since commit 852d095d16a6298834839f441593f59d58a31978=
:

  checkpatch.pl: Update DT vendor prefix check (2019-05-22 14:54:49 -0500)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/devicetree-for-5.3

for you to fetch changes up to f59d261180f3b66367962f1974090815ce710056:

  dt-bindings: vendor-prefixes: add Sipeed (2019-07-09 16:57:41 -0600)

----------------------------------------------------------------
Devicetree updates for v5.3:

- DT binding schema examples are now validated against the schemas.
  Various examples are fixed due to that.

- Sync dtc with upstream version v1.5.0-30-g702c1b6c0e73

- Initial schemas for networking bindings. This includes ethernet, phy
  and mdio common bindings with several Allwinner and stmmac converted
  to the schema.

- Conversion of more Arm top-level SoC/board bindings to DT schema

- Conversion of PSCI binding to DT schema

- Rework Arm CPU schema to coexist with other CPU schemas

- Add a bunch of missing vendor prefixes and new ones for SoChip,
  Sipeed, Kontron, B&R Industrial Automation GmbH, and Espressif

- Add Mediatek UART RX wakeup support to binding

- Add reset to ST UART binding

- Remove some Linuxisms from the endianness common-properties.txt
  binding

- Make the flattened DT read-only after init

- Ignore disabled reserved memory nodes

- Clean-up some dead code in FDT functions

----------------------------------------------------------------
Amit Kucheria (1):
      Documentation: arm: Link idle-states binding to "enable-method" prope=
rty

Brian Masney (1):
      dt-bindings: backlight: lm3630a: correct schema validation

Claire Chang (1):
      dt-bindings: serial: add documentation for Rx in-band wakeup support

Erwan Le Ray (1):
      dt-bindings: stm32: serial: Add optional reset

Geert Uytterhoeven (3):
      dt-bindings: property-units: Sanitize unit naming
      dt-bindings: Add missing newline at end of file
      of/platform: Drop superfluous cast in of_device_make_bus_id()

Hannes Schmelzer (1):
      Documentation: devicetree: Add vendor prefix for B&R Industrial
Automation GmbH

Icenowy Zheng (2):
      dt-bindings: vendor-prefixes: add SoChip
      dt-bindings: vendor-prefixes: add Sipeed

Kefeng Wang (2):
      of/fdt: Fix =E2=80=98of_fdt_match=E2=80=99 defined but not used compi=
ler warning
      dt-bindings: 83xx-512x-pci: Drop cell-index property

Krishna Reddy (1):
      of: reserved-memory: ignore disabled memory-region nodes

Marco Felsch (1):
      dt-bindings: add Kontron vendor prefix

Masahiro Yamada (1):
      of/fdt: pass early_init_dt_reserve_memory_arch() with bool type nomap

Maxime Ripard (22):
      dt-bindings: Add vendor prefix for Espressif
      dt-bindings: vendor: Escape single quote
      dt-bindings: vendor: Fix simtek vendor compatible
      dt-bindings: vendor: Add a bunch of vendors
      dt-bindings: net: Add YAML schemas for the generic Ethernet options
      dt-bindings: net: Add a YAML schemas for the generic PHY options
      dt-bindings: net: Add a YAML schemas for the generic MDIO options
      MAINTAINERS: Add Ethernet PHY YAML file
      dt-bindings: net: phy: The interrupt property is not mandatory
      dt-bindings: net: sun4i-emac: Convert the binding to a schemas
      dt-bindings: net: sun4i-mdio: Convert the binding to a schemas
      dt-bindings: net: stmmac: Convert the binding to a schemas
      dt-bindings: net: sun7i-gmac: Convert the binding to a schemas
      dt-bindings: net: sun8i-emac: Convert the binding to a schemas
      dt-bindings: net: dwmac: Deprecate the PHY reset properties
      dt-bindings: net: mdio: Add a nodename pattern
      dt-bindings: net: mdio: Add address and size cells
      dt-bindings: net: mdio: Add child nodes
      dt-bindings: display: Fix simple-framebuffer example
      dt-bindings: simple-framebuffer: Add requirement for pipelines
      dt-bindings: net: Use phy-mode instead of phy-connection-type
      dt-bindings: usb: ehci: Fix example warnings

Rob Herring (15):
      scripts/dtc: Update to upstream version v1.5.0-23-g87963ee20693
      dt-bindings: vendor-prefixes: Also allow node names starting with '_'
      dt-bindings: Check the examples against the schemas
      scripts/dtc: Update to upstream version v1.5.0-30-g702c1b6c0e73
      dt-bindings: arm: Convert Alpine board/soc bindings to json-schema
      dt-bindings: arm: qcom: Add missing schema for MSM8974
      dt-bindings: arm: qcom: Add missing schema for IPQ4019 boards
      dt-bindings: arm: Convert Axxia board/soc bindings to json-schema
      dt-bindings: arm: Convert MOXA ART board/soc bindings to json-schema
      dt-bindings: arm: Convert NXP LPC32xx board/soc bindings to json-sche=
ma
      dt-bindings: arm: Convert Conexant Digicolor board/soc bindings
to json-schema
      dt-bindings: arm: Convert PSCI binding to json-schema
      dt-bindings: arm: Limit cpus schema to only check Arm 'cpu' nodes
      dt-bindings: mtd: sunxi-nand: Drop 'maxItems' from child 'reg' proper=
ty
      dt-bindings: arm: Convert RDA Micro board/soc bindings to json-schema

Stephen Boyd (3):
      dt-bindings: Remove Linuxisms from common-properties binding
      of/fdt: Remove dead code and mark functions with __init
      of/fdt: Mark initial_boot_params as __ro_after_init

Wolfram Sang (1):
      of: unittest: simplify getting the adapter of a client

 Documentation/arm64/booting.txt                    |   2 +-
 Documentation/devicetree/bindings/Makefile         |   2 +-
 .../devicetree/bindings/arm/al,alpine.txt          |  16 -
 .../devicetree/bindings/arm/al,alpine.yaml         |  21 +
 Documentation/devicetree/bindings/arm/arm-boards   |   2 +-
 Documentation/devicetree/bindings/arm/axxia.txt    |  12 -
 Documentation/devicetree/bindings/arm/axxia.yaml   |  19 +
 Documentation/devicetree/bindings/arm/cpus.yaml    | 487 ++++++++++-------=
----
 .../devicetree/bindings/arm/digicolor.txt          |   6 -
 .../devicetree/bindings/arm/digicolor.yaml         |  16 +
 .../devicetree/bindings/arm/idle-states.txt        |  15 +-
 Documentation/devicetree/bindings/arm/moxart.txt   |  12 -
 Documentation/devicetree/bindings/arm/moxart.yaml  |  19 +
 .../devicetree/bindings/arm/nxp/lpc32xx.txt        |   8 -
 .../devicetree/bindings/arm/nxp/lpc32xx.yaml       |  25 ++
 Documentation/devicetree/bindings/arm/psci.txt     | 111 -----
 Documentation/devicetree/bindings/arm/psci.yaml    | 163 +++++++
 Documentation/devicetree/bindings/arm/qcom.yaml    |  14 +
 Documentation/devicetree/bindings/arm/rda.txt      |  17 -
 Documentation/devicetree/bindings/arm/rda.yaml     |  20 +
 .../devicetree/bindings/common-properties.txt      |  17 +-
 .../bindings/display/simple-framebuffer.yaml       |  25 +-
 .../devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt   |   2 +-
 .../bindings/leds/backlight/lm3630a-backlight.yaml |  21 +-
 .../bindings/mtd/allwinner,sun4i-a10-nand.yaml     |   1 -
 .../bindings/net/allwinner,sun4i-a10-emac.yaml     |  56 +++
 .../bindings/net/allwinner,sun4i-a10-mdio.yaml     |  70 +++
 .../bindings/net/allwinner,sun4i-emac.txt          |  19 -
 .../bindings/net/allwinner,sun4i-mdio.txt          |  27 --
 .../bindings/net/allwinner,sun7i-a20-gmac.txt      |  27 --
 .../bindings/net/allwinner,sun7i-a20-gmac.yaml     |  65 +++
 .../bindings/net/allwinner,sun8i-a83t-emac.yaml    | 321 ++++++++++++++
 .../devicetree/bindings/net/dwmac-sun8i.txt        | 201 ---------
 .../bindings/net/ethernet-controller.yaml          | 206 +++++++++
 .../devicetree/bindings/net/ethernet-phy.yaml      | 177 ++++++++
 Documentation/devicetree/bindings/net/ethernet.txt |  68 +--
 .../devicetree/bindings/net/fixed-link.txt         |  55 +--
 Documentation/devicetree/bindings/net/mdio.txt     |  38 +-
 Documentation/devicetree/bindings/net/mdio.yaml    |  74 ++++
 Documentation/devicetree/bindings/net/phy.txt      |  80 +---
 .../devicetree/bindings/net/snps,dwmac.yaml        | 411 +++++++++++++++++
 Documentation/devicetree/bindings/net/stmmac.txt   | 179 +-------
 .../devicetree/bindings/pci/83xx-512x-pci.txt      |   1 -
 .../bindings/pinctrl/nuvoton,npcm7xx-pinctrl.txt   |   2 +-
 .../devicetree/bindings/property-units.txt         |  34 +-
 .../devicetree/bindings/regulator/pv88060.txt      |   2 +-
 .../devicetree/bindings/serial/mtk-uart.txt        |  13 +-
 .../devicetree/bindings/serial/st,stm32-usart.txt  |   1 +
 .../devicetree/bindings/sound/cs42l73.txt          |   2 +-
 .../devicetree/bindings/usb/generic-ehci.yaml      |   3 +-
 .../devicetree/bindings/vendor-prefixes.yaml       |  76 +++-
 Documentation/translations/zh_CN/arm64/booting.txt |   2 +-
 MAINTAINERS                                        |   3 +-
 drivers/of/fdt.c                                   | 141 +++---
 drivers/of/of_reserved_mem.c                       |   3 +
 drivers/of/platform.c                              |   3 +-
 drivers/of/unittest.c                              |   2 +-
 include/linux/of_fdt.h                             |  11 -
 scripts/dtc/Makefile.dtc                           |   1 +
 scripts/dtc/checks.c                               |  72 ++-
 scripts/dtc/data.c                                 |  17 +-
 scripts/dtc/dtc-lexer.l                            |  17 +-
 scripts/dtc/dtc-parser.y                           |  17 +-
 scripts/dtc/dtc.c                                  |  17 +-
 scripts/dtc/dtc.h                                  |  20 +-
 scripts/dtc/flattree.c                             |  19 +-
 scripts/dtc/fstree.c                               |  17 +-
 scripts/dtc/libfdt/Makefile.libfdt                 |   3 +
 scripts/dtc/libfdt/fdt.c                           |  47 +-
 scripts/dtc/libfdt/fdt.h                           |  47 +-
 scripts/dtc/libfdt/fdt_addresses.c                 |  94 ++--
 scripts/dtc/libfdt/fdt_empty_tree.c                |  47 +-
 scripts/dtc/libfdt/fdt_overlay.c                   |  57 +--
 scripts/dtc/libfdt/fdt_ro.c                        |  97 ++--
 scripts/dtc/libfdt/fdt_rw.c                        |  69 +--
 scripts/dtc/libfdt/fdt_strerror.c                  |  47 +-
 scripts/dtc/libfdt/fdt_sw.c                        | 125 +++---
 scripts/dtc/libfdt/fdt_wip.c                       |  47 +-
 scripts/dtc/libfdt/libfdt.h                        | 205 ++++++---
 scripts/dtc/libfdt/libfdt_env.h                    |  48 +-
 scripts/dtc/libfdt/libfdt_internal.h               |  47 +-
 scripts/dtc/livetree.c                             |  37 +-
 scripts/dtc/srcpos.c                               |  16 +-
 scripts/dtc/srcpos.h                               |  16 +-
 scripts/dtc/treesource.c                           |  17 +-
 scripts/dtc/util.c                                 |  16 +-
 scripts/dtc/util.h                                 |  20 +-
 scripts/dtc/version_gen.h                          |   2 +-
 scripts/dtc/yamltree.c                             |  16 +-
 89 files changed, 2562 insertions(+), 2181 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/al,alpine.txt
 create mode 100644 Documentation/devicetree/bindings/arm/al,alpine.yaml
 delete mode 100644 Documentation/devicetree/bindings/arm/axxia.txt
 create mode 100644 Documentation/devicetree/bindings/arm/axxia.yaml
 delete mode 100644 Documentation/devicetree/bindings/arm/digicolor.txt
 create mode 100644 Documentation/devicetree/bindings/arm/digicolor.yaml
 delete mode 100644 Documentation/devicetree/bindings/arm/moxart.txt
 create mode 100644 Documentation/devicetree/bindings/arm/moxart.yaml
 delete mode 100644 Documentation/devicetree/bindings/arm/nxp/lpc32xx.txt
 create mode 100644 Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml
 delete mode 100644 Documentation/devicetree/bindings/arm/psci.txt
 create mode 100644 Documentation/devicetree/bindings/arm/psci.yaml
 delete mode 100644 Documentation/devicetree/bindings/arm/rda.txt
 create mode 100644 Documentation/devicetree/bindings/arm/rda.yaml
 create mode 100644
Documentation/devicetree/bindings/net/allwinner,sun4i-a10-emac.yaml
 create mode 100644
Documentation/devicetree/bindings/net/allwinner,sun4i-a10-mdio.yaml
 delete mode 100644
Documentation/devicetree/bindings/net/allwinner,sun4i-emac.txt
 delete mode 100644
Documentation/devicetree/bindings/net/allwinner,sun4i-mdio.txt
 delete mode 100644
Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.txt
 create mode 100644
Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml
 create mode 100644
Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
 delete mode 100644 Documentation/devicetree/bindings/net/dwmac-sun8i.txt
 create mode 100644
Documentation/devicetree/bindings/net/ethernet-controller.yaml
 create mode 100644 Documentation/devicetree/bindings/net/ethernet-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/net/mdio.yaml
 create mode 100644 Documentation/devicetree/bindings/net/snps,dwmac.yaml
