From: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v2 00/12] add imx usb driver for mx28/6x
Date: Mon, 21 May 2012 17:23:45 +0800
Message-ID: <1337592237-5090-1-git-send-email-richard.zhao@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linuxzsc-MeMPY/F8WlbQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The work is based on  ci13xxx rework done by Alexander Shishkin.

Status:
  - this version only support host
  - usbotg controler works at host role

Changes since V1:
 - Merge the work of Marek
 - re-implement connect change notify
 - imx6q: move part of code to clk
 - imx6q: add config-on-boot gpios

Richard Zhao (12):
  usb: otg: add notify_connect_change callback
  usb: chipidea: permit driver bindings pass phy pointer
  usb: ehci-hcd: notify phy when connect change
  usb: otg: add basic mxs phy driver support
  usb: chipidea: add imx driver binding
  ARM: imx6q: correct device name of usbphy and usb controller clock
    export
  ARM: imx6q: add config-on-boot gpios
  ARM: imx6q: add usbphy clocks
  ARM: imx6q: disable usb charger detector
  ARM: dts: imx6q-sabrelite: add usb devices
  ARM: mxs: clk_register_clkdev mx28 usb clocks
  ARM: dts: imx28-evk: add usb devices

 .../devicetree/bindings/usb/ci13xxx-imx.txt        |   20 ++
 Documentation/devicetree/bindings/usb/mxs-phy.txt  |   13 ++
 arch/arm/boot/dts/imx28-evk.dts                    |   18 ++
 arch/arm/boot/dts/imx28.dtsi                       |   12 +-
 arch/arm/boot/dts/imx6q-sabrelite.dts              |   25 +++-
 arch/arm/boot/dts/imx6q.dtsi                       |   44 ++++-
 arch/arm/mach-imx/clk-imx6q.c                      |   12 +-
 arch/arm/mach-imx/mach-imx6q.c                     |   60 ++++++
 drivers/clk/mxs/clk-imx28.c                        |    4 +
 drivers/usb/chipidea/Makefile                      |    8 +
 drivers/usb/chipidea/ci.h                          |    2 +
 drivers/usb/chipidea/ci13xxx_imx.c                 |  191 +++++++++++++++++++
 drivers/usb/chipidea/core.c                        |    4 +
 drivers/usb/chipidea/host.c                        |    1 +
 drivers/usb/chipidea/udc.c                         |   11 +-
 drivers/usb/host/ehci-hcd.c                        |    9 +
 drivers/usb/otg/Kconfig                            |    8 +
 drivers/usb/otg/Makefile                           |    1 +
 drivers/usb/otg/mxs-phy.c                          |  196 ++++++++++++++++++++
 include/linux/usb/chipidea.h                       |    3 +
 include/linux/usb/otg.h                            |   13 ++
 21 files changed, 644 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/ci13xxx-imx.txt
 create mode 100644 Documentation/devicetree/bindings/usb/mxs-phy.txt
 create mode 100644 drivers/usb/chipidea/ci13xxx_imx.c
 create mode 100644 drivers/usb/otg/mxs-phy.c

-- 
1.7.5.4


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
