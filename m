Return-Path: <SRS0=nKIV=KH=verge.net.au=horms@kernel.org>
Date: Mon, 23 Jul 2018 17:53:45 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] ARM: dts: r8a77470: Use r8a77470-sysc binding definitions
Message-ID: <20180723155345.zmo4oulckinlnkls@verge.net.au>
References: <1532092022-64918-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1532092022-64918-1-git-send-email-biju.das@bp.renesas.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Chris Paterson <chris.paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, Jul 20, 2018 at 02:07:02PM +0100, Biju Das wrote:
> Replace the hardcoded power domain indices by R8A77470_PD_* symbols.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>
> ---
> Commit 964f7c0dd23de68c0 ("soc: renesas: rcar-sysc: Add r8a77470 support") 
> is in Linus' tree
> ---
>  arch/arm/boot/dts/r8a77470.dtsi | 27 ++++++++++++++-------------
>  1 file changed, 14 insertions(+), 13 deletions(-)

Thanks,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
