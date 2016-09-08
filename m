From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH 1/8] ARM: dts: bcm283x: Define standard pinctrl groups
 in the gpio node.
Date: Thu, 8 Sep 2016 19:55:29 +0200 (CEST)
Message-ID: <1628308726.55593.220fafc0-57d9-4317-a72d-0875dfb2d658.open-xchange@email.1und1.de>
References: <1473244289-20728-1-git-send-email-kraxel@redhat.com>
 <1473244289-20728-2-git-send-email-kraxel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1473244289-20728-2-git-send-email-kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Gerd,

> Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> hat am 7. September 2016 um 12:31
> geschrieben:
> 
> 
> From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
> 
> The BCM2835-ARM-Peripherals.pdf documentation specifies what the
> function selects do for the pins, and there are a bunch of obvious
> groupings to be made.  With these created, we'll be able to replace
> bcm2835-rpi.dtsi's main "set all of these pins to alt0" with
> references to specific groups we want enabled.
> 
> Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
> ---
>  arch/arm/boot/dts/bcm283x.dtsi | 170
> +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 170 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/bcm283x.dtsi b/arch/arm/boot/dts/bcm283x.dtsi
> index 4d9f3ab..acb616f 100644
> --- a/arch/arm/boot/dts/bcm283x.dtsi
> +++ b/arch/arm/boot/dts/bcm283x.dtsi
> @@ -131,6 +131,176 @@
>  
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
> +
> +			/* Defines pin muxing groups according to
> +			 * BCM2835-ARM-Peripherals.pdf page 102.
> +			 *
> +			 * While each pin can have its mux selected
> +			 * for various functions individually, some
> +			 * groups only make sense to switch to a
> +			 * particular function together.
> +			 */
> ...
> +			i2c0_gpio32: i2c0_gpio32 {
> +				brcm,pins = <32 34>;
> +				brcm,function = <BCM2835_FSEL_ALT0>;
> +			};
> +			spio0_gpio35: spio0_gpio35 {
> +				brcm,pins = <35 36 37 38 39>;
> +				brcm,function = <BCM2835_FSEL_ALT0>;
> +			};

s/spio0/spi0

> +			pwm0_gpio40: pwm0_gpio40 {
> +				brcm,pins = <40>;
> +				brcm,function = <BCM2835_FSEL_ALT0>;
> +			};
> ...
> +			uart1_ctsrts_gpio42: uart1_ctsrts_gpio42 {
> +				brcm,pins = <42 43>;
> +				brcm,function = <BCM2835_FSEL_ALT5>;
> +			};

Please sort all pinctrl nodes by label.

According to this page [1] the pinctrl group for parallel display interface is
missing. Is it intended?

[1] - http://elinux.org/RPi_BCM2835_GPIOs

>  		};
>  
>  		uart0: serial@7e201000 {
> -- 
> 1.8.3.1
> 
> 
> _______________________________________________
> linux-rpi-kernel mailing list
> linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-rpi-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
