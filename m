From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 06/20] usb: host: xhci-plat: Add support for the Armada 38x
Date: Tue, 06 May 2014 14:21:55 +0200
Message-ID: <4660313.evfclGtT1x@wuerfel>
References: <1399335255-589-1-git-send-email-gregory.clement@free-electrons.com> <61061197.hLhKsFqJLF@wuerfel> <20140506141023.715b932d@skate>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140506141023.715b932d@skate>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 06 May 2014 14:10:23 Thomas Petazzoni wrote:
> On Tue, 06 May 2014 13:57:44 +0200, Arnd Bergmann wrote:
> 
> > > Please limit this driver to mvebu arch and compile testing, i.e.
> > > 
> > >         depends on ARCH_MVEBU || COMPILE_TEST
> > 
> > I think it actually needs a dependency on MVEBU_MBUS.
> 
> That's not what we do for any of the other drivers that use the
> MVEBU_MBUS functions.

Fair enough. I guess using ARCH_MVEBU as the dependency works as well
because it implies MVEBU_MBUS. However, you can't use COMPILE_TEST
then because the driver itself needs the interfaces provided by MBUS.

It could be

	depends on ARCH_MVEBU || (MVEBU_MBUS && COMPILE_TEST)

to describe the dependency most accurately.

> > You probably need something like
> > 
> >       depends on MVEBU_MBUS=y || (MVEBU_MBUS=m && USB_XHCI=m)
> 
> MVEBU_MBUS is a bool, so there is no way is can be =m.

Yes, that helps.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
