From: Yixun Lan <yixun.lan@amlogic.com>
Subject: [PATCH v2 0/2] pinctrl: meson-g12a: add pinctrl driver support
Date: Sat, 14 Jul 2018 23:27:52 +0000
Message-ID: <20180714232754.5402-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Yixun Lan <yixun.lan@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, Rob Herring <robh@kernel.org>, Xingyu Chen <xingyu.chen@amlogic.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch series try to add pinctrl driver support for
the Meson-G12A SoC.

Changes since v1 at [1]
 - add Martin's Ack, Xingyu's Signed-off
 - squash patch 1,2 (documentation & header file)
 - explain pinctrl IP
 - notice GPIOE located in AO bank

[1] https://lkml.kernel.org/r/20180704224511.29350-1-yixun.lan@amlogic.com

Yixun Lan (2):
  documentation: pinctrl: Add compatibles for Amlogic Meson G12A pin
    controllers
  pinctrl: meson-g12a: add pinctrl driver support

 .../bindings/pinctrl/meson,pinctrl.txt        |    2 +
 drivers/pinctrl/meson/Kconfig                 |    6 +
 drivers/pinctrl/meson/Makefile                |    1 +
 drivers/pinctrl/meson/pinctrl-meson-g12a.c    | 1433 +++++++++++++++++
 include/dt-bindings/gpio/meson-g12a-gpio.h    |  114 ++
 5 files changed, 1556 insertions(+)
 create mode 100644 drivers/pinctrl/meson/pinctrl-meson-g12a.c
 create mode 100644 include/dt-bindings/gpio/meson-g12a-gpio.h

-- 
2.18.0
