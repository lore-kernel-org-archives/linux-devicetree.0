From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] DeviceTree fixes for 4.3
Date: Thu, 24 Sep 2015 19:15:17 -0500
Message-ID: <CAL_Jsq+f33VOG6EBeP9GyrLQSdh06BDKr40QihXtkiF6_5SmXA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

Please pull DT fixes for 4.3. Details below.

Rob

The following changes since commit 6ff33f3902c3b1c5d0db6b1e2c70b6d76fba357f:

  Linux 4.3-rc1 (2015-09-12 16:35:56 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/devicetree-fixes-for-4.3

for you to fetch changes up to a13f18f59d2646754cda3662a9e215ff43e7a7d5:

  Documentation: arm: Fix typo in the idle-states bindings examples
(2015-09-24 17:55:32 -0500)

----------------------------------------------------------------
DeviceTree fixes for 4.3:

- Silence bogus warning for of_irq_parse_pci
- Fix typo in ARM idle-states binding doc and dts files
- Various minor binding documentation updates

----------------------------------------------------------------
David Daney (1):
      of_pci_irq: Silence bogus "of_irq_parse_pci() failed ..." messages.

Hans de Goede (1):
      devicetree: bindings: Extend the bma180 bindings with bma250 info

Javier Martinez Canillas (1):
      gpio: mention in DT binding doc that <name>-gpio is deprecated

Lorenzo Pieralisi (1):
      Documentation: arm: Fix typo in the idle-states bindings examples

Mark Rutland (1):
      Docs: dt: add #msi-cells to GICv3 ITS binding

Masahiro Yamada (1):
      of: add vendor prefix for Socionext Inc.

Punit Agrawal (2):
      of: thermal: Fix inconsitency between cooling-*-state and cooling-*-level
      of: thermal: Mark cooling-*-level properties optional

 Documentation/devicetree/bindings/arm/gic-v3.txt   |  5 ++++
 .../devicetree/bindings/arm/idle-states.txt        |  2 +-
 Documentation/devicetree/bindings/gpio/gpio.txt    |  4 +++-
 .../devicetree/bindings/iio/accel/bma180.txt       |  8 +++++--
 .../devicetree/bindings/thermal/thermal.txt        | 27 +++++++++++-----------
 .../devicetree/bindings/vendor-prefixes.txt        |  1 +
 arch/arm64/boot/dts/mediatek/mt8173.dtsi           |  2 +-
 arch/arm64/boot/dts/rockchip/rk3368.dtsi           |  2 +-
 drivers/of/of_pci_irq.c                            | 22 +++++++++++-------
 9 files changed, 46 insertions(+), 27 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
