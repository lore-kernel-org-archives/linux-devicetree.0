From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 0/9] Add sound support
Date: Thu, 21 Dec 2017 12:25:18 +0100
Message-ID: <20171221112518.tsxtkcli3s6agj65@verge.net.au>
References: <1513800125-53213-1-git-send-email-biju.das@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1513800125-53213-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Chris Paterson <chris.paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 20, 2017 at 08:01:56PM +0000, Biju Das wrote:
> This series aims to add sound support for iWave RZ/G1E board.
> 
> Biju Das (9):
>   ARM: dts: r8a7745: Add audio clocks
>   ARM: dts: r8a7745: Add audio DMAC support
>   ARM: dts: r8a7745: Add sound support
>   ARM: dts: iwg22d-sodimm: Enable SGTL5000 audio codec
>   ARM: dts: iwg22d-sodimm: Sound PIO support
>   ARM: dts: iwg22d-sodimm: Sound DMA support on DTS
>   ARM: dts: iwg22d-sodimm: Sound DMA support via BUSIF on DTS
>   ARM: dts: iwg22d-sodimm: Sound DMA support via SRC on DTS
>   ARM: dts: iwg22d-sodimm: Sound DMA support via DVC on DTS
> 
>  arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts |  92 +++++++++++
>  arch/arm/boot/dts/r8a7745.dtsi              | 232 ++++++++++++++++++++++++++++

Thanks, applied.
