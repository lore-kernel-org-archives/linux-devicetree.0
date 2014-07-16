From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 08/12] Documentation: bindings: add doc for the USB2 ChipIdea USB driver
Date: Wed, 16 Jul 2014 10:39:36 +0200
Message-ID: <23972141.94aiK9jz66@wuerfel>
References: <1405499166-6726-1-git-send-email-antoine.tenart@free-electrons.com> <1405499166-6726-9-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405499166-6726-9-git-send-email-antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Antoine =?ISO-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 16 July 2014 10:26:02 Antoine T=E9nart wrote:
> +
> +Required properties:
> +- compatible: should be "chipidea,usb2"
> +- reg: base address and length of the registers
> +- interrupts: interrupt for the USB controller
> +
> +Optional properties:
> +- clocks: reference to the USB clock
> +- usb-phy: reference to the USB PHY

I think the phy reference should use the standard phy binding, using
"phys" property to refer to a node that has a "#phy-cells" property.

It seems the code gets this right, but just the documentation is wrong.

> +- vbus-supply: reference to the VBUS regulator
> +- dma-mask: DMA bit mask

No. Do not use "dma-mask" as a property, that is a pure Linux specific
concept. The DT way to express this is to use the 'dma-ranges' property
in the device's parent to describe any bus-related restrictions, and
for the driver to ask for a mask that matches what the hardware is
capable of (which may be smaller or larger than what the bus supports).

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
