From: Alexandre TORGUE <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH 0/8] ADD STM32H743 MCU and STM32H743i-Eval board supports
Date: Tue, 31 Jan 2017 14:14:17 +0100
Message-ID: <1485868465-30446-1-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series adds basic support for STM32H743 MCU and stm32h743i-eval board.
With it, you can boot stm32h743i-eval board successfully.

For your information:

The STMicrolectornics's STM32H743 MCU has the following main features:
 - Cortex-M7 core running up to @400MHz
 - 2MB internal flash, about 1MBytes internal RAM
 - FMC controller to connect SDRAM, NOR and NAND memories
 - Dual mode QSPI
 - SD/MMC/SDIO support
 - Ethernet controller
 - USB OTFG FS & HS controllers
 - I2C, SPI, CAN busses support
 - Several 16 & 32 bits general purpose timers
 - Serial Audio interface
 - LCD controller
 - HDMI-CEC
 - SPDIFRX 

Regards

Alex

Alexandre TORGUE (8):
  include: dt-bindings: Add STM32H7 pinctrl DT bindings
  pinctrl: stm32: Add STM32H743 MCU support
  Documentation: dt-bindings: Add STM32 pinctrl driver DT bindings
  ARM: stm32: create dedicated kconfig for STM32 machine
  ARM: stm32: Add a new SOC - STM32H743
  ARM: stm32: Introduce MACH_STM32H743 flag
  ARM: dts: stm32: Add STM32H743 MCU and STM32H743i-EVAL board
  ARM: configs: Add new config fragment to change RAM start point

 Documentation/arm/stm32/stm32h743-overview.txt     |   30 +
 .../bindings/pinctrl/st,stm32-pinctrl.txt          |    1 +
 arch/arm/Kconfig                                   |   24 +-
 arch/arm/boot/dts/Makefile                         |    3 +-
 arch/arm/boot/dts/stm32h743-pinctrl.dtsi           |  156 ++
 arch/arm/boot/dts/stm32h743.dtsi                   |   83 +
 arch/arm/boot/dts/stm32h743i-eval.dts              |   74 +
 arch/arm/configs/dram_0xd0000000.config            |    1 +
 arch/arm/mach-stm32/Kconfig                        |   26 +
 arch/arm/mach-stm32/board-dt.c                     |    1 +
 drivers/pinctrl/stm32/Kconfig                      |    5 +
 drivers/pinctrl/stm32/Makefile                     |    1 +
 drivers/pinctrl/stm32/pinctrl-stm32h743.c          | 1980 ++++++++++++++++++++
 include/dt-bindings/pinctrl/stm32h7-pinfunc.h      | 1612 ++++++++++++++++
 14 files changed, 3974 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/arm/stm32/stm32h743-overview.txt
 create mode 100644 arch/arm/boot/dts/stm32h743-pinctrl.dtsi
 create mode 100644 arch/arm/boot/dts/stm32h743.dtsi
 create mode 100644 arch/arm/boot/dts/stm32h743i-eval.dts
 create mode 100644 arch/arm/configs/dram_0xd0000000.config
 create mode 100644 arch/arm/mach-stm32/Kconfig
 create mode 100644 drivers/pinctrl/stm32/pinctrl-stm32h743.c
 create mode 100644 include/dt-bindings/pinctrl/stm32h7-pinfunc.h

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
