From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: i.MX51 babbage: Support diagnostic LED
Date: Mon, 10 Feb 2014 14:31:20 +0800
Message-ID: <20140210063118.GJ9628@S2101-09.ap.freescale.net>
References: <1391522263-17877-1-git-send-email-Ying.Liu@freescale.com>
 <20140210030214.GB9628@S2101-09.ap.freescale.net>
 <1392006579.703394606@f357.i.mail.ru>
 <52F87087.4000908@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52F87087.4000908-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liu Ying <Ying.Liu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 10, 2014 at 02:24:07PM +0800, Liu Ying wrote:
> >>> @@ -81,6 +81,17 @@
> >>>  		};
> >>>  	};
> >>>  
> >>> +	leds {
> >>> +		compatible = "gpio-leds";
> >>> +		pinctrl-names = "default";
> >>> +		pinctrl-0 = <&led_pin_gpio2_6>;
> >>> +
> >>> +		led-diagnostic {
> >>> +			label = "diagnostic";
> >>> +			gpios = <&gpio2 6 0>;
> >>
> >> Just out of curiosity, how will you use/trigger the led?
> > 
> > And GPIO bindings should be used to specify active level,
> > GPIO_ACTIVE_HIGH in this case.
> 
> Based on Linux 3.14-rc2, this gives me no single output:
> grep GPIO_ACTIVE arch/arm/boot/dts/ -nr | grep imx

If you grep linux-next, you will find quite a few.

> 
> So, this patch follows the old approach.
> 
> I agree to use GPIO_ACTIVE_HIGH/GPIO_ACTIVE_LOW macros.
> How about generating dedicated patch sets for this purpose?
> Actually, I had one set for i.MX51 platforms.

I prefer to have this change in the same patch.

Shawn

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
