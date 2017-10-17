From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 2/9] ARM: dts: rockchip: rk3288-vyasa: Use fixed voltage range for vccio_sd
Date: Tue, 17 Oct 2017 21:09:04 +0200
Message-ID: <3394467.76otEihhKb@phil>
References: <1508156187-27519-1-git-send-email-jagan@amarulasolutions.com> <1508156187-27519-3-git-send-email-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1508156187-27519-3-git-send-email-jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jagan Teki <jagannadh.teki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

Am Montag, 16. Oktober 2017, 17:46:20 CEST schrieb Jagan Teki:
> vccio_sd has supplied to vqmmc-supply for sdmmc, use fixed voltage
> range of 3.3v for better IO lines supply voltage.
> 
> Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>

not sure I understand this one.

I.e. the regulator should be at 3.3V anyway and only when it
reaches UHS speeds should the mmc core reduce the voltage
to 1.8V, so having this variable here, shouldn't pose a problem?

So maybe you could explain a bit more what the problem is?


Thanks
Heiko

> ---
>  arch/arm/boot/dts/rk3288-vyasa.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/rk3288-vyasa.dts b/arch/arm/boot/dts/rk3288-vyasa.dts
> index 7a0f945..915b4a3 100644
> --- a/arch/arm/boot/dts/rk3288-vyasa.dts
> +++ b/arch/arm/boot/dts/rk3288-vyasa.dts
> @@ -214,7 +214,7 @@
>  
>  			vccio_sd: LDO_REG5 {
>  				regulator-name = "vccio_sd";
> -				regulator-min-microvolt = <1800000>;
> +				regulator-min-microvolt = <3300000>;
>  				regulator-max-microvolt = <3300000>;
>  				regulator-always-on;
>  				regulator-boot-on;
> 


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
