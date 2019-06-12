Return-Path: <SRS0=qchw=UL=verge.net.au=horms@kernel.org>
Date: Wed, 12 Jun 2019 13:50:39 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: hihope-rzg2-ex: Enable PCIe
 support
Message-ID: <20190612115038.yo5ecpixqd6plkjm@verge.net.au>
References: <1559891639-62529-1-git-send-email-biju.das@bp.renesas.com>
 <1559891639-62529-4-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559891639-62529-4-git-send-email-biju.das@bp.renesas.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, Jun 07, 2019 at 08:13:59AM +0100, Biju Das wrote:
> This patch enables PCIEC[01] PCI express controller on the sub board.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Thanks, applied for inclusion in v5.3.

> ---
>  arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
> index b1e45944..07a6eea 100644
> --- a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
> +++ b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
> @@ -31,6 +31,14 @@
>  	};
>  };
>  
> +&pciec0 {
> +	status = "okay";
> +};
> +
> +&pciec1 {
> +	status = "okay";
> +};
> +
>  &pfc {
>  	pinctrl-0 = <&scif_clk_pins>;
>  	pinctrl-names = "default";
> -- 
> 2.7.4
> 
