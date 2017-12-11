From: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: [PATCH 00/20] Add Hummingboard 2 support
Date: Mon, 11 Dec 2017 16:56:31 +0000
Message-ID: <20171211165631.GW10595@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

This series adds the long awaited Hummingboard 2 support to the
mainline kernel.

While I could squash the patch set down, I've not done this because
this is the result of several different people over the course of
the last couple of years, and I believe it's not right to lose the
detail of their contributions.

This builds upon the previous set of changes for the Hummingboard,
which re-organised the way we deal with the uSOM and baseboards.

 arch/arm/boot/dts/Makefile                         |   6 +
 .../boot/dts/imx6dl-hummingboard2-emmc-som-v15.dts |  55 +++
 arch/arm/boot/dts/imx6dl-hummingboard2-som-v15.dts |  54 +++
 arch/arm/boot/dts/imx6dl-hummingboard2.dts         |  53 ++
 .../boot/dts/imx6q-hummingboard2-emmc-som-v15.dts  |  63 +++
 arch/arm/boot/dts/imx6q-hummingboard2-som-v15.dts  |  62 +++
 arch/arm/boot/dts/imx6q-hummingboard2.dts          |  61 +++
 arch/arm/boot/dts/imx6qdl-hummingboard2-emmc.dtsi  |  72 +++
 arch/arm/boot/dts/imx6qdl-hummingboard2.dtsi       | 540 +++++++++++++++++++++
 9 files changed, 966 insertions(+)

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 8.8Mbps down 630kbps up
According to speedtest.net: 8.21Mbps down 510kbps up
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
