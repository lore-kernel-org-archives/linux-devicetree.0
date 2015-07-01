From: Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
Subject: [RFC PATCH 0/7] fsl-quadspi: Allow additional device combinations.
Date: Wed,  1 Jul 2015 16:20:02 -0400
Message-ID: <1435782010-9809-1-git-send-email-cory.tusar@pid1solutions.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, han.xu-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: stefan-XLVq0VzYD2Y@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch series fixes and extends the fsl-quadspi driver to allow for
non-contiguous and non-homogeneous SPI NOR device layouts.  The current
driver assumes that attached devices are all of the same type, and are
populated "in order" beginning with QSPIn_A_CS0.

The updated driver and DT changes make use of the 'reg' property
for each flash to determine the interface and chip select to which each
device is attached.

Patchset was tested on a custom VF610-based board with a single SPI NOR
connected to QSPI0_B_CS0, and also on a Rev. H TWR board with dual SPI
NOR devices connected to QSPI0_A_CS0 and QSPI0_B_CS0.  MTD tests passed
for all devices (readtest, speedtest, and stresstest), and independent
access to both devices was verified on the TWR system.

Regards,
-Cory


Cory Tusar (7):
  ARM: dts: vf610: Add missing QuadSPI register mapping and names.
  ARM: dts: vfxxx: Include support for qspi1 functionality.
  mtd: fsl-quadspi: Support both 24- and 32-bit addressed commands.
  mtd: fsl-quadspi: Use per-device clk_rate.
  mtd: fsl-quadspi: Allow non-contiguous flash layouts.
  mtd: spi-nor: Add support for Micron MT25QL02GC serial flash.
  ARM: dts: vf610-twr: Enable QSPI and map flash devices.

 .../devicetree/bindings/mtd/fsl-quadspi.txt        |  15 +-
 arch/arm/boot/dts/vf610-twr.dts                    |  39 +++
 arch/arm/boot/dts/vfxxx.dtsi                       |  16 +-
 drivers/mtd/spi-nor/fsl-quadspi.c                  | 313 +++++++++++----------
 drivers/mtd/spi-nor/spi-nor.c                      |   1 +
 5 files changed, 232 insertions(+), 152 deletions(-)

-- 
2.3.6

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
