Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] arm64: dts: renesas: Add support for R-Car E3 and Ebisu board
Date: Wed, 11 Apr 2018 18:37:40 +0900
Message-Id: <1523439462-1130-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch is based on the renesas-drivers-2018-04-03-v4.16 tag of
renesas-drivers.git.

This code doesn't use dt-bindings definitions to avoid dependency.

Takeshi Kihara (1):
  arm64: dts: renesas: Add Renesas Ebisu board support

Yoshihiro Shimoda (1):
  arm64: dts: renesas: Add Renesas R8A77990 SoC support

 arch/arm64/boot/dts/renesas/Makefile           |   1 +
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts |  37 +++++++
 arch/arm64/boot/dts/renesas/r8a77990.dtsi      | 131 +++++++++++++++++++++++++
 3 files changed, 169 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a77990.dtsi

-- 
1.9.1
