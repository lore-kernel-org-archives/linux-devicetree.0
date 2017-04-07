From: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3] regulator: Add driver for voltage controlled
 regulators
Date: Fri, 7 Apr 2017 11:44:09 -0700
Message-ID: <20170407184409.GD78690@google.com>
References: <20170331205035.126001-1-mka@chromium.org>
 <20170406182136.yrwdoyqeuz4qxc6d@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170406182136.yrwdoyqeuz4qxc6d-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Mark,

Thanks for the review!

El Thu, Apr 06, 2017 at 07:21:36PM +0100 Mark Brown ha dit:

> On Fri, Mar 31, 2017 at 01:50:35PM -0700, Matthias Kaehlcke wrote:
> 
> > +- compatible		  : must be "vctrl-regulator".
> > +- regulator-min-microvolt : smallest voltage consumers may set
> > +- regulator-max-microvolt : largest voltage consumers may set
> > +- ctrl-regulator:	  : the name of the regulator supplying the control
> > +			    voltage.
> 
> This looks good except for this bit where we read the regulator name out
> of the DT, that's generally a sign of bad practice for things that are
> less simple passives than things like this or fixed voltage regulators.
> As with the supplies for fixed voltage regulators just pick a name for
> the supply (ctrl seems fine to me) and use that, neither option is
> perfect but at elast this less typing for everyone and it's consistent
> with what other similar things are already doing.

Sounds good, I will send out an updated version shortly.

Matthias
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
