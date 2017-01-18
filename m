From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: add DT binding for s3c2410 USB
 device controller
Date: Wed, 18 Jan 2017 14:08:45 -0600
Message-ID: <20170118200845.qj4qzgav4ffcz5pa@rob-hp-laptop>
References: <1484172150-32075-1-git-send-email-sergio.prado@e-labworks.com>
 <1484172150-32075-2-git-send-email-sergio.prado@e-labworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1484172150-32075-2-git-send-email-sergio.prado-1e4yhPs3/ABSwrhanM7KvQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergio Prado <sergio.prado-1e4yhPs3/ABSwrhanM7KvQ@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 11, 2017 at 08:02:29PM -0200, Sergio Prado wrote:
> Adds the device tree bindings description for Samsung S3C2410 and
> compatible USB device controller.
> 
> Signed-off-by: Sergio Prado <sergio.prado-1e4yhPs3/ABSwrhanM7KvQ@public.gmane.org>
> ---
>  .../devicetree/bindings/usb/s3c2410-usb.txt        | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/s3c2410-usb.txt b/Documentation/devicetree/bindings/usb/s3c2410-usb.txt
> index e45b38ce2986..28353eea31fd 100644
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
> +		"uclk" for the USB bus clock
> +		"usb-device" for the USB device clock

Perhaps just "bus" and "device".

> +
> +Optional properties:
> + - samsung,vbus-gpio: specifies a gpio that allows to detect whether
> +   vbus is present - USB is connected (active high, input).
> + - samsung,pullup-gpio: If present, specifies a gpio to control the
> +   USB D+ pullup (active high, output).

"-gpios", not "-gpio" is preferred.

These should be common property names if we're going to have them. The 
problem with just "vbus-gpios" is does that mean an enable control or 
status as you have. I guess in the former case, that should always be 
modeled as a regulator.

Also, these should all be part of a connector node as these controls are 
more related to the USB connector than the controller. And I don't mean 
extcon here because those bindings are a mess.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
