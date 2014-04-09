From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 0/4] arm: Add basic support for Mediatek Cortex-A7 SoCs
Date: Wed,  9 Apr 2014 21:45:32 +0200
Message-ID: <1397072736-10793-1-git-send-email-matthias.bgg@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rdunlap@infradead.org, linux@arm.linux.org.uk, daniel.lezcano@linaro.org, tglx@linutronix.de, matthias.bgg@gmail.com, thierry.reding@gmail.com, florian.vaussard@epfl.ch, jic23@kernel.org, jason@lakedaemon.net, andrew@lunn.ch, silvio.fricke@gmail.com, heiko.stuebner@bq.com, olof@lixom.net, sebastian.hesselbarth@gmail.com, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch set adds basic support for the Mediatek Cortex-A7 SoCs.
Support is quite basic, as the only components working up to now are the
timers and the low-level debug via UART.

The patch series is build against torvalds/master tree


Matthias Brugger (4):
  clocksource: Add support for the Mediatek SoCs
  dt-bindings: add mtk-timer bindings
  arm: add basic support for Mediatek MT6589 boards
  arm: mediatek: Add earlyprintk support for MT6589

 .../bindings/timer/mediatek,mtk-timer.txt          |   19 ++
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 arch/arm/Kconfig                                   |    2 +
 arch/arm/Kconfig.debug                             |   49 +++-
 arch/arm/Makefile                                  |    1 +
 arch/arm/boot/dts/mtk6589.dtsi                     |  105 +++++++++
 arch/arm/include/debug/mediatek.S                  |   38 +++
 arch/arm/mach-mediatek/Kconfig                     |   14 ++
 arch/arm/mach-mediatek/Makefile                    |    1 +
 arch/arm/mach-mediatek/mediatek.c                  |   40 ++++
 drivers/clocksource/Kconfig                        |    4 +
 drivers/clocksource/Makefile                       |    1 +
 drivers/clocksource/mtk_timer.c                    |  248 ++++++++++++++++++++
 13 files changed, 521 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
 create mode 100644 arch/arm/boot/dts/mtk6589.dtsi
 create mode 100644 arch/arm/include/debug/mediatek.S
 create mode 100644 arch/arm/mach-mediatek/Kconfig
 create mode 100644 arch/arm/mach-mediatek/Makefile
 create mode 100644 arch/arm/mach-mediatek/mediatek.c
 create mode 100644 drivers/clocksource/mtk_timer.c

-- 
1.7.9.5
