From: <Andrei.Stefanescu@microchip.com>
Subject: [PATCH 0/3] add sama5d2 PIOBU GPIO driver
Date: Wed, 7 Nov 2018 15:12:24 +0000
Message-ID: <1541603580-17448-1-git-send-email-andrei.stefanescu@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gregkh@linuxfoundation.org, Nicolas.Ferre@microchip.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: Ludovic.Desroches@microchip.com, Cristian.Birsan@microchip.com, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Andrei.Stefanescu@microchip.com
List-Id: devicetree@vger.kernel.org

On sama5d2 SoC the PIOBU pins do not lose their
voltage during Backup/Self-refresh mode. This can
be useful, for example, when the voltage must remain
positive for a peripheral during Backup/Self-refresh
mode (suspend-to ram is the Linux equivalent state).

This patch series:
- documents the driver's necessary device tree bindings
- adds a MAINTAINER for the driver,
- provides a basic GPIO controller driver for them

Andrei Stefanescu (3):
  dt-bindings: gpio: add sama5d2 PIOBU support
  MAINTAINERS: add maintainer for sama5d2 PIOBU GPIO driver
  gpio: added driver for sama5d2 PIOBU pins

 .../bindings/gpio/gpio-sama5d2-piobu.txt           |  23 ++
 MAINTAINERS                                        |   7 +
 drivers/gpio/Kconfig                               |  10 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-sama5d2-piobu.c                  | 254 +++++++++++++++++=
++++
 5 files changed, 295 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-sama5d2-pio=
bu.txt
 create mode 100644 drivers/gpio/gpio-sama5d2-piobu.c

--=20
2.7.4
