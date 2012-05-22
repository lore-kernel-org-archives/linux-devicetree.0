From: Chen Peter-B29397 <B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCH v2 00/12] add imx usb driver for mx28/6x
Date: Tue, 22 May 2012 01:38:33 +0000
Message-ID: <F281D0F91ED19E4D8E63A7504E8A649803BB2B2F@039-SN2MPN1-023.039d.mgd.msft.net>
References: <1337592237-5090-1-git-send-email-richard.zhao@freescale.com>
 <201205212141.52171.marex@denx.de> <4FBA9BE4.7020303@grid-net.com>
 <201205212207.34978.marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201205212207.34978.marex-ynQEQJNshbs@public.gmane.org>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Subodh Nijsure <snijsure-4jo+YWezP1RWk0Htik3J/w@public.gmane.org>
Cc: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Estevam Fabio-R49496 <r49496-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Li Frank-B20596 <B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "linuxzsc-MeMPY/F8WlbQT0dZR+AlfA@public.gmane.org" <linuxzsc-MeMPY/F8WlbQT0dZR+AlfA@public.gmane.org>, "dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Zhao Richard-B20223 <B20223-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org" <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

 
> > >
> > >> Hi Richard,
> > >>
> > >> On Mon, May 21, 2012 at 6:23 AM, Richard Zhao
> > >>
> > >> <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>  wrote:
> > >>> The work is based on  ci13xxx rework done by Alexander Shishkin.
> > >>>
> > >>> Status:
> > >>>   - this version only support host
> > >>>   - usbotg controler works at host role
> > >>>
> > >>> Changes since V1:
> > >>>   - Merge the work of Marek
> > >>>   - re-implement connect change notify
> > >>>   - imx6q: move part of code to clk
> > >>>   - imx6q: add config-on-boot gpios
> > >>
> > >> Can you please also add the driver into the defconfig files?
> > >>
> > >> What about the existing USB host drivers for
> mx27/mx31/mx35/mx25/mx35?
> > >>
> > >> Is the idea to switch to drivers/usb/chipidea/host.c too?
> > >
> > > I think the core is the same, it's just the ci13xxx-imx driver that'd
> > > need to be written differently for these
> >
> > So that means driver that you did are not going to be up streamed for
> > mx28/mxs? And those interested should be tracking this patch set?
> 
> This here is definitelly going to support mx28 and I'm slowly working
> through
> the DT stuff to test this, all right?
> 
> We were talking about imx.{xz|x,y is [0-9a-z]} \ imx.{23,28,6q}
>
This driver needs to work on both DT and non-DT support.
Let's do it after next version when we need to add it for old mxc platform.

 
> >
> > -Subodh
> 
> Best regards,
> Marek Vasut


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
