From: atull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: Re: [PATCH 1/4 v3] GPIO: gpio-dwapb: Enable platform driver binding
 to MFD driver
Date: Thu, 11 Sep 2014 10:26:09 -0500
Message-ID: <alpine.DEB.2.02.1409111020130.19272@atx-linux-37>
References: <1410286081-16653-1-git-send-email-alvin.chen@intel.com>  <1410286081-16653-2-git-send-email-alvin.chen@intel.com>  <alpine.DEB.2.02.1409101353500.2790@atx-linux-37> <1410422381.7023.15.camel@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410422381.7023.15.camel-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Shevchenko, Andriy" <andriy.shevchenko-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Chen, Alvin" <alvin.chen-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "Kweh, Hock Leong" <hock.leong.kweh-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Ong, Boon Leong" <boon.leong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "sebastian-E0PNVn5OA6ohrxcnuTQ+TQ@public.gmane.org" <sebastian-E0PNVn5OA6ohrxcnuTQ+TQ@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Westerberg, Mika" <mika.westerberg-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "dvhart-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <dvhart-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 11 Sep 2014, Shevchenko, Andriy wrote:

> On Wed, 2014-09-10 at 14:11 -0500, atull wrote:
> 
> []
> 
> > >  static int dwapb_gpio_probe(struct platform_device *pdev)
> > >  {
> > > +	int i;
> > >  	struct resource *res;
> > >  	struct dwapb_gpio *gpio;
> > > -	struct device_node *np;
> > >  	int err;
> > > -	unsigned int offs = 0;
> > > +	struct device *dev = &pdev->dev;
> > > +	struct dwapb_platform_data *pdata = dev_get_platdata(dev);
> > > +	bool is_pdata_alloc = !pdata;
> > 
> > Please combine the int's in one line (int err, i;) and put them as
> > the last one on this list.  It looks the same to the compiler of
> > course, but more uniform for human eyes :)
> 
> Do you think it's a good idea? In this case I, for example, would like
> to see int err as a separate line at the end of definition block. It
> would be better to distinguish counters and return code storage.
> Moreover, often counters would be unsigned int.

If they are both 'int' they should be combined.  If 'i' is changed to be
an unsigned int they would be separate.

> 
> -- 
> Andy Shevchenko <andriy.shevchenko-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> Intel Finland Oy
> ---------------------------------------------------------------------
> Intel Finland Oy
> Registered Address: PL 281, 00181 Helsinki 
> Business Identity Code: 0357606 - 4 
> Domiciled in Helsinki 
> 
> This e-mail and any attachments may contain confidential material for
> the sole use of the intended recipient(s). Any review or distribution
> by others is strictly prohibited. If you are not the intended
> recipient, please contact the sender and delete all copies.
> 

Andy,

This confidentiality footer is problematic on this mailing list.  Please
see https://lkml.org/lkml/2014/3/5/790 for example.

Alan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
