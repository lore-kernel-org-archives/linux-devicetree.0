From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v4 02/17] usb: phy-mxs: Add platform judgement code
Date: Tue, 3 Dec 2013 16:12:17 +0800
Message-ID: <20131203081217.GA19603@shlinux1.ap.freescale.net>
References: <1386056231-17258-1-git-send-email-peter.chen@freescale.com>
 <1386056231-17258-3-git-send-email-peter.chen@freescale.com>
 <529D987C.8080905@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <529D987C.8080905-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, frank.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 03, 2013 at 09:38:20AM +0100, Marc Kleine-Budde wrote:
> On 12/03/2013 08:36 AM, Peter Chen wrote:
> > The mxs-phy has several bugs and features at different
> > versions, the driver code can get it through of_device_id.data.
> > 
> > Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > ---
> >  drivers/usb/phy/phy-mxs-usb.c |   58 ++++++++++++++++++++++++++++++++++------
> >  1 files changed, 49 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
> > index 545844b..f6cbc78 100644
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
> > +
> > +/* Do disconnection between PHY and controller without vbus */
> > +#define MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS	BIT(0)
> > +
> > +/*
> > + * The PHY will be in messy if there is an wakeup after putting
>                                            ^^
>                                            a
> Do you mean "messy state"?

Yes, will change the typo.


-- 

Best Regards,
Peter Chen

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
