From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 0/4] arm64: dts: r8a7795: Add HSUSB device node and enable channel 0 of USB2.0
Date: Tue, 24 May 2016 19:34:14 +0900
Message-ID: <1464086058-1276-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

This patch is based on the renesas-drivers / renesas-drivers-2016-05-17-v4.6 tag.

Changes from v1:
 - fix compatible string of hsusb in patch 1.
 - fix patch 2 for "make dtbs W=1" warning.

Yoshihiro Shimoda (4):
  arm64: dts: r8a7795: Add HSUSB device node
  arm64: dts: salvator-x: enable usb2_phy of channel 0
  arm64: dts: salvator-x: enable USB 2.0 Host channel 0
  arm64: dts: salvator-x: enable HSUSB

 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 36 ++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           | 17 ++++++++++
 2 files changed, 53 insertions(+)

-- 
1.9.1
