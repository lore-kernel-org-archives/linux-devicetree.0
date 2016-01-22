From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] arm64: dts: r8a7795: Add USB3.0 host
Date: Fri, 22 Jan 2016 19:03:21 +0900
Message-ID: <1453457003-7720-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

This patch set is based on the latest renesas.git / renesas-devel-20160121-v4.4
tag. (commit id = 3740ade0617955c76e1767b6d49347d5446eed74)

This patch needs r8a7795-cpg-mssr.c update for usb3.0 clocks.

Yoshihiro Shimoda (2):
  arm64: dts: r8a7795: Add USB3.0 host device nodes
  arm64: dts: salvator-x: enable usb3.0 host channel 0

 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts |  4 ++++
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           | 18 ++++++++++++++++++
 2 files changed, 22 insertions(+)

-- 
1.9.1
