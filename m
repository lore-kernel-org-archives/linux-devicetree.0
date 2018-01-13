From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH v2 4/4] ARM: dts: bcm2837-rpi-3-b: add GPIO expander
Date: Sat, 13 Jan 2018 11:44:22 +0100 (CET)
Message-ID: <2079522989.43372.1515840262445@email.1und1.de>
References: <cover.1515698418.git.baruch@tkos.co.il>
 <1cb81e3d7a1b1f7ccf374952fa7e8d2147c186fb.1515698418.git.baruch@tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1cb81e3d7a1b1f7ccf374952fa7e8d2147c186fb.1515698418.git.baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Dave Stevenson <dave.stevenson-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Zoran <mzoran-O+n0w2l5AFbk1uMJSBkQmQ@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Baruch,

> Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org> hat am 11. Januar 2018 um 20:44 geschrieben:
> 
> 
> Add a description of the RPi3 GPIO expander that the VC4 firmware controls.
> 
> Signed-off-by: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
> ---
> v2:
>   * Move GPIO expander node out of the soc container
>   * Rename compatible string
>   * Add gpio-line-names property
> ---
>  arch/arm/boot/dts/bcm2837-rpi-3-b.dts | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/bcm2837-rpi-3-b.dts b/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
> index b44b3b5af00d..24555e8a43ec 100644
> --- a/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
> +++ b/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
> @@ -23,6 +23,16 @@
>  			gpios = <&gpio 47 0>;
>  		};
>  	};
> +
> +	expgpio: gpio-expander {
> +		compatible = "raspberrypi,firmware-gpio";
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		firmware = <&firmware>;
> +		gpio-line-names = "BT_ON", "WL_ON", "STATUS_LED", "LAN_RUN",
> +			"HPD_N", "CAM_GPIO0", "CAM_GPIO1", "PWR_LOW_N";

please one GPIO name per line like in the other files. This makes it easier to review changes and add comments.

Stefan

> +		status = "okay";
> +	};
>  };
>  
>  /* uart0 communicates with the BT module */
> -- 
> 2.15.1
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
