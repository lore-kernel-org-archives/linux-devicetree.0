From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: devicetree repository separation/migration
Date: Tue, 18 Feb 2014 13:18:54 -0500
Message-ID: <20140218181854.GB7862@titan.lakedaemon.net>
References: <20140217180544.GU7862@titan.lakedaemon.net>
 <20140218155750.GS17250@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140218155750.GS17250-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 18, 2014 at 04:57:50PM +0100, Sascha Hauer wrote:
> On Mon, Feb 17, 2014 at 01:05:44PM -0500, Jason Cooper wrote:
...
> >   - Is the Linux development workflow ready for devicetree to move out
> >     of the Linux Kernel?
> 
> I hope so since keeping the devicetrees in sync with the kernel is a
> pain for all external users.

Well, I haven't heard any screams yet.  I suspect people are waiting for
details on the exact form it would take before complaining...

> >   - How do we envision projects will use it?  git submodule?  reference
> >     a version tag?  (this is primarily targeted at bootloaders that need
> >     to compile in a dtb or subset of a dtb into the bootloader)
> 
> I would prefer to use it as a submodule.

ok.  I've often thought that was the right solution for several things
(dtc.git inside the kernel tree), but no one ever seemed to speak of it
or bring it up.  Kinda like leprosy.

It does add an extra step to build process for new users.  Although that
could be handled in the Makefile.

> I'll likely need some barebox specific additions to the devicetrees.
> Right now our idea is to leave the provided devicetrees untouched and
> instead of compiling the board dts files directly we create
> <boardname>-barebox.dts files which include the original board files.
> That would allow us to provide additional information to barebox
> without having to carry patches for the devicetrees.

So the resulting <boardname>-barebox.dtb is compiled into the barebox
binary?  Is the dtb passed to the kernel independently upgradeable?

Why not post binding/dts patches for 'barebox,...' attributes that you
need?

> > Other thoughts I may have missed?
> 
> It will be interesting to see which rules should apply for merging new
> bindings. I know that devicetrees should be OS agnostic, but sometimes
> they are modelled after how Linux currently works. What happens when the
> *BSD guys have different ideas how a good binding looks like? How will
> such conflicts be resolved?

That's more a question for Grant.  I assume we'll all put on our big-boy
pants and pick the best technical solution based on their merits. :)

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree-spec" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
