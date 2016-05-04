From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] extcon: gpio: add DT binding doc for extcon-gpio
Date: Wed, 4 May 2016 08:30:37 -0500
Message-ID: <20160504133037.GA23334@rob-hp-laptop>
References: <1462254591-8907-1-git-send-email-vreddytalla@nvidia.com>
 <1462254591-8907-2-git-send-email-vreddytalla@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1462254591-8907-2-git-send-email-vreddytalla-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Venkat Reddy Talla <vreddytalla-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 03, 2016 at 11:19:51AM +0530, Venkat Reddy Talla wrote:
> Addiing DT binding doc for the extcon gpios properties.
> 
> Signed-off-by: Venkat Reddy Talla <vreddytalla-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  .../devicetree/bindings/extcon/extcon-gpio.txt        | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/extcon/extcon-gpio.txt
> 
> diff --git a/Documentation/devicetree/bindings/extcon/extcon-gpio.txt b/Documentation/devicetree/bindings/extcon/extcon-gpio.txt
> new file mode 100644
> index 0000000..4a49c23
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/extcon/extcon-gpio.txt
> @@ -0,0 +1,19 @@
> +EXTCON FOR GPIO

This needs a better description of what this is and what h/w this 
applies to.

> +
> +Required Properties:
> + - compatible : Should be "extcon-gpio";
> +
> +Optional Properties:
> + - extcon-gpio,name: Name of extcon device.
> + - gpio: gpio number.

Should be 'gpios'.

> + - extcon-gpio,irq-flags: IRQ flags for GPIO.

If this is an interrupt, then you should be using the interrupts 
property.

> + - extcon-gpio,debounce: Debounce time in ms.

extcon-gpio is not a vendor prefix, so drop it.

Add unit suffix (-ms).

> + - extcon-gpio,connection-state-low: boolean, Connection state with
> +                gpio state. True if gpio low means connected.

The active state should be in the GPIO flags cell.

> +
> +extcon-gpio {
> +	compatible = "extcon-gpio";
> +        extcon-gpio,name = "VBUS";

How is VBus a gpio?

> +	gpio = <&gpio 20 0>;
> +	extcon-gpio,cable-names = <EXTCON_USB EXTCON_NONE>;

Not documented.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
