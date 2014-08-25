From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: [RFC PATCH 0/9] dt: dependencies (for deterministic driver initialization order based on the DT)
Date: Mon, 25 Aug 2014 09:13:59 -0500
Message-ID: <E1XLv1z-0002Jv-VN@jdl.com>
References: <1399913280-6915-1-git-send-email-holler@ahsoftware.de> <20140514141914.446F7C4153D@trevor.secretlab.ca> <20140821140211.GD19293@ulmo.nvidia.com> <53F64624.5000403@ahsoftware.de> <20140822131919.GX21734@leverpostej> <20140825093931.GB2399@ulmo> <E1XLu15-0002DP-6o@jdl.com> <20140825133714.GH4163@ulmo.nvidia.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20140825133714.GH4163-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alexander Holler <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> 
> 
> > I believe some of the issues that need to be resolved are:
> >
> >     1) What constitutes a dependency?
> >     2) How is that dependency expressed?
> >     3) How do we add missing dependencies?
> >     4) Backward compatability problems.
> >
> > There are other questions, of course.  Is it a topsort
> > per bus?  Are there required "early devices"?  Should
> > the inter-node dependencies be expressed at each node,
> > or in a separate hierarchy within the DTS?  Others.
> 
> I think Grant already objected to the idea of explicitly adding
> dependency information into the device tree sources.

Clearly, the reason to object to the introdcution of such
an artificial dependency implies that it would be trying
to express something that doesn't actually describe an
existing hardware requirement.  That is, it wouldn't be
"describing hardware".  That's fine.

But the inverse should also be true.  That is, we should
ensure that where there *is* a hardware dependency that
is currently not expressed, we should introduce that
relationship.


> For regulators (and regulator-like bindings) the problem is somewhat
> more difficult because they property names are not standardized. One way
> to solve this would be to look for property names with a -supply suffix,
> but that could obviously lead to false positives. One alternative that I
> think could eliminate this would be to explicitly list dependencies in
> drivers. This would allow core code to step through such a list and
> resolve the (phandle, specifier) tuples.

So, express the "additional SW dependencies" in the SW?

> Clocks are usually not a problem with deferred probing since they often
> are registered early anyway.

Ah, but how are they known to be needed early?  A toposort should sort
them into that position.  That's not currently done.  And I doubt the
set of nodes and expressed dependencies would cause them to be done
early enough by today's standards.

> Regulators on the other hand seem to be a fairly common trigger,
> though, so they seem like a good candidate to focus on.

Yeah.  And I've seen some debatable IRQ-PHY-PCIe interaction too.

> Thierry

jdl
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
