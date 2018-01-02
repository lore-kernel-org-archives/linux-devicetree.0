From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: dts: bcm2837-rpi-3-b: add GPIO expander
Date: Tue, 2 Jan 2018 20:03:13 +0100 (CET)
Message-ID: <1524381852.182115.1514919793281@email.1und1.de>
References: <cover.1514898134.git.baruch@tkos.co.il>
 <a29df633ee568e150c150debde66c0783a57c70a.1514898134.git.baruch@tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a29df633ee568e150c150debde66c0783a57c70a.1514898134.git.baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Dave Stevenson <dave.stevenson-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Baruch,

> Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org> hat am 2. Januar 2018 um 14:19 geschrieben:
> 
> 
> Add a description of the RPi3 GPIO expander that the VC4 firmware controls.
> 
> Signed-off-by: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
> ---
>  arch/arm/boot/dts/bcm2837-rpi-3-b.dts | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/bcm2837-rpi-3-b.dts b/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
> index b44b3b5af00d..09dca48da2bd 100644
> --- a/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
> +++ b/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
> @@ -23,6 +23,16 @@
>  			gpios = <&gpio 47 0>;
>  		};
>  	};
> +
> +	soc {

unfortunately this is a common issue of the RPi firmware drivers. These nodes shouldn't be child of the soc, because it's only bound for memory mapped IO. So please move it to the same level as soc. Otherwise we get more warnings with W=1 and Rob Herring gets unhappy.

> +		expgpio: expgpio {
> +			compatible = "brcm,bcm2835-expgpio";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			firmware = <&firmware>;

Please add the gpio-line-names from Eric's patch [1].

Thanks
Stefan

[1] - https://patchwork.kernel.org/patch/9339857/

> +			status = "okay";
> +		};
> +	};
>  };
>  
>  /* uart0 communicates with the BT module */
> -- 
> 2.15.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
