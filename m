From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH RFC v4 2/2] clk: Add handling of clk parent and rate
 assigned from DT
Date: Wed, 2 Apr 2014 11:01:02 +0300
Message-ID: <20140402080102.GK2931@tbergstrom-lnx.Nvidia.com>
References: <1396284116-19178-1-git-send-email-s.nawrocki@samsung.com>
 <1396284116-19178-3-git-send-email-s.nawrocki@samsung.com>
 <20140331200620.GA13881@kroah.com>
 <533ABCEC.8040701@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <533ABCEC.8040701-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Cc: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org" <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 01, 2014 at 03:19:40PM +0200, Ben Dooks wrote:
> On 31/03/14 21:06, Greg KH wrote:
> > On Mon, Mar 31, 2014 at 06:41:56PM +0200, Sylwester Nawrocki wrote:
> >> This function adds a helper function to configure clock parents and rates
> >> as specified in clock-parents, clock-rates DT properties for a consumer
> >> device and a call to it before driver is bound to a device.
> >>
> >> Signed-off-by: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> 
> [snip]
> 
> >
> > I don't understand why you need the driver core to initialize this one
> > type of thing?  That should be in a driver, or in a class, or at worse
> > case, the platform code.
> >
> > What makes clocks so "unique" here?
> 
> I suppose the issue here is that a lot of drivers currently use
> clocks and a number of systems have badly setup default clock trees
> at start time.
> 
> Mark Brown and others have argued that the management of clocks which
> is common to all devices should not live in the driver.

Exactly, this data should be part of the clock provider DT nodes, not
of the device nodes. 

Cheers,

Peter.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
