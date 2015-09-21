From: Jisheng Zhang <jszhang@marvell.com>
Subject: [PATCH v2 0/6] arm64: berlin: add pinctrl support
Date: Mon, 21 Sep 2015 18:04:14 +0800
Message-ID: <1442829860-4647-1-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sebastian.hesselbarth@gmail.com, linus.walleij@linaro.org, antoine.tenart@free-electrons.com, catalin.marinas@arm.com, will.deacon@arm.com, mark.rutland@arm.com, robh+dt@kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Jisheng Zhang <jszhang@marvell.com>
List-Id: devicetree@vger.kernel.org

This series adds support for Marvell berlin4ct pin-controller, allowing
to configure the pin muxing from the device tree.

Since v1:
 - use generic name for pin functions
 - a new commit to add pinmux for uart0
 - correct pinctrl usage in dts

Jisheng Zhang (6):
  pinctrl: berlin: regmap as an extra argument of berlin_pinctrl_probe()
  pinctrl: berlin: add the berlin4ct pinctrl driver
  arm64: berlin: add the pinctrl dependency for Marvell Berlin SoCs
  pinctrl: dt-binding: document berlin4ct SoC pinctrl
  arm64: dts: berlin4ct: add the pinctrl node
  arm64: dts: berlin4ct: add default pinmux for uart0

 .../devicetree/bindings/pinctrl/berlin,pinctrl.txt |   5 +-
 arch/arm64/Kconfig.platforms                       |   1 +
 arch/arm64/boot/dts/marvell/berlin4ct.dtsi         |  22 +
 drivers/pinctrl/berlin/Kconfig                     |   5 +
 drivers/pinctrl/berlin/Makefile                    |   1 +
 drivers/pinctrl/berlin/berlin-bg2.c                |  10 +-
 drivers/pinctrl/berlin/berlin-bg2cd.c              |  10 +-
 drivers/pinctrl/berlin/berlin-bg2q.c               |  10 +-
 drivers/pinctrl/berlin/berlin.c                    |   9 +-
 drivers/pinctrl/berlin/berlin.h                    |   1 +
 drivers/pinctrl/berlin/berlin4ct.c                 | 503 +++++++++++++++++++++
 11 files changed, 565 insertions(+), 12 deletions(-)
 create mode 100644 drivers/pinctrl/berlin/berlin4ct.c

-- 
2.5.3
