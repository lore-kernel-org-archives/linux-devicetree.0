From: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Subject: Re: [RESEND PATCH] ARM: dts: lpc32xx: set default parent clock for
 pwm1 & pwm2
Date: Thu, 8 Sep 2016 02:46:28 +0300
Message-ID: <edf2ee45-7793-7564-9318-ee08909d0ff5@mleia.com>
References: <1473277073-12093-1-git-send-email-slemieux.tyco@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1473277073-12093-1-git-send-email-slemieux.tyco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sylvain Lemieux <slemieux.tyco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Sylvain,

On 07.09.2016 22:37, Sylvain Lemieux wrote:
> From: Sylvain Lemieux <slemieux-1xCVI8+nB4ZBDgjK7y7TUQ@public.gmane.org>
> 
> The change setup the peripheral clock (PERIPH_CLK) as the default 
> parent clock for PWM1 & PWM2.
> 
> Signed-off-by: Sylvain Lemieux <slemieux-1xCVI8+nB4ZBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/lpc32xx.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/lpc32xx.dtsi b/arch/arm/boot/dts/lpc32xx.dtsi
> index e295e1e..ed85b95 100644
> --- a/arch/arm/boot/dts/lpc32xx.dtsi
> +++ b/arch/arm/boot/dts/lpc32xx.dtsi
> @@ -469,6 +469,9 @@
>  				compatible = "nxp,lpc3220-pwm";
>  				reg = <0x4005C000 0x4>;
>  				clocks = <&clk LPC32XX_CLK_PWM1>;
> +				assigned-clocks = <&clk LPC32XX_CLK_PWM1>,
> +						  <&clk LPC32XX_CLK_PERIPH>;

I believe here "assigned-clocks = <&clk LPC32XX_CLK_PWM1>;" would be
good enough. In this context the second clock could be potentially
specified, if you are going to set its rate, but because it is a common
clock for many controllers it should not be done from a PWM device node.

> +				assigned-clock-parents = <&clk LPC32XX_CLK_PERIPH>;
>  				status = "disabled";
>  			};
>  
> @@ -476,6 +479,9 @@
>  				compatible = "nxp,lpc3220-pwm";
>  				reg = <0x4005C004 0x4>;
>  				clocks = <&clk LPC32XX_CLK_PWM2>;
> +				assigned-clocks = <&clk LPC32XX_CLK_PWM2>,
> +						  <&clk LPC32XX_CLK_PERIPH>;

Same as above.

Please remove the second <&clk LPC32XX_CLK_PERIPH> value from the
assigned-clocks property.

> +				assigned-clock-parents = <&clk LPC32XX_CLK_PERIPH>;
>  				status = "disabled";
>  			};
>  
> 

--
With best wishes,
Vladimir
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
