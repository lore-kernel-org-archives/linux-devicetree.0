From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/3] arm64: dts: renesas: fix avb_pins on some boards
Date: Tue,  3 Oct 2017 13:57:10 +0900
Message-ID: <1507006633-28258-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

This patch set is based on the renesas.git /
renesas-devel-20171002-v4.14-rc3 tag.

Yoshihiro Shimoda (3):
  arm64: dts: renesas: salvator-common: drop "avb_phy_int" from avb_pins
  arm64: dts: renesas: ulcb: drop "avb_phy_int" from avb_pins
  arm64: dts: renesas: r8a77995: draak: drop "avb_phy_int" from avb_pins

 arch/arm64/boot/dts/renesas/r8a77995-draak.dts   | 3 +--
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 3 +--
 arch/arm64/boot/dts/renesas/ulcb.dtsi            | 3 +--
 3 files changed, 3 insertions(+), 6 deletions(-)

-- 
1.9.1
