From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 0/8] Add Renesas R8A77970/Eagle board support
Date: Fri, 15 Sep 2017 22:43:18 +0300
Message-ID: <20170915193718.359780292@cogentembedded.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Simon Horman <horms@verge.net.au>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello.

   Here's the set of 8 patches against Simon Horman's 'renesas.git' repo's
'renesas-devel-20170915-v4.13' tag. I'm adding the device tree support for
the R8A77970-based Eagle board. Already merged patches will not be reposted.
The necessary SYS-DMAC, [H]SCIF, and EtherAVB bindings updates have been
posted earlier.

[1/8] soc: renesas: rcar-sysc: add R8A77970 support
[2/8] arm64: dts: renesas: initial R8A77970 SoC device tree
[3/8] arm64: dts: renesas: r8a77970: add SYS-DMAC support
[4/8] arm64: dts: renesas: r8a77970: add [H]SCIF support
[5/8] arm64: dts: renesas: r8a77970: add EtherAVB support
[6/8] arm64: renesas: document Eagle board bindings
[7/8] arm64: dts: renesas: initial Eagle board device tree
[8/8] arm64: dts: renesas: eagle: add EtherAVB support

WBR, Sergei
