From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: rockchip: Adding LEDs handling via leds-gpio for the Radxa Rock2 Square
Date: Wed, 30 Dec 2015 16:20:10 +0100
Message-ID: <3613784.8JLtyMHEE9@diego>
References: <1451474219-1313-1-git-send-email-romain.perier@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1451474219-1313-1-git-send-email-romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Romain,

Am Mittwoch, 30. Dezember 2015, 12:16:59 schrieb Romain Perier:

even a oneliner is generally preferred, compared to no commit message at all 
;-)

> Signed-off-by: Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/rk3288-rock2-square.dts | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/rk3288-rock2-square.dts
> b/arch/arm/boot/dts/rk3288-rock2-square.dts index c5453a0..a33020f 100644
> --- a/arch/arm/boot/dts/rk3288-rock2-square.dts
> +++ b/arch/arm/boot/dts/rk3288-rock2-square.dts
> @@ -56,6 +56,23 @@
>  		pinctrl-0 = <&ir_int>;
>  	};
> 
> +	gpio-leds {
> +		compatible = "gpio-leds";
> +
> +		heartbeat {
> +			gpios = <&gpio7 15 GPIO_ACTIVE_LOW>;
> +			label = "rock2:green:heartbeat";
> +			linux,default-trigger = "heartbeat";
> +		};
> +
> +		mmc {
> +			gpios = <&gpio0 11 GPIO_ACTIVE_LOW>;
> +			label = "rock2:blue:mmc";
> +			linux,default-trigger = "mmc0";
> +		};

the rock2 core schematics seem to not list these leds at all (especially when 
looking at the gpio-side). But looking at the schematics my guess would be 
led_state1 and led_state2, so the naming should reflect that 
(rock2:green:state1 ...).

Also I'd like to refrain from encoding user-specific configurations in the 
devicetree - aka please do a default trigger of "off" for those generic leds.


Thanks
Heiko

> +	};
> +
> +
>  	sound {
>  		compatible = "simple-audio-card";
>  		simple-audio-card,name = "SPDIF";

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
