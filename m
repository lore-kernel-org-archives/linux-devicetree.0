From: Garlic Tseng <garlic.tseng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2] arm: dts: mediatek: Add audio driver node for MT2701
Date: Thu, 1 Jun 2017 13:37:04 +0800
Message-ID: <1496295424.513.5.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi all,

> Add audio driver node for mt2701

> Signed-off-by: Garlic Tseng <garlic.tseng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  arch/arm/boot/dts/mt2701-evb.dts | 65 ++++++++++++++++++++++++++
>  arch/arm/boot/dts/mt2701.dtsi    | 98
> ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 163 insertions(+)

> diff --git a/arch/arm/boot/dts/mt2701-evb.dts 
> b/arch/arm/boot/dts/mt2701-evb.dts
> index 98bf12c..6c458f1 100644
> --- a/arch/arm/boot/dts/mt2701-evb.dts
> +++ b/arch/arm/boot/dts/mt2701-evb.dts
> @@ -22,6 +22,40 @@
>  	memory {
>  		reg = <0 0x80000000 0 0x40000000>;
>  	};
> +
> +		sound:sound {
> +		compatible = "mediatek,mt2701-cs42448-machine";
> +		mediatek,platform = <&afe>;
> +		/* CS42448 Machine name */

I found an intend problem here and I'll send a new version to fix that.
Sorry for the inconvenience.

Garlic.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
