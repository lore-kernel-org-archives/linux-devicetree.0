From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH 0/9] arm64: renesas: add M3ULCB board
Date: Thu,  3 Nov 2016 21:06:15 +0300
Message-ID: <1478196375-1131-1-git-send-email-vladimir.barinov@cogentembedded.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Vladimir Barinov <vladimir.barinov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

Hello,

This adds the folowing:
- R8A7796 SoC based M3ULCB (R-Car Starter Kit Pro) device tree
- Document DT bindings

Vladimir Barinov (9):
[1/9] dt: arm: shmobile: add M3ULCB board DT bindings
[2/9] arm64: dts: m3ulcb: initial device tree
[3/9] arm64: dts: m3ulcb: enable SCIF clk and pins
[4/9] arm64: dts: m3ulcb: enable GPIO leds
[5/9] arm64: dts: m3ulcb: enable GPIO keys
[6/9] arm64: dts: m3ulcb: enable SDHI0
[7/9] arm64: dts: m3ulcb: enable EXTALR clk
[8/9] arm64: dts: m3ulcb: enable WDT
[9/9] arm64: dts: m3ulcb: enable SDHI2

---
This patchset is against the 'kernel/git/horms/renesas.git' repo.

 Documentation/devicetree/bindings/arm/shmobile.txt |   2 +
 arch/arm64/boot/dts/renesas/Makefile               |   2 +-
 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts     | 189 +++++++++++++++++++++
 3 files changed, 192 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
