From: Manivannan Sadhasivam <manivannan.sadhasivam-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 00/10] Add Actions Semi S900 pinctrl and gpio support
Date: Sun, 18 Feb 2018 02:14:23 +0530
Message-ID: <20180217204433.3095-1-manivannan.sadhasivam@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, afaerber-l3A5Bk7waGM@public.gmane.org
Cc: liuwei-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org, mp-cs-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org, 96boards-Ty1hIZOCd2XuufBYgWm87A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Manivannan Sadhasivam <manivannan.sadhasivam-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset adds pinctrl and gpio support for Actions Semi S900 SoC.
Pinctrl and gpio subsystems share the common set of register range but
implemented as individual drivers for making it less complex.

Pinmux functions are only accessible for pin groups while pinconf
parameters are available for both pin groups and individual pins.

gpio-line-names has been added for the Bubblegum-96 board matching the
96Boards CE specification v1.0.

Both pinctrl and gpio drivers are verified using the Bubblegum-96 board.

This patchset depends on the clock driver which is still under review:
https://lkml.org/lkml/2018/2/9/831

Thanks,
Mani

Manivannan Sadhasivam (10):
  dt-bindings: pinctrl: Add bindings for Actions S900 SoC
  arm64: dts: actions: Add pinctrl node for S900
  arm64: actions: Enable PINCTRL in platforms Kconfig
  pinctrl: actions: Add Actions S900 pinctrl driver
  dt-bindings: gpio: Add gpio nodes for Actions S900 SoC
  arm64: dts: actions: Add S900 gpio nodes
  arm64: dts: actions: Add gpio line names to Bubblegum-96 board
  gpio: Add gpio driver for Actions OWL S900 SoC
  MAINTAINERS: Add reviewer for ACTIONS platforms
  MAINTAINERS: Add Actions Semi S900 pinctrl and gpio entries

 .../devicetree/bindings/gpio/actions,owl-gpio.txt  |   15 +
 .../bindings/pinctrl/actions,s900-pinctrl.txt      |  171 ++
 MAINTAINERS                                        |    5 +
 arch/arm64/Kconfig.platforms                       |    1 +
 arch/arm64/boot/dts/actions/s900-bubblegum-96.dts  |  175 ++
 arch/arm64/boot/dts/actions/s900.dtsi              |   13 +
 drivers/gpio/Kconfig                               |    8 +
 drivers/gpio/Makefile                              |    1 +
 drivers/gpio/gpio-owl.c                            |  258 ++
 drivers/pinctrl/Kconfig                            |    1 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/actions/Kconfig                    |   12 +
 drivers/pinctrl/actions/Makefile                   |    2 +
 drivers/pinctrl/actions/pinctrl-owl.c              |  573 +++++
 drivers/pinctrl/actions/pinctrl-owl.h              |  178 ++
 drivers/pinctrl/actions/pinctrl-s900.c             | 2536 ++++++++++++++++++++
 16 files changed, 3950 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/actions,owl-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/actions,s900-pinctrl.txt
 create mode 100644 drivers/gpio/gpio-owl.c
 create mode 100644 drivers/pinctrl/actions/Kconfig
 create mode 100644 drivers/pinctrl/actions/Makefile
 create mode 100644 drivers/pinctrl/actions/pinctrl-owl.c
 create mode 100644 drivers/pinctrl/actions/pinctrl-owl.h
 create mode 100644 drivers/pinctrl/actions/pinctrl-s900.c

-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
