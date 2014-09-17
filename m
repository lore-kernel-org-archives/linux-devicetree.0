From: Peter Chen <Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCH v5 07/12] usb: chipidea: add a usb2 driver for ci13xxx
Date: Wed, 17 Sep 2014 00:00:57 +0000
Message-ID: <9aaef3c1f0944174b725371fff9813ab@BN1PR0301MB0772.namprd03.prod.outlook.com>
References: <1410777378-12726-1-git-send-email-antoine.tenart@free-electrons.com>
 <1410777378-12726-8-git-send-email-antoine.tenart@free-electrons.com>
 <20140916005129.GC3379@peterchendt> <20140916133841.GA4869@kwain>
 <20140916140551.GE4869@kwain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140916140551.GE4869@kwain>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: "sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, "p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org" <zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org" <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

 
> > > > Tested on the Marvell Berlin SoCs USB controllers.
> > > >
> > > > Signed-off-by: Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > > > ---
> > > >  drivers/usb/chipidea/Makefile       |   1 +
> > > >  drivers/usb/chipidea/ci_hdrc_usb2.c | 137
> > > > ++++++++++++++++++++++++++++++++++++
> > > >  2 files changed, 138 insertions(+)  create mode 100644
> > > > drivers/usb/chipidea/ci_hdrc_usb2.c
> > > >
> > >
> > > compile error:
> > >
> > > /home/peter/work/projects/usb/drivers/usb/chipidea/ci_hdrc_usb2.c: In
> function 'ci_hdrc_usb2_dt_probe':
> > > /home/peter/work/projects/usb/drivers/usb/chipidea/ci_hdrc_usb2.c:30
> > > :2: error: implicit declaration of function 'of_phy_get'
> > > [-Werror=implicit-function-declaration]
> > > /home/peter/work/projects/usb/drivers/usb/chipidea/ci_hdrc_usb2.c:30
> > > :16: warning: assignment makes pointer from integer without a cast
> > > [enabled by default]
> >
> > Did you apply the series introducing the support for the generic PHY
> > framework in the USB subsystem first? One of the patches includes
> > 'linux/phy/phy.h' in 'linux/usb/otg.h'. That's why I did not encounter
> > this error.
> >
> > Anyway, you're right and 'linux/phy/phy.h' should be explicitly
> > included here.
> 
> Let me know if you want me to quickly cook up a new version fixing this.
> 

You can send this fix if you don't want to get comments for other parts in this
series.

I also see other dependencies like generic phy support for chipidea with this one.
I think the 7th and 8th in this series are ok after adding 'linux/phy/phy.h', but
you generic phy support series should be queued before this one.

Peter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
