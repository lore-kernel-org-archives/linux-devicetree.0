From: Richard Zhao <linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 05/12] usb: chipidea: add imx driver binding
Date: Tue, 22 May 2012 23:06:19 +0800
Message-ID: <20120522150616.GA2380@richard-laptop>
References: <1337592237-5090-1-git-send-email-richard.zhao@freescale.com>
 <1337592237-5090-6-git-send-email-richard.zhao@freescale.com>
 <201205220630.57007.marex@denx.de>
 <20120522045120.GL6206@b20223-02.ap.freescale.net>
 <87fwasbkt7.fsf@ashishki-desk.ger.corp.intel.com>
 <20120522100624.GP30559@arwen.pp.htv.fi>
 <20120522103139.GD32035@b20223-02.ap.freescale.net>
 <20120522103516.GR30559@arwen.pp.htv.fi>
 <8762bobiqt.fsf@ashishki-desk.ger.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <8762bobiqt.fsf-qxRn5AmX6ZD9BXuAQUXR0fooFf0ArEBIu+b9c/7xato@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linuxzsc-MeMPY/F8WlbQT0dZR+AlfA@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 22, 2012 at 01:41:30PM +0300, Alexander Shishkin wrote:
> Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org> writes:
> 
> > On Tue, May 22, 2012 at 06:31:40PM +0800, Richard Zhao wrote:
> >> On Tue, May 22, 2012 at 01:06:26PM +0300, Felipe Balbi wrote:
> >> > Hi,
> >> > 
> >> > On Tue, May 22, 2012 at 12:56:52PM +0300, Alexander Shishkin wrote:
> >> > > > Do you think it's a good idea to let user select binding driver directly
> >> > > > and the binding driver config depends on chipidea config?
> >> > > 
> >> > > I don't have a strong opinion on this, although I prefer it the way it
> >> > > is now, because, imo:
> >> > > 
> >> > >   * in case of =m (and that's the only sane way of compiling it anyway),
> >> > >     these all are compiled as modules, which you simply don't install if
> >> > >     you don't want them;
> >> > >   * all of them get compile-tested every time you change something in
> >> > >     the driver, which is a good thing;
> >> > 
> >> > only true for $(ARCH) builds. I would like to see these drivers being
> >> > compile tested on linux-next on all arches. Thus the patches I just
> >> > sent.
> >> The idea is great. But
> >> - how can I make sure it pass for all arch? There' 27 folder in arch/.
> >> - it's hard to predict one driver depends on what.
> >> - for embedded kernel, people like built-in drivers, and people will
> >>   have things they don't need at all.
> >
> > that's true to some extent, but until we know for sure that all of that
> > is compiling fine and all dependencies are properly handled, I wouldn't
> > like to see Kconfig or Makefile being abused. That has happened before
> > and will happen again if we allow it.
> >
> > My suggestion to Alex is to remove all dependencies for at least a
> > couple of merge windows and only add dependencies for stuff which
> > actually matters; like only building the PCI glue layer when CONFIG_PCI
> > is defined instead of when ARCH_X86 is defined and so on.
> 
> That's what I mean to do as well. I wouldn't dream of making something
> like this x86 specific. :)
Alex, Have you made the decision that remove all dependencies and leave
only ones that has to be there? If yes, I'll try the way, though I don't
feel good about that.

Thanks
Richard
> 
> > When it gets to a product, that can be easily optimized and when we have
> > decided what's the best way to place the choices, we will do so. Until
> > then, we like to use linux-next for compile testing everything.
> 
> Seconded.
> 
> Regards,
> --
> Alex
> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
