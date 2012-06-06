From: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v3 03/12] usb: ehci-hcd: notify phy when connect change
Date: Wed, 6 Jun 2012 09:27:44 +0800
Message-ID: <20120606012743.GA16929@b20223-02.ap.freescale.net>
References: <201206051923.09063.marex@denx.de>
 <Pine.LNX.4.44L0.1206051328430.1542-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1206051328430.1542-100000-IYeN2dnnYyZXsRXLowluHWD2FQJk+8+b@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 05, 2012 at 01:30:08PM -0400, Alan Stern wrote:
> On Tue, 5 Jun 2012, Marek Vasut wrote:
> 
> > > > > Do the tests in the opposite order and add "unlikely":
> > > > > 			if (unlikely(ehci->transceiver &&
> > > > > 			
> > > > > 					(pstatus & PORT_CSC)) {
> > > > > 
> > > > > That way it will fail more quickly on systems where it doesn't apply or
> > > > > for unaffected ports.
> > > > 
> > > > Does this unlikely() have any effect on ARM/MIPS/PPC, where this chipidea
> > > > IP is used ? Or is there some x86 device sporting this IP too?
> > > 
> > > I don't know what unlikely() does on architectures other than x86.
> > 
> > It should be optimized out to nothing on anything else but x86. On x86 it is a 
> > hint for the branch predictor. Or that's what I believe it is.
> 
> That's right.  Then it should have no effect on ARM/MIPS/PPC.
I prefer add the unlikely, we don't need to care about the arch
implementation. Maybe it'll be implemented some day if it don't. and
at least the code tell the reader the condition is unlikely.

I'll post a update to this series.

Thanks
Richard
> 
> > > And
> > > I haven't heard of any x86 systems that would need to use this code.
> > >
> > > On the other hand, port-status changes don't occur very frequently.  A
> > > little time penalty one way or the other won't make much difference.
> > 
> > I'm not opposed, just curious :)
> 
> No big deal either way.  But the order of the tests should be switched, 
> because on most systems, ehci->transceiver will be NULL.
> 
> Alan Stern
> 
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
