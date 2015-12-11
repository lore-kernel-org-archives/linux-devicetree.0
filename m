From: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH RESEND v3 0/9] Add STM32 pinctrl/GPIO driver
Date: Fri, 11 Dec 2015 09:24:57 +0100
Message-ID: <1449822306-9035-1-git-send-email-mcoquelin.stm32@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: patrice.chotard-qxv4g6HH51o@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, afaerber-l3A5Bk7waGM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, bruherrera-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Linus, Patrice,

I resend the series for Patrice to review it.

Thanks,
Maxime



This is the third round of STM32 pinctrl series, which improves DT
bindings declaration and documentation, and also fixes some commit fixup
issues. The series also contains two more patches, adding GPIO LEDs
support as a user of this driver.

The STM32 family has 16 pins per GPIO bank, and the number of bank varies
depending on the model.

Pins can be multiplexed either in GPIO mode, alternate function (up to 15
functions per pin) or analog (for ADC/DAC).

Changes since v2:
-----------------
 - Rebase on v4.4-rc1
 - Declare leds also for Eval board
 - Set green led as heartbeat
 - Collect some acks

Changes since v1:
-----------------
 - Add GPIO LEDs support in DT and defconfig
 - Changes pinmux DT bindings from macros to raw values (Daniel)
 - Improve DT bindings documentation (Daniel)
 - Fix some commit fixup and rebase issues.

Kind regards,
Maxime

Maxime Coquelin (9):
  ARM: Kconfig: Introduce MACH_STM32F429 flag
  Documentation: dt-bindings: Document STM32 pinctrl driver DT bindings
  includes: dt-bindings: Add STM32F429 pinctrl DT bindings
  pinctrl: Add STM32 MCUs support
  ARM: mach-stm32: Select pinctrl
  ARM: dts: Add pinctrl node to STM32F429
  ARM: dts: Add USART1 pin config to STM32F429 boards
  ARM: dts: Add leds support to STM32F429 boards
  ARM: config: Enable GPIO Led driver in stm32_defconfig

 .../bindings/pinctrl/st,stm32-pinctrl.txt          |  126 ++
 arch/arm/Kconfig                                   |    6 +
 arch/arm/boot/dts/stm32429i-eval.dts               |   19 +
 arch/arm/boot/dts/stm32f429-disco.dts              |   13 +
 arch/arm/boot/dts/stm32f429.dtsi                   |  110 ++
 arch/arm/configs/stm32_defconfig                   |    1 +
 drivers/pinctrl/Kconfig                            |    1 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/stm32/Kconfig                      |   16 +
 drivers/pinctrl/stm32/Makefile                     |    5 +
 drivers/pinctrl/stm32/pinctrl-stm32.c              |  856 +++++++++++
 drivers/pinctrl/stm32/pinctrl-stm32.h              |   43 +
 drivers/pinctrl/stm32/pinctrl-stm32f429.c          | 1598 ++++++++++++++++++++
 include/dt-bindings/pinctrl/pinctrl-stm32.h        |   12 +
 include/dt-bindings/pinctrl/stm32f429-pinfunc.h    | 1241 +++++++++++++++
 15 files changed, 4048 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt
 create mode 100644 drivers/pinctrl/stm32/Kconfig
 create mode 100644 drivers/pinctrl/stm32/Makefile
 create mode 100644 drivers/pinctrl/stm32/pinctrl-stm32.c
 create mode 100644 drivers/pinctrl/stm32/pinctrl-stm32.h
 create mode 100644 drivers/pinctrl/stm32/pinctrl-stm32f429.c
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-stm32.h
 create mode 100644 include/dt-bindings/pinctrl/stm32f429-pinfunc.h

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
