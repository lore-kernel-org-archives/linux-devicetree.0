From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v6 02/15] usb: phy-mxs: Add platform judgement code
Date: Fri, 13 Dec 2013 13:15:09 +0800
Message-ID: <20131213051508.GA16072@shlinux1.ap.freescale.net>
References: <1386897825-6130-1-git-send-email-peter.chen@freescale.com>
 <1386897825-6130-3-git-send-email-peter.chen@freescale.com>
 <20131213041918.GC867@saruman.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131213041918.GC867-HgARHv6XitL9zxVx7UNMDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, frank.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 12, 2013 at 10:19:19PM -0600, Felipe Balbi wrote:
> On Fri, Dec 13, 2013 at 09:23:32AM +0800, Peter Chen wrote:
> > The mxs-phy has several bugs and features at different
> > versions, the driver code can get it through of_device_id.data.
> > 
> > Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > ---
> >  drivers/usb/phy/phy-mxs-usb.c |   58 ++++++++++++++++++++++++++++++++++------
> >  1 files changed, 49 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
> > index 545844b..6d49040 100644
> > --- a/drivers/usb/phy/phy-mxs-usb.c
> > +++ b/drivers/usb/phy/phy-mxs-usb.c
> > @@ -1,5 +1,5 @@
> >  /*
> > - * Copyright 2012 Freescale Semiconductor, Inc.
> > + * Copyright 2012-2013 Freescale Semiconductor, Inc.
> >   * Copyright (C) 2012 Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
> >   * on behalf of DENX Software Engineering GmbH
> >   *
> > @@ -20,6 +20,7 @@
> >  #include <linux/delay.h>
> >  #include <linux/err.h>
> >  #include <linux/io.h>
> > +#include <linux/of_device.h>
> >  
> >  #define DRIVER_NAME "mxs_phy"
> >  
> > @@ -34,13 +35,55 @@
> >  #define BM_USBPHY_CTRL_ENUTMILEVEL2		BIT(14)
> >  #define BM_USBPHY_CTRL_ENHOSTDISCONDETECT	BIT(1)
> >  
> > +#define to_mxs_phy(p) container_of((p), struct mxs_phy, phy)
> 
> defined, but never used.
> 

At current code, this define is after definition of struct mxs_phy,
I think the lines of #define should be at the same place, so I move
it up.

-- 

Best Regards,
Peter Chen

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
