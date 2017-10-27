From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v7 usb-next 4/4] dt-bindings: usb: xhci: include the
 roothub and a device in the example
Date: Thu, 26 Oct 2017 22:29:57 -0500
Message-ID: <20171027032957.m55ntlce646hpd5a@rob-hp-laptop>
References: <20171023215718.3446-1-martin.blumenstingl@googlemail.com>
 <20171023215718.3446-5-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171023215718.3446-5-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 23, 2017 at 11:57:18PM +0200, Martin Blumenstingl wrote:
> This extends the existing example from the USB xHCI binding
> documentation so it includes the roothub and an actual device.
> The goal of this is to show that the roothub is specified alongside the
> actual devices on the USB bus (which is important because a device on
> the USB bus - for example a hub - might need it's own phys / phy-names
> properties. modelling the roothub as separate device and not nesting the
> other devices on the bus below the roothub allows us to keep the
> properties, for example the PHYs, separated).
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/usb/usb-xhci.txt | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> index 5b49ba9f2f9a..20e5ce2b016a 100644
> --- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> @@ -42,4 +42,27 @@ Example:
>  		compatible = "generic-xhci";
>  		reg = <0xf0931000 0x8c8>;
>  		interrupts = <0x0 0x4e 0x0>;
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		/* see usb-roothub.txt */
> +		roothub@0 {
> +			compatible = "usb1d6b,3", "usb1d6b,2";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0>;
> +
> +			port@1 {
> +				reg = <1>;
> +				phys = <&usb2_phy1>, <&usb3_phy1>;
> +				phy-names = "usb2-phy", "usb3-phy";
> +			};
> +		};
> +
> +		/* see usb-device.txt */
> +		hub: genesys@1 {

What do the 0 and 1 addresses correspond to?

> +			compatible = "usb5e3,608";
> +			reg = <1>;
> +		};
>  	};
> -- 
> 2.14.2
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
