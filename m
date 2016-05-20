From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 11/23] ARM: dts: armadillo800eva: Fix W=1 dtc warnings
Date: Fri, 20 May 2016 18:38:49 +0300
Message-ID: <e0a1fbc1-ac95-2c79-65ed-d0328679bb8a@cogentembedded.com>
References: <1463728214-13838-1-git-send-email-geert+renesas@glider.be>
 <1463728214-13838-12-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1463728214-13838-12-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

On 05/20/2016 10:10 AM, Geert Uytterhoeven wrote:

> Warning (unit_address_vs_reg): Node /memory has a reg or ranges property, but no unit name
> Warning (unit_address_vs_reg): Node /regulator@0 has a unit name, but no reg property
> Warning (unit_address_vs_reg): Node /regulator@1 has a unit name, but no reg property
> Warning (unit_address_vs_reg): Node /regulator@2 has a unit name, but no reg property
> Warning (unit_address_vs_reg): Node /regulator@3 has a unit name, but no reg property
> Warning (unit_address_vs_reg): Node /i2c@2 has a unit name, but no reg property
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
> ---
> v2:
>   - No changes.
> ---
>  arch/arm/boot/dts/r8a7740-armadillo800eva.dts | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm/boot/dts/r8a7740-armadillo800eva.dts b/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
> index 2c82dab2b6f45f9c..b3f0ac4b99bd5a3d 100644
> --- a/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
> +++ b/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
[...]
> @@ -127,7 +127,7 @@
>  		};
>  	};
>
> -	i2c2: i2c@2 {
> +	i2c2: i2c2 {

    Not "i2c-2" as in the other patches?

>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  		compatible = "i2c-gpio";

MBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
