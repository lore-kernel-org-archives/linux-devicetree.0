Return-Path: <SRS0=8Fol=Q4=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 0/5] Add EPSON RX-8571 RTC support
Date: Thu, 21 Feb 2019 09:40:43 +0000
Message-Id: <1550742048-28068-1-git-send-email-biju.das@bp.renesas.com>
To: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This patch set aims to add support for EPSON RX-8571 real-time clock.
EPSON RX-8571 rtc is compatible with EPSON RX-8581 rtc except that
former has 16 bytes additional RAM.

1 byte of nvmem is supported on both RX-8581 and RX-8571. It is
exposed through sysfs along with  support for 16 bytes additional RAM
present only on EPSON RX-8571.

This patch series is tested against renesas-dev and linux-next.

Biju Das (5):
  rtc: rx8581: Add rx8571 compatible
  rtc: rx8581: Add support for rx8571 RTC
  rtc: rx8581: Add support for Epson rx8571 RTC
  arm64: defconfig: enable RX-8581 config option
  arm64: dts: renesas: r8a774c0-cat874: add RTC support

 Documentation/devicetree/bindings/rtc/rtc.txt   |   1 +
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts |  18 ++++
 arch/arm64/configs/defconfig                    |   1 +
 drivers/rtc/Kconfig                             |   5 +-
 drivers/rtc/rtc-rx8581.c                        | 114 ++++++++++++++++++++++--
 5 files changed, 128 insertions(+), 11 deletions(-)

-- 
2.7.4
