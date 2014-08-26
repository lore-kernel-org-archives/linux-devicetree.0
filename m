From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v7 0/5] i.MX6 PU power domain support
Date: Tue, 26 Aug 2014 15:46:26 +0200
Message-ID: <1409060791-23167-1-git-send-email-p.zabel@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

this is a rebased and updated version of the series I sent previously:

http://lists.infradead.org/pipermail/linux-arm-kernel/2014-March/238377.html

It is based on the "PM / Domains: Generic OF-based support" series that Ulf
Hansson sent recently:

http://www.spinics.net/lists/arm-kernel/msg357003.html

Changes since v6:
 - imx6qdl.dtsi entry now uses clock name macros instead of index numbers

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
 arch/arm/boot/dts/imx6qdl.dtsi                     |  11 +-
 arch/arm/boot/dts/imx6sl.dtsi                      |   4 +
 arch/arm/mach-imx/Kconfig                          |   1 +
 arch/arm/mach-imx/gpc.c                            | 203 +++++++++++++++++++++
 5 files changed, 272 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/power/fsl,imx-gpc.txt

-- 
2.1.0.rc1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
