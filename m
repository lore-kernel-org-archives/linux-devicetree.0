From: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: [PATCH 00/13] SolidRun Hummingboard DT updates
Date: Mon, 27 Nov 2017 16:51:34 +0000
Message-ID: <20171127165134.GH31757@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Jon Nettleton <jon.nettleton-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Shawn,

This series updates the SolidRun Hummingboard platforms to:
(a) make the DT more reflective of the schematics
(b) re-organise how we deal with the differences between various board
    versions in preparation for the new 1.5 microsom.

The idea with (b) is that we add the support for the board + usom
combination by including the appropriate dtsi files.

For example, in mainline at the moment, we support two variants of the
Hummingboards - both with Broadcom Wi-Fi and without eMMC.  Going
forward, when a 1.5 usom is fitted (which modern Hummingboards will all
have) the boards will have TI Wi-Fi and potentially eMMC on the usom.

So, this prepares the ground to support these combinations, and maybe
if I can get agreement from Jon, move forward with Hummingboard2
support.

 arch/arm/boot/dts/imx6dl-cubox-i.dts           |   2 +
 arch/arm/boot/dts/imx6dl-hummingboard.dts      |   2 +
 arch/arm/boot/dts/imx6q-cubox-i.dts            |   2 +
 arch/arm/boot/dts/imx6q-h100.dts               |   2 +-
 arch/arm/boot/dts/imx6q-hummingboard.dts       |   2 +
 arch/arm/boot/dts/imx6qdl-cubox-i.dtsi         |  72 +++++------
 arch/arm/boot/dts/imx6qdl-hummingboard.dtsi    | 103 +++++++++------
 arch/arm/boot/dts/imx6qdl-microsom-ar8035.dtsi |  99 --------------
 arch/arm/boot/dts/imx6qdl-microsom-brcm.dtsi   | 144 +++++++++++++++++++++
 arch/arm/boot/dts/imx6qdl-microsom-emmc.dtsi   |  70 ++++++++++
 arch/arm/boot/dts/imx6qdl-microsom-ti.dtsi     | 170 +++++++++++++++++++++++++
 arch/arm/boot/dts/imx6qdl-microsom.dtsi        | 148 ++++++++-------------
 12 files changed, 548 insertions(+), 268 deletions(-)

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 8.8Mbps down 630kbps up
According to speedtest.net: 8.21Mbps down 510kbps up
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
