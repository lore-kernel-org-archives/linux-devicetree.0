From: <Claudiu.Beznea@microchip.com>
Subject: [PATCH v3 0/7] add support for SAM9X60 pin controller
Date: Thu, 7 Feb 2019 09:24:42 +0000
Message-ID: <1549531468-1676-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com, Ludovic.Desroches@microchip.com
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Claudiu.Beznea@microchip.com
List-Id: devicetree@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea@microchip.com>

This series adds drive strenght and slew rate support for SAMX60's pin
controller. For drive strenght we could have 2 values: low, high.
For slew rate we could have 2 values: enable, disabled.

Besides this I took the chance and adapt the documentation for at91 pinctrl
driver.

Changes in v3:
- fix checkpatch.pl warning on DBG_SHOW_FLAG_MASKED() macro in patch 1/7
- add Ack-by tag

Changes in v2:
- s/microchip,sam9x60-pictrl/microchip,sam9x60-pinctrl in patches 3/7, 5/7

Claudiu Beznea (7):
  pinctrl: at91: add option to use drive strength bits
  pinctrl: at91: add drive strength support for SAM9X60
  pinctrl: at91: add compatibles for SAM9X60 pin controller
  dt-bindings: add documentation for banks
  dt-bindings: add bindings for SAM9X60
  pinctrl: at91: add slewrate support for SAM9X60
  dt-bindings: add documentation for slew rate

 .../bindings/pinctrl/atmel,at91-pinctrl.txt        |  27 ++++-
 drivers/pinctrl/pinctrl-at91.c                     | 134 +++++++++++++++++=
++--
 drivers/pinctrl/pinctrl-at91.h                     |   3 +
 include/dt-bindings/pinctrl/at91.h                 |   4 +
 4 files changed, 155 insertions(+), 13 deletions(-)

--=20
2.7.4
