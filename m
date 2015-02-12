From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] DeviceTree changes for 3.20
Date: Wed, 11 Feb 2015 22:10:33 -0600
Message-ID: <CAL_JsqJSQRkqYvm_djMwMaB0h1ESoR03O4fJjECB3CL33QiEdA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

Please pull DeviceTree changes for 3.20. Details below.

Rob

The following changes since commit 26bc420b59a38e4e6685a73345a0def461136dce:

  Linux 3.19-rc6 (2015-01-25 20:04:41 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/devicetree-for-3.20

for you to fetch changes up to 3c3c8e3618b018aee1dfd42343a74f3ab5ddf23c:

  Merge remote-tracking branch 'grant/devicetree/next' into for-next
(2015-02-11 21:28:45 -0600)

----------------------------------------------------------------
DeviceTree changes for 3.20:

- DT unittests for I2C probing and overlays from Pantelis Antoniou
- Remove DT unittest dependency on OF_DYNAMIC from Gaurav Minocha
- Add Tegra compatible strings missing for newer parts from Paul
Walmsley
- Various vendor prefix additions

----------------------------------------------------------------
Alan Tull (1):
      doc: add bindings document for altera fpga manager

Andrew Lunn (1):
      DT: Vendors: Add Everspin

Arnaud Ebalard (1):
      dt-bindings: use isil prefix for Intersil in vendor-prefixes.txt

Daniel Thompson (1):
      of: Fix brace position for struct of_device_id definition

Fabio Estevam (2):
      of: Use ovti for Omnivision
      of: Add vendor prefix for OmniVision Technologies

Gaurav Minocha (1):
      Removes OF_UNITTEST dependency on OF_DYNAMIC config symbol

George G. Davis (1):
      drivers: of: Export of_reserved_mem_device_{init,release}

Grant Likely (1):
      of/unittest: Remove obsolete code

Ian Molton (1):
      Add AD Holdings Plc. to vendor-prefixes.

Krzysztof Kozlowski (1):
      dt-bindings: Add Silicon Mitus vendor prefix

Lad, Prabhakar (1):
      of/fdt: fix sparse warning

Linus Walleij (1):
      pinctrl: fix up device tree bindings

Liu Ying (2):
      of: Add vendor prefix for Himax Technologies Inc.
      of: Add vendor prefix for Truly Semiconductors Limited

Pantelis Antoniou (1):
      of: unitest: Add I2C overlay unit tests.

Paul Walmsley (3):
      Documentation: DT bindings: add more Tegra chip compatible strings
      Documentation: DT bindings: add nvidia, tegra132-denver compatible string
      Documentation: DT: document compatible string existence requirement

Rob Herring (2):
      Merge tag 'v3.19-rc6' into HEAD
      Merge remote-tracking branch 'grant/devicetree/next' into for-next

Sakari Ailus (1):
      of: EXPORT_SYMBOL_GPL of_property_read_u64_array

 Documentation/devicetree/bindings/arm/cpus.txt     |   1 +
 .../bindings/arm/tegra/nvidia,tegra20-ahb.txt      |   5 +-
 .../bindings/arm/tegra/nvidia,tegra20-pmc.txt      |   6 +-
 .../devicetree/bindings/ata/tegra-sata.txt         |   4 +-
 .../bindings/fpga/altera-socfpga-fpga-mgr.txt      |  17 +
 .../bindings/fuse/nvidia,tegra20-fuse.txt          |  10 +-
 .../bindings/gpu/nvidia,tegra20-host1x.txt         |   8 +-
 .../devicetree/bindings/i2c/nvidia,tegra20-i2c.txt |  10 +-
 .../devicetree/bindings/media/atmel-isi.txt        |   2 +-
 .../devicetree/bindings/media/video-interfaces.txt |   2 +-
 .../bindings/misc/nvidia,tegra20-apbmisc.txt       |   9 +-
 .../bindings/mmc/nvidia,tegra20-sdhci.txt          |   6 +-
 .../bindings/pci/nvidia,tegra20-pcie.txt           |   8 +-
 .../bindings/pinctrl/nvidia,tegra124-pinmux.txt    |   3 +-
 .../pinctrl/nvidia,tegra124-xusb-padctl.txt        |   4 +-
 .../devicetree/bindings/pinctrl/ste,nomadik.txt    |  35 +-
 .../devicetree/bindings/pwm/nvidia,tegra20-pwm.txt |   7 +-
 .../devicetree/bindings/rtc/nvidia,tegra20-rtc.txt |   4 +-
 .../devicetree/bindings/serial/of-serial.txt       |   5 +-
 .../bindings/sound/nvidia,tegra30-ahub.txt         |   5 +-
 .../bindings/sound/nvidia,tegra30-hda.txt          |   4 +-
 .../bindings/sound/nvidia,tegra30-i2s.txt          |   5 +-
 .../bindings/spi/nvidia,tegra114-spi.txt           |   4 +-
 .../devicetree/bindings/submitting-patches.txt     |  23 +
 .../devicetree/bindings/thermal/tegra-soctherm.txt |   4 +-
 .../bindings/timer/nvidia,tegra30-timer.txt        |   4 +-
 Documentation/devicetree/bindings/unittest.txt     |  59 +-
 .../bindings/usb/nvidia,tegra20-ehci.txt           |   5 +-
 .../bindings/usb/nvidia,tegra20-usb-phy.txt        |   5 +-
 .../devicetree/bindings/vendor-prefixes.txt        |   9 +-
 drivers/of/Kconfig                                 |   1 -
 drivers/of/base.c                                  |   1 +
 drivers/of/fdt.c                                   |   2 +-
 drivers/of/of_reserved_mem.c                       |   2 +
 drivers/of/unittest-data/tests-overlay.dtsi        |  94 ++++
 drivers/of/unittest.c                              | 597 ++++++++++++++++-----
 include/linux/mod_devicetable.h                    |   3 +-
 37 files changed, 786 insertions(+), 187 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/fpga/altera-socfpga-fpga-mgr.txt
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
