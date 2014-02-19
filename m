From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: devicetree repository separation/migration
Date: Wed, 19 Feb 2014 13:50:54 -0500
Message-ID: <20140219185054.GQ7862@titan.lakedaemon.net>
References: <20140217180544.GU7862@titan.lakedaemon.net>
 <20140218155750.GS17250@pengutronix.de>
 <20140218181854.GB7862@titan.lakedaemon.net>
 <20140219083232.GV17250@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140219083232.GV17250-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 19, 2014 at 09:32:32AM +0100, Sascha Hauer wrote:
> On Tue, Feb 18, 2014 at 01:18:54PM -0500, Jason Cooper wrote:
> > On Tue, Feb 18, 2014 at 04:57:50PM +0100, Sascha Hauer wrote:
> > > On Mon, Feb 17, 2014 at 01:05:44PM -0500, Jason Cooper wrote:
> > ...
> > > >   - Is the Linux development workflow ready for devicetree to move out
> > > >     of the Linux Kernel?
> > > 
> > > I hope so since keeping the devicetrees in sync with the kernel is a
> > > pain for all external users.
> > 
> > Well, I haven't heard any screams yet.  I suspect people are waiting for
> > details on the exact form it would take before complaining...
> > 
> > > >   - How do we envision projects will use it?  git submodule?  reference
> > > >     a version tag?  (this is primarily targeted at bootloaders that need
> > > >     to compile in a dtb or subset of a dtb into the bootloader)
> > > 
> > > I would prefer to use it as a submodule.
> > 
> > ok.  I've often thought that was the right solution for several things
> > (dtc.git inside the kernel tree), but no one ever seemed to speak of it
> > or bring it up.  Kinda like leprosy.
> > 
> > It does add an extra step to build process for new users.  Although that
> > could be handled in the Makefile.
> > 
> > > I'll likely need some barebox specific additions to the devicetrees.
> > > Right now our idea is to leave the provided devicetrees untouched and
> > > instead of compiling the board dts files directly we create
> > > <boardname>-barebox.dts files which include the original board files.
> > > That would allow us to provide additional information to barebox
> > > without having to carry patches for the devicetrees.
> > 
> > So the resulting <boardname>-barebox.dtb is compiled into the barebox
> > binary?  Is the dtb passed to the kernel independently upgradeable?
> 
> Yes, it's compiled into barebox. barebox uses it for probing from
> devicetree. You can pass this devicetree to the kernel or provide
> another one should you want or have to.

Ok.

> > Why not post binding/dts patches for 'barebox,...' attributes that you
> > need?
> 
> I wasn't clear. The bindings themselves should be posted and merged
> mainline. mtd partitions are a good example for what I mean. I don't
> want to see them in the mainline dts files because that would mean my
> partitioning would change with each mainline change. Nevertheless I have
> the partitions in the barebox dts files.

Ack.  We should probably address those kinds of properties in a more
uniform way.  A good example is the OpenBlocks platform.  It can use
standard ram of various sizes in it's socket.  So the memory value in
the mainline tree is completely bogus and needs to be rewritten at boot
either by the bootloader or atags_to_fdt.

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree-spec" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
