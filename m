From: Rob Herring <robherring2@gmail.com>
Subject: [GIT PULL] DeviceTree updates for 4.18
Date: Wed, 6 Jun 2018 21:40:01 -0500
Message-ID: <CAL_JsqJqTQLMMO5cKp9C2hPQHfUfcRJMvEO3gg=uyLXcnWFF7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

Please pull DT updates for 4.18. Details below.

Rob

The following changes since commit 60cc43fc888428bb2f18f08997432d426a243338=
:

  Linux 4.17-rc1 (2018-04-15 18:24:20 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/devicetree-for-4.18

for you to fetch changes up to 44acf10587907ff77c28fd97906220b2d8eb4f05:

  dt-bindings: submitting-patches: add guidance on patch content and
subject (2018-06-05 16:37:47 -0600)

----------------------------------------------------------------
DeviceTree updates for v4.18:

- Sync dtc with upstream version v1.4.6-21-g84e414b0b5bc. This adds new
  warnings which are either fixed or disabled by default (enabled with
  W=3D1).

- Validate an untrusted offset in DT overlay function
  update_usages_of_a_phandle_reference

- Fix a use after free error of_platform_device_destroy

- Fix an off by 1 string errors in unittest

- Avoid creating a struct device for OPP nodes

- Update DT specific submitting-patches.txt with patch content and
  subject requirements.

- Move some bindings to their proper subsystem locations

- Add vendor prefixes for Kaohsiung, SiFive, Avnet, Wi2Wi, Logic PD, and
  ArcherMind

- Add documentation for "no-gpio-delays" property in FSI bus GPIO master

- Add compatible for r8a77990 SoC ravb ethernet block

- More wack-a-mole removal of 'status' property in examples

----------------------------------------------------------------
Benjamin Herrenschmidt (1):
      dt-bindings: fsi-master-gpio: Document "no-gpio-delays" property

Frank Rowand (2):
      MAINTAINERS: add keyword for devicetree overlay notifiers
      of: overlay: validate offset from property fixups

Geert Uytterhoeven (3):
      dt-bindings: meson-uart: DT fix s/clocks-names/clock-names/
      dt-bindings: mvebu-uart: DT fix s/interrupts-names/interrupt-names/
      dt-bindings: panel: lvds: Fix path to display timing bindings

H. Nikolaus Schaller (1):
      dt-bindings: define vendor prefix for Wi2Wi, Inc.

Jacopo Mondi (3):
      dt-bindings: net: ravb: Add support for r8a77965 SoC
      dt-bindings: serial: sh-sci: Add support for r8a77965 (H)SCIF
      dt-bindings: dmaengine: rcar-dmac: document R8A77965 support

Jan Kiszka (1):
      of: overlay: Stop leaking resources on overlay removal

Lukasz Majewski (2):
      doc: Add vendor prefix for Kieback & Peter GmbH
      doc: Add vendor prefix for Kaohsiung

Manivannan Sadhasivam (1):
      dt-bindings: Add vendor prefix for ArcherMind

Matheus Castello (1):
      dt-bindings: pinctrl: sunxi: Fix reference to driver

Michal Simek (1):
      dt-bindings: Add vendor prefix for Avnet, Inc.

Niklas S=C3=B6derlund (1):
      dt-bindings: thermal: rcar-gen3-thermal: update register size in exam=
ple

Rob Herring (12):
      of/numa: drop export of of_node_to_nid
      dt-bindings: more status property removal from examples
      dtc: checks: drop warning for missing PCI bridge bus-range
      dt-bindings: move various timer bindings to timer/ directory
      dt-bindings: move various RNG bindings to rng/ directory
      dt-bindings: powerpc/4xx: move 4xx NDFC and EMAC bindings to
subsystem directories
      dt-bindings: exynos: move ADC binding to iio/adc/ directory
      Merge tag 'devicetree-fixes-for-4.17' into dt/next to pick-up fixes
      scripts/dtc: Update to upstream version v1.4.6-21-g84e414b0b5bc
      kbuild: disable new dtc graph and unit-address warnings
      drm: rcar-du: disable dtc graph-endpoint warnings on DT overlays
      dt-bindings: submitting-patches: add guidance on patch content and su=
bject

Srinivas Kandagatla (1):
      of: platform: stop accessing invalid dev in of_platform_device_destro=
y

Stefan M Schaeckeler (1):
      of: unittest: for strings, account for trailing \0 in property
length field

Thierry Reding (1):
      dt-bindings: Relocate Tegra20 memory controller bindings

Viresh Kumar (1):
      of: Don't create device for OPP tables

Vladimir Zapolskiy (1):
      dt-bindings: Add vendor prefix for Logic PD

Wesley W. Terpstra (1):
      dt-bindings: Add "sifive" vendor prefix

Yoshihiro Shimoda (1):
      dt-bindings: net: ravb: Add support for r8a77990 SoC

 .../devicetree/bindings/arm/ux500/boards.txt       |   2 +-
 .../bindings/display/panel/panel-common.txt        |   2 +-
 Documentation/devicetree/bindings/dma/k3dma.txt    |   1 -
 .../devicetree/bindings/dma/renesas,rcar-dmac.txt  |   1 +
 Documentation/devicetree/bindings/dma/ti-edma.txt  |   1 -
 .../devicetree/bindings/fsi/fsi-master-gpio.txt    |   4 +
 .../adc/samsung,exynos-adc.txt}                    |   0
 .../nvidia,tegra20-mc.txt                          |   0
 .../devicetree/bindings/mips/lantiq/rcu.txt        |   2 -
 Documentation/devicetree/bindings/mmc/tmio_mmc.txt |   4 -
 .../{powerpc/4xx/ndfc.txt =3D> mtd/ibm,ndfc.txt}     |   0
 Documentation/devicetree/bindings/mtd/mtk-nand.txt |   4 -
 .../{powerpc/4xx/emac.txt =3D> net/ibm,emac.txt}     |   0
 .../devicetree/bindings/net/renesas,ravb.txt       |   2 +
 .../devicetree/bindings/pci/xgene-pci.txt          |   7 -
 .../bindings/pinctrl/allwinner,sunxi-pinctrl.txt   |   6 +-
 Documentation/devicetree/bindings/pps/pps-gpio.txt |   1 -
 .../devicetree/bindings/pwm/pwm-omap-dmtimer.txt   |   2 +-
 .../samsung,exynos4-rng.txt}                       |   0
 .../bindings/{ =3D> rng}/sparc_sun_oracle_rng.txt    |   0
 .../bindings/serial/amlogic,meson-uart.txt         |   2 +-
 .../devicetree/bindings/serial/mvebu-uart.txt      |   2 +-
 .../bindings/serial/renesas,sci-serial.txt         |   2 +
 .../devicetree/bindings/submitting-patches.txt     |   9 +-
 .../bindings/thermal/rcar-gen3-thermal.txt         |   6 +-
 .../{nios2/timer.txt =3D> timer/altr,timer-1.0.txt}  |   0
 .../arch_timer.txt =3D> timer/arm,arch_timer.txt}    |   0
 .../arm,armv7m-systick.txt}                        |   0
 .../arm,global_timer.txt}                          |   0
 .../bindings/{arm/twd.txt =3D> timer/arm,twd.txt}    |   0
 .../{powerpc/fsl/gtm.txt =3D> timer/fsl,gtm.txt}     |   0
 .../mrvl/timer.txt =3D> timer/mrvl,mmp-timer.txt}    |   0
 .../msm/timer.txt =3D> timer/qcom,msm-timer.txt}     |   0
 .../spear-timer.txt =3D> timer/st,spear-timer.txt}   |   0
 .../{c6x/timer64.txt =3D> timer/ti,c64x+timer64.txt} |   0
 .../{arm/omap/timer.txt =3D> timer/ti,timer.txt}     |   0
 .../{arm/vt8500 =3D> timer}/via,vt8500-timer.txt     |   0
 .../devicetree/bindings/vendor-prefixes.txt        |   7 +
 Documentation/devicetree/overlay-notes.txt         |   8 +
 MAINTAINERS                                        |   2 +
 drivers/gpu/drm/rcar-du/Makefile                   |   7 +
 drivers/of/of_numa.c                               |   1 -
 drivers/of/overlay.c                               |  30 ++-
 drivers/of/platform.c                              |  16 +-
 drivers/of/resolver.c                              |   5 +
 drivers/of/unittest.c                              |   8 +-
 scripts/Makefile.lib                               |   3 +
 scripts/dtc/checks.c                               | 204 +++++++++++++++++=
