From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 1/1] USB: core: let USB device know device node
Date: Thu, 21 Jan 2016 11:10:28 +0100
Message-ID: <3851350.Ox9dssDdWY@wuerfel>
References: <4405270.vcz87Q878u@wuerfel> <1989217.907WTZoGvq@wuerfel> <20160121094832.GA22037@shlinux2>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160121094832.GA22037@shlinux2>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 21 January 2016 17:48:32 Peter Chen wrote:
> 
> > 
> > So two hubs at ports 1 and 2 of the USB controller that integrates
> > the root hub and shares a device node with it.
> > 
> Ok, so the "reg" is the address for certain root hub (HS or SS), not
> the unity address for the whole controller, if it is, do we really
> need to add two nodes for one physical port, HS and SS will not be used
> at the same time. And if the reg is the same, how can we know
> which node is from current recognized device.

The "reg" is the address that the parent device uses to talk to the child
device. If you know which of the two that child is attached to, then I
think you don't need both, but I think we have to use the entire addressing.

In Alan's example, there are six HS ports and three SS ports, but as I
understand it, there is no guarantee that the numbering between the two
is identical, and that the three SS ports always refer to the three HS
ports. In particular for devices soldered on-board (rather than connected
through a standard plug), I would guess that it is possible to connect
them to separate child devices though I have to admit that I do not
understand enough of the standard to know for sure.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
