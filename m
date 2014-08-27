From: Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/4] watchdog: add driver for Ricoh RN5T618 watchdog
Date: Thu, 28 Aug 2014 00:12:10 +0200
Message-ID: <20140827221209.GA24987@gmail.com>
References: <1409091237-16722-1-git-send-email-b.galvani@gmail.com>
 <1409091237-16722-4-git-send-email-b.galvani@gmail.com>
 <20140827190135.GA18849@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140827190135.GA18849-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 27, 2014 at 12:01:35PM -0700, Guenter Roeck wrote:
[...]
> > +#include <linux/device.h>
> > +#include <linux/mfd/rn5t618.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/watchdog.h>
> > +
> > +#define DRIVER_NAME "rn5t618-wdt"
> > +
> > +static bool nowayout = WATCHDOG_NOWAYOUT;
> > +static unsigned int heartbeat = -1;
> 
> I'd be surprised if this doesn't cause a compiler warning.
> Why not just initialize the variable with 0 ?

The idea was to initialize the variable with an invalid value that has
no effect when watchdog_init_timeout() is called during probe, thus
leaving the watchdog timeout to the maximum value.

You are right, the same effect can be achieved in a cleaner way
leaving the variable to zero (by the way, the above assignment doesn't
seem to generate warnings).

> 
> > +
> > +module_param(heartbeat, int, 0);
> > +MODULE_PARM_DESC(heartbeat, "Initial watchdog heartbeat in seconds");
> > +
> > +module_param(nowayout, bool, 0);
> > +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
> > +		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> > +
> > +struct rn5t618_wdt {
> > +	struct watchdog_device wdt_dev;
> > +	struct rn5t618 *rn5t618;
> > +};

[..]

> > +static int rn5t618_wdt_set_timeout(struct watchdog_device *wdt_dev,
> > +				   unsigned int timeout)
> > +{
> > +	struct rn5t618_wdt *wdt = watchdog_get_drvdata(wdt_dev);
> > +	int ret, i;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(rn5t618_wdt_map); i++) {
> > +		if (rn5t618_wdt_map[i].time + 1 >= timeout)
> > +			break;
> > +	}
> > +
> > +	if (i == ARRAY_SIZE(rn5t618_wdt_map))
> > +		ret = -EINVAL;
> 
> Can you simplify this a bit ? If you use
> 
> 	if (i == ARRAY_SIZE(rn5t618_wdt_map))
> 		return -EINVAL;
> 
> > +	else
> 
> You can drop this else statement.

Will do, thanks.

Beniamino
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
