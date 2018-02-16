From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 0/5] Add R8A77980/Condor board support
Date: Fri, 16 Feb 2018 21:25:30 +0300
Message-ID: <ae31804b-969b-9b20-16d0-50f5dea42f08@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Language: en-MW
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Simon Horman <horms@verge.net.au>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello!

Here's the set of 11 patches against Simon Horman's 'renesas.git' repo's
'renesas-devel-20180216-v4.16-rc1' tag. I'm adding the device tree support
for the R8A77980-based Condor board (note that NFS root would only work on
the Condor boards [re]wired for booting from EtherAVB -- we haven't been
able to get the 'sh_eth' driver working in either U-Boot or Linux so far).
The necessary SYS-DMAC, [H]SCIF, and EtherAVB bindings updates have been
posted, the clock driver has been reposted yesterday, and the merged patches
have been dropped from this respin of the series...

[1/5] soc: renesas: rcar-sysc: add R8A77980 support
[2/5] arm64: dts: renesas: r8a77980: add [H]SCIF support
[3/5] arm64: dts: renesas: r8a77980: add EtherAVB support
[4/5] arm64: dts: renesas: initial Condor board device tree
[5/5] arm64: dts: renesas: condor: add EtherAVB support

WBR, Sergei
