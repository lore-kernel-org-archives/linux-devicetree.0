From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3] ARM: dts: bcm283x: Fix pin function of JTAG pins
Date: Mon, 25 Dec 2017 12:30:46 -0800
Message-ID: <5a18e270-5905-d847-f061-14663f69aa43@gmail.com>
References: <1514231010-19554-1-git-send-email-henryzhang62@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1514231010-19554-1-git-send-email-henryzhang62-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: henryzhang62-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, stefan.wahren-eS4NqCHxEME@public.gmane.org
List-Id: devicetree@vger.kernel.org

Le 12/25/17 à 11:43, henryzhang62-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org a écrit :
> From: Henry Zhang <henryzhang62-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> BCM2835 ARM Peripherals doc shows gpio pins 4, 5, 6, 12 and 13
> carry altenate function, ALT5 for ARM JTAG
> 
> Fixes: 21ff843931b2 ("ARM: dts: bcm283x: Define standard pinctrl
>                       groups in the gpio node.")
> 

Almost there, please don't break the Fixes: line onto multiple lines,
this may, or may not require resending depending on what Eric says.

Thank you!

> Signed-off-by: Henry Zhang <henryzhang62-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Acked-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
> ---
>  arch/arm/boot/dts/bcm283x.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/bcm283x.dtsi b/arch/arm/boot/dts/bcm283x.dtsi
> index dcde93c..64971e4 100644
> --- a/arch/arm/boot/dts/bcm283x.dtsi
> +++ b/arch/arm/boot/dts/bcm283x.dtsi
> @@ -251,7 +251,7 @@
>  
>  			jtag_gpio4: jtag_gpio4 {
>  				brcm,pins = <4 5 6 12 13>;
> -				brcm,function = <BCM2835_FSEL_ALT4>;
> +				brcm,function = <BCM2835_FSEL_ALT5>;
>  			};
>  			jtag_gpio22: jtag_gpio22 {
>  				brcm,pins = <22 23 24 25 26 27>;
> 


-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
