From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH  0/2] Add BQ32000 RTC support for iWave RZ/G1M board
Date: Tue,  8 Aug 2017 14:04:23 +0100
Message-ID: <1502197465-61546-1-git-send-email-biju.das@bp.renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Chris Paterson <chris.paterson2@renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Biju Das <biju.das@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

This series aims to add BQ32000 RTC support for iWave RZ/G1M board.

This series has been tested against Linux-next tag 20170727 and renesas-dev branch.
This patch series depends on https://www.spinics.net/lists/arm-kernel/msg599220.html

Biju Das (2):
  ARM: dts: iwg20d-q7: Add RTC support
  ARM: shmobile: Enable BQ32000 rtc in shmobile_defconfig

 arch/arm/boot/dts/r8a7743-iwg20d-q7.dts | 18 ++++++++++++++++++
 arch/arm/configs/shmobile_defconfig     |  1 +
 2 files changed, 19 insertions(+)

-- 
1.9.1