+++-
 scripts/dtc/dtc-lexer.l                            |   7 +
 scripts/dtc/dtc-parser.y                           |  39 ++--
 scripts/dtc/dtc.h                                  |   4 +
 scripts/dtc/livetree.c                             |  26 ++-
 scripts/dtc/version_gen.h                          |   2 +-
 53 files changed, 362 insertions(+), 67 deletions(-)
 rename Documentation/devicetree/bindings/{arm/samsung/exynos-adc.txt
=3D> iio/adc/samsung,exynos-adc.txt} (100%)
 rename Documentation/devicetree/bindings/{arm/tegra =3D>
memory-controllers}/nvidia,tegra20-mc.txt (100%)
 rename Documentation/devicetree/bindings/{powerpc/4xx/ndfc.txt =3D>
mtd/ibm,ndfc.txt} (100%)
 rename Documentation/devicetree/bindings/{powerpc/4xx/emac.txt =3D>
net/ibm,emac.txt} (100%)
 rename Documentation/devicetree/bindings/{crypto/samsung,exynos-rng4.txt
=3D> rng/samsung,exynos4-rng.txt} (100%)
 rename Documentation/devicetree/bindings/{ =3D>
rng}/sparc_sun_oracle_rng.txt (100%)
 rename Documentation/devicetree/bindings/{nios2/timer.txt =3D>
timer/altr,timer-1.0.txt} (100%)
 rename Documentation/devicetree/bindings/{arm/arch_timer.txt =3D>
timer/arm,arch_timer.txt} (100%)
 rename Documentation/devicetree/bindings/{arm/armv7m_systick.txt =3D>
timer/arm,armv7m-systick.txt} (100%)
 rename Documentation/devicetree/bindings/{arm/global_timer.txt =3D>
timer/arm,global_timer.txt} (100%)
 rename Documentation/devicetree/bindings/{arm/twd.txt =3D>
timer/arm,twd.txt} (100%)
 rename Documentation/devicetree/bindings/{powerpc/fsl/gtm.txt =3D>
timer/fsl,gtm.txt} (100%)
 rename Documentation/devicetree/bindings/{arm/mrvl/timer.txt =3D>
timer/mrvl,mmp-timer.txt} (100%)
 rename Documentation/devicetree/bindings/{arm/msm/timer.txt =3D>
timer/qcom,msm-timer.txt} (100%)
 rename Documentation/devicetree/bindings/{arm/spear-timer.txt =3D>
timer/st,spear-timer.txt} (100%)
 rename Documentation/devicetree/bindings/{c6x/timer64.txt =3D>
timer/ti,c64x+timer64.txt} (100%)
 rename Documentation/devicetree/bindings/{arm/omap/timer.txt =3D>
timer/ti,timer.txt} (100%)
 rename Documentation/devicetree/bindings/{arm/vt8500 =3D>
timer}/via,vt8500-timer.txt (100%)
