From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH v3 03/12] usb: ehci-hcd: notify phy when connect change
Date: Tue, 5 Jun 2012 13:30:08 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1206051328430.1542-100000@iolanthe.rowland.org>
References: <201206051923.09063.marex@denx.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201206051923.09063.marex-ynQEQJNshbs@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Cc: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 5 Jun 2012, Marek Vasut wrote:

> > > > Do the tests in the opposite order and add "unlikely":
> > > > 			if (unlikely(ehci->transceiver &&
> > > > 			
> > > > 					(pstatus & PORT_CSC)) {
> > > > 
> > > > That way it will fail more quickly on systems where it doesn't apply or
> > > > for unaffected ports.
> > > 
> > > Does this unlikely() have any effect on ARM/MIPS/PPC, where this chipidea
> > > IP is used ? Or is there some x86 device sporting this IP too?
> > 
> > I don't know what unlikely() does on architectures other than x86.
> 
> It should be optimized out to nothing on anything else but x86. On x86 it is a 
> hint for the branch predictor. Or that's what I believe it is.

That's right.  Then it should have no effect on ARM/MIPS/PPC.

> > And
> > I haven't heard of any x86 systems that would need to use this code.
> >
> > On the other hand, port-status changes don't occur very frequently.  A
> > little time penalty one way or the other won't make much difference.
> 
> I'm not opposed, just curious :)

No big deal either way.  But the order of the tests should be switched, 
because on most systems, ehci->transceiver will be NULL.

Alan Stern

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
