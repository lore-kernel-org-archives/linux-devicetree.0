From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 8/9] ARM: dts: iwg22d-sodimm: Sound DMA support via SRC
 on DTS
Date: Thu, 21 Dec 2017 11:44:44 +0100
Message-ID: <20171221104443.rk6prrib4gdi7qyz@verge.net.au>
References: <1513800125-53213-1-git-send-email-biju.das@bp.renesas.com>
 <1513800125-53213-9-git-send-email-biju.das@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1513800125-53213-9-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Chris Paterson <chris.paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 20, 2017 at 08:02:04PM +0000, Biju Das wrote:
> DMA transfer to/from SRC
> 
>      DMA      DMApp
> [MEM] -> [SRC] -> [SSIU] -> [SSI]
> 
>      DMA      DMApp
> [MEM] <- [SRC] <- [SSIU] <- [SSI]
> 
> Current sound driver is supporting SSI/SRC random connection.
> So, this patch is trying
> SSI3 -> SRC3
> SSI4 <- SRC4

I am curious to know why the selection here differs from that
present in iwg20d-q7-common. Is it an arbitrary decision?

Likewise for other uses of ssi*, src* and dvc* in this patchset.

> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---
>  arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
> index 0f880c1..2cac57c 100644
> --- a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
> +++ b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
> @@ -183,8 +183,8 @@
>  
>  	rcar_sound,dai {
>  		dai0 {
> -			playback = <&ssi3>;
> -			capture = <&ssi4>;
> +			playback = <&ssi3 &src3>;
> +			capture = <&ssi4 &src4>;
>  		};
>  	};
>  };
> -- 
> 1.9.1
> 
