From: Chen Peter-B29397 <B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCH v2 00/12] add imx usb driver for mx28/6x
Date: Tue, 22 May 2012 01:44:14 +0000
Message-ID: <F281D0F91ED19E4D8E63A7504E8A649803BB2B79@039-SN2MPN1-023.039d.mgd.msft.net>
References: <1337592237-5090-1-git-send-email-richard.zhao@freescale.com>
 <201205212141.52171.marex@denx.de> <4FBA9BE4.7020303@grid-net.com>
 <201205212207.34978.marex@denx.de>
 <F281D0F91ED19E4D8E63A7504E8A649803BB2B2F@039-SN2MPN1-023.039d.mgd.msft.net>
 <20120522014158.GF6206@b20223-02.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120522014158.GF6206-iWYTGMXpHj9ITqJhDdzsOjpauB2SiJktrE5yTffgRl4@public.gmane.org>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhao Richard-B20223 <B20223-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Subodh Nijsure <snijsure-4jo+YWezP1RWk0Htik3J/w@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Estevam Fabio-R49496 <r49496-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Li Frank-B20596 <B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "linuxzsc-MeMPY/F8WlbQT0dZR+AlfA@public.gmane.org" <linuxzsc-MeMPY/F8WlbQT0dZR+AlfA@public.gmane.org>, "dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org" <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

 
> > >
> > > This here is definitelly going to support mx28 and I'm slowly working
> > > through
> > > the DT stuff to test this, all right?
> > >
> > > We were talking about imx.{xz|x,y is [0-9a-z]} \ imx.{23,28,6q}
> > >
> > This driver needs to work on both DT and non-DT support.
> > Let's do it after next version when we need to add it for old mxc
> platform.
> I don't think so. We only need to go right direction and don't do
> extra work for what is going to be abandoned.
Are you sure all i.mx platform will support DT in future?

> 
> Thanks
> Richard
> >
> >
> > > >
> > > > -Subodh
> > >
> > > Best regards,
> > > Marek Vasut
> >

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
