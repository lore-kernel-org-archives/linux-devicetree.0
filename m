From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 00/11] arm: rpi: Enable USB and Ethernet driver model Raspberry Pi
Date: Fri,  7 Aug 2015 07:42:20 -0600
Message-ID: <1438954951-13329-1-git-send-email-sjg@chromium.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Joe Hershberger <joe.hershberger-acOepvfBmUk@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Herrmann <morpheus.ibis-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vikas Manocha <vikas.manocha-qxv4g6HH51o@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Albert Aribaud <albert.u.boot-LhW3hqR2+23R7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Raspberry Pi uses a DWC2 USB controller and a SMSC USB Ethernet adaptor.
Driver model support for these was recently merged.

This series does the following:
- Move Raspberry Pi to use device tree control (u-boot-dtb.bin instead of
     u-boot.bin)
- Remove GPIO platform data (now uses device tree)
- Remove serial platform data (now uses device tree)
- Enable CONFIG_DM_ETH and CONFIG_DM_USB on Raspberry Pi

With Ethernet active the device list looks something like this:

U-Boot> dm tree
 Class       Probed   Name
----------------------------------------
 root        [ + ]    root_driver
 simple_bus  [ + ]    |-- soc
 gpio        [   ]    |   |-- gpio@7e200000
 serial      [ + ]    |   |-- uart@7e201000
 usb         [ + ]    |   `-- usb@7e980000
 usb_hub     [ + ]    |       `-- usb_hub
 usb_hub     [ + ]    |           `-- usb_hub
 eth         [ + ]    |               `-- smsc95xx_eth
 simple_bus  [   ]    `-- clocks

Changes in v3:
- Drop applied patches from series
- Drop patch to introduce usbethaddr for driver model
- Rename binding file to pl01x.txt

Changes in v2:
- Add support for Raspberry Pi 2

Simon Glass (11):
  dm: serial: Update binding for PL01x serial UART
  arm: rpi: Define CONFIG_TFTP_TSIZE to show tftp size info
  arm: rpi: Bring in kernel device tree files
  arm: rpi: Device tree modifications for U-Boot
  arm: rpi: Add device tree files for Raspberry Pi 2
  arm: rpi: Enable device tree control for Rasberry Pi
  arm: rpi: Enable device tree control for Rasberry Pi 2
  arm: rpi: Drop the UART console platform data
  arm: rpi: Drop the GPIO platform data
  arm: rpi: Move to driver model for USB
  arm: rpi: Use driver model for Ethernet

 arch/arm/dts/Makefile                             |   3 +
 arch/arm/dts/bcm2835-rpi-b.dts                    |  24 ++++
 arch/arm/dts/bcm2835.dtsi                         |  35 +++++
 arch/arm/dts/bcm2836-rpi-2-b.dts                  |  30 +++++
 arch/arm/dts/bcm2836.dtsi                         |  42 ++++++
 arch/arm/dts/bcm283x-common.dtsi                  | 157 ++++++++++++++++++++++
 arch/arm/dts/bcm283x-rpi.dtsi                     |  49 +++++++
 arch/arm/dts/stv0991.dts                          |   2 +-
 arch/arm/mach-bcm283x/include/mach/gpio.h         |   5 -
 board/raspberrypi/rpi/rpi.c                       |  24 ----
 configs/rpi_2_defconfig                           |   6 +
 configs/rpi_defconfig                             |   6 +
 doc/device-tree-bindings/arm/bcm/brcm,bcm2835.txt |   8 ++
 doc/device-tree-bindings/arm/bcm/brcm,bcm2836.txt |  10 ++
 doc/device-tree-bindings/serial/pl01x.txt         |  55 +++++++-
 drivers/gpio/bcm2835_gpio.c                       |  20 +++
 drivers/serial/serial_pl01x.c                     |   6 +-
 include/configs/rpi-common.h                      |   6 +-
 include/dt-bindings/pinctrl/bcm2835.h             |  27 ++++
 19 files changed, 474 insertions(+), 41 deletions(-)
 create mode 100644 arch/arm/dts/bcm2835-rpi-b.dts
 create mode 100644 arch/arm/dts/bcm2835.dtsi
 create mode 100644 arch/arm/dts/bcm2836-rpi-2-b.dts
 create mode 100644 arch/arm/dts/bcm2836.dtsi
 create mode 100644 arch/arm/dts/bcm283x-common.dtsi
 create mode 100644 arch/arm/dts/bcm283x-rpi.dtsi
 create mode 100644 doc/device-tree-bindings/arm/bcm/brcm,bcm2835.txt
 create mode 100644 doc/device-tree-bindings/arm/bcm/brcm,bcm2836.txt
 create mode 100644 include/dt-bindings/pinctrl/bcm2835.h

-- 
2.5.0.rc2.392.g76e840b

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
