From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] at91: 3.4-rc1 fixes
Date: Wed, 04 Apr 2012 19:03:27 +0200
Message-ID: <4F7C7EDF.4000702@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Arnd, Olof,

I would like you to integrate this fist batch of AT91 related fixes. They
are covering DT and USB related issues that we have seen on top of 3.4-rc1.

I have also included modifications of the OHCI USB driver because they
are also touching the core AT91 devices/board files and Device Tree files.
The modification of "vbus_pin_active_low" in particular cannot be separated
from the modification of .dts[i] and devices/board files.

Alan Stern for USB OHCI/EHCI and Grant Likely for DT gave me their "Acked-by"
on concerned patches (thanks a lot guys!).

The following changes since commit dd775ae2549217d3ae09363e3edb305d0fa19928:

  Linux 3.4-rc1 (2012-03-31 16:24:09 -0700)

are available in the git repository at:

  git://github.com/at91linux/linux-at91.git at91-fixes

for you to fetch changes up to dcce6ce802c271cd7c21f4730f301150577b2826:

  ARM: at91: dt: remove unit-address part for memory nodes (2012-04-04 18:35:52 +0200)

----------------------------------------------------------------
Ludovic Desroches (1):
      ARM: at91: dt: remove unit-address part for memory nodes

Nicolas Ferre (11):
      ARM: at91/at91sam9x5: add clkdev entries for DMA controllers
      USB: ohci-at91: fix vbus_pin_active_low handling
      ARM: at91/USB host: specify and handle properly vbus_pin_active_low
      ARM: at91/dts: USB host vbus is active low
      USB: ohci-at91: rework and fix initialization
      USB: ohci-at91: change maximum number of ports
      USB: ohci-at91: trivial return code name change
      ARM: at91/at91sam9x5.dtsi: fix NAND ale/cle in DT file
      ARM: at91/NAND DT bindings: add comments
      USB: ehci-atmel: add needed of.h header file
      ARM: at91: fix check of valid GPIO for SPI and USB

 .../devicetree/bindings/mtd/atmel-nand.txt         |   10 +-
 arch/arm/boot/dts/at91sam9g20.dtsi                 |    2 +-
 arch/arm/boot/dts/at91sam9g25ek.dts                |    4 +-
 arch/arm/boot/dts/at91sam9g45.dtsi                 |    2 +-
 arch/arm/boot/dts/at91sam9m10g45ek.dts             |    6 +-
 arch/arm/boot/dts/at91sam9x5.dtsi                  |    6 +-
 arch/arm/boot/dts/at91sam9x5cm.dtsi                |    2 +-
 arch/arm/boot/dts/usb_a9g20.dts                    |    2 +-
 arch/arm/mach-at91/at91sam9260_devices.c           |    3 +
 arch/arm/mach-at91/at91sam9261_devices.c           |    3 +
 arch/arm/mach-at91/at91sam9263_devices.c           |    6 +-
 arch/arm/mach-at91/at91sam9g45_devices.c           |   11 +-
 arch/arm/mach-at91/at91sam9rl_devices.c            |    3 +
 arch/arm/mach-at91/at91sam9x5.c                    |    2 +
 arch/arm/mach-at91/board-sam9263ek.c               |    1 +
 arch/arm/mach-at91/board-sam9m10g45ek.c            |    1 +
 arch/arm/mach-at91/include/mach/board.h            |   13 +-
 drivers/usb/host/ehci-atmel.c                      |    1 +
 drivers/usb/host/ohci-at91.c                       |  163 +++++++++++---------
 19 files changed, 137 insertions(+), 104 deletions(-)

Thanks, best regards,
-- 
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
