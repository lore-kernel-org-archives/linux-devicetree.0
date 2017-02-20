From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Renesas RZ/A1 pin and gpio controller
Date: Mon, 20 Feb 2017 18:13:01 +0100
Message-ID: <1487610788-6939-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: geert+renesas@glider.be, laurent.pinchart@ideasonboard.com, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello,
   this is the first submission of combined GPIO and pin controller driver
for Renesas RZ/A1 SoC.

Compared to my RFC series on the same subject, this new implementation
supports a single SoC. If more devices with a similar pin controller will
arrive later, we will consider supporting them through this driver.

The series adds the driver itself and register the pincontroller in dtsi.
The pin controller hardware supports 12 ports, each of them is also a gpio
controller.

The series makes use of pinctrl and pinmux generic function currently
available in Linus Walleij's linux-pinctrl.git tree.

Testing done veryfing functionalities of hardware modules enabled in device
tree (SCIF2 for serial output, RIIC for accessing an internal eeprom chip and
user visible leds).
Gpio have been also verified using a i2c-gpio device in place of the native
RIIC one to access the same eeprom device.

Thanks
   j

Jacopo Mondi (7):
  pinctrl: Renesas RZ/A1 pin and gpio controller
  Documentation: devicetree: bindings: Add RZ/A1 pinctrl binding
    documentation
  arm: dts: dt-bindings: Add Renesas RZ pinctrl header
  arm: dts: r7s72100: Add pin controller node
  arm: dts: genmai: Add SCIF2 pin group
  arm: dts: genmai: Add RIIC2 pin group
  arm: dts: genmai: Add user led device nodes

 .../bindings/pinctrl/renesas,rza1-pinctrl.txt      |  114 +++
 arch/arm/boot/dts/r7s72100-genmai.dts              |   35 +
 arch/arm/boot/dts/r7s72100.dtsi                    |   81 ++
 drivers/pinctrl/Kconfig                            |   10 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/pinctrl-rza1.c                     | 1026 ++++++++++++++++++++
 include/dt-bindings/pinctrl/r7s72100-pinctrl.h     |   30 +
 7 files changed, 1297 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
 create mode 100644 drivers/pinctrl/pinctrl-rza1.c
 create mode 100644 include/dt-bindings/pinctrl/r7s72100-pinctrl.h

-- 
2.7.4

