Return-Path: <SRS0=qchw=UL=verge.net.au=horms@kernel.org>
Date: Wed, 12 Jun 2019 13:50:02 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: hihope-common: Declare pcie bus
 clock
Message-ID: <20190612115001.xmalqxe7m2lasqzs@verge.net.au>
References: <1559891639-62529-1-git-send-email-biju.das@bp.renesas.com>
 <1559891639-62529-3-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559891639-62529-3-git-send-email-biju.das@bp.renesas.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, Jun 07, 2019 at 08:13:58AM +0100, Biju Das wrote:
> Declare pcie bus clock, since it is generated on the HiHope RZ/G2M main
> board.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Thanks, applied for inclusion in v5.3.

> ---
>  arch/arm64/boot/dts/renesas/hihope-common.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/hihope-common.dtsi b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> index 4cc924d..95ac6fa 100644
> --- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> @@ -26,6 +26,10 @@
>  	clock-frequency = <32768>;
>  };
>  
> +&pcie_bus_clk {
> +	clock-frequency = <100000000>;
> +};
> +
>  &pfc {
>  	pinctrl-0 = <&scif_clk_pins>;
>  	pinctrl-names = "default";
> -- 
> 2.7.4
> 
