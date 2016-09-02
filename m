From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH v4 0/4] arm64: renesas: enable H3ULCB board peripherals
Date: Fri,  2 Sep 2016 15:04:41 +0300
Message-ID: <1472817881-11860-1-git-send-email-vladimir.barinov@cogentembedded.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Vladimir Barinov <vladimir.barinov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

Hello,

This adds the folowing:
- R8A7795 SoC based H3ULCB board peripherals

Vladimir Barinov (4):
[1/4] arm64: dts: h3ulcb: enable GPIO leds
[2/4] arm64: dts: h3ulcb: enable GPIO keys
[3/4] arm64: dts: h3ulcb: enable SDHI0
[4/4] arm64: dts: h3ulcb: Sound SSI support

---
This patchset is against the 'kernel/git/horms/renesas.git' repo.

 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts     | 189 +++++++++++++++++++++++++
 1 file changed, 189 insertions(+)
