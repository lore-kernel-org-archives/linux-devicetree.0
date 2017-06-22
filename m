From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v6 00/8] Renesas RZ/A1 pin and gpio controller
Date: Thu, 22 Jun 2017 16:54:28 +0200
Message-ID: <1498143276-7976-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linus.walleij@linaro.org, geert+renesas@glider.be, laurent.pinchart@ideasonboard.com, chris.brandt@renesas.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, aisheng.dong@nxp.com
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello,
   this is 6th round of RZ/A1 pin controller patch series.

Where did we stop: discussion from pin controller driver shifted toward two
new generic pin configuration properties I added to the previous series
(bi-directional and output-enable).

After a really long discussion, we decided to go for handling internally all
bi-directional use cases, making the generic property not a requirement for the
series. Interestingly, we recently found out the number of pins actually
requiring this flag is less (~half) than what reported by the processor manual,
so we could have handled these internally from day one :(

We also now manage internally pins requiring IO direction specified in software
even when configured in alternate function mode (SWIO mode). Most of them are
handled by the driver, some of them have to come from DTS as the user can freely
select if they have to be inputs or outputs. For those pins, and after another
discussion involving NXP developers, we decided to use input-enable and
output-enable properties. I have just sent a patch to add output-enable to the
generic pin configuration properties, but it is currently under discussion.

However, none of the pins currently configured by mainline DTS require those
properties to be specified, so I have dropped in this driver any dependency on
output-enable property, and I'm using instead the already in place
PIN_CONFIG_OUTPUT one. Once output-enable will eventually be accepted, we can
update the driver to make use of it, but since there are no use cases for that
at the moment, it makes not too much sense holding this series back for that.

The total memory occupation we were so worried about of bi-directional and swio
pin tables is now around 100 bytes, because of how the number of pins actually
needing those flags has  reduced and because of how we have arranged the
tables using bitfield structures (credits to Geert here).

Having cleared out dependencies on new pin configuration properties and having
made configuration flags a driver specific issue, I hope this version can be
accepted and land in forthcoming pull request for Renesas PFC updates from
Geert, pending some feedback from the linux-gpio community.

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

v5 -> v6:
- add tables in driver to manage bi-directional and swio flags
- drop dependecies on new generic pin configuration properties

Jacopo Mondi (8):
  pinctrl: Renesas RZ/A1 pin and gpio controller
  dt-bindings: pinctrl: Add RZ/A1 bindings doc
  arm: dts: dt-bindings: Add Renesas RZ/A1 pinctrl header
  arm: dts: r7s72100: Add pin controller node
  arm: dts: genmai: Add SCIF2 pin group
  arm: dts: genmai: Add RIIC2 pin group
  arm: dts: genmai: Add user led device nodes
  arm: dts: genmai: Add ethernet pin group

 .../bindings/pinctrl/renesas,rza1-pinctrl.txt      |  218 ++++
 arch/arm/boot/dts/r7s72100-genmai.dts              |   69 ++
 arch/arm/boot/dts/r7s72100.dtsi                    |   78 ++
 drivers/pinctrl/Kconfig                            |   11 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/pinctrl-rza1.c                     | 1309 ++++++++++++++++++++
 include/dt-bindings/pinctrl/r7s72100-pinctrl.h     |   16 +
 7 files changed, 1702 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
 create mode 100644 drivers/pinctrl/pinctrl-rza1.c
 create mode 100644 include/dt-bindings/pinctrl/r7s72100-pinctrl.h

--
2.7.4
