From: Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Subject: Re: [PATCH 2/2] arm: AT91: fix DT duplicate node name
Date: Thu, 14 Sep 2017 18:53:30 +0200
Message-ID: <e5868359-8708-3d17-df8c-b04ad3624df0@microchip.com>
References: <cover.1504037038.git.mirq-linux@rere.qmqm.pl>
 <910fee2eb99b2d95e59fa6b997645b498f167022.1504037038.git.mirq-linux@rere.qmqm.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <910fee2eb99b2d95e59fa6b997645b498f167022.1504037038.git.mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 29/08/2017 at 22:08, Michał Mirosław wrote:
> Fix following warning at bootup:
> 
> device-tree: Duplicate name in fb@0x00500000, renamed to "display#1"
> 
> Signed-off-by: Michał Mirosław <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
> ---
>  arch/arm/boot/dts/at91sam9m10g45ek.dts | 48 +++++++++++++++++-----------------
>  1 file changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/at91sam9m10g45ek.dts b/arch/arm/boot/dts/at91sam9m10g45ek.dts
> index 9cf1f5163fbd..272af5867403 100644
> --- a/arch/arm/boot/dts/at91sam9m10g45ek.dts
> +++ b/arch/arm/boot/dts/at91sam9m10g45ek.dts
> @@ -223,30 +223,6 @@
>  		fb0: fb@0x00500000 {
>  			display = <&display0>;
>  			status = "okay";
> -
> -			display0: display {

Michał, thanks for your patch.

Actually the DT binding requires this:
Documentation/devicetree/bindings/video/atmel,lcdc.txt

So it's somehow a bigger issue.
Moreover, several boards have exactly the same arrangement than the
at91sam9m10g45ek, so you probably need to modify them all at the same time.

After a brief look at drivers/video/fbdev/atmel_lcdfb.c it seems that
the name of the node is not so much important, so we can modify it
(something like display0: lcd-display {}) .

I suggest that you modify the binding, the board files affected and
re-submit a patch.

Best regards,

> -				bits-per-pixel = <32>;
> -				atmel,lcdcon-backlight;
> -				atmel,dmacon = <0x1>;
> -				atmel,lcdcon2 = <0x80008002>;
> -				atmel,guard-time = <9>;
> -				atmel,lcd-wiring-mode = "RGB";
> -
> -				display-timings {
> -					native-mode = <&timing0>;
> -					timing0: timing0 {
> -						clock-frequency = <9000000>;
> -						hactive = <480>;
> -						vactive = <272>;
> -						hback-porch = <1>;
> -						hfront-porch = <1>;
> -						vback-porch = <40>;
> -						vfront-porch = <1>;
> -						hsync-len = <45>;
> -						vsync-len = <1>;
> -					};
> -				};
> -			};
>  		};
>  
>  		nand0: nand@40000000 {
> @@ -293,6 +269,30 @@
>  		};
>  	};
>  
> +	display0: display {
> +		bits-per-pixel = <32>;
> +		atmel,lcdcon-backlight;
> +		atmel,dmacon = <0x1>;
> +		atmel,lcdcon2 = <0x80008002>;
> +		atmel,guard-time = <9>;
> +		atmel,lcd-wiring-mode = "RGB";
> +
> +		display-timings {
> +			native-mode = <&timing0>;
> +			timing0: 480x272 {
> +				clock-frequency = <9000000>;
> +				hactive = <480>;
> +				vactive = <272>;
> +				hback-porch = <1>;
> +				hfront-porch = <1>;
> +				vback-porch = <40>;
> +				vfront-porch = <1>;
> +				hsync-len = <45>;
> +				vsync-len = <1>;
> +			};
> +		};
> +	};
> +
>  	pwmleds {
>  		compatible = "pwm-leds";
>  
> 


-- 
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
