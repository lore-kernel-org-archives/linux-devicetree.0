From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/3] arm64: dts: renesas: r8a7795: salvator-xs: enable usb 2.0 channel 3
Date: Wed, 26 Jul 2017 20:30:57 +0900
Message-ID: <1501068660-4032-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

This patch is based on the renesas-drivers.git /
renesas-drivers-2017-07-18-v4.13-rc1 tag and
"pinctrl: sh-pfc: r8a7795: add usb2.0 on R-Car H3 ES2.0" patch set and
"arm64: dts: renesas: r8a7795: add usb2.0 for R-Car H3 ES2.0" patch set.

Yoshihiro Shimoda (3):
  arm64: dts: renesas: r8a7795: salvator-xs: enable usb2_phy ch3
  arm64: dts: renesas: r8a7795: salvator-xs: enable USB 2.0 channel 3
  arm64: dts: renesas: r8a7795: salvator-xs: enable HSUSB channel 3

 .../arm64/boot/dts/renesas/r8a7795-salvator-xs.dts | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

-- 
1.9.1
