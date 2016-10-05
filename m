From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] DeviceTree updates for 4.9
Date: Wed, 5 Oct 2016 12:18:20 -0500
Message-ID: <CAL_Jsq+aJuFqPzLfEEyU1sVbyYg3Jzn+kEYpYWpXVisQLVyppw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

Please pull DeviceTree updates for 4.9. Details below.

Rob


The following changes since commit fa8410b355251fd30341662a40ac6b22d3e38468:

  Linux 4.8-rc3 (2016-08-21 16:14:10 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/devicetree-for-4.9

for you to fetch changes up to 87e5fc99b0280b492724cc7f2d8d9ad37b980087:

  DT: irqchip: renesas-irqc: document R8A7743/5 support (2016-10-05
08:09:30 -0500)

----------------------------------------------------------------
DeviceTree updates for 4.9:

- Update changeset documentation on locking to reflect current code

- Fix alphabetizing of vendor-prefixes.txt

- Add various vendor prefixes

- Add ESP8089 WiFi binding

- Add new variable sized array parsing functions

----------------------------------------------------------------
Bharat Kumar Gogada (1):
      PCI: Xilinx NWL PCIe: Updating device tree documentation with
prefetchable memory space

Guenther Wutz (1):
      Documentation: devicetree: spi: fix wrong spi-bus documentation

Hans de Goede (1):
      dt: bindings: Add binding for ESP8089 wifi chips

Heiko Stuebner (1):
      devicetree: Add vendor-prefix for Silead Inc.

Jagan Teki (1):
      of: Add vendor prefix for Engicam s.r.l company

Lucas Stach (1):
      dt-bindings: add vendor prefix for Auvidea GmbH

Marek Vasut (1):
      dt-bindings: Add Keith&Koep vendor prefix

Neil Armstrong (1):
      dt-bindings: vendor-prefixes: Add Sierra Wireless

Niklas Cassel (1):
      bindings: PCI: artpec: correct pci binding example

Randy Li (1):
      devicetree: bindings: Add vendor prefix for Topeet.

Rask Ingemann Lambertsen (2):
      devicetree: Sort vendor prefixes in alphabetical order
      devicetree: Add vendor prefix for Shenzhen Sunchip Technology Co., Ltd

Richard Fitzgerald (2):
      of: Make of_find_property_value_of_size take a length range
      of: Add array read functions with min/max size limits

Robin Murphy (1):
      of/platform: Initialise dev->fwnode appropriately

Sebastiaan Schalbroeck (1):
      Documentation: devicetree: Fix max77693 spelling errors

Sergei Shtylyov (1):
      DT: irqchip: renesas-irqc: document R8A7743/5 support

Stephen Warren (1):
      dt: net: enhance DWC EQoS binding to support Tegra186

Vinay Simha BN (2):
      dt-bindings: Add Japan Display Inc vendor id
      dt-bindings: Add summit vendor id

Wolfram Sang (1):
      Documentation: devicetree: changesets do locking on their own meanwhile

 .../bindings/interrupt-controller/renesas,irqc.txt |   4 +-
 Documentation/devicetree/bindings/mfd/max77693.txt |  12 +-
 .../bindings/net/snps,dwc-qos-ethernet.txt         |  99 +++++++++++-
 .../bindings/net/wireless/esp,esp8089.txt          |  31 ++++
 .../devicetree/bindings/pci/axis,artpec6-pcie.txt  |   7 +-
 .../devicetree/bindings/pci/xilinx-nwl-pcie.txt    |   5 +-
 Documentation/devicetree/bindings/spi/spi-bus.txt  |   2 +-
 .../devicetree/bindings/vendor-prefixes.txt        |  35 +++--
 Documentation/devicetree/changesets.txt            |  19 +--
 drivers/of/base.c                                  | 171 ++++++++++++++-------
 drivers/of/platform.c                              |   2 +
 include/linux/of.h                                 | 144 +++++++++++++++--
 12 files changed, 423 insertions(+), 108 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/net/wireless/esp,esp8089.txt
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
