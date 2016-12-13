From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: usb: add DT binding for s3c2410 USB
 device controller
Date: Tue, 13 Dec 2016 12:59:15 -0600
Message-ID: <20161213185915.z2ze7wzx4im5hxdh@rob-hp-laptop>
References: <1481310400-28676-1-git-send-email-sergio.prado@e-labworks.com>
 <1481310400-28676-2-git-send-email-sergio.prado@e-labworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1481310400-28676-2-git-send-email-sergio.prado-1e4yhPs3/ABSwrhanM7KvQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergio Prado <sergio.prado-1e4yhPs3/ABSwrhanM7KvQ@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 09, 2016 at 05:06:39PM -0200, Sergio Prado wrote:
> Adds the device tree bindings description for Samsung S3C2410 and
> compatible USB device controller.
> 
> Signed-off-by: Sergio Prado <sergio.prado-1e4yhPs3/ABSwrhanM7KvQ@public.gmane.org>
> ---
>  .../devicetree/bindings/usb/s3c2410-usb.txt        | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/s3c2410-usb.txt b/Documentation/devicetree/bindings/usb/s3c2410-usb.txt
> index e45b38ce2986..4d3f9894c2d4 100644
> --- a/Documentation/devicetree/bindings/usb/s3c2410-usb.txt
> +++ b/Documentation/devicetree/bindings/usb/s3c2410-usb.txt
> @@ -20,3 +20,31 @@ usb0: ohci@49000000 {
>  	clocks = <&clocks UCLK>, <&clocks HCLK_USBH>;
>  	clock-names = "usb-bus-host", "usb-host";
>  };
> +
> +Samsung S3C2410 and compatible USB device controller
> +
> +Required properties:
> + - compatible: Should be one of the following
> +	       "samsung,s3c2410-udc"
> +	       "samsung,s3c2440-udc"
> + - reg: address and length of the controller memory mapped region
> + - interrupts: interrupt number for the USB device controller
> + - clocks: Should reference the bus and host clocks
> + - clock-names: Should contain two strings
> +		"usb-bus-gadget" for the USB bus clock

Pretty sure the h/w clock name in the datasheet does not use the Linux 
term gadget.

> +		"usb-device" for the USB device clock
> +
> +Optional properties:
> + - samsung,vbus-gpio: If present, specifies a gpio that needs to be
> +   activated for the bus to be powered.

Isn't it the host side that controls Vbus?

> + - samsung,pullup-gpio: If present, specifies a gpio to control the

Both GPIOs need to specify the active state.

> +   USB D+ pullup.
> +
> +usb1: udc@52000000 {
> +	compatible = "samsung,s3c2440-udc";
> +	reg = <0x52000000 0x100000>;
> +	interrupts = <0 0 25 3>;
> +	clocks = <&clocks UCLK>, <&clocks HCLK_USBD>;
> +	clock-names = "usb-bus-gadget", "usb-device";
> +	samsung,pullup-gpio = <&gpc 5 GPIO_ACTIVE_HIGH>;
> +};
> -- 
> 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
