From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v2 0/7] Renesas RZ/A1 pin and gpio controller
Date: Mon, 20 Mar 2017 17:14:44 +0100
Message-ID: <1490026491-21742-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: geert+renesas@glider.be, laurent.pinchart@ideasonboard.com, chris.brandt@renesas.com, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello,
   second round of combined GPIO and pin controller driver
for Renesas RZ/A1 SoC.

Few adjustments compared to v1.
The most visible one is the update of pin configuration flag to what
Chris suggested, and consequent simplification of pin multiplexing routine.
Some other fixes in DTS suggested by Geert have been applied.

Testing done verifying functionalities of hardware modules enabled in device
tree (SCIF2 for serial output, RIIC for accessing an internal eeprom chip and
user visible leds).
Gpio have been also verified using a i2c-gpio device in place of the native
RIIC one to access the same eeprom device.

Chris: it would be great if you could give this another spin on RSK board. In
v4.11 generic pinmux and pinctrl function have been merged in mainline, so no
need for an ad-hoc branch if you're willing to test this again.

Thanks
   j

v1 -> v2:
- change pin configuration flags as suggested by Chris
- gpio set direction function fixed as suggested by Chris
- add some more example on pin configuration flag usage to dt-binding doc
- fix gpio-controller names to remove unit address as suggested by Geert
- some comments chopped here and there to make the driver less verbose

Jacopo Mondi (7):
  pinctrl: Renesas RZ/A1 pin and gpio controller
  dt-bindings: pinctrl: Add RZ/A1 bindings doc
  arm: dts: dt-bindings: Add Renesas RZ pinctrl header
  arm: dts: r7s72100: Add pin controller node
  arm: dts: genmai: Add SCIF2 pin group
  arm: dts: genmai: Add RIIC2 pin group
  arm: dts: genmai: Add user led device nodes

 .../bindings/pinctrl/renesas,rza1-pinctrl.txt      | 144 +++
 arch/arm/boot/dts/r7s72100-genmai.dts              |  36 +
 arch/arm/boot/dts/r7s72100.dtsi                    |  80 ++
 drivers/pinctrl/Kconfig                            |  10 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinctrl-rza1.c                     | 963 +++++++++++++++++++++
 include/dt-bindings/pinctrl/r7s72100-pinctrl.h     |  36 +
 7 files changed, 1270 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
 create mode 100644 drivers/pinctrl/pinctrl-rza1.c
 create mode 100644 include/dt-bindings/pinctrl/r7s72100-pinctrl.h

-- 
2.7.4
