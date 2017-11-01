From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: usb: max3421: Interrupt-parent is optional
Date: Wed, 1 Nov 2017 17:08:00 -0500
Message-ID: <20171101220800.hl52gimstkm7euqc@rob-hp-laptop>
References: <20171031103257.3707-1-jules.maselbas@grenoble-inp.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171031103257.3707-1-jules.maselbas-l+/54qjP3hgoQXW8ST3Jvw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jules Maselbas <jules.maselbas-l+/54qjP3hgoQXW8ST3Jvw@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 31, 2017 at 11:32:57AM +0100, Jules Maselbas wrote:
> Documentation modification, now interrupt-parent is an optional
> property. Also fix few typos.
> 
> Signed-off-by: Jules Maselbas <jules.maselbas-l+/54qjP3hgoQXW8ST3Jvw@public.gmane.org>
> Reported-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/usb/maxim,max3421.txt | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/maxim,max3421.txt b/Documentation/devicetree/bindings/usb/maxim,max3421.txt
> index 7536c3ab3e5a..8cdbe0c85188 100644
> --- a/Documentation/devicetree/bindings/usb/maxim,max3421.txt
> +++ b/Documentation/devicetree/bindings/usb/maxim,max3421.txt
> @@ -1,17 +1,19 @@
>  Maxim Integrated SPI-based USB 2.0 host controller MAX3421E
>  
>  Required properties:
> - - compatible: "maxim,max3421"
> + - compatible: Should be "maxim,max3421"
>   - spi-max-frequency: maximum frequency for this device must not exceed 26 MHz.
>   - reg: chip select number to which this device is connected.
>   - maxim,vbus-en-pin: <GPOUTx ACTIVE_LEVEL>
>     GPOUTx is the number (1-8) of the GPOUT pin of MAX3421E to drive Vbus.
>     ACTIVE_LEVEL is 0 or 1.
> - - interrupt-parent: the phandle of the associated interrupt controller.
> - - interrupts: the interuption line description for the interrupt controller.
> + - interrupts: the interrupt line description for the interrupt controller.
>     The driver configures MAX3421E for active low level triggered interrupts,
>     configure your interrupt line accordingly.
>  
> +Optional property:
> + - interrupt-parent: the phandle to the associated interrupt controller.
> +

This all seems a bit pointless to me. interrupt-parent is required, but 
it can be in this node or a parent node (or not at all if a parent is 
the interrupt-controller).

If I have to set guidance, I'd say don't document interrupt-parent at 
all in device bindings. 

BTW, if you have this wrong, dtc checks this now.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
