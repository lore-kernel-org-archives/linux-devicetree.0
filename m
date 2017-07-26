From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/5] arm64: dts: renesas: r8a7795: add usb2.0 for R-Car H3 ES2.0
Date: Wed, 26 Jul 2017 20:29:35 +0900
Message-ID: <1501068580-3981-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

This patch is based on the renesas-drivers.git /
renesas-drivers-2017-07-18-v4.13-rc1 tag.

Kazuya Mizuguchi (1):
  arm64: dts: renesas: r8a7795: Add usb companion property in EHCI

Yoshihiro Shimoda (4):
  arm64: dts: renesas: r8a7795: add usb2_phy ch3 device node
  arm64: dts: renesas: r8a7795: add usb2.0 host ch3 device nodes
  arm64: dts: renesas: r8a7795: add usb-dmac ch2 and ch3 device nodes
  arm64: dts: renesas: r8a7795: add hsusb ch3 device node

 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi |  8 +++
 arch/arm64/boot/dts/renesas/r8a7795.dtsi     | 85 ++++++++++++++++++++++++++++
 2 files changed, 93 insertions(+)

-- 
1.9.1
