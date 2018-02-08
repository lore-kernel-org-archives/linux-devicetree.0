From: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Subject: Re: [PATCH] powerpc/fsl/dts: fix the i2c-mux compatible for t104xqds
Date: Thu, 8 Feb 2018 10:32:12 +0100
Message-ID: <da15288b-f656-8126-7bc9-eb2fd58adccb@axentia.se>
References: <20170803125934.14960-1-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170803125934.14960-1-peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Prabhakar Kushwaha <prabhakar-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

[Adding some people whom seem relevant but did not get fingered by
get_maintainer.pl]

On 2017-08-03 14:59, Peter Rosin wrote:
> The sanctioned compatible is "nxp,pca9547".
Ping.

Cheers,
Peter

> Signed-off-by: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
> ---
>  arch/powerpc/boot/dts/fsl/t104xqds.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/boot/dts/fsl/t104xqds.dtsi b/arch/powerpc/boot/dts/fsl/t104xqds.dtsi
> index 2fd4cbe7098f..615479732252 100644
> --- a/arch/powerpc/boot/dts/fsl/t104xqds.dtsi
> +++ b/arch/powerpc/boot/dts/fsl/t104xqds.dtsi
> @@ -269,7 +269,7 @@
>  
>  		i2c@118000 {
>  			pca9547@77 {
> -				compatible = "philips,pca9547";
> +				compatible = "nxp,pca9547";
>  				reg = <0x77>;
>  			};
>  			rtc@68 {
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
