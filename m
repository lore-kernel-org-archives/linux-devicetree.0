From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [git pull] Devicetree changes for v3.15
Date: Mon, 29 Sep 2014 09:52:03 -0400
Message-ID: <20140929135203.GH23926@titan.lakedaemon.net>
References: <CACxGe6vCrkHPL6UNy1p8AO4+z5VFRY6w4_2grQEZQwp_3jJ7Yw@mail.gmail.com>
 <CACRpkdZoo=P7uTO1rNDD_HUPjfAk26C0=mNYPoZmTV0wcO3V-w@mail.gmail.com>
 <20140926141943.GC23926@titan.lakedaemon.net>
 <20140929124922.CBE9FC4150A@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140929124922.CBE9FC4150A-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 29, 2014 at 01:49:22PM +0100, Grant Likely wrote:
> On Fri, 26 Sep 2014 10:19:43 -0400
> , Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
>  wrote:
> > Linus,
> > 
> > On Fri, Sep 26, 2014 at 02:30:53PM +0200, Linus Walleij wrote:
> > > On Tue, Apr 1, 2014 at 12:15 PM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> > > 
> > > > Here are the dt changes I've got queued up for v3.15. The full
> > > > description is below in the tag. Please pull.
> > > (...)
> > > > Jason Cooper (1):
> > > >       kbuild: dtbs_install: new make target
> > 
> > Exact patch is:
> > 
> >   f4d4ffc03efc kbuild: dtbs_install: new make target
> > 
> > > After this patch a while back I have observed the following behaviour
> > > of the kernel build:
> > > 
> > > make zImage
> > > make zImage
> > > -> incremental build, just relink
> > > 
> > > make zImage
> > > make dtbs
> > > make zImage
> > > -> The whole kernel gets rebuilt
> > > 
> > > So now if I happen to recompile my device trees, I suddenly want
> > > the entire zImage to be rebuilt to? It's by definition not changes that
> > > affect the kernel build :-(
> > > 
> > > I noticed this because my build scripts calls make dtbs && make zImage,
> > > and started to rebuild absolutely everything all the time.
> > > 
> > > Do you think this can be fixed? It's quite simple to reproduce...
> > 
> > Does the attached fix your problem?
> > 
> > thx,
> > 
> > Jason.
> > 
> > ----------->8------------------------------------------
> > diff --git a/arch/arm/Makefile b/arch/arm/Makefile
> > index 0ce9d0f71f2a..a88b13af58d2 100644
> > --- a/arch/arm/Makefile
> > +++ b/arch/arm/Makefile
> > @@ -313,7 +313,9 @@ $(INSTALL_TARGETS):
> >  	$(Q)$(MAKE) $(build)=$(boot)/dts MACHINE=$(MACHINE) $(boot)/dts/$@
> >  
> >  PHONY += dtbs dtbs_install
> > -dtbs dtbs_install: prepare scripts
> > +dtbs: scripts
> > +	$(Q)$(MAKE) $(build)=$(boot)/dts MACHINE=$(MACHINE) $@
> > +dtbs_install: prepare scripts
> >  	$(Q)$(MAKE) $(build)=$(boot)/dts MACHINE=$(MACHINE) $@
> >  
> >  # We use MRPROPER_FILES and CLEAN_FILES now
> 
> Is this the right fix though? It seems that it would fix the problem for
> the dtbs target, but would still cause a kernel rebuild for
> dtbs_install. Why does dtbs_install need to depend on the 'prepare'
> target?

iirc, it was added as a dependency to ensure $KERNELVERSION was set
before attempting to install into /path/to/$KERNELVERSION/dtbs.

This patch was just a confirmation that the 'prepare' target was the
source of the problem for Linus.  Now that we know that, we need to dig
and find a proper fix for setting $KERNELVERSION for dtbs_install.

I dug into the prepare* menagerie a bit preparing this test patch, and
it seems that any existing target which would get us $KERNELVERSION also
depends on FORCE.  I haven't had time to dig into it more... Perhaps one
of the kbuild maintainers would have some insight?

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
