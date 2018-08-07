From: Yixun Lan <yixun.lan@amlogic.com>
Subject: [PATCH v3 0/2] pinctrl: meson-g12a: add pinctrl driver support
Date: Tue, 7 Aug 2018 10:06:32 +0800
Message-ID: <20180807020634.18182-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Yixun Lan <yixun.lan@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Herring <robh@kernel.org>, Xingyu Chen <xingyu.chen@amlogic.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

  This patch series try to add pinctrl driver support for
the Meson-G12A SoC.

  The pinctrl driver for Meson-G12A SoC share the similar IP as
the previous Meson-AXG SoC, both use same pinmux ops (register layout).
But, a new driver is needed here due to the differences in the pins.

Changes since v2 at [2]
 - use ${FUNCTION}_${DOMAIN}_${PORT}_${PINFUNC}_${BANK}${PINNUM}
   to rename some pins
 - fix tdm groups
 - explain the similarity of pinmux between AXG and G12A - thanks Martin 
 - collect Rob's Reviewed-by

Changes since v1 at [1]
 - add Martin's Ack, Xingyu's Signed-off
 - squash patch 1,2 (documentation & header file)
 - explain pinctrl IP
 - notice GPIOE located in AO bank

[1] https://lkml.kernel.org/r/20180704224511.29350-1-yixun.lan@amlogic.com
[2] https://lkml.kernel.org/r/20180714232754.5402-1-yixun.lan@amlogic.com

Yixun Lan (2):
  documentation: pinctrl: Add compatibles for Amlogic Meson G12A pin
    controllers
  pinctrl: meson-g12a: add pinctrl driver support

 .../bindings/pinctrl/meson,pinctrl.txt        |    2 +
 drivers/pinctrl/meson/Kconfig                 |    6 +
 drivers/pinctrl/meson/Makefile                |    1 +
 drivers/pinctrl/meson/pinctrl-meson-g12a.c    | 1404 +++++++++++++++++
 include/dt-bindings/gpio/meson-g12a-gpio.h    |  114 ++
 5 files changed, 1527 insertions(+)
 create mode 100644 drivers/pinctrl/meson/pinctrl-meson-g12a.c
 create mode 100644 include/dt-bindings/gpio/meson-g12a-gpio.h

-- 
2.18.0
