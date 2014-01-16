From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC 04/18] driver core & of: Mark of_nodes of added device as populated
Date: Thu, 16 Jan 2014 17:03:20 +0000
Message-ID: <20140116170320.F083BC40973@trevor.secretlab.ca>
References: <1387815830-8794-1-git-send-email-pawel.moll@arm.com> < 1387815830-8794-5-git-send-email-pawel.moll@arm.com> < CAL_JsqJGQFstgFu=tpho91C0iv4eH9XSCAVKfXXQO4Z+yD-0tw@mail.gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJGQFstgFu=tpho91C0iv4eH9XSCAVKfXXQO4Z+yD-0tw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 8 Jan 2014 11:28:01 -0600, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Mon, Dec 23, 2013 at 10:23 AM, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org> wrote:
> > In "Device Tree powered" systems, platform devices are usually
> > massively populated with of_platform_populate() call, executed
> > at some level of initcalls, either by generic architecture
> > or by platform-specific code.
> >
> > There are situations though where certain devices must be
> > created (and bound with drivers) before all the others.
> > This presents small challenge in DT-driven systems, as
> > devices explicitly created in early code would be created
> > again by of_platform_populate().
> 
> Isn't this already at least partially solved with the aux data
> support? I'm guessing the difference here is how the early device is
> created.

Still, creating a device early and then trying to remember that it has
been done does nothing but add complexity for a very small number of use
cases. I still would much rather see things that need really early setup
to avoid the device model entirely and do the bare minimum needed to
allow the kernel to get to initcall time. In the cases where a subsystem
API requires a struct device, I would consider using a dummy throwaway
struct device for the early bits.

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
