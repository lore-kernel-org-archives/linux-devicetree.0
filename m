From: Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v5 0/2] pinctrl: nuvoton: add driver for NPCM7xx
Date: Mon,  6 Aug 2018 18:23:52 +0300
Message-ID: <20180806152354.340380-1-tmaimon77@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, yuenn@google.com, venture@google.com, brendanhiggins@google.com, avifishman70@gmail.com, joel@jms.id.au
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
List-Id: devicetree@vger.kernel.org

This patch set adds pinmux and GPIO controller for the Nuvoton
NPCM750/730/715/705 Baseboard Management Controller (BMC).

The Nuvoton BMC NPCM750/730/715/705 Pinmux functions accessible
only for pin groups and pinconf parameters available only for 
individual pins.

The Nuvoton BMC NPCM750/730/715/705 has eight identical GPIO 
modules, each module has 32 GPIO ports.

Most of the GPIO ports are multiplexed with other system functions.

The NPCM7xx pinctrl and GPIO driver tested on NPCM750 evaluation board.

Addressed comments from:.
 - Linus Walleij: https://www.spinics.net/lists/devicetree/msg243012.html
 
conversion about it with Linus Walleij:
 - https://www.spinics.net/lists/devicetree/msg241973.html
 
Changes since version 4:
 - Use direct access read and write functions.
 - Modify the probe GPIO and pinctrl order.
 - Remove unsupported BGPIOF_INVERTED_REG_DIR flag.
 - dt-binding documentation haven't changed.
 
Changes since version 3:
 - Remove Kconfig MFD_SYSCON dependency.
 - Add BGPIOF_INVERTED_REG_DIR flag.
 - dt-binding documentation haven't changed.

Changes since version 2:
 - Using GPIO_GENERIC (mmio).
 - Add Kconfig MFD_SYSCON dependency.
 - Remove unnecessary code from the direction output function.
 - dt-binding documentation haven't changed.
				  
Changes since version 1:
 - Remove Kconfig MFD_SYSCON dependency.
 - Modify setfunc function.
 - Modify dt-binding documentation according Rob comments. 

Tomer Maimon (2):
  dt-binding: pinctrl: Add NPCM7xx pinctrl and GPIO documentation
  pinctrl: nuvoton: add NPCM7xx pinctrl and GPIO driver

 .../bindings/pinctrl/nuvoton,npcm7xx-pinctrl.txt   |  216 ++
 drivers/pinctrl/Kconfig                            |    1 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/nuvoton/Kconfig                    |   12 +
 drivers/pinctrl/nuvoton/Makefile                   |    4 +
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c          | 2076 ++++++++++++++++++++
 6 files changed, 2310 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nuvoton,npcm7xx-pinctrl.txt
 create mode 100644 drivers/pinctrl/nuvoton/Kconfig
 create mode 100644 drivers/pinctrl/nuvoton/Makefile
 create mode 100644 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c

-- 
2.14.1
