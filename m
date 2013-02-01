From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [RFC 10/11] iio: Add OF support
Date: Fri, 1 Feb 2013 11:42:13 -0800
Message-ID: <20130201194213.GA17968@roeck-us.net>
References: <1359668588-13678-1-git-send-email-linux@roeck-us.net>
 <1359668588-13678-11-git-send-email-linux@roeck-us.net>
 <510BADCA.1030407@metafoo.de>
 <20130201143307.GB20767@roeck-us.net>
 <510BD845.1010200@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <510BD845.1010200-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 01, 2013 at 03:59:17PM +0100, Lars-Peter Clausen wrote:
> On 02/01/2013 03:33 PM, Guenter Roeck wrote:
> > On Fri, Feb 01, 2013 at 12:58:02PM +0100, Lars-Peter Clausen wrote:
> >> 013 10:43 PM, Guenter Roeck wrote:
> >>> Provide bindings, new API access functions, and parse OF data
> >>> during initialization.
> >>>
> >>
> >> Hi Guenter,
> >>
> >> Thanks for taking care of this.
> >>
> >> I'd prefer to have only one iio_get_channel which handles both the dt and the
> >> non-dt case. Otherwise we'll soon have constructs like
> >>
> >> if (dev->of_node)
> >> 	chan = of_iio_get_channel(dev->of_node, 1);
> >> else
> >> 	chan = iio_get_channel(dev_name(dev), "vcc");
> >>

Clock code has of_clk_get_by_name(node *, name), clk_get(dev, name), and
of_clk_get(node *, index). Right now of_iio_get_channel matches of_clk_get,
and iio_get_channel matches clk_get.

Question is really how we want to API to look like. I am open to suggestions.

> >> appearing all over the place in drivers code. I'd keep the actual
> >> implementation pretty close to what the clk framework does. E.g. take a look at
> >> of_clk_get_by_name() and clk_get() in clkdev.c. And don't take a detour via the
> >> iio_map lookup for the devicetree case, just loop over all IIO devices and
> >> match by of_node. This should allow us to simplify the code quite a bit.
> >>
> > Yes, I just could not figure out how to loop over the list of iio devices. That
> > is why I hijacked iio_map which does provide a list.
> > 
> > Any hints ?
> 
> Yes, use bus_find_device on iio_bus_type. A nice example how to use this to
> lookup device by of node is of_find_i2c_device_by_node. For IIO you also need
> to make sure that dev->type is iio_dev_type, since both devices and triggers
> are registered on the same bus.
> 
Great, that works nicely, and, yes, the code is now much simpler.

> >>> +static struct iio_map *iio_map_of_init(struct iio_dev *idev)
> >>> +{
> >>
> >> To be honest I find this whole function a bit confusing. If we are using
> >> devicetree, we shouldn't need to register iio_map. Maybe just skip over
> >> io-channel-output-names for now, until we figure out if we really need this and
> >> what for.
> >>
Correct, I don't need this anymore after implementing the above.

Thanks,
Guenter
