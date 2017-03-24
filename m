From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v3 0/8] Renesas RZ/A1 pin and gpio controller
Date: Fri, 24 Mar 2017 16:22:07 +0100
Message-ID: <1490368934-12494-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: geert+renesas@glider.be, laurent.pinchart@ideasonboard.com, chris.brandt@renesas.com, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello!

Third round for Renesas RZ/A1 PFC gpio and pin controller.

V3 fixes review comments on grammar and spelling by Geert.
Some other fixes from Geert's review as update of function argument names
to reflect the function purpose (s/offset/[pin|bit]), use irqsave/irqrestore
version of spinlocks locking/unlocking methods and other style fixes.

Still an open question on the use of "pins" or "renesas,pins" property in
device tree bindings:
https://www.spinics.net/lists/linux-renesas-soc/msg12765.html

Tested on Genmai and RSK boards with SCIF, I2c and GPIO (genmai) and SCIF, I2c,
SDHI and ethernet on RSK (thanks Chris).

Thanks
   j

v1 -> v2:
- change pin configuration flags as suggested by Chris
- gpio set direction function fixed as suggested by Chris
- add some more example on pin configuration flag usage to dt-binding doc
- fix gpio-controller names to remove unit address as suggested by Geert
- some comments chopped here and there to make the driver less verbose

v2 -> v3:
- fix grammar and syntax in comment and documentation
- fix code style (reverse xmas tree ordering in variable declaration)
- use irqsave/irqrestore in spinlock lock/unlock
- use devm_ version of kasprintf (memory returned was not properly free)
- use bitops.h operation ffs and fls to make sure a single bit is set in pmx
  mask
- Add Geert's reviewed-by to DTS patches

Jacopo Mondi (8):
  pinctrl: Renesas RZ/A1 pin and gpio controller
  dt-bindings: pinctrl: Add RZ/A1 bindings doc
  arm: dts: dt-bindings: Add Renesas RZ pinctrl header
  arm: dts: r7s72100: Add pin controller node
  arm: dts: genmai: Add SCIF2 pin group
  arm: dts: genmai: Add RIIC2 pin group
  arm: dts: genmai: Add user led device nodes
  arm: dts: genmai: Add ethernet pin group

 .../bindings/pinctrl/renesas,rza1-pinctrl.txt      | 143 +++
 arch/arm/boot/dts/r7s72100-genmai.dts              |  68 ++
 arch/arm/boot/dts/r7s72100.dtsi                    |  80 ++
 drivers/pinctrl/Kconfig                            |  10 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinctrl-rza1.c                     | 961 +++++++++++++++++++++
 include/dt-bindings/pinctrl/r7s72100-pinctrl.h     |  36 +
 7 files changed, 1299 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
 create mode 100644 drivers/pinctrl/pinctrl-rza1.c
 create mode 100644 include/dt-bindings/pinctrl/r7s72100-pinctrl.h

-- 
2.7.4

