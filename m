Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/3] arm64: renesas: Add Renesas R8A77990 support
Date: Wed, 11 Apr 2018 18:35:50 +0900
Message-Id: <1523439353-980-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch is based on the renesas-drivers-2018-04-03-v4.16 tag of
renesas-drivers.git.

Yoshihiro Shimoda (3):
  dt-bindings: arm: Document R-Car E3 SoC DT bindings
  dt-bindings: arm: Document Renesas Ebisu board DT bindings
  arm64: renesas: Add Renesas R8A77990 Kconfig support

 Documentation/devicetree/bindings/arm/shmobile.txt | 4 ++++
 arch/arm64/Kconfig.platforms                       | 6 ++++++
 2 files changed, 10 insertions(+)

-- 
1.9.1
