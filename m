From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 2/3] usb: gadget: pxa27x_udc device-tree documentation
Date: Wed, 25 Jun 2014 11:33:57 +0100
Message-ID: <20140625103357.GC14495@leverpostej>
References: <1403427899-32154-1-git-send-email-robert.jarzmik@free.fr>
 <1403427899-32154-2-git-send-email-robert.jarzmik@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1403427899-32154-2-git-send-email-robert.jarzmik-GANU6spQydw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jun 22, 2014 at 10:04:58AM +0100, Robert Jarzmik wrote:
> Add documentation for device-tree binding of arm PXA 27x udc (usb
> device) driver.
> 
> Signed-off-by: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> 
> ---
> Since V1: change OF id mrvl,pxa27x_udc -> marvell,pxa27x-udc
>           This is a consequence of other DT reviews on the marvell
>           namings.
> ---
>  Documentation/devicetree/bindings/usb/pxa-usb.txt | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/pxa-usb.txt b/Documentation/devicetree/bindings/usb/pxa-usb.txt
> index 79729a9..0e4863f 100644
> --- a/Documentation/devicetree/bindings/usb/pxa-usb.txt
> +++ b/Documentation/devicetree/bindings/usb/pxa-usb.txt
> @@ -29,3 +29,23 @@ Example:
>  		marvell,port-mode = <2>; /* PMM_GLOBAL_MODE */
>  	};
>  
> +UDC
> +
> +Required properties:
> + - compatible: Should be "marvell,pxa27x-udc" for USB controllers
> +   used in device mode.

We typically don't like wildcard compatible strings in DT.

> +
> +Optional properties:
> + - "udc-pullup-gpio" - gpio activated to control the USB D+ pullup.
> + - "udc-pullup-gpio-inverted" - boolean inverting gpio pullup logic.

Use the GPIO bindings.

> +
> +Example:
> +
> +		pxa27x_udc: udc@40600000 {
> +			compatible = "marvell,pxa27x-udc";
> +			reg = <0x40600000 0x10000>;
> +			interrupts = <11>;
> +			clocks = <&pxa2xx_clks 11>;
> +			clock-names = "pxa27x-udc";

Neither of these were mentioned above.

The name of the clock input doesn't make sense.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
