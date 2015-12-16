From: "Maciej S. Szmigiero" <mail-APzI5cXaD1zVlRWJc41N0YvC60bnQu0Y@public.gmane.org>
Subject: Re: [PATCH v2 0/3] USB: add generic onboard USB HUB driver
Date: Wed, 16 Dec 2015 21:05:35 +0100
Message-ID: <5671C40F.3000000@maciej.szmigiero.name>
References: <1450077974-22762-1-git-send-email-peter.chen@freescale.com>	<CAOMZO5CfBKuJ584jwbg98s9tn+0Z7W0nOaZnUkm4cJUSvNGTZw@mail.gmail.com>	<20151215062821.GA11241@shlinux2>	<CAOMZO5DiRzfy5dULh0C7qU2KUM-i8fBh6W5rS9zOTHJJK6fqwg@mail.gmail.com>	<20151216041058.GC23482@shlinux2> <CAOMZO5An3CK-a3NQtOF3nnPc8vzu2+SKnfJ=iOuAhjCBvZwToQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOMZO5An3CK-a3NQtOF3nnPc8vzu2+SKnfJ=iOuAhjCBvZwToQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Patryk Kowalczyk <patryk-6+2coLtxvIyvnle+31E0rA@public.gmane.org>, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Fabio,
Hi Peter,

On 16.12.2015 11:11, Fabio Estevam wrote:
> Hi Peter,
> 
> On Wed, Dec 16, 2015 at 2:11 AM, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> 
>> Thanks, Fabio, but I am curious how things like that? The USBOH3 clock
>> is not opened, the usb driver will hang when it tries to access
>> registers. If this clock is always on, then, why the system will
>> hang later?
> 
> I found the issue with your patch. You missed to add the pinctrl node.
> 
> With the change below USB is functional in Udoo:
> 
> --- a/arch/arm/boot/dts/imx6qdl-udoo.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-udoo.dtsi
> @@ -22,6 +22,8 @@
> 
>         usb_hub1 {
>                 compatible = "generic-onboard-hub";
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_usbh>;
>                 clocks = <&clks IMX6QDL_CLK_CKO>;
>                 reset-gpios = <&gpio7 12 GPIO_ACTIVE_LOW>;
>                 reset-duration-us = <2>;
> 

Thanks for your work, I didn't notice it previously (sorry).

I can confirm, too that with Peter's patches and the above change
the USB support works again on my UDOO DualLite board.

However, I noticed that when you have host USB support configured to be
build as modules then (due to its location under "if USB") it is only
possible to compile generic onboard USB HUB as module, too.

Then this module would need to be loaded before loading USB support
(or quickly after it), otherwise USB enumeration would time out after
few secs and loading it later wouldn't help.

Currently, this driver doesn't really need any USB host support and
is able to be compiled-in successfully regardless of USB host support
configuration with just small change to Makefile and Kconfig.

However I don't know if it is a design goal to not use USB host support
or just a current development status, but if it doesn't really need it
then it would be great if it could be selected to be build-in into kernel
regardless of host USB support setting.

Best regards,
Maciej Szmigiero

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
