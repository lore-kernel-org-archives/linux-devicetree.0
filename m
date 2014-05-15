From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCHv3 2/3] ARM: mm: add support for HW coherent systems in
 PL310
Date: Thu, 15 May 2014 15:46:13 +0200
Message-ID: <20140515154613.57d1262b@free-electrons.com>
References: <1400145519-28530-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<1400145519-28530-3-git-send-email-thomas.petazzoni@free-electrons.com>
	<CAL_JsqJZDhi8qtzSbDAdkN3BQqdZQZtRcC-yha+QsreLFpaNRQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJZDhi8qtzSbDAdkN3BQqdZQZtRcC-yha+QsreLFpaNRQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Albin Tonnerre <albin.tonnerre-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dear Rob Herring,

On Thu, 15 May 2014 08:35:18 -0500, Rob Herring wrote:

> > diff --git a/Documentation/devicetree/bindings/arm/l2cc.txt b/Documentation/devicetree/bindings/arm/l2cc.txt
> > index b513cb8..077d837 100644
> > --- a/Documentation/devicetree/bindings/arm/l2cc.txt
> > +++ b/Documentation/devicetree/bindings/arm/l2cc.txt
> > @@ -40,6 +40,9 @@ Optional properties:
> >  - arm,filter-ranges : <start length> Starting address and length of window to
> >    filter. Addresses in the filter window are directed to the M1 port. Other
> >    addresses will go to the M0 port.
> > +- dma-coherent : indicates that the system is operating in an hardware
> > +  I/O coherent mode. Valid only when the arm,pl310-cache compatible
> > +  string is used.
> 
> I don't like this because it creates 2 different meanings for
> dma-coherent. dma-coherent is meant to be a property of DMA masters
> and that is not really what the L2 is. Perhaps "arm,io-coherent" or
> "pl310-io-coherent" instead.

Yes, indeed, makes sense.

> > +/*
> > + * PL310 operations used on I/O coherent systems. Theoretically, no
> > + * outer cache operations would be needed, except that for secondary
> > + * processors bring up, a few cache maintenance operations are needed
> > + * because secondary processors are not directly coherent with the L2
> > + * cache when they start up.
> > + */
> > +static const struct l2x0_of_data pl310_coherent_data = {
> > +       .setup = pl310_of_setup,
> > +       .save  = pl310_save,
> > +       .outer_cache = {
> > +               .resume      = pl310_resume,
> > +               .inv_range   = l2x0_inv_range,
> > +               .clean_range = l2x0_clean_range,
> > +               .flush_range = l2x0_flush_range,
> > +               .flush_all   = l2x0_flush_all,
> > +               .inv_all     = l2x0_inv_all,
> > +       },
> > +};
> 
> Why do you need a whole new struct. Can't you just null out the sync ptr?

Because originally Catalin suggested a separate compatible string, and
therefore a separate set of operations. But you're right, with the move
to just an additional property, nullify-ing the sync pointer is much
simpler.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
