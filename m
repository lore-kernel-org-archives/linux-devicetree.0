From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH  0/4] ARM: dts: Add USB function support
Date: Mon,  9 Oct 2017 14:21:17 +0100
Message-ID: <1507555281-57845-1-git-send-email-biju.das@bp.renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, Chris Paterson <chris.paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

Hello,

This series aims to add USB function support for iWave RZ/G1M (R8A7743) board.
This series has been tested against renesas-dev tag 201710109-v4.14-rc4.

This patch has documentation dependency on below patches

* [v2] usb: renesas_usbhs: Add compatible string for r8a7743/5
https://patchwork.kernel.org/patch/9990063/
* [v2] dmaengine: usb-dmac: Add compatible string for r8a7743/5
https://patchwork.kernel.org/patch/9990113/

Regards,

Biju Das (4):
  ARM: dts: r8a7743: Add HS-USB device node
  ARM: dts: iwg20d-q7: Enable HS-USB
  ARM: dts: r8a7743: Add USB-DMAC device nodes
  ARM: dts: r8a7743: Enable DMA for HSUSB

 arch/arm/boot/dts/iwg20d-q7-common.dtsi |  8 +++++-
 arch/arm/boot/dts/r8a7743.dtsi          | 45 +++++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+), 1 deletion(-)

-- 
1.9.1
