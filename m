From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] DeviceTree updates for 4.11
Date: Wed, 22 Feb 2017 11:29:39 -0600
Message-ID: <CAL_JsqLAkMQrJfgKQGz21wYo25Ur8mZKW6AD+o03BKjTDz_EHg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Linus,

Please pull. Pretty standard stuff with dtc upstream sync being the
biggest piece. Details below.

Rob


The following changes since commit 0c744ea4f77d72b3dcebb7a8f2684633ec79be88=
:

  Linux 4.10-rc2 (2017-01-01 14:31:53 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/devicetree-for-4.11

for you to fetch changes up to 4e29ccdb240ec833f172a34fcf405e077b51066b:

  DT: add Faraday Tec. as vendor (2017-02-15 17:01:50 -0600)

----------------------------------------------------------------
DeviceTree updates for 4.11:

- Sync dtc to upstream commit 0931cea3ba20. This picks up overlay
  support in dtc.

- Set dma_ops for reserved memory users.

- Make references to IOMMU consistent in DT bindings.

- Cleanup references to pm_power_off in bindings.

- Move some display bindings that snuck into the old bindings/video/
  path.

- Fix some wrong documentation paths caused from binding restructuring.

- Vendor prefixes for Faraday and Fujitsu.

- Fix an of_node ref counting leak in of_find_node_opts_by_path

- Introduce new graph helper of_graph_get_remote_node() which will be
  used by DRM drivers in 4.12.

----------------------------------------------------------------
Alexander Sverdlin (1):
      of/unittest: Swap arguments of of_unittest_apply_overlay()

Fabio Estevam (1):
      serial: fsl-imx-uart.txt: Remove generic property

Frank Rowand (2):
      of: make of_device_make_bus_id() static
      of: Add missing space at end of pr_fmt().

Geliang Tang (1):
      of: drop duplicate headers

Guenter Roeck (3):
      dt-bindings: mfd: as3722: Drop reference to pm_power_off
      dt-bindings: power: reset: gpio-poweroff: Drop reference to pm_power_=
off
      dt-bindings: power: reset: qnap-poweroff: Drop reference to pm_power_=
off

Guilherme G. Piccoli (1):
      of/irq: improve error report on irq discovery process failure

Hans Ulli Kroll (1):
      DT: add Faraday Tec. as vendor

Marek Vasut (1):
      devicetree: Add Fujitsu Ltd. vendor prefix

Masanari Iida (1):
      bus:qcom : Fix typo in qcom,ebi2.txt

Qi Hou (1):
      of: fix of_node leak caused in of_find_node_opts_by_path

Rob Herring (3):
      scripts/dtc: Update to upstream version 0931cea3ba20
      dt-bindings: display: move ANX7814 and SiI8620 bridge bindings
      of: introduce of_graph_get_remote_node

Scott Wood (1):
      dt-bindings: qman: Remove pool channel node

Smitha T Murthy (1):
      of: reserved_mem: set dma_ops for devices using reserved mem

Stuart Yoder (1):
      Docs: dt: Be explicit and consistent in reference to IOMMU specifiers

Thomas Petazzoni (1):
      dt-bindings: net: remove reference to fixed link support

Uwe Kleine-K=C3=B6nig (1):
      devicetree: bindings: clk: mvebu: fix description for sata1 on Armada=
 XP

XuYing (1):
      of: remove redundant memset in overlay

Yegor Yefremov (5):
      Documentation: omap-usb-host: fix OMAP OHCI/EHCI file names
      Documentation: ehci-omap: remove the unnecessary newline
      Documentation: panel-dpi: fix path to display-timing.txt
      Documentation: display: fix wrong documentation paths
      Documentation: usb: fix wrong documentation paths

 .../devicetree/bindings/bus/qcom,ebi2.txt          |   6 +-
 .../bindings/clock/mvebu-gated-clock.txt           |   2 +-
 .../devicetree/bindings/display/arm,pl11x.txt      |   2 +-
 .../bindings/display/bridge/analogix_dp.txt        |   2 +-
 .../bindings/{video =3D> display}/bridge/anx7814.txt |   0
 .../{video =3D> display}/bridge/sil-sii8620.txt      |   0
 .../bindings/display/cirrus,clps711x-fb.txt        |   2 +-
 .../bindings/display/exynos/exynos7-decon.txt      |   2 +-
 .../bindings/display/exynos/samsung-fimd.txt       |   2 +-
 .../devicetree/bindings/display/imx/fsl,imx-fb.txt |   2 +-
 .../devicetree/bindings/display/imx/ldb.txt        |   2 +-
 .../bindings/display/mediatek/mediatek,disp.txt    |   2 +-
 .../devicetree/bindings/display/msm/dsi.txt        |   2 +-
 .../devicetree/bindings/display/msm/edp.txt        |   2 +-
 .../devicetree/bindings/display/msm/hdmi.txt       |   2 +-
 .../bindings/display/panel/panel-dpi.txt           |   2 +-
 .../bindings/display/panel/samsung,ld9040.txt      |   2 +-
 .../bindings/display/panel/samsung,s6e8aa0.txt     |   2 +-
 .../display/rockchip/analogix_dp-rockchip.txt      |   2 +-
 .../devicetree/bindings/display/tilcdc/panel.txt   |   2 +-
 .../devicetree/bindings/iommu/arm,smmu.txt         |  10 +-
 Documentation/devicetree/bindings/mfd/as3722.txt   |   3 +-
 .../devicetree/bindings/mfd/omap-usb-host.txt      |   4 +-
 .../devicetree/bindings/net/marvell-pp2.txt        |   4 +-
 .../devicetree/bindings/pci/pci-iommu.txt          |   6 +-
 .../bindings/power/reset/gpio-poweroff.txt         |  10 +-
 .../bindings/power/reset/qnap-poweroff.txt         |   3 +-
 .../devicetree/bindings/serial/fsl-imx-uart.txt    |   4 +-
 .../devicetree/bindings/soc/fsl/qman-portals.txt   |  20 -
 Documentation/devicetree/bindings/usb/dwc3-st.txt  |   4 +-
 .../devicetree/bindings/usb/ehci-omap.txt          |   1 -
 Documentation/devicetree/bindings/usb/ehci-st.txt  |   2 +-
 .../devicetree/bindings/usb/mt8173-mtu3.txt        |   2 +-
 .../devicetree/bindings/usb/mt8173-xhci.txt        |   4 +-
 .../devicetree/bindings/usb/qcom,dwc3.txt          |   2 +-
 .../devicetree/bindings/vendor-prefixes.txt        |   2 +
 drivers/of/base.c                                  |  40 ++
 drivers/of/fdt.c                                   |   2 +-
 drivers/of/irq.c                                   |  19 +-
 drivers/of/of_pci_irq.c                            |  10 +-
 drivers/of/of_reserved_mem.c                       |   4 +
 drivers/of/overlay.c                               |   2 -
 drivers/of/platform.c                              |   2 +-
 drivers/of/resolver.c                              |   1 -
 drivers/of/unittest.c                              |   5 +-
 include/linux/of_device.h                          |   1 -
 include/linux/of_graph.h                           |   8 +
 scripts/dtc/checks.c                               | 349 +++++-----
 scripts/dtc/dtc-lexer.l                            |  21 +-
 scripts/dtc/dtc-lexer.lex.c_shipped                | 650 +++++++++--------=
-
 scripts/dtc/dtc-parser.tab.c_shipped               | 752 +++++++++++------=
----
 scripts/dtc/dtc-parser.tab.h_shipped               |  54 +-
 scripts/dtc/dtc-parser.y                           |  34 +-
 scripts/dtc/dtc.c                                  |  69 +-
 scripts/dtc/dtc.h                                  |  39 +-
 scripts/dtc/flattree.c                             |  41 +-
 scripts/dtc/fstree.c                               |   5 +-
 scripts/dtc/libfdt/Makefile.libfdt                 |   2 +-
 scripts/dtc/libfdt/fdt_ro.c                        |  30 +-
 scripts/dtc/libfdt/fdt_rw.c                        |   6 +-
 scripts/dtc/libfdt/fdt_strerror.c                  |   6 +
 scripts/dtc/libfdt/fdt_wip.c                       |  29 +-
 scripts/dtc/libfdt/libfdt.h                        | 210 +++++-
 scripts/dtc/libfdt/libfdt_env.h                    |   1 +
 scripts/dtc/livetree.c                             | 299 +++++++-
 scripts/dtc/srcpos.c                               |  35 +-
 scripts/dtc/srcpos.h                               |   1 -
 scripts/dtc/treesource.c                           |  14 +-
 scripts/dtc/util.c                                 |  30 +
 scripts/dtc/util.h                                 |   1 +
 scripts/dtc/version_gen.h                          |   2 +-
 71 files changed, 1788 insertions(+), 1107 deletions(-)
 rename Documentation/devicetree/bindings/{video =3D>
display}/bridge/anx7814.txt (100%)
 rename Documentation/devicetree/bindings/{video =3D>
display}/bridge/sil-sii8620.txt (100%)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
