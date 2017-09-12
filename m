From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 00/11] Add R8A77970/Eagle board support
Date: Tue, 12 Sep 2017 23:37:16 +0300
Message-ID: <20170912203716.238067587__38917.2330186286$1505250334$gmane$org@cogentembedded.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Simon Horman <horms@verge.net.au>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello.

   Here's the set of 11 patches against Simon Horman's 'renesas.git' repo's
'renesas-devel-20170911v2-v4.13' tag. I'm adding the device tree support for
the R8A77970-based Eagle board. The necessary SYS-DMAC, [H]SCIF, and EtherAVB
bindings updates have been posted earlier.

[01/11] soc: renesas: identify R-Car V3M
[02/11] soc: renesas: rcar-rst: add R8A77970 support
[03/11] dt-bindings: power: add R8A77970 SYSC power domain definitions
[04/11] soc: renesas: rcar-sysc: add R8A77970 support
[05/11] arm64: dts: renesas: initial R8A77970 SoC device tree
[06/11] arm64: dts: renesas: r8a77970: add SYS-DMAC support
[07/11] arm64: dts: renesas: r8a77970: add [H]SCIF support
[08/11] arm64: dts: renesas: r8a77970: add EtherAVB support
[09/11] arm64: renesas: document Eagle board
[11/11] arm64: dts: renesas: initial Eagle board device tree
[11/11] arm64: dts: renesas: eagle: add EtherAVB support

WBR, Sergei
