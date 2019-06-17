Return-Path: <SRS0=U1Pn=UQ=verge.net.au=horms@kernel.org>
Date: Mon, 17 Jun 2019 10:05:22 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 1/6] arm64: dts: renesas: r8a774a1: Fix USB 2.0 clocks
Message-ID: <20190617080521.hzlllq5cuprvf2dt@verge.net.au>
References: <1560258401-9517-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1560258401-9517-2-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1560258401-9517-2-git-send-email-fabrizio.castro@bp.renesas.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, Jun 11, 2019 at 02:06:36PM +0100, Fabrizio Castro wrote:
> Similarly to what done for the r8a7796 with commit 737e05bf034e
> ("arm64: dts: renesas: revise properties for R-Car Gen3 SoCs'
> usb 2.0"), this patch lists the clock for the USB High-Speed Module
> (HS-USB) with the USB2.0 Host (EHCI/OHCI) IP DT node, and it lists
> the clock for the USB2.0 Host IP with the HS-USB module DT node.
> 
> Fixes: 4c2c2fb99876 ("arm64: dts: renesas: r8a774a1: Add USB2.0 phy and host(EHCI/OHCI) device nodes")
> Fixes: ed898d4fc19d ("arm64: dts: renesas: r8a774a1: Add USB-DMAC and HSUSB device nodes")
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thanks Fabrizio,

I have applied this for inclusion in v5.3.
