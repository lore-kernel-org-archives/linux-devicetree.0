From: Peter Chen <Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCH v5 08/23] usb: chipidea: set usb gadeget's otg
 capabilities
Date: Wed, 24 Jun 2015 07:44:47 +0000
Message-ID: <BN3PR0301MB0849817C3D6F3DB9C39704CC81AF0@BN3PR0301MB0849.namprd03.prod.outlook.com>
References: <1434541230-15090-1-git-send-email-jun.li@freescale.com>
 <1434541230-15090-9-git-send-email-jun.li@freescale.com>
 <20150624030442.GB3475@shlinux2> <20150624033421.GA29386@shlinux2>
 <20150624034922.GC3475@shlinux2> <20150624072217.GB29386@shlinux2>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150624072217.GB29386@shlinux2>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Li Jun <Jun.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "rogerq-l0cyMroinI0@public.gmane.org" <rogerq-l0cyMroinI0@public.gmane.org>, Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

 
> 
> > >
> > > > For non-dt platform (eg i686), how it changes otg capabilities
> > > > through their platform data?
> > > >
> > > Directly override platdata->ci_otg_caps in its platform driver after
> > > ci_hdrc_add_device().
> >
> > After ci_hdrc_add_device, the device may begin to enumerate, we need
> > to make sure otg capabilities before the device goes to work.
> >
> > Peter
> 
> How about add a flag for platdata->flags like if (platdata->flags &
> CI_HDRC_USE_PREDEF_OTG_CAPS == 0) {
> 	... ...
> }
> then non-dt platform driver can set CI_HDRC_USE_PREDEF_OTG_CAPS flag
> and pre-define otg caps before call to ci_hdrc_add_device().
> 

Add Andy Shevchenko.

I think the current i686 platforms does not support full otg, you may not need
to consider this to avoid unnecessary complexities,  unless someone wants.
 
Peter
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
