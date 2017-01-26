From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH 0/4] arm64: renesas: enable M3ULCB board peripherals
Date: Thu, 26 Jan 2017 17:53:42 +0300
Message-ID: <1485442422-18259-1-git-send-email-vladimir.barinov@cogentembedded.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Vladimir Barinov <vladimir.barinov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

Hello,

This adds the folowing:
- R8A7796 SoC based M3ULCB board peripherals

Vladimir Barinov (4):
[1/4] arm64: dts: m3ulcb: enable I2C
[2/4] arm64: dts: m3ulcb: Update memory node to 2 GiB map
[3/4] arm64: dts: m3ulcb: enable EthernetAVB
[4/4] arm64: dts: m3ulcb: enable HS200 for eMMC

---
This patchset is against the 'kernel/git/horms/renesas.git' repo.

 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts     | 50 +++++++++++++++++++++++++
 1 file changed, 50 insertions(+)
