From: Ilya Ledvich <ilya-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Subject: [PATCH v2 0/2] Add support for CL-SOM-iMX7 and SBC-iMX7
Date: Tue, 22 Dec 2015 10:15:18 +0200
Message-ID: <1450772120-18131-1-git-send-email-ilya@compulab.co.il>
References: <1449472479-2521-1-git-send-email-ilya@compulab.co.il>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449472479-2521-1-git-send-email-ilya-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ilya Ledvich <ilya-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch series adds support for CompuLab CL-SOM-iMX7 and
SBC-iMX7 boards.

CL-SOM-iMX7 is a miniature System-on-Module (SoM) based on
Freescale i.MX7 ARM Cortex-A7 System-on-Chip.
s
SBC-iMX7 is a single board computer, implemented with the
CL-SOM-iMX7 System-on-Module providing most of the functions,
and SB-SOM-iMX7 carrier board providing additional peripheral
functions and connectors.

The SBC-iMX7 provides following features:

CPU:		Freescale i.MX 7Dual ARM Cortex-A7, 1GHz NEON SIMD and VFPv4 or
		Freescale i.MX 7Solo ARM Cortex-A7, 800MHz NEON SIMD and VFPv4

RAM:		DDR3, 256MB - 2GB

Storage:	NAND flash, 128MB - 1GB or eMMC flash, 4GB - 32GB
		SPI flash, 2MB
		Standard full-size SD socket

Ethernet:	Up to 2x 10/100/1000Mbps Ethernet ports (MAC+PHY)

WiFi/BT:	Dual-band 2x2 802.11a/b/g/n WiFi interface (TI WiLink 8 WL1837 chipset)

Analog Audio:	Audio codec with analog stereo output, stereo input and microphone support

More details can be found here:

http://www.compulab.co.il/products/computer-on-modules/cl-som-imx7-freescale-i-mx-7-system-on-module/

http://www.compulab.co.il/products/sbcs/sbc-imx7-freescale-i-mx-7-single-board-computer/

This series provides basic DT support including following features:

* Memory configuration
* eMMC
* 2x Gigabit Ethernet ports (FEC1 and FEC2)
* I2C2 bus
  * EEPROM
  * PCA9555 GPIO extender
  * PMIC
* UART1
* USB OTG port

Changes history:
v2: use generic node name for pmic (Thanks Rob)
    move board description out of fsl.txt (Shawn)
    use GPL/X11 dual licence for newly added dts files (Shawn)
    discard one level of container node (Shawn)
    squash several patches into one patch (Shawn)

Ilya Ledvich (2):
  ARM: dts: imx7d: cl-som-imx7: add basic module support
  ARM: dts: imx7d: sbc-imx7: add basic board support

 arch/arm/boot/dts/Makefile              |   2 +
 arch/arm/boot/dts/imx7d-cl-som-imx7.dts | 293 ++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/imx7d-sbc-imx7.dts    |  44 +++++
 3 files changed, 339 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx7d-cl-som-imx7.dts
 create mode 100644 arch/arm/boot/dts/imx7d-sbc-imx7.dts

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
