From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] DeviceTree for 4.13
Date: Thu, 6 Jul 2017 15:06:26 -0500
Message-ID: <CAL_JsqKvMncLnmUzrLs4v-k8mse=fBAxSZbqo2s31B8yDdPi=Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Takashi Iwai <tiwai-IBi9RG/b67k@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

Please pull DT updates for 4.13. There's one conflict with your tree
in Documentation/devicetree/bindings/net/ethernet.txt. The conflict is
just context lines, and the correct resolution is in -next.

Rob

The following changes since commit 2ea659a9ef488125eb46da6eb571de5eae5c43f6:

  Linux 4.12-rc1 (2017-05-13 13:19:49 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/devicetree-for-4.13

for you to fetch changes up to a4485b545e2fad4d65732cb7c60089bf4246de5c:

  Merge branch 'dt/property-move' into dt/next (2017-07-05 08:31:52 -0500)

----------------------------------------------------------------
DeviceTree for 4.13:

- vsprintf format specifier %pOF for device_node's. This will enable us
  to stop storing the full node names. Conversion of users will happen
  next cycle.

- Update documentation to point to DT specification instead of ePAPR.

- Split out graph and property functions to a separate file.

- New of-graph functions for ALSA

- Add vendor prefixes for RISC-V, Linksys, iWave Systems, Roofull,
  Itead, and BananaPi.

- Improve dtx_diff utility filename printing.

----------------------------------------------------------------
Biju Das (1):
      of: Add vendor prefix for iWave Systems Technologies Pvt. Ltd

Frank Rowand (11):
      MAINTAINERS: add device tree ABI documentation file
      Documentation: remove overlay-notes reference to non-existent file
      dt-bindings: display-timing.txt convert non-ascii characters to ascii
      of: make of_fdt_is_compatible() static
      of: fdt.c header comment typo
      of: address.c header comment typo
      of: make __of_attach_node() static
      of: be consistent in form of file mode
      of: detect invalid phandle in overlay
      of: update ePAPR references to point to Devicetree Specification
      of: document /sys/firmware/fdt

Geert Uytterhoeven (2):
      of: Provide dummy of_device_compatible_match() for compile-testing
      scripts/dtc: dtx_diff - Show real file names in diff header

Kieran Bingham (1):
      Documentation: of: Fix grammar usage in graph bindings

Krzysztof Kozlowski (1):
      dt-bindings: usb: exynos-usb: Add missing required VDD properties

Kuninori Morimoto (4):
      of-graph: export symbol of_phandle_iterator_init/next
      of_graph: add of_graph_get_remote_endpoint()
      of_graph: add of_graph_get_port_parent()
      of_graph: add of_graph_get_endpoint_count()

Madalin Bucur (1):
      dt-bindings: net: move FMan binding

Marcus Cooper (2):
      devicetree: add Itead vendor prefix
      devicetree: add Roofull vendor prefix

Markus Mayer (1):
      dt-bindings: thermal: add file extension to brcm,ns-thermal

Martin Blumenstingl (1):
      dt-binding: net: wireless: fix node name in the BCM43xx example

Matt Ranostay (1):
      iio: proximity: as3935: add missing required spi-max-frequency

Palmer Dabbelt (1):
      dt-bindings: Add RISC-V vendor prefix

Pantelis Antoniou (1):
      vsprintf: Add %p extension "%pOF" for device tree

Ralph Sennhauser (1):
      dt-bindings: Add vendor prefix for Linksys

Rob Herring (4):
      of: use kbasename instead of open coding
      of: find_node_by_full_name rewrite to compare each level
      Merge branch 'topic/of-graph-base' of
git://git.kernel.org/.../tiwai/sound into dt/property-move
      Merge branch 'dt/property-move' into dt/next

Sakari Ailus (3):
      of: Move OF property and graph API from base.c to property.c
      of: Make of_fwnode_handle() safer
      of: Support const and non-const use for to_of_node()

Sean Wang (1):
      dt-bindings: add vendor prefix for bananapi

Thomas Petazzoni (1):
      of: irq: use of_irq_get() in of_irq_to_resource()

 Documentation/ABI/testing/sysfs-firmware-ofw       |  26 +-
 Documentation/devicetree/bindings/arm/cci.txt      |  15 +-
 Documentation/devicetree/bindings/arm/cpus.txt     |  13 +-
 .../devicetree/bindings/arm/idle-states.txt        |   4 +-
 Documentation/devicetree/bindings/arm/l2c2x0.txt   |   4 +-
 Documentation/devicetree/bindings/arm/topology.txt |   4 +-
 .../devicetree/bindings/bus/simple-pm-bus.txt      |   2 +-
 Documentation/devicetree/bindings/chosen.txt       |   3 +-
 .../devicetree/bindings/common-properties.txt      |   2 +-
 .../devicetree/bindings/crypto/fsl-sec4.txt        |   4 +-
 .../devicetree/bindings/crypto/fsl-sec6.txt        |   4 +-
 .../bindings/display/panel/display-timing.txt      |  16 +-
 Documentation/devicetree/bindings/graph.txt        |  13 +-
 .../devicetree/bindings/iio/proximity/as3935.txt   |   2 +
 .../bindings/interrupt-controller/open-pic.txt     |   5 +-
 Documentation/devicetree/bindings/net/ethernet.txt |   9 +-
 .../{powerpc/fsl/fman.txt => net/fsl-fman.txt}     |   0
 .../bindings/net/wireless/brcm,bcm43xx-fmac.txt    |   2 +-
 .../devicetree/bindings/powerpc/fsl/cpus.txt       |   6 +-
 .../devicetree/bindings/powerpc/fsl/l2cache.txt    |   2 +-
 .../devicetree/bindings/powerpc/fsl/srio-rmu.txt   |   4 +-
 .../devicetree/bindings/powerpc/fsl/srio.txt       |   3 +-
 .../{brcm,ns-thermal => brcm,ns-thermal.txt}       |   0
 .../devicetree/bindings/usb/exynos-usb.txt         |   4 +
 .../devicetree/bindings/vendor-prefixes.txt        |   6 +
 Documentation/devicetree/booting-without-of.txt    |   2 +-
 Documentation/devicetree/overlay-notes.txt         |   8 +-
 Documentation/devicetree/usage-model.txt           |   2 +-
 Documentation/printk-formats.txt                   |  36 +
 Documentation/xtensa/mmu.txt                       |   6 +-
 MAINTAINERS                                        |   1 +
 drivers/of/Makefile                                |   2 +-
 drivers/of/address.c                               |   2 +-
 drivers/of/base.c                                  | 771 +-------------------
 drivers/of/dynamic.c                               |   2 +-
 drivers/of/fdt.c                                   |   4 +-
 drivers/of/irq.c                                   |   5 +-
 drivers/of/of_private.h                            |   4 +-
 drivers/of/overlay.c                               |   4 +
 drivers/of/platform.c                              |   2 +-
 drivers/of/property.c                              | 806 +++++++++++++++++++++
 drivers/of/resolver.c                              |  34 +-
 drivers/of/unittest-data/tests-platform.dtsi       |   4 +-
 drivers/of/unittest.c                              |  58 ++
 include/linux/of.h                                 |  36 +-
 include/linux/of_fdt.h                             |   3 -
 include/linux/of_graph.h                           |  21 +
 lib/vsprintf.c                                     | 136 ++++
 scripts/checkpatch.pl                              |   2 +-
 scripts/dtc/dtx_diff                               |   2 +-
 50 files changed, 1235 insertions(+), 871 deletions(-)
 rename Documentation/devicetree/bindings/{powerpc/fsl/fman.txt =>
net/fsl-fman.txt} (100%)
 rename Documentation/devicetree/bindings/thermal/{brcm,ns-thermal =>
brcm,ns-thermal.txt} (100%)
 create mode 100644 drivers/of/property.c
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
