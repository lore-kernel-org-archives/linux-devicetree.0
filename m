From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 1/1] USB: core: let USB device know device node
Date: Thu, 21 Jan 2016 09:41:20 +0100
Message-ID: <1989217.907WTZoGvq@wuerfel>
References: <4405270.vcz87Q878u@wuerfel> <5639398.uJHXq6DsMC@wuerfel> <20160121031524.GA29893@shlinux2>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160121031524.GA29893@shlinux2>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 21 January 2016 11:15:24 Peter Chen wrote:
> 
> Just adding from device driver view and change the name from "roohub" to
> "port".
> 
> It is the port number (1-9), but not the root hub number.
> 
> At the most of embedded platforms, we have only one port per controller.
> For example, at the non-hub boards, if there are two Standard-A ports,
> there are from two different USB controllers.
> But for Alan's case, it has six ports, and all from the one USB controller,
> port 1 to port 6 are from the HS root hub, port 7 to port 9 are from the SS
> root hub.
> 
> For the single port controller platform, the dts will be like below, port_1 is
> under the HS root hub, port_2 is under the SS root hub.
> 
> &usb1 {
>         port_1: nxp@1 {
>                 compatible = "usb15a2,007d";
>                 reg = <0x01>;
> 
>                 hub: genesys@1 {
>                         compatible = "usb05e3,0608";
>                         reg = <0x01>;
>                 };
>         };
> 
>         port_2: nxp@2 {
>                 compatible = "usb15a2,007d";
>                 reg = <0x02>;
> 
>                 hub: genesys@1 {
>                         compatible = "usb05e3,0608";
>                         reg = <0x01>;
>                 };
>         };
> };

But why are you modeling ports of the root hub as hubs themselves?

I would expect the example above to look like

&usb1 {
        hub@1 {
                compatible = "usb05e3,0608";
                reg = <0x01>;
        };

	hub@2 {
                compatible = "usb05e3,0608";
                reg = <0x01>;
        };
};

So two hubs at ports 1 and 2 of the USB controller that integrates
the root hub and shares a device node with it.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
