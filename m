Return-Path: <SRS0=nKIV=KH=verge.net.au=horms@kernel.org>
Date: Mon, 23 Jul 2018 17:56:56 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] ARM: dts: r8a77470: Add PFC support
Message-ID: <20180723155656.bzgntnqyei7kogvg@verge.net.au>
References: <1532092186-3313-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1532092186-3313-1-git-send-email-biju.das@bp.renesas.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Chris Paterson <chris.paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, Jul 20, 2018 at 02:09:46PM +0100, Biju Das wrote:
> Define the generic R8A77470 part of the PFC device node.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---
> Commit 73dacc3403436fc2 ("pinctrl: sh-pfc: Add r8a77470 PFC support") 
> is in Linus' tree
> ---
>  arch/arm/boot/dts/r8a77470.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)

Thanks,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
