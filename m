From: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: keystone: Fix domain register range for clkfftc1
Date: Tue, 18 Mar 2014 12:09:22 -0400
Message-ID: <53286FB2.1040903@ti.com>
References: <1395148697-22481-1-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395148697-22481-1-git-send-email-ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, grygorii.strashko-l0cyMroinI0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 18 March 2014 09:18 AM, Ivan Khoronzhuk wrote:
> The domain register range for clkfftc1 has to be 0x0235004c
> instead of 0x023504c0.
> 
> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
> ---
Thanks .. Applying for 3.15-fixes

>  arch/arm/boot/dts/k2hk-clocks.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/k2hk-clocks.dtsi b/arch/arm/boot/dts/k2hk-clocks.dtsi
> index 8855b1f..96e6536 100644
> --- a/arch/arm/boot/dts/k2hk-clocks.dtsi
> +++ b/arch/arm/boot/dts/k2hk-clocks.dtsi
> @@ -209,7 +209,7 @@ clocks {
>  		compatible = "ti,keystone,psc-clock";
>  		clocks = <&chipclk13>;
>  		clock-output-names = "fftc-1";
> -		reg = <0x02350074 0xb00>, <0x023504c0 0x400>;
> +		reg = <0x02350074 0xb00>, <0x0235004c 0x400>;
>  		reg-names = "control", "domain";
>  		domain-id = <19>;
>  	};
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
