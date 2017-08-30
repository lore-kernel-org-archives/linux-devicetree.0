From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: r8a7795: Drop bogus HDMI node names suffixes
Date: Wed, 30 Aug 2017 13:10:58 +0300
Message-ID: <3276171.anaVMsVBRO@avalon>
References: <1504087397-6211-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1504087397-6211-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Wednesday, 30 August 2017 13:03:17 EEST Geert Uytterhoeven wrote:
> Node names should not use numerical suffixes if the nodes can be
> distinguished by unit-address.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>

Acked-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>

> ---
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> b/arch/arm64/boot/dts/renesas/r8a7795.dtsi index
> 8b4dbce860001224..e1ced54d11322cb4 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> @@ -2702,7 +2702,7 @@
>  			renesas,fcp = <&fcpf1>;
>  		};
> 
> -		hdmi0: hdmi0@fead0000 {
> +		hdmi0: hdmi@fead0000 {
>  			compatible = "renesas,r8a7795-hdmi", "renesas,rcar-gen3-hdmi";
>  			reg = <0 0xfead0000 0 0x10000>;
>  			interrupts = <GIC_SPI 389 IRQ_TYPE_LEVEL_HIGH>;
> @@ -2727,7 +2727,7 @@
>  			};
>  		};
> 
> -		hdmi1: hdmi1@feae0000 {
> +		hdmi1: hdmi@feae0000 {
>  			compatible = "renesas,r8a7795-hdmi", "renesas,rcar-gen3-hdmi";
>  			reg = <0 0xfeae0000 0 0x10000>;
>  			interrupts = <GIC_SPI 436 IRQ_TYPE_LEVEL_HIGH>;


-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
