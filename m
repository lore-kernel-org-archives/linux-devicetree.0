From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v5 0/5] i.MX6 PU power domain support
Date: Fri, 28 Feb 2014 17:03:42 +0100
Message-ID: <1393603427-6199-1-git-send-email-p.zabel@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The i.MX6Q can gate off the CPU and PU (GPU/VPU) power domains using the
Power Gating Controller (PGC) in the GPC register space. The CPU power
domain is already handled by wait state code, but the PU power domain can
be controlled using the generic power domain framework and power off the PU
supply regulator if all devices in the power domain are (runtime) suspended.

This patchset adds a GPC platform device initialized at subsys_initcall time
(after anatop regulators) that binds to the gpc device tree node and sets up
the PU power domain. The GPC node becomes a power-controller as defined by
Tomasz' OF power domain bindings. This series depends on his patch
    "base: power: Add generic OF-based power domain look-up"

Using the power-domain bindings allows to use indexed power domains inside the
gpc node. This allows to use phandles with an index cell to select the power
domains, similarly to the reset lines provided by the SRC.

I have tested this on i.MX6S and noticed hangs if the GPU is not clocked during
domain powerup. As a consequence, the domain driver no longer collects the
reset clocks from drivers in the domain (as the GPU driver might not be
enabled, or even in mainline...), but is provided with the necessary clocks
directly from the device tree. This also allowed to get rid of the bus
notifier.

Finally, the device specific timing data has been dropped for now, since the
current generic OF power domain code doesn't support it yet.

Changes since v4:
 - Use OF power domain bindings
 - Provide reset clocks directly via device tree

regards
Philipp

Philipp Zabel (5):
  Documentation: Add device tree bindings for Freescale i.MX GPC
  ARM: imx6: gpc: Add PU power domain for GPU/VPU
  ARM: dts: imx6qdl: Add power-domain information to gpc node
  ARM: dts: imx6sl: Add power-domain information to gpc node
  ARM: dts: imx6qdl: Allow disabling the PU regulator, add a enable ramp
    delay

 .../devicetree/bindings/power/fsl,imx-gpc.txt      |  54 ++++++
 arch/arm/boot/dts/imx6qdl.dtsi                     |   7 +-
 arch/arm/boot/dts/imx6sl.dtsi                      |   6 +-
 arch/arm/mach-imx/Kconfig                          |   2 +
 arch/arm/mach-imx/gpc.c                            | 182 +++++++++++++++++++++
 5 files changed, 249 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power/fsl,imx-gpc.txt

-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
