From: Qianggui Song <qianggui.song@amlogic.com>
Subject: [PATCH v3 0/4] pinctrl: meson-a1: add pinctrl driver
Date: Mon, 14 Oct 2019 18:54:48 +0800
Message-ID: <1571050492-6598-1-git-send-email-qianggui.song@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Qianggui Song <qianggui.song@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Carlo Caione <carlo@caione.org>, Rob Herring <robh+dt@kernel.org>, Xingyu Chen <xingyu.chen@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>, Hanjie Lin <hanjie.lin@amlogic.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patchset adds Pin controller driver support for Meson-A1 Soc
which shares the same register layout of pinmux with previous
Meson-G12A, however there is difference for gpio and pin config
registers in A1.

Changes since v2 at [1]:
 - make dt parser callback as a separate patch

Changes since v1 at [0]:
 - collect Reviewed-by
 - modify commit log
 - add an extra dt parser function for a1

[0] https://lore.kernel.org/linux-amlogic/1568700442-18540-1-git-send-email-qianggui.song@amlogic.com/
[1] https://lore.kernel.org/linux-amlogic/1570532999-23302-1-git-send-email-qianggui.song@amlogic.com/

Qianggui Song (4):
  pinctrl: add compatible for Amlogic Meson A1 pin controller
  pinctrl: meson: add a new dt parse callback for Meson-A series SoCs
  pinctrl: meson: add pinctrl driver support for Meson-A1 Soc
  arm64: dts: meson: a1: add pinctrl controller support

 .../devicetree/bindings/pinctrl/meson,pinctrl.txt  |   1 +
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |  18 +
 drivers/pinctrl/meson/Kconfig                      |   6 +
 drivers/pinctrl/meson/Makefile                     |   1 +
 drivers/pinctrl/meson/pinctrl-meson-a1.c           | 942 +++++++++++++++++++++
 drivers/pinctrl/meson/pinctrl-meson.c              |  16 +-
 drivers/pinctrl/meson/pinctrl-meson.h              |   7 +
 include/dt-bindings/gpio/meson-a1-gpio.h           |  73 ++
 8 files changed, 1063 insertions(+), 1 deletion(-)
 create mode 100644 drivers/pinctrl/meson/pinctrl-meson-a1.c
 create mode 100644 include/dt-bindings/gpio/meson-a1-gpio.h

-- 
1.9.1
