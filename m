Return-Path: <SRS0=lwod=N6=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH  0/4] Add NXP pcf85263 real-time clock support
Date: Mon, 19 Nov 2018 11:15:04 +0000
Message-Id: <1542626108-61344-1-git-send-email-biju.das@bp.renesas.com>
To: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This patch set aims to add support for NXP pcf85263 real-time clock. 
pcf85263 rtc is compatible with pcf85363 rtc except that pcf85363 has
64 bytes additional RAM. 

1 byte of nvmem is supported in pcf85263 and is exposed through sysfs.

The details of pcf85363 and pcf85263 can be found in the below
data sheets.

https://www.nxp.com/docs/en/data-sheet/PCF85363A.pdf

https://www.nxp.com/docs/en/data-sheet/PCF85263A.pdf


This patch is tested against linux-next and renesas-dev.

Biju Das (4):
  dt-bindings: rtc: pcf85363: Document pcf85263 real-time clock
  rtc: pcf85363: Add support for NXP pcf85263 rtc
  ARM: shmobile: Enable NXP pcf85363 rtc in shmobile_defconfig
  ARM: dts: iwg23s-sbc: Enable RTC

 Documentation/devicetree/bindings/rtc/pcf85363.txt |  4 +-
 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts          | 18 +++++++++
 arch/arm/configs/shmobile_defconfig                |  1 +
 drivers/rtc/rtc-pcf85363.c                         | 44 +++++++++++++++++++---
 4 files changed, 60 insertions(+), 7 deletions(-)

-- 
2.7.4
