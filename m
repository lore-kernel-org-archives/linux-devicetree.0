From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: [PATCH v2 00/19] ARM: dts: aspeed: updates and new machines
Date: Fri, 15 Dec 2017 16:54:24 +1030
Message-ID: <20171215062443.23059-1-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, Patrick Venture <venture-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Xo Wang <xow-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Lei YU <mine260309-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg-Bxea+6Xhats@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-aspeed-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series of device tree patches for the ASPEED BMC machines
moves all systems to use the soon to be merged clk driver, and
updates machines to use all of the drivers we have upstream.

 v2: Address review from Arnd
  - Remove NUM_CLKS from dt header
  - Send VUART patch as a fix, drop it from this series
  - Add reasoning for breaking old kernel in the 'proper clock
    references' patch

In addition it adds three new OpenBMC systems that have been developed
in the OpenBMC kernel tree over the past year: two Power9 OpenPower
systems, and a port by Google to a Quanta x86 server.

I have boot tested these on Romulus and Palmetto, as well as boot tested
all device trees in Qemu.

Please review the boards you are familiar with. I will merge these in to
the ASPEED ARM SoC tree for inclusion in 4.16.

Andrew Jeffery (1):
  ARM: dts: aspeed: Add LPC and child devices

Joel Stanley (16):
  dt-bindings: clock: Add ASPEED constants
  dt-bindings: gpio: Add ASPEED constants
  ARM: dts: aspeed: Add proper clock references
  ARM: dts: aspeed: Add MAC clocks
  ARM: dts: aspeed: Add watchdog clocks
  ARM: dts: aspeed: Add flash controller clocks
  ARM: dts: aspeed: Add clock phandle to GPIO
  ARM: dts: aspeed: Add PWM and tachometer node
  ARM: dts: aspeed: Add LPC Snoop device
  ARM: dts: aspeed: Remove skeleton.dtsi
  ARM: dts: aspeed: Update license headers
  ARM: dts: Add OpenBMC flash layout
  ARM: dts: aspeed: Sort ASPEED entries in makefile
  ARM: dts: aspeed: Add Witherspoon BMC machine
  ARM: dts: aspeed-romulus: Update Romulus system
  ARM: dts: aspeed-plametto: Add flash layout

Rick Altherr (1):
  ARM: dts: aspeed: Add Qanta Q71L BMC machine

Xo Wang (1):
  ARM: dts: aspeed: Add Ingrasys Zaius BMC machine

 arch/arm/boot/dts/Makefile                       |   8 +-
 arch/arm/boot/dts/aspeed-ast2500-evb.dts         |   2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts    |   3 +-
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     | 155 ++++++-
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 547 +++++++++++++++++++++++
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts       | 427 ++++++++++++++++++
 arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts     | 458 +++++++++++++++++++
 arch/arm/boot/dts/aspeed-g4.dtsi                 | 164 ++++---
 arch/arm/boot/dts/aspeed-g5.dtsi                 | 155 ++++---
 arch/arm/boot/dts/openbmc-flash-layout.dtsi      |  32 ++
 include/dt-bindings/clock/aspeed-clock.h         |  52 +++
 include/dt-bindings/gpio/aspeed-gpio.h           |  49 ++
 12 files changed, 1906 insertions(+), 146 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
 create mode 100644 arch/arm/boot/dts/openbmc-flash-layout.dtsi
 create mode 100644 include/dt-bindings/clock/aspeed-clock.h
 create mode 100644 include/dt-bindings/gpio/aspeed-gpio.h

-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
