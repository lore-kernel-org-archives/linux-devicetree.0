From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v5 00/10] Renesas RZ/A1 pin and gpio controller
Date: Thu, 27 Apr 2017 10:19:44 +0200
Message-ID: <1493281194-5200-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: linus.walleij@linaro.org, geert+renesas@glider.be, laurent.pinchart@ideasonboard.com, chris.brandt@renesas.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Geert,
   this is 5th round of gpio/pincontroller for RZ/A1 devices.

I have updated the pin controller driver to use the newly introduced
"pinctrl_enable()" function.
This is required since v4.11-rc7 as otherwise, as reported by Chris Brandt,
the pin controller does not start.

I have incorporated your comments on the device tree bindings documentation,
and added to pinctrl-generic.h header file two macros to unpack generic
properties and their arguments.

Tested with SCIF, RIIC, ETHER and gpio-leds on Genmai board.

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

v3 -> v4:
- use "pinmux" property in pmx sub-nodes in place of "renesas,pins"
- use pinconf standard properties to set pin mux additional flags
- add "bi-directional" and "output-enable" to pinconf generic properties
- perform pmx function parsing at dt_node_to_map() time
- change DT bindings to use GENERIC_PINCONF
- change DT bindings to allow sub-nodes to have "pinmux" property specified
- several renames (register names, DT parse functions, set_mux() function)

v4 -> v5:
- use pinctrl_enable() function in pin controller registration function
- update bindings documentation to incorporate Geert's comments
- add generic properties unpack macros

Jacopo Mondi (10):
  pinctrl: generic: Add bi-directional and output-enable
  pinctrl: generic: Add macros to unpack properties
  pinctrl: Renesas RZ/A1 pin and gpio controller
  dt-bindings: pinctrl: Add RZ/A1 bindings doc
  arm: dts: dt-bindings: Add Renesas RZ/A1 pinctrl header
  arm: dts: r7s72100: Add pin controller node
  arm: dts: genmai: Add SCIF2 pin group
  arm: dts: genmai: Add RIIC2 pin group
  arm: dts: genmai: Add user led device nodes
  arm: dts: genmai: Add ethernet pin group

 .../bindings/pinctrl/pinctrl-bindings.txt          |   2 +
 .../bindings/pinctrl/renesas,rza1-pinctrl.txt      | 219 +++++
 arch/arm/boot/dts/r7s72100-genmai.dts              |  76 ++
 arch/arm/boot/dts/r7s72100.dtsi                    |  78 ++
 drivers/pinctrl/Kconfig                            |  11 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinconf-generic.c                  |   3 +
 drivers/pinctrl/pinctrl-rza1.c                     | 995 +++++++++++++++++++++
 include/dt-bindings/pinctrl/r7s72100-pinctrl.h     |  16 +
 include/linux/pinctrl/pinconf-generic.h            |   7 +-
 10 files changed, 1407 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
 create mode 100644 drivers/pinctrl/pinctrl-rza1.c
 create mode 100644 include/dt-bindings/pinctrl/r7s72100-pinctrl.h

--
2.7.4

