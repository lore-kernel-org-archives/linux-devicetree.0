From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/3] arm64: dts: r8a7796: add usb host device nodes
Date: Thu,  3 Aug 2017 21:28:41 +0900
Message-ID: <1501763324-26028-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

This patch is based on the renesas.git / renesas-devel-20170731v2-v4.13-rc3 tag.

For usb2.0 host, we need the following patch:
 https://patchwork.kernel.org/patch/9864583/

For usb3.0 host, we need the following patch:
 https://patchwork.kernel.org/patch/9864579/

Yoshihiro Shimoda (3):
  arm64: dts: r8a7796: add usb2_phy device nodes
  arm64: dts: r8a7796: add USB2.0 Host (EHCI/OHCI) device nodes
  arm64: dts: r8a7795: Add USB3.0 host device node

 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 70 ++++++++++++++++++++++++++++----
 1 file changed, 63 insertions(+), 7 deletions(-)

-- 
1.9.1
