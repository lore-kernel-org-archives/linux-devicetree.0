From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH v2 00/17] ARM: Initial Actions Semi S500 and S900 enablement
Date: Fri, 24 Feb 2017 04:40:38 +0100
Message-ID: <20170224034055.18807-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mp-cs-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org, 96boards-Ty1hIZOCd2XuufBYgWm87A@public.gmane.org, support-8Vy/tIz7429AfugRpC6u6w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

This series adds initial support for Actions Semiconductor S500 (ARMv7) and
S900 (ARMv8) SoCs.

In addition to earlycon serial output, v2 includes a serial console driver RFC.
Guitar output is coming further along thanks to a new timer implementation, but
is still earlycon only - to be investigated. Bubblegum-96 reaches an initrd,
but a small part of the serial output just before is lost (visible in dmesg).

https://github.com/afaerber/linux/commits/bg96-next

Booting from U-Boot is straightforward on both boards:

https://en.opensuse.org/HCL:Guitar
https://en.opensuse.org/HCL:Bubblegum-96

Have a lot of fun!

Cheers,
Andreas

v1 -> v2:
* S900 DT fixes (Mark)
* Kconfig name changes (Arnd)
* Bubblegum-96 .dts rename
* Vendor prefix rename
* Minor cleanups
* Add serial driver
* Add MAINTAINERS section
* Use SPDX-License-Identifier in DT (Rob)
* Add clocksource driver

Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: mp-cs-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org
Cc: 96boards-Ty1hIZOCd2XuufBYgWm87A@public.gmane.org
Cc: support-8Vy/tIz7429AfugRpC6u6w@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Andreas Färber (17):
  dt-bindings: Add vendor prefix for Actions Semi
  dt-bindings: arm: Document Actions Semi S500
  dt-bindings: timer: Document Owl timer
  clocksource: Add Owl timer
  ARM: Prepare Actions Semi S500
  ARM64: Prepare Actions Semi S900
  dt-bindings: serial: Document Actions Semi Owl UARTs
  tty: serial: Add Actions Semi Owl UART earlycon
  Documentation: kernel-parameters: Document owl earlycon
  ARM: dts: Add Actions Semi S500 and LeMaker Guitar
  dt-bindings: Add vendor prefix for uCRobotics
  dt-bindings: arm: Document Actions Semi S900
  ARM64: dts: Add Actions Semi S900 and Bubblegum-96
  MAINTAINERS: Add Actions Semi Owl section
  tty: serial: owl: Implement console driver
  ARM64: dts: actions: s900-bubblegum-96: Add fake uart5 clk
  ARM: dts: s500-guitar-bb-rev-b: Add fake uart3 clock

 Documentation/admin-guide/kernel-parameters.txt    |   6 +
 Documentation/devicetree/bindings/arm/actions.txt  |  39 ++
 .../bindings/serial/actions,owl-uart.txt           |  16 +
 .../bindings/timer/actions,owl-timer.txt           |  16 +
 .../devicetree/bindings/vendor-prefixes.txt        |   2 +
 MAINTAINERS                                        |  10 +
 arch/arm/Kconfig                                   |   2 +
 arch/arm/Makefile                                  |   1 +
 arch/arm/boot/dts/Makefile                         |   2 +
 arch/arm/boot/dts/s500-guitar-bb-rev-b.dts         |  33 +
 arch/arm/boot/dts/s500-guitar.dtsi                 |  20 +
 arch/arm/boot/dts/s500.dtsi                        | 135 ++++
 arch/arm/mach-actions/Kconfig                      |  10 +
 arch/arm/mach-actions/Makefile                     |   1 +
 arch/arm/mach-actions/owl.c                        |  28 +
 arch/arm64/Kconfig.platforms                       |   5 +
 arch/arm64/boot/dts/Makefile                       |   1 +
 arch/arm64/boot/dts/actions/Makefile               |   5 +
 arch/arm64/boot/dts/actions/s900-bubblegum-96.dts  |  38 ++
 arch/arm64/boot/dts/actions/s900.dtsi              | 109 ++++
 drivers/clocksource/Kconfig                        |   7 +
 drivers/clocksource/Makefile                       |   1 +
 drivers/clocksource/owl-timer.c                    | 146 +++++
 drivers/tty/serial/Kconfig                         |  19 +
 drivers/tty/serial/Makefile                        |   1 +
 drivers/tty/serial/owl-uart.c                      | 707 +++++++++++++++++++++
 include/uapi/linux/serial_core.h                   |   3 +
 27 files changed, 1363 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/actions.txt
 create mode 100644 Documentation/devicetree/bindings/serial/actions,owl-uart.txt
 create mode 100644 Documentation/devicetree/bindings/timer/actions,owl-timer.txt
 create mode 100644 arch/arm/boot/dts/s500-guitar-bb-rev-b.dts
 create mode 100644 arch/arm/boot/dts/s500-guitar.dtsi
 create mode 100644 arch/arm/boot/dts/s500.dtsi
 create mode 100644 arch/arm/mach-actions/Kconfig
 create mode 100644 arch/arm/mach-actions/Makefile
 create mode 100644 arch/arm/mach-actions/owl.c
 create mode 100644 arch/arm64/boot/dts/actions/Makefile
 create mode 100644 arch/arm64/boot/dts/actions/s900-bubblegum-96.dts
 create mode 100644 arch/arm64/boot/dts/actions/s900.dtsi
 create mode 100644 drivers/clocksource/owl-timer.c
 create mode 100644 drivers/tty/serial/owl-uart.c

-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
