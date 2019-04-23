Return-Path: <SRS0=Cy/r=SZ=verge.net.au=horms@kernel.org>
Date: Tue, 23 Apr 2019 13:31:09 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 0/6] Add more support to RZ/G2M SoC
Message-ID: <20190423113108.z2hhjgnlezxpairh@verge.net.au>
References: <1555428717-18376-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1555428717-18376-1-git-send-email-biju.das@bp.renesas.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, Apr 16, 2019 at 04:31:51PM +0100, Biju Das wrote:
> This series adds RZ/G2M SoC dtsi support for DU, VSP, FDP,
> and Tie SYS-DMAC, Audio-DMAC, Ethernet AVB to IPMMU.
> 
> This patchset is based on renesas dev branch.

Thanks Biju,

applied for v5.3 with "renesas:" added to the prefix for the
first two patches.

> 
> Biju Das (6):
>   arm64: dts: r8a774a1: Add VSP instances
>   arm64: dts: r8a774a1: Add DU device to DT
>   arm64: dts: renesas: r8a774a1: Add FDP1 instance
>   arm64: dts: renesas: r8a774a1: Tie SYS-DMAC to IPMMU-DS0/1
>   arm64: dts: renesas: r8a774a1: Tie Audio-DMAC to IPMMU-MP
>   arm64: dts: renesas: r8a774a1: Connect Ethernet-AVB to IPMMU-DS0
> 
>  arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 169 ++++++++++++++++++++++++++++++
>  1 file changed, 169 insertions(+)
> 
> -- 
> 2.7.4
> 
