From: Frans Klaver <frans.klaver-MHHw4NDrbWwAvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 1/2] sbs-battery: add forced instantiation from
 device tree
Date: Wed, 24 Sep 2014 16:22:22 +0200
Message-ID: <20140924142222.GC22872@ci00147.xsens-tech.local>
References: <1411564278-17207-1-git-send-email-frans.klaver@xsens.com>
 <1411564278-17207-2-git-send-email-frans.klaver@xsens.com>
 <20140924131655.GG5729@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140924131655.GG5729@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 24, 2014 at 02:16:55PM +0100, Mark Rutland wrote:
> On Wed, Sep 24, 2014 at 02:11:17PM +0100, Frans Klaver wrote:
> > In some cases you want to instantiate a battery even before it is
> > attached; it is perfectly reasonable for a device to start up on
> > wall-power and be connected to a battery later. The current advice is to
> > instantiate a device explicitly in the kernel, or probe for the device
> > from userspace. The downside of these approaches is that the user needs
> > to keep the information related to the i2c battery in different places,
> > which is inconvenient.
> 
> This really sounds like a Linux policy issue rather than something that
> should be described in dt.
> 
> Presumably there's a reason we sanity cehck this in the first place.
> What happens while the battery isn't plugged in? What can fail, and how?

It was introduced in a22b41a31e53 "sbs-battery: Probe should try talking
to the device", saying:

  "this driver doesn't actually try talking to the device at probe time,
  so if it's incorrectly configured in the device tree or platform data
  (or if the battery has been removed from the system), then probe will
  succeed and every access will sit there and time out. The end result
  is a possibly laggy system that thinks it has a battery but can never
  read status, which isn't very useful."

That's a reasonable thing to do, but it breaks just the feature I need.
Besides that, the driver provides us with a gpio that indicates battery
presence, which will also be useless if the device isn't present at
probe time. That commit also doesn't take into account the fact that a
battery could be removed after probing without any problems, leaving the
system in the same state as before the probe change.

Now if the battery isn't plugged in, it is never detected after it has
been attached, unless you take action from userspace. Basically you
don't know your battery level until it has been explicitly probed.

We might also reduce the severity of the sanity check failure to produce
a warning instead of an error. This would achieve that a developer might
be warned that the battery isn't present, but also allow my use case
where the battery may not be present at boot time. Was that what you
meant with policy by the way?

> 
> > Add the "sbs,always-present" option to the device tree. If set, the
> > battery is instantiated without sanity checking the connection.
> 
> From the description above, this name is incorrect. You're adding this
> property to work around the battery _not_ being present at probe-time.
> From a binding point of view, "instantiated" is somewhat meaningless --
> that's an OS level detail rather than a contract detail.

That's fair. I wasn't entirely sure of the name myself, so feel free to
suggest some other names. It started out with "sbs,force-presence", but
I would be just as happy using "sbs,always-register",
"sbs,no-sanity-check" or something entirely different altogether.

If we go with the downgrade of the status read error, the device tree
requirement will be removed entirely.

Thanks,
Frans
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
