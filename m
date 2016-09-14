From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH v1 2/3] ARM: dts: imx6q-apalis-ixora: Remove use of
 pwm-leds
Date: Wed, 14 Sep 2016 08:58:31 -0700
Message-ID: <5eee36b0a60c41a05ca2a161b8ef3eb7@agner.ch>
References: <9d2c17aa2e00e6ff4349a53de8247860d2382607.1473833908.git.maitysanchayan@gmail.com>
 <6111feb57b5fbaa29eeb6ba089bb2824bbf2f8ff.1473833908.git.maitysanchayan@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6111feb57b5fbaa29eeb6ba089bb2824bbf2f8ff.1473833908.git.maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2016-09-13 23:35, Sanchayan Maity wrote:
> Remove use of pwm-leds and use the standard /sys/class/pwm
> interface from PWM subsystem.

Don't we have actual leds on the Ixora?

--
Stefan

> 
> Signed-off-by: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/imx6q-apalis-ixora.dts | 22 ----------------------
>  1 file changed, 22 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/imx6q-apalis-ixora.dts
> b/arch/arm/boot/dts/imx6q-apalis-ixora.dts
> index d99979e..70a3da0 100644
> --- a/arch/arm/boot/dts/imx6q-apalis-ixora.dts
> +++ b/arch/arm/boot/dts/imx6q-apalis-ixora.dts
> @@ -146,28 +146,6 @@
>  			gpios = <&gpio2 2 GPIO_ACTIVE_HIGH>;
>  		};
>  	};
> -
> -	pwmleds {
> -		compatible = "pwm-leds";
> -
> -		ledpwm1 {
> -			label = "PWM1";
> -			pwms = <&pwm1 0 50000>;
> -			max-brightness = <255>;
> -		};
> -
> -		ledpwm2 {
> -			label = "PWM2";
> -			pwms = <&pwm2 0 50000>;
> -			max-brightness = <255>;
> -		};
> -
> -		ledpwm3 {
> -			label = "PWM3";
> -			pwms = <&pwm3 0 50000>;
> -			max-brightness = <255>;
> -		};
> -	};
>  };
>  
>  &backlight {
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
