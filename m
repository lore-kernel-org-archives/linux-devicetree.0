From: Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v11 0/6] FPGA Manager support for altera passive serial
Date: Thu, 25 May 2017 10:29:05 -0700
Message-ID: <20170525172911.11467-1-stillcompiling@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, Bastian Stender <bst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

FPGA Manager passive serial can now support Stratix, Cyclone and Arria
FPGAs.
Thanks to Bastian and Anatolij for helping to extend support beyond Cyclone

changes from v10

- Rebase on v4.12-rc2
- Remove an erroneous cyclone-ps-spi.o reference from drivers/fpga/Makefile
- Change FPGA_MGR_SPI_BITSTREAM_LSB_FIRST tp FPGA_MGR_BITSTREAM_LSB_FIRST
- Change CONF_DONE "low" to "inactive" in an error message
- Add a MODULE_DEVICE_TABLE for SPI
- Patches 1-4 can be merged without 5 and 6
- Patches 5, and 6 Add back in the bitrev8x4 speed up code newly with support
  for any size buffer.

Anatolij Gustschin (1):
  fpga: Add flag to indicate SPI bitstream is bit-reversed

Joshua Clayton (4):
  doc: dt: add altera-ps-spi binding document
  fpga manager: Add altera-ps-spi driver for Altera FPGAs
  ARM: dts: imx6q-evi: support altera-ps-spi
  lib: add bitrev8x4()
  fpga-manager: altera-ps-spi: use bitrev8x4

 .../bindings/fpga/altera-passive-serial.txt        |  29 ++
 arch/arm/boot/dts/imx6q-evi.dts                    |  16 ++
 drivers/fpga/Kconfig                               |   7 +
 drivers/fpga/Makefile                              |   1 +
 drivers/fpga/altera-ps-spi.c                       | 307 +++++++++++++++++++++
 include/linux/bitrev.h                             |  19 ++
 include/linux/fpga/fpga-mgr.h                      |   2 +
 7 files changed, 381 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fpga/altera-passive-serial.txt
 create mode 100644 drivers/fpga/altera-ps-spi.c

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
