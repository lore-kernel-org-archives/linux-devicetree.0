From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 0/2] Add HDMI support to iwg22d
Date: Mon,  6 Nov 2017 18:26:52 +0000
Message-ID: <1509992814-4543-1-git-send-email-fabrizio.castro@bp.renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert@linux-m68k.org>, Chris Paterson <chris.paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello,

this series aims to add HDMI support to iWave RZ/G1E (R8A7745) board.
This series has been tested against renesas-devel-20171106-v4.14-rc8.

Fabrizio Castro (2):
  ARM: dts: r8a7745: Add DU support
  ARM: dts: iwg22d-sodimm-dbhd-ca: Add HDMI video output

 .../arm/boot/dts/r8a7745-iwg22d-sodimm-dbhd-ca.dts | 85 ++++++++++++++++++++++
 arch/arm/boot/dts/r8a7745.dtsi                     | 27 +++++++
 2 files changed, 112 insertions(+)

-- 
2.7.4
