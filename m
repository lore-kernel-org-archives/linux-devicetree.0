From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH 0/6] ARM: Initial RDA8810PL and Orange Pi 2G-IoT enablement
Date: Tue, 27 Jun 2017 02:55:14 +0200
Message-ID: <20170627005520.23731-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, service@rdamicro.com, zhao_steven@263.net, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello,

This mini-series adds initial Device Trees for the RDA Micro RDA8810PL SoC and
the Orange Pi 2G-IoT board.

With the vendor U-Boot the .dtb needs to be appended to the zImage.
It then boots with earlycon until it is lacking a timer driver.

Cf. https://en.opensuse.org/HCL:Orange_Pi_2G-IoT

Patches at:
https://github.com/afaerber/linux/commits/opi2g-next

Have a lot of fun!

Cheers,
Andreas

Cc: service@rdamicro.com
Cc: zhao_steven@263.net
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Olof Johansson <olof@lixom.net>
Cc: devicetree@vger.kernel.org

Andreas Färber (6):
  dt-bindings: Add RDA Micro vendor prefix
  dt-bindings: arm: Document RDA8810PL and Orange Pi 2G-IoT
  ARM: Prepare RDA8810PL
  dt-bindings: serial: Document RDA Micro UART
  tty: serial: Add RDA Micro UART driver
  ARM: dts: Add RDA8810PL and Orange Pi 2G-IoT

 Documentation/admin-guide/kernel-parameters.txt    |   6 ++
 Documentation/devicetree/bindings/arm/rda.txt      |  17 +++
 .../devicetree/bindings/serial/rda-uart.txt        |  13 +++
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 arch/arm/Kconfig                                   |   2 +
 arch/arm/Makefile                                  |   1 +
 arch/arm/boot/dts/Makefile                         |   2 +
 arch/arm/boot/dts/rda8810pl-orangepi-2g-iot.dts    |  27 +++++
 arch/arm/boot/dts/rda8810pl.dtsi                   |  94 +++++++++++++++++
 arch/arm/mach-rda/Kconfig                          |   7 ++
 arch/arm/mach-rda/Makefile                         |   1 +
 drivers/tty/serial/Kconfig                         |  19 ++++
 drivers/tty/serial/Makefile                        |   1 +
 drivers/tty/serial/rda-uart.c                      | 117 +++++++++++++++++++++
 14 files changed, 308 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/rda.txt
 create mode 100644 Documentation/devicetree/bindings/serial/rda-uart.txt
 create mode 100644 arch/arm/boot/dts/rda8810pl-orangepi-2g-iot.dts
 create mode 100644 arch/arm/boot/dts/rda8810pl.dtsi
 create mode 100644 arch/arm/mach-rda/Kconfig
 create mode 100644 arch/arm/mach-rda/Makefile
 create mode 100644 drivers/tty/serial/rda-uart.c

-- 
2.12.3
