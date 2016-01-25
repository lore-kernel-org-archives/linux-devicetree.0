From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 1/1] USB: core: let USB device know device node
Date: Mon, 25 Jan 2016 09:50:53 +0100
Message-ID: <1825868.A6VKDYvWaj@wuerfel>
References: <Pine.LNX.4.44L0.1601211015010.2275-100000@iolanthe.rowland.org> <2404899.20LhULZo7N@wuerfel> <CAL411-qfzcynzc=YrepzcA6EmFuxy-Ri4xRQ+R-QVBDEPZXtZQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL411-qfzcynzc=YrepzcA6EmFuxy-Ri4xRQ+R-QVBDEPZXtZQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday 25 January 2016 11:57:37 Peter Chen wrote:
> >> >
> >> >             hub@3 { /* same external  hub, highspeed mode */
> >> >                     compatible = "usb2109,0812.591",
> >> >                                  "usb2109,0812",
> >> >                                  "usb2109,class9.0.1",
> >> >                                  "usb2109,class9.0",
> >> >                                  "usb2109,class9";
> >> >
> >> >                     #address-cells = <1>;
> >> >                     #size-cells = <0>;
> >> >                     reg = >;
> >> >
> >>
> >> Why "reg" is 3 here?
> >
> > My mistake. It should be hub@1 and reg=<1>;
> >
> > I accidentally confused the port number and the device number.
> 
> I think it should be hub@2 and reg=<0x2>.
> According to Alan, we should use xHCI numbering scheme when
> describing the ports of an xHCI root hub.

For a single-port root hub, that would be right. My PC has
two ports, so the first port has reg=<0x1> for SS and
reg=<0x3> for HS.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
