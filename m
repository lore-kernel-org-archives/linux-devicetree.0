Return-Path: <SRS0=Ri32=V6=ideasonboard.com=laurent.pinchart@kernel.org>
Date: Fri, 2 Aug 2019 11:29:52 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH/RFC 11/12] arm64: dts: renesas: cat874: Add definition
 for 12V regulator
Message-ID: <20190802082952.GL5008@pendragon.ideasonboard.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1564731249-22671-12-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1564731249-22671-12-git-send-email-fabrizio.castro@bp.renesas.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, ebiharaml@si-linux.co.jp
List-ID: <devicetree@vger.kernel.org>

Hi Fabrizio,

Thank you for the patch.

On Fri, Aug 02, 2019 at 08:34:08AM +0100, Fabrizio Castro wrote:
> Power rail "D12.0V" comes straight from the power barrel connector,
> and it's used in both main board and sub board.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I don't plan to take this in my tree without patch 12/12, so if you
think the rest of the series won't be ready in time for v5.4, feel free
to get this patch merged through Simon or Geert already.

> ---
>  arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> index 46a77ee..651383c 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> @@ -65,6 +65,15 @@
>  		reg = <0x0 0x48000000 0x0 0x78000000>;
>  	};
>  
> +	reg_12p0v: regulator-12p0v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "D12.0V";
> +		regulator-min-microvolt = <12000000>;
> +		regulator-max-microvolt = <12000000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
>  	sound: sound {
>  		compatible = "simple-audio-card";
>  

-- 
Regards,

Laurent Pinchart
