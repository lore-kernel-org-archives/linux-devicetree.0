From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 00/10] irqchip: sunxi-nmi: Cleanups and fix A31 R_INTC register offset
Date: Tue,  6 Jun 2017 13:59:22 +0800
Message-ID: <20170606055932.22548-1-wens@csie.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi everyone,

This is an alternative to Icenowy's recent A64 R_INTC patches.

This is a two part series. The first four patches clean up the existing
sunxi-nmi driver. Patches five and six add a new "sun6i-a31-r-intc"
compatible, which mainly adjusts or removes the awkward register region
offset the old "sun6i-a31-sc-nmi" compatible needed. The remaining
patches fix or add device nodes for SoC's having this hardware.

Using "sun6i-a31-r-intc" introduced in this series, instead of Icenowy's
"sun50i-a64-r-intc" is preferred. This follows our policy of naming
hardware blocks and compatibles after their first occurrence.

The first six patches should go through the irqchip tree, while we
(sunxi) can take the device tree changes after the driver has been
merged, to avoid breaking linux-next as a whole.


Regards
ChenYu


Chen-Yu Tsai (9):
  irqchip: sunxi-nmi: Convert magic numbers to defines
  irqchip: sunxi-nmi: Document interrupt disabling and clearing at probe
    time
  irqchip: sunxi-nmi: Reorder sunxi_sc_nmi_reg_offs' in ascending order
  irqchip: sunxi-nmi: const-ify sunxi_sc_nmi_reg_offs structures
  dt-bindings: interrupt-controller: sunxi-nmi: Add compatible for A31
    R_INTC
  irqchip: sunxi-nmi: Support sun6i-a31-r-intc compatible
  ARM: sun6i: a31: Use new sun6i-a31-r-intc compatible for NMI/R_INTC
  ARM: sun8i: a23/a33: Use new sun6i-a31-r-intc compatible for
    NMI/R_INTC
  ARM: sun8i: a83t: Add device node for R_INTC interrupt controller

Icenowy Zheng (1):
  arm64: allwinner: a64: add NMI (R_INTC) controller on A64

 .../interrupt-controller/allwinner,sunxi-nmi.txt   |  7 ++-
 arch/arm/boot/dts/sun6i-a31.dtsi                   |  6 +-
 arch/arm/boot/dts/sun8i-a23-a33.dtsi               |  6 +-
 arch/arm/boot/dts/sun8i-a83t.dtsi                  |  9 +++
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi      |  9 +++
 drivers/irqchip/irq-sunxi-nmi.c                    | 68 +++++++++++++++++-----
 6 files changed, 83 insertions(+), 22 deletions(-)

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
