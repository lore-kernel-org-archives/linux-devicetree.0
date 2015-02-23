From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v9 0/5] i.MX6 PU power domain support
Date: Mon, 23 Feb 2015 18:40:10 +0100
Message-ID: <1424713215-3357-1-git-send-email-p.zabel@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

this is a rebased and updated version of the series I sent previously:

http://www.spinics.net/lists/arm-kernel/msg360709.html

Changes since v8:
 - Updated DT documentation example with IRQ_TYPE_... and
   IMX6QDL_CLK_... defines
 - Made PU regulator optional to support i.MX6SX, suggested by
   Robin Gong
 - Removed regulator_enable() call in the probe function, stopped
   disabling the regulator in imx6q_pm_pu_power_off() - the regulator
   framework will disable unused regulators.
 - Changed the GPC driver to enable pu power if CONFIG_PM is not
   enabled, as some bootloaders disable pu power on boot.

regards
Philipp

Philipp Zabel (6):
  Documentation: Add device tree bindings for Freescale i.MX GPC
  ARM: imx6: gpc: Add PU power domain for GPU/VPU
  ARM: dts: imx6qdl: Add power-domain information to gpc node
  ARM: dts: imx6sl: Add power-domain information to gpc node
  ARM: dts: imx6qdl: Allow disabling the PU regulator, add a enable ramp
    delay
  ARM: imx6: gpc: Allow PU regulator bypass

 .../devicetree/bindings/power/fsl,imx-gpc.txt      |  59 ++++++
 arch/arm/boot/dts/imx6qdl.dtsi                     |  10 +-
 arch/arm/boot/dts/imx6sl.dtsi                      |   4 +
 arch/arm/mach-imx/Kconfig                          |   1 +
 arch/arm/mach-imx/gpc.c                            | 216 +++++++++++++++++++++
 5 files changed, 289 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/power/fsl,imx-gpc.txt

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
