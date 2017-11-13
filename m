From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH  0/3] ARM: dts: Add PCIEC support
Date: Mon, 13 Nov 2017 17:43:09 +0000
Message-ID: <1510594992-63806-1-git-send-email-biju.das@bp.renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Chris Paterson <chris.paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

Hello,

This series aims to add PCIEC support for iWave RZ/G1M (R8A7743) board.

This patch has documentation dependency on below patch

* dt-bindings: PCI: rcar: Add device tree support for r8a7743
https://patchwork.kernel.org/patch/10056407/

This patch series has dependency on below patches

* ARM: dts: r8a7743: Add CAN[01] SoC support
https://patchwork.kernel.org/patch/10046875/

* ARM: dts: iwg20d-q7-common: Add can0 support to carrier board
https://patchwork.kernel.org/patch/10046879/

Biju Das (3):
  ARM: dts: r8a7743: Add default PCIe bus clock
  ARM: dts: r8a7743: Add PCIe Controller device node
  ARM: dts: iwg20d-q7: Enable PCIe Controller

 arch/arm/boot/dts/iwg20d-q7-common.dtsi |  8 ++++++++
 arch/arm/boot/dts/r8a7743.dtsi          | 35 +++++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)

-- 
1.9.1
