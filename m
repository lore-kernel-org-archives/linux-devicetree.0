From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH  0/5] Add USB2.0 Host support
Date: Mon,  9 Oct 2017 14:58:56 +0100
Message-ID: <1507557541-46560-1-git-send-email-biju.das@bp.renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, Chris Paterson <chris.paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

Hello,

This series aims to add USB2.0 Host support on iWave RZ/G1E(r8a7745) based board.

This series has been tested against renesas-dev tag 20171009-v4.14-rc4

This patch has documentation dependency on below patch
 * [RESEND] phy: rcar-gen2: Add r8a7743/5 support
https://patchwork.kernel.org/patch/9992587/

Biju Das (5):
  ARM: dts: r8a7745: Add internal PCI bridge nodes
  ARM: dts: r8a7745: Add USB PHY DT support
  ARM: dts: r8a7745: Link PCI USB devices to USB PHY
  ARM: dts: iwg22d-sodimm: Enable internal PCI
  ARM: dts: iwg22d-sodimm: Enable USB PHY

 arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts | 15 +++++
 arch/arm/boot/dts/r8a7745.dtsi              | 92 +++++++++++++++++++++++++++++
 2 files changed, 107 insertions(+)

-- 
1.9.1
