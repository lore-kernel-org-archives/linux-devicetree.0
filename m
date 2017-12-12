From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 0/5] Add Sound support for iWave RZ/G1M board
Date: Tue, 12 Dec 2017 18:25:06 +0000
Message-ID: <1513103111-45830-1-git-send-email-biju.das@bp.renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Chris Paterson <chris.paterson2@renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Biju Das <biju.das@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

This series aims to add sound support for iWave RZ/G1M board.

This patch series has documentation dependency on 
https://patchwork.kernel.org/patch/10108014/

Biju Das (5):
  ARM: shmobile: defconfig: Enable SGTL5000 audio codec
  ARM: dts: r8a7743: Add audio clocks
  ARM: dts: r8a7743: Add audio DMAC support
  ARM: dts: r8a7743: Add sound support
  ARM: dts: iwg20d-q7-common: Enable SGTL5000 audio codec

 arch/arm/boot/dts/iwg20d-q7-common.dtsi |  24 +++
 arch/arm/boot/dts/r8a7743.dtsi          | 270 ++++++++++++++++++++++++++++++++
 arch/arm/configs/shmobile_defconfig     |   1 +
 3 files changed, 295 insertions(+)

-- 
1.9.1
