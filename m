From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: devicetree repository separation/migration
Date: Tue, 18 Feb 2014 14:22:42 -0500
Message-ID: <20140218192242.GF7862@titan.lakedaemon.net>
References: <20140217180544.GU7862@titan.lakedaemon.net>
 <20140218155750.GS17250@pengutronix.de>
 <20140218181854.GB7862@titan.lakedaemon.net>
 <5303AFDC.9010908@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5303AFDC.9010908-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 18, 2014 at 12:09:16PM -0700, Stephen Warren wrote:
> On 02/18/2014 11:18 AM, Jason Cooper wrote:
> > On Tue, Feb 18, 2014 at 04:57:50PM +0100, Sascha Hauer wrote:
> >> On Mon, Feb 17, 2014 at 01:05:44PM -0500, Jason Cooper wrote:
> > ...
> >>>   - Is the Linux development workflow ready for devicetree to move out
> >>>     of the Linux Kernel?
> >>
> >> I hope so since keeping the devicetrees in sync with the kernel is a
> >> pain for all external users.
> > 
> > Well, I haven't heard any screams yet.  I suspect people are waiting for
> > details on the exact form it would take before complaining...
> > 
> >>>   - How do we envision projects will use it?  git submodule?  reference
> >>>     a version tag?  (this is primarily targeted at bootloaders that need
> >>>     to compile in a dtb or subset of a dtb into the bootloader)
> >>
> >> I would prefer to use it as a submodule.
> > 
> > ok.  I've often thought that was the right solution for several things
> > (dtc.git inside the kernel tree), but no one ever seemed to speak of it
> > or bring it up.  Kinda like leprosy.
> > 
> > It does add an extra step to build process for new users.  Although that
> > could be handled in the Makefile.
> 
> My limited experience of git submodules implies that comparing them to
> Leprosy isn't a bad comparison:-)
> 
> If they are separated out, I'd vastly prefer they simply be a standalone
> project completed divorced from the kernel.

Yes, I probably wasn't clear.  The devicetree repo _would_ be it's own
repo divorced from all other projects, including the kernel.

How projects wish to integrate the tree in order to produce the dtbs is
the question at hand.  The outcome of the discussion may have an effect
on how we structure the tree.  eg Makefile's and such.

> Playing games with git submodules to try and make it easier seems more
> likely to actually make this more complicated.

I've played around with them a bit, and I think they are most similar to
round-abouts.  It looks like chaos.  But as long as people follow a few
simple rules, it works out fine.

>From the devicetree pov, though, it would just be maintaining the
makefile(s) to be amenable to that scenario.

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree-spec" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
