Return-Path: <SRS0=7icI=M3=verge.net.au=horms@kernel.org>
Date: Mon, 15 Oct 2018 17:38:32 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v3 5/6] ARM: dts: r8a77470: Add SDHI1 support
Message-ID: <20181015153832.2haidauznvhrrxvf@verge.net.au>
References: <1538988712-17077-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1538988712-17077-6-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1538988712-17077-6-git-send-email-fabrizio.castro@bp.renesas.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Mon, Oct 08, 2018 at 09:51:51AM +0100, Fabrizio Castro wrote:
> Althought interface SDHI1 found on the RZ/G1C SoC (a.k.a.
> r8a77470) is compatible with the R-Car Gen3 ones, its OF
> compatibility is restricted to the SoC specific compatible
> string to avoid confusion, as from a more generic perspective
> the RZ/G1C is sharing the most similarities with the R-Car
> Gen2 family of SoCs, and there is a combination of R-Car
> Gen2 compatible SDHI IPs and R-Car Gen3 compatible SDHI IP
> on this specific chip.
> This patch adds the SoC specific part of SDHI1 support, and
> since SDHI1 comes with internal DMA, its DT node looks fairly
> different from SDHI0 and SDHI2.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>

Thanks, applied for v4.21.
