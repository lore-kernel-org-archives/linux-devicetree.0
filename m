From: <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: [PATCHv2 0/8] Addition of Altera Arria10 System Resource Chip
Date: Thu, 2 Jun 2016 12:52:20 -0500
Message-ID: <1464889948-28793-1-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>

This patch series adds the SPI MultiFunction Device for the Altera System
Resource Chip for the Arria10 Developement Kit. The MFD implements GPIO
expansion on an Altera MAX5. The previous hwmon changes were removed since
they don't fit the hwmon requirements.

Thor Thayer (8):
  dt-bindings: mfd: Add Altera Arria10 System Resource Chip bindings
  MAINTAINERS: Add Altera Arria10 System Resource Chip
  mfd: altr_a10sr: Add Altera Arria10 DevKit System Resource Chip
  gpio: altera-a10sr: Add A10 System Resource Chip GPIO support.
  ARM: socfpga: dts: Add SPI Master1 for Arria10 SR chip
  ARM: socfpga: dts: Add Devkit A10-SR fields for Arria10
  ARM: socfpga: dts: Enable GPIO parent for Arria10 SR chip
  ARM: socfpga: dts: Add LED framework to A10-SR GPIO

 .../devicetree/bindings/mfd/altera-a10sr.txt       |   46 ++++++
 MAINTAINERS                                        |    7 +
 arch/arm/boot/dts/socfpga_arria10.dtsi             |   15 ++
 arch/arm/boot/dts/socfpga_arria10_socdk.dtsi       |   49 ++++++
 drivers/gpio/Kconfig                               |    8 +
 drivers/gpio/Makefile                              |    1 +
 drivers/gpio/gpio-altera-a10sr.c                   |  140 ++++++++++++++++
 drivers/mfd/Kconfig                                |   11 ++
 drivers/mfd/Makefile                               |    2 +
 drivers/mfd/altera-a10sr.c                         |  169 ++++++++++++++++++++
 include/linux/mfd/altera-a10sr.h                   |   85 ++++++++++
 11 files changed, 533 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/altera-a10sr.txt
 create mode 100644 drivers/gpio/gpio-altera-a10sr.c
 create mode 100644 drivers/mfd/altera-a10sr.c
 create mode 100644 include/linux/mfd/altera-a10sr.h

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
