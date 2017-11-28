From: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: [PATCH v2 00/16] SolidRun Hummingboard DT updates
Date: Tue, 28 Nov 2017 15:00:46 +0000
Message-ID: <20171128150045.GV31757@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Nettleton <jon-UBr1pzP51AyaMJb+Lgu22Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Shawn,

This series updates the SolidRun Hummingboard platforms to:
(a) make the DT more reflective of the schematics
(b) re-organise how we deal with the differences between various board
    versions in preparation for the new 1.5 SOM.

The idea with (b) is that we add the support for the board + usom
combination by including the appropriate dtsi files.

For example, in mainline at the moment, we support two variants of the
Hummingboards - both with Broadcom Wi-Fi and without eMMC.  Going
forward, when a 1.5 SOM is fitted (which modern Hummingboards will all
have) the boards will have TI Wi-Fi and potentially eMMC on the usom.

This series adds the dtsi files for the new SOM and dts files for the
platform variants (v1.5 SOM without eMMC, v1.5 SOM with eMMC.)  It's
unfortunate that the w/o eMMC variant can't detect the lack of eMMC,
running the eMMC version without eMMC on the boards results in an
almost constant stream of kernel messages.

Feedback from the previous posting has been addressed, and additional
changes adding the v1.5 SOM board level files added through discussion
with Jon.

 arch/arm/boot/dts/Makefile                         |   8 +
 arch/arm/boot/dts/imx6dl-cubox-i-emmc-som-v15.dts  |  52 +++++++
 arch/arm/boot/dts/imx6dl-cubox-i-som-v15.dts       |  51 +++++++
 arch/arm/boot/dts/imx6dl-cubox-i.dts               |   2 +
 .../boot/dts/imx6dl-hummingboard-emmc-som-v15.dts  |  53 +++++++
 arch/arm/boot/dts/imx6dl-hummingboard-som-v15.dts  |  52 +++++++
 arch/arm/boot/dts/imx6dl-hummingboard.dts          |   2 +
 arch/arm/boot/dts/imx6q-cubox-i-emmc-som-v15.dts   |  60 ++++++++
 arch/arm/boot/dts/imx6q-cubox-i-som-v15.dts        |  59 +++++++
 arch/arm/boot/dts/imx6q-cubox-i.dts                |   2 +
 arch/arm/boot/dts/imx6q-h100.dts                   |   4 +-
 .../boot/dts/imx6q-hummingboard-emmc-som-v15.dts   |  61 ++++++++
 arch/arm/boot/dts/imx6q-hummingboard-som-v15.dts   |  60 ++++++++
 arch/arm/boot/dts/imx6q-hummingboard.dts           |   2 +
 arch/arm/boot/dts/imx6qdl-cubox-i.dtsi             |  72 ++++-----
 arch/arm/boot/dts/imx6qdl-hummingboard.dtsi        | 103 ++++++++-----
 arch/arm/boot/dts/imx6qdl-microsom-ar8035.dtsi     |  99 ------------
 arch/arm/boot/dts/imx6qdl-microsom.dtsi            | 161 -------------------
 arch/arm/boot/dts/imx6qdl-sr-som-brcm.dtsi         | 144 +++++++++++++++++
 arch/arm/boot/dts/imx6qdl-sr-som-emmc.dtsi         |  70 +++++++++
 arch/arm/boot/dts/imx6qdl-sr-som-ti.dtsi           | 170 +++++++++++++++++++++
 arch/arm/boot/dts/imx6qdl-sr-som.dtsi              | 121 +++++++++++++++
 22 files changed, 1072 insertions(+), 336 deletions(-)

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 8.8Mbps down 630kbps up
According to speedtest.net: 8.21Mbps down 510kbps up
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
