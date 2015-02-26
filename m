From: Peter Chen <Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCH v2 0/2] ARM: imx6sx-sdb: add revb board
Date: Thu, 26 Feb 2015 09:18:24 +0000
Message-ID: <BN3PR0301MB084995583E88A7A53E5D5A0F81140@BN3PR0301MB0849.namprd03.prod.outlook.com>
References: <1421804094-26379-1-git-send-email-peter.chen@freescale.com>
 <20150226075838.GF20028@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150226075838.GF20028@dragon>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


 
> >
> > The main changes between reva and revb board:
> > - OOP setting
> > - pfuse
> > - qspi
> > - can transceiver (not mainlined)
> >
> > Changes for v2:
> >
> > - Add missing Makefile entries for both dts files. [Patch 1/2] and
> > [Patch 2/2]
> > - Delete OOP setting changed at imx6sx-sdb-reva, it is SoC feature,
> >   it doesn't need to be change unless board limitations. [Patch 1/2]
> > - Add explanation why OOP setting need to changed at imx6sx-sdb revb
> > board. [Patch 2/2]
> > - Make imx6sx-sdb revb board as default imx6sx-sdb board. [Patch 2/2]
> >
> > Peter Chen (2):
> >   ARM: imx6sx-sdb: change default board as reva board
> >   ARM: imx6sx-sdb: add revb board and make it default
> 
> Peter,
> 
> What branch did you generate these patches on?  I'm trying to apply them, but
> they do not apply on any reasonable branch.  Can you re-spin against v4.0-rc1?
> Thanks.
> 

I did it based on two or three weeks Linux-next tree, I will send it based on
v4.0-rc1 today.

Peter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
