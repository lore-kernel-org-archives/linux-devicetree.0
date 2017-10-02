From: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v3 00/12] add pinmuxing support for pins in
 AXP209 and AXP813 PMICs
Date: Mon,  2 Oct 2017 14:08:42 +0200
Message-ID: <20171002120854.5212-1-quentin.schulz@free-electrons.com>
Reply-To: quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCLZXSNY5IDBBGWZZDHAKGQEMUKJ7EI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The AXP209 and AXP813 PMICs have several pins (respectively 3 and 2) that can
be used either as GPIOs or for other purposes (ADC or LDO here).

We already have a GPIO driver for the GPIO use of those pins on the AXP209.
Let's "upgrade" this driver to support all the functions these pins can have.

Then we add support to this driver for the AXP813 which is slighlty different
(basically a different offset in a register and one less pin).

I suggest patches 1 to 6 go through Linus's tree and 7 to 12 via Maxime or
Chen-Yu's tree.

This version of the patchset is based on Chen-Yu's patchset for AXP813/818
regulators[1].

v3:
  - add defines for GPIO funcs,
  - use again get_regs function instead of drv_data (which was implemented in
  v2),
  - use of_device_id data for device specific data (gpio_status_offset and pins
  description),
  - change compatible from axp813-pctl to axp813-gpio,
  - use axp81x DT label instead of axp813 since AXP813 and AXP818 are similar,
  - add dtsi include for all boards embedding axp813/axp818,
  - drastically simplify structures,
  - rebase on Chen-Yu's patch series for regulators,
  - add GPIOs pinmuxing for LDO regulators,

v2:
  - add support for AXP813 pins,
  - split into more patches so it is easier to follow the modifications,
  - reorder of some patches,
  - register all pins within the same range instead of a range per pin,

[1] https://www.spinics.net/lists/arm-kernel/msg608384.html

Thanks,
Quentin

Quentin Schulz (12):
  pinctrl: move gpio-axp209 to pinctrl
  pinctrl: axp209: add pinctrl features
  pinctrl: axp209: rename everything from gpio to pctl
  pinctrl: axp209: add programmable gpio_status_offset
  pinctrl: axp209: add support for AXP813 GPIOs
  mfd: axp20x: add pinctrl cell for AXP813
  ARM: dts: sun8i: a711: include axp81x dtsi
  ARM: dts: sun8i: bananapi-m3: include axp81x dtsi
  ARM: dts: sun8i: h8homlet-v2: include axp81x dtsi
  ARM: dts: sun8i: cubietruck-plus: include axp81x dtsi
  ARM: dtsi: axp81x: add GPIO DT node
  ARM: dtsi: axp81x: set pinmux for GPIO0/1 when used as LDOs

 .../devicetree/bindings/gpio/gpio-axp209.txt       |  30 --
 .../devicetree/bindings/pinctrl/pinctrl-axp209.txt |  67 +++
 arch/arm/boot/dts/axp81x.dtsi                      |  20 +
 .../boot/dts/sun8i-a83t-allwinner-h8homlet-v2.dts  |   2 +
 arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts       |   2 +
 arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dts   |   2 +
 arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts          |   4 +-
 drivers/gpio/Kconfig                               |   6 -
 drivers/gpio/Makefile                              |   1 -
 drivers/gpio/gpio-axp209.c                         | 188 ---------
 drivers/mfd/axp20x.c                               |   3 +
 drivers/pinctrl/Kconfig                            |   6 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinctrl-axp209.c                   | 459 +++++++++++++++++++++
 14 files changed, 565 insertions(+), 226 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-axp209.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-axp209.txt
 delete mode 100644 drivers/gpio/gpio-axp209.c
 create mode 100644 drivers/pinctrl/pinctrl-axp209.c

-- 
2.11.0
