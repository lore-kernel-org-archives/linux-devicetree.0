From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH 0/9] dt: dependencies (for deterministic driver
 initialization order based on the DT)
Date: Tue, 26 Aug 2014 09:42:08 +0100
Message-ID: <20140826084208.AE5F0C40989@trevor.secretlab.ca>
References: <1399913280-6915-1-git-send-email-holler@ahsoftware.de>
	<20140514141914.446F7C4153D@trevor.secretlab.ca>
	<20140821140211.GD19293@ulmo.nvidia.com> <53F64624.5000403@ahsoftware.de>
	<20140822131919.GX21734@leverpostej> <20140825093931.GB2399@ulmo>
	<E1XLu15-0002DP-6o@jdl.com> <20140825133714.GH4163@ulmo.nvidia.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140825133714.GH4163-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alexander Holler <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 25 Aug 2014 15:37:16 +0200, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Mon, Aug 25, 2014 at 08:08:59AM -0500, Jon Loeliger wrote:
> > > 
> > 
> > > Anyway, instead of going back and forth between "deferred probe is good"
> > > and "deferred probe is bad", how about we do something useful now and
> > > concentrate on how to make use of the information we have in DT with the
> > > goal to reduce the number of cases where deferred probing is required?
> > 
> > Good idea.
> > 
> > The proposal on the table is to allow the probe code
> > to make a topological sort of the devices based on
> > dependency information either implied, explicitly stated
> > or both.  That is likely a fundamentally correct approach.
> > 
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
> dependency information into the device tree sources. Rather, if I
> understand correctly, we should be using the information readily
> available (phandle references) as much as possible before resorting to
> additional properties.

My objection is primarily around the concern that the dependency data
will get stale if firmware modifies the tree or that the kernel will
break when by relying on incorrect dependency information.

If the kernel can handle incorrect dependencies gracefully (like falling
back to deferred probe) then we can consider additional properties.

> So far we've been operating under the assumption that a dependency is
> modeled as a phandle reference and that the dependent would contain the
> phandle reference to the dependency. That's for example how clocks and
> regulators (to name only a few) work. A simplified example would look
> like this:
> 
> 	clock: clock@... {
> 		...
> 		#clock-cells = <1>;
> 		...
> 	};
> 
> 	pmic: pmic@... {
> 		regulators {
> 			vdd_foo: ldo0 {
> 				...
> 			};
> 
> 			vdd_bar: ldo1 {
> 				...
> 			};
> 	};
> 
> 	device@... {
> 		vdd-supply = <&vdd_foo>;
> 		clocks = <&clock 0>;
> 	};
> 
> 	device@... {
> 		vdd-supply = <&vdd_bar>;
> 		clocks = <&clock 1>;
> 	};
> 
> There are somewhat standardized bindings for the above and especially
> for bindings of the type that clocks implement this is trivial. We can
> simply iterate over each (phandle, specifier) tuple and check that the
> corresponding clock provider can be resolved (which typically means that
> it's been registered with the common clock framework).
> 
> For regulators (and regulator-like bindings) the problem is somewhat
> more difficult because they property names are not standardized. One way
> to solve this would be to look for property names with a -supply suffix,
> but that could obviously lead to false positives. One alternative that I
> think could eliminate this would be to explicitly list dependencies in
> drivers. This would allow core code to step through such a list and
> resolve the (phandle, specifier) tuples.

False positives and negatives may not actually be a problem. It is
suboptimal, certainly, but it shouldn't outright break the kernel.

g.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
