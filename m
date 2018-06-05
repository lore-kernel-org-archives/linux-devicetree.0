Return-Path: <SRS0=sN9C=IX=linaro.org=lee.jones@kernel.org>
Date: Tue, 5 Jun 2018 08:04:57 +0100
From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] regulator: tps65911: fix regulator-compatible
 documentation
Message-ID: <20180605070457.GF21163@dell>
References: <1528146863.2818.23.camel@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1528146863.2818.23.camel@googlemail.com>
To: Christoph Fritz <chf.fritz@googlemail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Tony Lindgren <tony@atomide.com>, devicetree <devicetree@vger.kernel.org>, linux-omap@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, 04 Jun 2018, Christoph Fritz wrote:

> 
> Signed-off-by: Christoph Fritz <chf.fritz@googlemail.com>
> ---
>  Documentation/devicetree/bindings/mfd/tps65910.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/tps65910.txt b/Documentation/devicetree/bindings/mfd/tps65910.txt
> index 8af1202..4f62143 100644
> --- a/Documentation/devicetree/bindings/mfd/tps65910.txt
> +++ b/Documentation/devicetree/bindings/mfd/tps65910.txt
> @@ -22,7 +22,7 @@ Required properties:
>    The valid regulator-compatible values are:
>    tps65910: vrtc, vio, vdd1, vdd2, vdd3, vdig1, vdig2, vpll, vdac, vaux1,
>              vaux2, vaux33, vmmc, vbb
> -  tps65911: vrtc, vio, vdd1, vdd3, vddctrl, ldo1, ldo2, ldo3, ldo4, ldo5,
> +  tps65911: vrtc, vio, vdd1, vdd2, vddctrl, ldo1, ldo2, ldo3, ldo4, ldo5,
>              ldo6, ldo7, ldo8
>  
>  - xxx-supply: Input voltage supply regulator.

<playing_dumb>

I have no idea what I'm meant to be looking for.

Please add a suitable commit log.

</playing_dumb>

Also, this is not a "regulator" patch, as your $SUBJECT suggests.
Please change the pre-fix to "dt-bindings: mfd: "

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
