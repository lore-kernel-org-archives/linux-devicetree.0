From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/2] Add R8A77970/Eagle GPIO support
Date: Tue, 14 Nov 2017 00:23:19 +0300
Message-ID: <20171113212319.775334314@cogentembedded.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello!

Here's the set of 2 patches against Simon Horman's 'renesas.git' repo's
'renesas-devel-20171113-v4.14' tag. We're adding the R8A77970 GPIO nodes
and then describing the PHY IRQ for EtherAVB  device declared earlier.
These patches depend on the R8A77970/Eagle PFC suport patchset in order
to apply/compile.

[1/2] arm64: dts: renesas: r8a77970: add GPIO support
[2/2] arm64: dts: renesas: eagle: specify EtherAVB PHY IRQ

WBR, Sergei
