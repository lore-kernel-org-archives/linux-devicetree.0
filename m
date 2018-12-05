Return-Path: <SRS0=wIoc=OO=verge.net.au=horms@kernel.org>
Date: Wed, 5 Dec 2018 11:56:24 -0800
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 3/5] ARM: dts: r8a7744: Add DU support
Message-ID: <20181205195624.upiljxcwo6zu4bcz@verge.net.au>
References: <1544000815-28069-1-git-send-email-biju.das@bp.renesas.com>
 <1544000815-28069-4-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1544000815-28069-4-git-send-email-biju.das@bp.renesas.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Dec 05, 2018 at 09:06:53AM +0000, Biju Das wrote:
> Add du node to r8a7744 SoC DT. Boards that want to enable the DU
> need to specify the output topology.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
> V1-->V2
> 	* Removed LVDS encoder definition from DU node.

I would like this and the remaining patches in this series to
receive some review before I apply them. This likely means they
will be accepted for v4.22 as I am planning to close the
renesas tree for non-bugfixes for v4.21 later today.

b

> ---
>  arch/arm/boot/dts/r8a7744.dtsi | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/r8a7744.dtsi b/arch/arm/boot/dts/r8a7744.dtsi
> index 04148d6..6a51b16 100644
> --- a/arch/arm/boot/dts/r8a7744.dtsi
> +++ b/arch/arm/boot/dts/r8a7744.dtsi
> @@ -1645,8 +1645,14 @@
>  		};
>  
>  		du: display@feb00000 {
> -			reg = <0 0xfeb00000 0 0x40000>,
> -			      <0 0xfeb90000 0 0x1c>;
> +			compatible = "renesas,du-r8a7744";
> +			reg = <0 0xfeb00000 0 0x40000>;
> +			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 724>,
> +				 <&cpg CPG_MOD 723>;
> +			clock-names = "du.0", "du.1";
> +			status = "disabled";
>  
>  			ports {
>  				#address-cells = <1>;
> @@ -1663,7 +1669,6 @@
>  					};
>  				};
>  			};
> -			/* placeholder */
>  		};
>  
>  		prr: chipid@ff000044 {
> -- 
> 2.7.4
> 
