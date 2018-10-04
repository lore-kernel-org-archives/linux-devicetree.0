Return-Path: <SRS0=iicR=MQ=verge.net.au=horms@kernel.org>
Date: Thu, 4 Oct 2018 12:13:45 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH RESEND] ARM: dts: iwg23s-sbc: Add pinctl support for
 EtherAVB
Message-ID: <20181004101344.ppufmao3fhtips4i@verge.net.au>
References: <1538555523-19644-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1538555523-19644-1-git-send-email-biju.das@bp.renesas.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Oct 03, 2018 at 09:32:03AM +0100, Biju Das wrote:
> Adding pinctrl support for EtherAVB interface.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Hi Simon,
> 
> As per the below discussion,I need to resend this patch for V.21
> 
> https://patchwork.kernel.org/patch/10558315/
> 
> Are you happy to take this patch?
> 
> This patch is tested against renesas-dev branch

Hi Biju,

As I understand it this patch has dependencies which should be included
in v4.20-rc1. If that understanding is correct then I would prefer
to wait until v4.20-rc1 is released before I accept this patch
so that I can accept it into a branch based on v4.20-rc1 which will
have the dependency present.

> ---
>  arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
> index 22da819..4ceff9c 100644
> --- a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
> +++ b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
> @@ -28,6 +28,9 @@
>  };
>  
>  &avb {
> +	pinctrl-0 = <&avb_pins>;
> +	pinctrl-names = "default";
> +
>  	phy-handle = <&phy3>;
>  	phy-mode = "gmii";
>  	renesas,no-ether-link;
> @@ -46,6 +49,11 @@
>  };
>  
>  &pfc {
> +	avb_pins: avb {
> +		groups = "avb_mdio", "avb_gmii_tx_rx";
> +		function = "avb";
> +	};
> +
>  	scif1_pins: scif1 {
>  		groups = "scif1_data_b";
>  		function = "scif1";
> -- 
> 2.7.4
> 
