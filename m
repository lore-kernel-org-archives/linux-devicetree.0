From: <Andrei.Stefanescu@microchip.com>
Subject: [PATCH v4 0/2]  add SAMA5D2 PIOBU GPIO driver
Date: Wed, 12 Dec 2018 11:56:58 +0000
Message-ID: <1544615784-29331-1-git-send-email-andrei.stefanescu@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, robh+dt@kernel.org, gregkh@linuxfoundation.org, Nicolas.Ferre@microchip.com, mark.rutland@arm.com
Cc: Ludovic.Desroches@microchip.com, Cristian.Birsan@microchip.com, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Andrei.Stefanescu@microchip.com
List-Id: devicetree@vger.kernel.org

On SAMA5D2 SoC the PIOBU pins do not lose their
voltage during Backup/Self-refresh mode. This can
be useful, for example, when the voltage must remain
positive for a peripheral during Backup/Self-refresh
mode (suspend-to ram is the Linux equivalent state).

v4:
- readd Makefile and Kconfig changes which are missing in v3

v3:
- change driver's compatible to atmel,sama5d2-secumod
- get syscon using syscon_node_to_regmap(pdev->dev.of_node)
- document how to use SECUMOD as a gpio-controller

v2:
- make driver be a subnode of the syscon node
- change Kconfig to depend on MFD_SYSCON and select GPIO_SYSCON
- change include header from linux/gpio.h to linux/gpio/driver.h
- include linux/bits.h header
- change intrusion in comment to tamper
- fix kerneldoc of functions
- replace GPIOF_DIR_* flags with 0/1
- replace ?: statement with if-else
- remove the use of sama5d2_piobu_template_chip
- retrieve syscon via syscon_node_to_regmap(pdev->dev.parent->of_node);

Note that PIOBU_REG_SIZE is used to determine the register to write to
with regmap:
	reg =3D PIOBU_BASE + pin * PIOBU_REG_SIZE;

Also, no irq capability implemented.

Andrei Stefanescu (2):
  dt-bindings: arm: atmel: describe SECUMOD usage as a GPIO controller
  gpio: add driver for SAMA5D2 PIOBU pins

 .../devicetree/bindings/arm/atmel-sysregs.txt      |  12 +-
 MAINTAINERS                                        |   6 +
 drivers/gpio/Kconfig                               |  11 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-sama5d2-piobu.c                  | 253 +++++++++++++++++=
++++
 5 files changed, 282 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpio/gpio-sama5d2-piobu.c

--=20
2.7.4
