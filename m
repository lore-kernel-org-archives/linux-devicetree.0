From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH v2 1/5] ARM: dts: iwg20d-q7-common: Sound PIO support
Date: Wed, 20 Dec 2017 10:41:28 +0100
Message-ID: <20171220094128.cffetpgij42m57kq@verge.net.au>
References: <1513621361-10944-1-git-send-email-biju.das@bp.renesas.com>
 <1513621361-10944-2-git-send-email-biju.das@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1513621361-10944-2-git-send-email-biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chris Paterson <chris.paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 18, 2017 at 06:22:37PM +0000, Biju Das wrote:
> Enable sound PIO support on carrier board.
> 
> Signed-off-by: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> Reviewed-by: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> Acked-by: Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
> ---
> v1-->v2
>  * Reworked sorting
> 
>  arch/arm/boot/dts/iwg20d-q7-common.dtsi | 46 +++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/iwg20d-q7-common.dtsi b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
> index 2070b14..ed67201 100644
> --- a/arch/arm/boot/dts/iwg20d-q7-common.dtsi
> +++ b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
> @@ -34,6 +34,22 @@
>  		regulator-always-on;
>  	};
>  
> +	rsnd_sgtl5000: sound {
> +		compatible = "simple-audio-card";
> +
> +		simple-audio-card,format = "i2s";
> +		simple-audio-card,bitclock-master = <&sndcodec>;
> +		simple-audio-card,frame-master = <&sndcodec>;
> +
> +		sndcpu: simple-audio-card,cpu {
> +			sound-dai = <&rcar_sound>;
> +		};
> +
> +		sndcodec: simple-audio-card,codec {
> +			sound-dai = <&sgtl5000>;

I'm sorry for not noticing this earlier but with this patch applied
(and none of the others in this series) I see the following error:

arch/arm/boot/dts/r8a7743-iwg20d-q7.dtb: ERROR (phandle_references):
Reference to non-existent node or label "sgtl5000"

At the very least this will break bisection.
Please find a way to avoid this.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
