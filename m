From: "Anson.Huang-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Anson.Huang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCH 1/2] ARM: imx6sx-sdb: change default board as reva board
Date: Tue, 20 Jan 2015 07:51:31 +0000
Message-ID: <BN1PR0301MB062873E37C225DD38B2BCE3CFF4B0@BN1PR0301MB0628.namprd03.prod.outlook.com>
References: <1421220998-3491-1-git-send-email-peter.chen@freescale.com>
 <1421220998-3491-2-git-send-email-peter.chen@freescale.com>
 <20150120073527.GT2766@dragon> <20150120063016.GD13645@shlinux2>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150120063016.GD13645@shlinux2>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



Best regards!
Anson Huang


> -----Original Message-----
> From: Peter Chen [mailto:peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org]
> Sent: 2015-01-20 2:30 PM
> To: Shawn Guo; Huang Yongcai-B20788
> Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org; robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; pawel.moll-5wv7dgnIgG8@public.gmane.org;
> mark.rutland-5wv7dgnIgG8@public.gmane.org; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org;
> devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: [PATCH 1/2] ARM: imx6sx-sdb: change default board as reva
> board
> 
> On Tue, Jan 20, 2015 at 03:35:29PM +0800, Shawn Guo wrote:
> > On Wed, Jan 14, 2015 at 03:36:37PM +0800, Peter Chen wrote:
> > > The imx6sx sdb board has two revisions, the current mainline one is
> > > reva which is mainly for internal use. In this commit, we rename
> > > imx6sx-sdb.dts to imx6sx-sdb.dtsi, and move the reva dedicated
> > > contents to imx6sx-sdb-reva.dts.
> > >
> > > Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > > ---
> > >  arch/arm/boot/dts/imx6sx-sdb-reva.dts              | 158
> +++++++++++++++++++++
> > >  .../boot/dts/{imx6sx-sdb.dts => imx6sx-sdb.dtsi}   | 131 -----------
> ------
> >
> > arch/arm/boot/dts/Makefile needs an update.
> >
> 
> Thanks, I will.
> 
> 
> > >  2 files changed, 158 insertions(+), 131 deletions(-)  create mode
> > > 100644 arch/arm/boot/dts/imx6sx-sdb-reva.dts
> > >  rename arch/arm/boot/dts/{imx6sx-sdb.dts => imx6sx-sdb.dtsi} (83%)
> > >
> > > diff --git a/arch/arm/boot/dts/imx6sx-sdb-reva.dts
> > > b/arch/arm/boot/dts/imx6sx-sdb-reva.dts
> > > new file mode 100644
> > > index 0000000..e7a8c34
> > > --- /dev/null
> > > +++ b/arch/arm/boot/dts/imx6sx-sdb-reva.dts
> > > @@ -0,0 +1,158 @@
> > > +/*
> > > + * Copyright (C) 2014-2015 Freescale Semiconductor, Inc.
> > > + *
> > > + * This program is free software; you can redistribute it and/or
> > > +modify
> > > + * it under the terms of the GNU General Public License version 2
> > > +as
> > > + * published by the Free Software Foundation.
> > > + */
> > > +
> > > +#include "imx6sx-sdb.dtsi"
> > > +
> > > +/ {
> > > +	model = "Freescale i.MX6 SoloX SDB RevA Board"; };
> > > +
> > > +&cpu0 {
> > > +	operating-points = <
> > > +		/* kHz    uV */
> > > +		996000  1250000
> > > +		792000  1175000
> > > +		396000  1075000
> > > +	>;
> > > +	fsl,soc-operating-points = <
> > > +		/* ARM kHz  SOC uV */
> > > +		996000      1175000
> > > +		792000      1175000
> > > +		396000      1175000
> > > +	>;
> >
> > I'm wondering why different revision of the board require a different
> > OPP settings.
> >
> 
> Anson, do you know the reason?

As i.MX6SX SDB Rev-B board uses PFuse 200 which has only one power supply for both
VDDARM_IN and VDDSOC_IN, so it needs VDDARM_IN equal VDDSOC_IN, currently
we set Rev-B board as default in imx6sx.dtsi, which uses same voltage for both
VDDARM_IN and VDDSOC_IN.The Rev-A board uses PFuze 100 which has separate power
supply for VDDARM_IN and VDDSOC_IN, so it can use different voltage on VDDARM_IN
and VDDSOC_IN according to datasheet.

Anson
> 
> Peter
> 
> 
> --
> 
> Best Regards,
> Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
