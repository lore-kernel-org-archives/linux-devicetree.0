From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH 0/9] dt: dependencies (for deterministic driver
 initialization order based on the DT)
Date: Tue, 26 Aug 2014 09:51:28 +0100
Message-ID: <20140826085128.958A9C40989@trevor.secretlab.ca>
References: <1399913280-6915-1-git-send-email-holler@ahsoftware.de>
	<20140514141914.446F7C4153D@trevor.secretlab.ca>
	<20140821140211.GD19293@ulmo.nvidia.com> <53F64624.5000403@ahsoftware.de>
	<20140822131919.GX21734@leverpostej> <20140825093931.GB2399@ulmo>
	<E1XLu15-0002DP-6o@jdl.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <E1XLu15-0002DP-6o-CYoMK+44s/E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alexander Holler <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 25 Aug 2014 08:08:59 -0500, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org> wrote:
> > 
> 
> > Anyway, instead of going back and forth between "deferred probe is good"
> > and "deferred probe is bad", how about we do something useful now and
> > concentrate on how to make use of the information we have in DT with the
> > goal to reduce the number of cases where deferred probing is required?
> 
> Good idea.
> 
> The proposal on the table is to allow the probe code
> to make a topological sort of the devices based on
> dependency information either implied, explicitly stated
> or both.  That is likely a fundamentally correct approach.
> 
> I believe some of the issues that need to be resolved are:
> 
>     1) What constitutes a dependency?
>     2) How is that dependency expressed?
>     3) How do we add missing dependencies?
>     4) Backward compatability problems.
> 
> There are other questions, of course.  Is it a topsort
> per bus?  Are there required "early devices"?  Should
> the inter-node dependencies be expressed at each node,
> or in a separate hierarchy within the DTS?  Others.

Getting the dependency tree I think is only half the problem. The other
have is how to get the driver model to actually order probing using that
list. That problem is hard because the order drivers are probed is
currently determined by the interaction of driver link order, driver
initcall level, and device registration order. The first devices are
registered at an early initcall, before their drivers, and therefore
bind order is primarily determined by initcall level and driver link
order. However, later devices (ie. i2c clients) are registered by the
bus driver (ie. again, i2c) and probe order may be primarily link order
(if the driver is not yet registered) or registration order (if the
driver was registered before the parent bus).

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
