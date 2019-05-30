Return-Path: <SRS0=7JyS=T6=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 0/3] Add basic HiHope RZ/G2M board support
Date: Thu, 30 May 2019 15:57:43 +0100
Message-Id: <1559228266-16724-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, xu_shunji@hoperun.com, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

The HiHope RZ/G2M board from HopeRun consists of main board
(HopeRun HiHope RZ/G2M main board) and sub board(HopeRun 
HiHope RZ/G2M sub board). The HiHope RZ/G2M sub board sits
below the HiHope RZ/G2M main board.

This series adds the device trees to describe the HW configuration
of the HiHope RZ/G2M, with some basic support.

This patch series based on linux-next next-20190528.

Biju Das (3):
  arm64: dts: renesas: Add HiHope RZ/G2M main board support
  arm64: dts: renesas: hihope-common: Add pincontrol support to
    scif2/scif clock
  arm64: dts: renesas: Add HiHope RZ/G2M sub board support

 arch/arm64/boot/dts/renesas/Makefile               |  2 +
 arch/arm64/boot/dts/renesas/hihope-common.dtsi     | 53 +++++++++++++++++++++
 arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi    | 55 ++++++++++++++++++++++
 .../boot/dts/renesas/r8a774a1-hihope-rzg2m-ex.dts  | 15 ++++++
 .../boot/dts/renesas/r8a774a1-hihope-rzg2m.dts     | 26 ++++++++++
 5 files changed, 151 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/hihope-common.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m.dts

-- 
2.7.4
