From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] DeviceTree for 4.5
Date: Thu, 14 Jan 2016 09:31:37 -0600
Message-ID: <CAL_Jsq+UhiLbvmg1HoHp7QoXwTbqM-SBLSBzgg6GzDdEKKuv+A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

Please pull DT updates for 4.5. Details below.

Rob

The following changes since commit 1ec218373b8ebda821aec00bb156a9c94fad=
9cd4:

  Linux 4.4-rc2 (2015-11-22 16:45:59 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/devicetree-for-4.5

for you to fetch changes up to 183223770ae8625df8966ed15811d1b3ee8720aa=
:

  drivers/of: Export OF changeset functions (2016-01-13 16:10:37 -0600)

----------------------------------------------------------------
DeviceTree updates for 4.5:

- Rework and export the changeset API to make it available to users
other than DT overlays

- ARM secure devices binding

- OCTEON USB binding

- Clean-up of various SRAM binding docs

- Various other binding doc updates

----------------------------------------------------------------
Aaro Koskinen (1):
      Documentation/devicetree: document OCTEON USB bindings

Alban Bedel (2):
      dt-bindings: Misc fix for the ATH79 MISC interrupt controllers
      dt-bindings: Misc fix for the ATH79 DDR controllers

Andrew F. Davis (1):
      Documentation: dt-bindings: Fix interrupt documentation file path

Gavin Shan (1):
      drivers/of: Export OF changeset functions

Geert Uytterhoeven (1):
      ARM: psci: Fix indentation in DT bindings

Grant Likely (1):
      of/unittest: Show broken behaviour in the platform bus

Krzysztof Kozlowski (1):
      dt-bindings: Consolidate SRAM bindings from all vendors

Liviu Dudau (1):
      dt-bindings: tda998x: Document the required 'port' node.

Masahiro Yamada (4):
      dt-bindings: ARM: add arm,cortex-a72 compatible string
      of/irq: optimize device node matching loop in of_irq_init()
      of/address: replace printk(KERN_ERR ...) with pr_err(...)
      of/platform: export of_default_bus_match_table

Michael Trimarchi (1):
      usb: misc: usb3503: Describe better how to bind clock to the hub

Michal Simek (1):
      net/macb: bindings doc: Merge cdns-emac to macb

Pali Roh=C3=A1r (1):
      Fix documentation for adp1653 DT

Peter Maydell (1):
      Documentation: dt: Add bindings for Secure-only devices

Songjun Wu (1):
      ASoC: Atmel: ClassD: add GCK's parent clock in DT binding

Stefan Wahren (1):
      DT: add Olimex to vendor prefixes

Sudip Mukherjee (1):
      of: fix declaration of of_io_request_and_map

Yao Yuan (1):
      Documentation: fsl-quadspi: Add fsl,ls1021-qspi compatible string

 Documentation/devicetree/bindings/arm/arm,scpi.txt |  2 +-
 Documentation/devicetree/bindings/arm/cpus.txt     |  1 +
 Documentation/devicetree/bindings/arm/psci.txt     | 25 +++++----
 Documentation/devicetree/bindings/arm/secure.txt   | 53 ++++++++++++++=
++++
 .../devicetree/bindings/display/bridge/tda998x.txt |  4 ++
 .../devicetree/bindings/gpio/snps-dwapb-gpio.txt   |  2 +-
 .../interrupt-controller/qca,ath79-misc-intc.txt   |  2 +-
 .../devicetree/bindings/media/i2c/adp1653.txt      |  7 ++-
 .../memory-controllers/ath79-ddr-controller.txt    |  8 +--
 Documentation/devicetree/bindings/mfd/arizona.txt  |  2 +-
 Documentation/devicetree/bindings/mfd/palmas.txt   |  2 +-
 .../devicetree/bindings/mtd/fsl-quadspi.txt        |  3 +-
 .../devicetree/bindings/net/cdns-emac.txt          | 20 -------
 Documentation/devicetree/bindings/net/macb.txt     |  3 +
 .../devicetree/bindings/sound/atmel-classd.txt     |  6 ++
 Documentation/devicetree/bindings/sound/wm8994.txt |  2 +-
 .../pmu-sram.txt =3D> sram/rockchip-pmu-sram.txt}    |  0
 .../smp-sram.txt =3D> sram/rockchip-smp-sram.txt}    |  2 +-
 .../smp-sysram.txt =3D> sram/samsung-sram.txt}       |  2 +-
 .../devicetree/bindings/{misc =3D> sram}/sram.txt    |  0
 .../{soc/sunxi/sram.txt =3D> sram/sunxi-sram.txt}    |  2 +-
 .../devicetree/bindings/usb/octeon-usb.txt         | 62 ++++++++++++++=
+++++++
 Documentation/devicetree/bindings/usb/usb3503.txt  |  5 +-
 .../devicetree/bindings/vendor-prefixes.txt        |  1 +
 drivers/of/address.c                               |  2 +-
 drivers/of/dynamic.c                               | 65 ++++++++++++++=
+-------
 drivers/of/irq.c                                   | 27 +++++----
 drivers/of/of_private.h                            |  2 +
 drivers/of/overlay.c                               |  8 +--
 drivers/of/platform.c                              |  1 +
 drivers/of/unittest.c                              | 18 ++++--
 include/linux/of_address.h                         | 19 +++----
 32 files changed, 256 insertions(+), 102 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/secure.txt
 delete mode 100644 Documentation/devicetree/bindings/net/cdns-emac.txt
 rename Documentation/devicetree/bindings/{arm/rockchip/pmu-sram.txt
=3D> sram/rockchip-pmu-sram.txt} (100%)
 rename Documentation/devicetree/bindings/{arm/rockchip/smp-sram.txt
=3D> sram/rockchip-smp-sram.txt} (92%)
 rename Documentation/devicetree/bindings/{arm/exynos/smp-sysram.txt
=3D> sram/samsung-sram.txt} (95%)
 rename Documentation/devicetree/bindings/{misc =3D> sram}/sram.txt (10=
0%)
 rename Documentation/devicetree/bindings/{soc/sunxi/sram.txt =3D>
sram/sunxi-sram.txt} (97%)
 create mode 100644 Documentation/devicetree/bindings/usb/octeon-usb.tx=
t
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
