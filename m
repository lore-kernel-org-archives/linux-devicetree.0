From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v4 1/2] watchdog: imx2_wdt: add external reset support
 via 'ext-reset-output' dt prop
Date: Wed, 30 Mar 2016 14:09:16 -0700
Message-ID: <20160330210916.GB21993@roeck-us.net>
References: <CAJ+vNU2fSxRJ7YvxOfNzoEoiKgzv-dHj=+eksKxH48ekHiUw2Q@mail.gmail.com>
 <20151106220249.GA19791@roeck-us.net>
 <565F4244.7090502@timesys.com>
 <CAJ+vNU00Bf97HUqkkW9KqOUzHXh482R9O1gasz6ju3Pn-_5chA@mail.gmail.com>
 <CAJ+vNU2qHQPSJ1KWp_3f3vAdeuOcF0ooZHmHsdafabZLXJv=Bw@mail.gmail.com>
 <20151228162923.GA31680@spo001.leaseweb.nl>
 <56AA79DA.2010305@timesys.com>
 <CAOMZO5DrTY3ho0Z_jXxeYMqbd6GmUKRwD1LB61vM1ZTGQAYOrg@mail.gmail.com>
 <56F991C3.8030201@timesys.com>
 <20160330012226.GD28207@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160330012226.GD28207@tiger>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Akshay Bhat <akshay.bhat-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Justin Waters <justin.waters-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 30, 2016 at 09:22:33AM +0800, Shawn Guo wrote:
> On Mon, Mar 28, 2016 at 04:19:15PM -0400, Akshay Bhat wrote:
> > Hi Shawn,
> > 
> > On 02/28/2016 08:56 AM, Fabio Estevam wrote:
> > >Rob,
> > >
> > >On Thu, Jan 28, 2016 at 6:28 PM, Akshay Bhat <akshay.bhat-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org> wrote:
> > >
> > >>>I have no objections against the idea and the code itself.
> > >>>But as Guenter pointed out: it would be handy to get feedback from the
> > >>>devicetree maintainers on the above discussion.
> > >>>
> > >>>Kind regards,
> > >>>Wim.
> > >>>
> > >>
> > >>Any suggestions on whether a vendor specific prefix is necessary?
> > >
> > >Any comments?
> > >
> > 
> > Is this something you can help with, since you are the iMX
> > architecture/devicetree maintainer? Appreciate any feedback.
> 
> FWIW,
> 
> Acked-by: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> 
> Guenter,
> 
> I think it's reasonable to pick up the patch, if we have it copied to DT
> maintainers and on the list for a long period of time, and do not see
> any objection from anyone.
> 
The question was if the property name should be ext-reset-output or
fsl,ext-reset-output. In my opinion, it should be fsl,ext-reset-output
because it is not a generic property. Tim disagrees.

So we have two options: Change the property name to fsl,ext-reset-output,
which I would accept, or wait for a devicetree maintainer to make a decision.

Guenter
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
