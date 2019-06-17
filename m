Return-Path: <SRS0=U1Pn=UQ=verge.net.au=horms@kernel.org>
Date: Mon, 17 Jun 2019 11:33:39 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] arm64: dts: renesas: hihope-common: Enable USB3.0
Message-ID: <20190617093339.qrezhd6jnm7jqxbt@verge.net.au>
References: <1560523869-56668-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1560523869-56668-1-git-send-email-biju.das@bp.renesas.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, Jun 14, 2019 at 03:51:09PM +0100, Biju Das wrote:
> This patch enables USB3.0 host/peripheral device node for the HiHope
> RZ/G2M board.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
> This patch depend on [1]
> [1]. https://patchwork.kernel.org/patch/10995323/

Thanks,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
