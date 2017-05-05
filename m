From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] DeviceTree for 4.12
Date: Fri, 5 May 2017 14:23:12 -0500
Message-ID: <CAL_JsqLGERF896yeoyR7F+nty=6oh3NUU0919xNAGF_SuDHeYw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

Please pull DT updates for 4.12. Details below.

Rob


The following changes since commit 4495c08e84729385774601b5146d51d9e5849f81:

  Linux 4.11-rc2 (2017-03-12 14:47:08 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/devicetree-for-4.12

for you to fetch changes up to 17a70355ea576843a7ac851f1db26872a50b2850:

  of: fix sparse warnings in fdt, irq, reserved mem, and resolver code
(2017-05-04 14:01:13 -0500)

----------------------------------------------------------------
DeviceTree for 4.12:

- Fix sparse warnings in drivers/of/.

- Add more overlay unittests.

- Update dtc to v1.4.4-8-g756ffc4f52f6. This adds more checks on dts
files such as unit-address formatting and stricter character sets for
node and property names.

- Add a common DT modalias function.

- Move trivial-devices.txt up and out of i2c dir.

- ARM NVIC interrupt controller binding.

- Vendor prefixes for Sensirion, Dioo, Nordic, ROHM.

- Correct some binding file locations.

----------------------------------------------------------------
Arnd Bergmann (2):
      of: fix unittest build without CONFIG_OF_OVERLAY
      of: fix uninitialized variable warning for overlay test

Dan Carpenter (1):
      of/unittest: Missing unlocks on error

Frank Rowand (2):
      of: per-file dtc compiler flags
      of: Add unit tests for applying overlays

Greentime Hu (1):
      dt-bindings: net: generalize moxart-mac to support all faraday
based ftmac IP

Jerome Brunet (1):
      dt-bindings: add vendor prefix for Dioo

Kumar Gala (2):
      dt-bindings: arm,nvic: Binding for ARM NVIC interrupt controller
on Cortex-M
      of: Add vendor prefix for Nordic Semiconductor

Marco Franchi (1):
      dt: Add vendor prefix for Sensirion

Marek Vasut (1):
      of: Add vendor prefix for ROHM Semiconductor

Richard Genoud (2):
      dt-bindings: mfd: Fix path to atmel/hlcdc-dc.txt
      dt-bindings: display: atmel: Fix path to atmel-hlcdc.txt

Rob Herring (8):
      of: fix of_device_get_modalias returned length when truncating buffers
      of: Add function for generating a DT modalias with a newline
      scripts/dtc: automate getting dtc version and log in update script
      scripts/dtc: Update to upstream version v1.4.4-8-g756ffc4f52f6
      dtc: update warning settings for new bus and node/property name checks
      of: fix sparse warnings in of_find_next_cache_node
      of: fix sparse warning in of_pci_range_parser_one
      of: fix sparse warnings in fdt, irq, reserved mem, and resolver code

Tobias Klauser (1):
      fpga: region: add missing DT documentation for config complete timeout

Tyrel Datwyler (1):
      of: fix "/cpus" reference leak in of_numa_parse_cpu_nodes()

Wolfram Sang (1):
      Documentation: devicetree: move trivial-devices out of I2C realm

 .../devicetree/bindings/display/atmel/hlcdc-dc.txt |   2 +-
 .../devicetree/bindings/fpga/fpga-region.txt       |   2 +
 .../bindings/interrupt-controller/arm,nvic.txt     |  36 ++
 .../devicetree/bindings/mfd/atmel-hlcdc.txt        |   2 +-
 .../net/{moxa,moxart-mac.txt => faraday,ftmac.txt} |   7 +-
 .../bindings/{i2c => }/trivial-devices.txt         |   0
 .../devicetree/bindings/vendor-prefixes.txt        |   4 +
 arch/powerpc/platforms/pseries/ibmebus.c           |   5 +-
 drivers/base/platform.c                            |   2 +-
 drivers/macintosh/macio_sysfs.c                    |   7 +-
 drivers/of/address.c                               |   2 +-
 drivers/of/base.c                                  |  13 +-
 drivers/of/device.c                                |  20 +-
 drivers/of/fdt.c                                   |  18 +-
 drivers/of/irq.c                                   |   2 +-
 drivers/of/of_numa.c                               |   2 +
 drivers/of/of_private.h                            |  12 +
 drivers/of/of_reserved_mem.c                       |   2 +-
 drivers/of/resolver.c                              |   2 +-
 drivers/of/unittest-data/Makefile                  |  17 +-
 drivers/of/unittest-data/overlay.dts               |  53 +++
 drivers/of/unittest-data/overlay_bad_phandle.dts   |  20 ++
 drivers/of/unittest-data/overlay_base.dts          |  80 +++++
 drivers/of/unittest.c                              | 321 ++++++++++++++++++
 drivers/tty/serdev/core.c                          |   5 +-
 drivers/usb/common/ulpi.c                          |   2 +-
 include/linux/of_device.h                          |   7 +-
 include/linux/of_irq.h                             |   2 +-
 scripts/Makefile.lib                               |  14 +-
 scripts/dtc/checks.c                               | 361 ++++++++++++++++++---
 scripts/dtc/data.c                                 |  16 +-
 scripts/dtc/dtc-lexer.l                            |   3 +-
 scripts/dtc/dtc-lexer.lex.c_shipped                |  77 ++---
 scripts/dtc/dtc-parser.tab.c_shipped               |   6 +-
 scripts/dtc/dtc-parser.y                           |   6 +-
 scripts/dtc/dtc.c                                  |   9 +-
 scripts/dtc/dtc.h                                  |  11 +-
 scripts/dtc/flattree.c                             |  58 ++--
 scripts/dtc/libfdt/fdt_rw.c                        |   3 +-
 scripts/dtc/libfdt/libfdt.h                        |  51 ++-
 scripts/dtc/libfdt/libfdt_env.h                    |  26 +-
 scripts/dtc/livetree.c                             |  22 +-
 scripts/dtc/srcpos.c                               |   2 +-
 scripts/dtc/srcpos.h                               |  11 +-
 scripts/dtc/treesource.c                           |   6 +-
 scripts/dtc/update-dtc-source.sh                   |  20 +-
 scripts/dtc/util.c                                 |  11 +-
 scripts/dtc/util.h                                 |  24 +-
 scripts/dtc/version_gen.h                          |   2 +-
 49 files changed, 1153 insertions(+), 233 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/interrupt-controller/arm,nvic.txt
 rename Documentation/devicetree/bindings/net/{moxa,moxart-mac.txt =>
faraday,ftmac.txt} (68%)
 rename Documentation/devicetree/bindings/{i2c => }/trivial-devices.txt (100%)
 create mode 100644 drivers/of/unittest-data/overlay.dts
 create mode 100644 drivers/of/unittest-data/overlay_bad_phandle.dts
 create mode 100644 drivers/of/unittest-data/overlay_base.dts
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
