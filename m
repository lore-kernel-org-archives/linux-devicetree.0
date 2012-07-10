From: Richard Zhao <linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v9 REBASE 6/9] USB: notify phy when root hub port connect
 change
Date: Tue, 10 Jul 2012 22:53:04 +0800
Message-ID: <20120710145302.GA2789@richard-laptop>
References: <20120710014450.GF26888@b20223-02.ap.freescale.net>
 <Pine.LNX.4.44L0.1207101021580.1308-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1207101021580.1308-100000-IYeN2dnnYyZXsRXLowluHWD2FQJk+8+b@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 10, 2012 at 10:24:07AM -0400, Alan Stern wrote:
> On Tue, 10 Jul 2012, Richard Zhao wrote:
> 
> > > > @@ -4037,6 +4038,13 @@ static void hub_port_connect_change(struct usb_hub *hub, int port1,
> > > >  		}
> > > >  	}
> > > >  
> > > > +	if (unlikely(hcd->phy && !hdev->parent)) {
> > > 
> > > Why is this "unlikely"?  And why mark it as such, is this a "fast path"
> > > that needs the compiler to know this hint to optimize things here?
> > > 
> > > Please don't use likely() or unlikely() except in places it really is
> > > needed, _and_ you have measured the difference.  Have you done so in
> > > this place?
> > It's from a comment by Alan Stern.
> > http://www.spinics.net/lists/linux-usb/msg64987.html
> 
> That comment was made in a somewhat different context.  At the time 
> the code was part of an interrupt handler; now it isn't.
> 
> > Actually, for my board, it's not unlikely. But for others which don't
> > have notify_connect/disconnect, it's unlikely.
> > 
> > Because it's not unlikely for all boards, I prefer remove "unlikely".
> 
> It's no longer a big deal one way or another.  I don't care about the 
> "unlikely" because it's on a cold path running in process context.  Go 
> ahead and remove it.
Ok. I'll remove it. 

Thanks
Richard
> 
> Alan Stern
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
