From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH v6 0/9] AXP803 PMIC support for Pine64
Date: Thu, 18 May 2017 15:16:44 +0800
Message-ID: <20170518071653.36561-1-icenowy@aosc.io>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Pine64 (including Pine64+) boards have an AXP803 PMIC, which is a PMIC
similar to AXP288, but tweaked to use with Allwinner SoCs rather than Intel
tablets (with DCIN and Vbus re-splitted like other AXP PMICs, and RSB bus
support added).

This patchset adds support for it and enabled it in Pine64 device tree.

Some parts of this patchset is already applied, including basical AXP803
MFD code and A64 RSB device node.

Thus this patchset is now still two parts, but a bit different to older
revisions:

- Part1: from PATCH 1/9 to PATCH 4/9, which focus on enabling AXP803 in the
  device tree: the R_INTC interrupt controller (for the NMI line, which is
  connected to AXP803 on Pine64), and finally the basical AXP803 node.
- Part2: from PATCH 5/9 to PATCH 9/9, which are enabling the regulator
  function of the AXP803 PMIC. Finally Wi-Fi function is added
  as a usage of regulators function.

PATCH 1 adds device tree binding of A64 R_INTC.

PATCH 2 really adds support for A64 R_INTC in NMI driver.

PATCH 3 adds R_INTC node in A64 device tree.

PATCH 4 adds AXP803 node to the Pine64 device tree by using already
applied drivers/bindings.

PATCH 5 adds support for AXP803 regulators in AXP20x regulatoe driver.
(The binding is already applied)

PATCH 6 enables the AXP803 regulator cell in MFD driver.

PATCH 7 adds a DTSI file for AXP803, like other older AXP PMICs.

PATCH 8 enables AXP803 regulators in Pine64 device tree.

PATCH 9 enables Wi-Fi for Pine64.

Icenowy Zheng (9):
  irqchip/sunxi-nmi: add A64 R_INTC to the binding doc
  irqchip/sunxi-nmi: add support for the NMI in A64 R_INTC
  arm64: allwinner: a64: add NMI (R_INTC) controller on A64
  arm64: allwinner: a64: add AXP803 node to Pine64 device tree
  regulator: axp20x-regulator: add support for AXP803
  mfd: axp20x: add axp20x-regulator cell for AXP803
  arm64: allwinner: a64: add DTSI file for AXP803 PMIC
  arm64: allwinner: a64: enable AXP803 regulators for Pine64
  arm64: allwinner: a64: enable Wi-Fi for Pine64

 .../interrupt-controller/allwinner,sunxi-nmi.txt   |   7 +-
 arch/arm64/boot/dts/allwinner/axp803.dtsi          | 150 ++++++++++++++++++++
 .../arm64/boot/dts/allwinner/sun50i-a64-pine64.dts | 136 ++++++++++++++++++
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi      |   8 ++
 drivers/irqchip/irq-sunxi-nmi.c                    |  13 ++
 drivers/mfd/axp20x.c                               |   3 +-
 drivers/regulator/axp20x-regulator.c               | 153 ++++++++++++++++++---
 include/linux/mfd/axp20x.h                         |  37 +++++
 8 files changed, 482 insertions(+), 25 deletions(-)
 create mode 100644 arch/arm64/boot/dts/allwinner/axp803.dtsi

-- 
2.12.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
