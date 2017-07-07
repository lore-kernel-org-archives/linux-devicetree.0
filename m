From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v 0/2] Add R8A7743/iwg20d-q7 Ethernet AVB support
Date: Fri,  7 Jul 2017 14:12:43 +0100
Message-ID: <1499433165-62475-1-git-send-email-biju.das@bp.renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Chris Paterson <chris.paterson2@renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Biju Das <biju.das@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

Hello,

This series aims to add device tree support for Ethernet AVB on R8A7743 SoC/iwg20d-q7 platform

This series has been tested against linux-next tag next-20170704.

It depends upon the patch 
https://www.mail-archive.com/netdev@vger.kernel.org/msg176852.html

Biju Das (2):
  ARM: dts: r8a7743: Add Ethernet AVB support
  ARM: dts: iwg20d-q7: Add Ethernet AVB support

 arch/arm/boot/dts/r8a7743-iwg20d-q7.dts | 21 +++++++++++++++++++++
 arch/arm/boot/dts/r8a7743.dtsi          | 13 +++++++++++++
 2 files changed, 34 insertions(+)

-- 
1.9.1
