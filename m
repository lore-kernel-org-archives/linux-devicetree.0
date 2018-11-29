Return-Path: <SRS0=Z+zc=OI=verge.net.au=horms@kernel.org>
Date: Thu, 29 Nov 2018 14:41:22 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 02/22] ARM: dts: r8a7744: Add I2C and IIC support
Message-ID: <20181129134121.yiu3nrnpp7eatiqf@verge.net.au>
References: <1543319795-48325-1-git-send-email-biju.das@bp.renesas.com>
 <1543319795-48325-3-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1543319795-48325-3-git-send-email-biju.das@bp.renesas.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, Nov 27, 2018 at 11:56:15AM +0000, Biju Das wrote:
> Add the I2C[0-5] and IIC[0,1,3] devices nodes to the R8A7744 device tree.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
>  arch/arm/boot/dts/r8a7744.dtsi | 141 ++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 139 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/r8a7744.dtsi b/arch/arm/boot/dts/r8a7744.dtsi
> index 165c701..6505ebd 100644
> --- a/arch/arm/boot/dts/r8a7744.dtsi
> +++ b/arch/arm/boot/dts/r8a7744.dtsi
> @@ -15,6 +15,18 @@
>  	#address-cells = <2>;
>  	#size-cells = <2>;
>  
> +	aliases {
> +		i2c0 = &i2c0;
> +		i2c1 = &i2c1;
> +		i2c2 = &i2c2;
> +		i2c3 = &i2c3;
> +		i2c4 = &i2c4;
> +		i2c5 = &i2c5;
> +		i2c6 = &iic0;
> +		i2c7 = &iic1;
> +		i2c8 = &iic3;
> +	};
> +

I believe we are moving away from adding aliases such as those above.
Geert, can you comment on this?

Other than that this patch looks good to me.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
