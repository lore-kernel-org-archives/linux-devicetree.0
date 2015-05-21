From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v2 4/6] dt-bindings: Consolidate ChipIdea USB ci13xxx
 bindings
Date: Thu, 21 May 2015 09:46:01 +0800
Message-ID: <20150521014600.GA26837@shlinux2>
References: <1432087805-16671-1-git-send-email-robh@kernel.org>
 <1432087805-16671-5-git-send-email-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1432087805-16671-5-git-send-email-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>, Daniel Tang <dt.tangr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 19, 2015 at 09:10:03PM -0500, Rob Herring wrote:
> Combine the ChipIdea USB binding into a single document to reduce
> duplication and fragmentation. This marks use of the old PHY bindings as
> deprecated. Future compatible bindings should use generic PHY binding.

Thanks, Rob. These are what I plan to do in future too.

> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> index 27f8b1e..f074827 100644
> --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> @@ -1,15 +1,35 @@
>  * USB2 ChipIdea USB controller for ci13xxx
>  
>  Required properties:
> -- compatible: should be "chipidea,usb2"
> +- compatible: should be one of:
> +	"fsl,imx27-usb"
> +	"lsi,zevio-usb"
> +	"qcom,ci-hdrc"
> +	"chipidea,usb2"
>  - reg: base address and length of the registers
>  - interrupts: interrupt for the USB controller
>  
> +Recommended properies:
> +- phy_type: the type of the phy connected to the core. Should be one
> +  of "utmi", "utmi_wide", "ulpi", "serial" or "hsic". Without this
> +  property the PORTSC register won't be touched.
> +- dr_mode: One of "host", "peripheral" or "otg". Defaults to "otg"
> +
> +Deprecated properties:
> +- usb-phy:      phandle for the PHY device. Use "phys" instead.
> +- fsl,usbphy: phandle of usb phy that connects to the port. Use "phys" instead.
> +
>  Optional properties:
>  - clocks: reference to the USB clock
>  - phys: reference to the USB PHY
>  - phy-names: should be "usb-phy"
>  - vbus-supply: reference to the VBUS regulator
> +- fsl,usbmisc: phandler of non-core register device, with one argument
> +  that indicate usb controller index
> +- disable-over-current: disable over current detect
> +- external-vbus-divider: enables off-chip resistor divider for Vbus

The above property is only for fsl, we may need to differentiate
generic and vendor properties for reader.

-- 

Best Regards,
Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
