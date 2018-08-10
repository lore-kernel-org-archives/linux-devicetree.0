Return-Path: <SRS0=20pF=KZ=verge.net.au=horms@kernel.org>
Date: Fri, 10 Aug 2018 14:10:52 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v3 3/5] ARM: dts: r8a77470: Add GPIO support
Message-ID: <20180810121052.q35n55b2pg2chvwi@verge.net.au>
References: <1533628626-26503-1-git-send-email-biju.das@bp.renesas.com>
 <1533628626-26503-4-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1533628626-26503-4-git-send-email-biju.das@bp.renesas.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, Aug 07, 2018 at 08:57:04AM +0100, Biju Das wrote:
> Describe GPIO blocks in the R8A77470 device tree.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> V2-->V3
>  * Moved gpio-reserved-ranges property just below gpio-ranges

Thanks, applied for v4.20.
