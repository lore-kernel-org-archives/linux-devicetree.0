From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH V4] kbuild: dtbs_install: new make target
Date: Wed, 20 Nov 2013 12:08:45 -0500
Message-ID: <20131120170845.GJ28859@titan.lakedaemon.net>
References: <1384201760-16785-1-git-send-email-jason@lakedaemon.net>
 <1384896475-8744-1-git-send-email-jason@lakedaemon.net>
 <528BDEED.8080708@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <528BDEED.8080708-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 19, 2013 at 02:58:05PM -0700, Stephen Warren wrote:
> On 11/19/2013 02:27 PM, Jason Cooper wrote:
> > Unlike other build products in the Linux kernel, there is no 'make
> > *install' mechanism to put devicetree blobs in a standard place.
> > 
> > This patch is an attempt to fix this problem.  Akin to 'make install',
> > this creates a new make target, dtbs_install.  The script that gets
> > called defers to a distribution or user supplied installdtbs binary,
> > if found in the system.  Otherwise, the default action is to install a
> > given dtb into
> > 
> >   /lib/modules/${kernel_version}/devicetree/${dts_filename}.dtb
> 
> I still don't see why you wouldn't install the files in
> /lib/devicetrees, but I suppose that location is fine.

Hmm, after sleeping on it a night, I've come around.  If we install to
/lib/devicetree/${kernel_version}/, then when the devicetree moves to
it's own repo, it should be able to install to /lib/devicetree.

So this:
 1) hints at the still strong connection between a dtb and the kernel
    version
 2) doesn't sound odd like installing dtbs into a modules directory
 3) allows a future independent repository to install
    non-kernel-version-dependent dtbs in a sane location.

I'm still not in favor of installing to /boot/anything since /boot is
often a separate, small partition.  I even set mine not to automount.
The number and size of dtbs is only going to grow.  Better to install
them in a location with lots of space, and /lib is used to having the
kernel modules installed in it.

> > This is done to keep dtbs from different kernel versions separate until
> > things have settled down.  Once the dtbs are stable, and not so strongly
> > linked to the kernel version, the devicetree files will most likely move
> > to their own repo.  Users will need to upgrade install scripts at that
> > time.
> > 
> > Signed-off-by: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
> > ---
> > Question: should I make a note about the filenames not being considered an ABI,
> > or just let it be?
> 
> I still believe they're an ABI.
> 
> I guess Grant meant that they aren't an ABI to the kernel at run-time,
> unlike the content which is an ABI. That's fine.
> 
> However, I believe the files certainly are an ABI to any script that
> takes them from the "make dtbs_install" output directory.
> 
> Perhaps the best resolution is to just say nothing and let it be:-)

Fine by me.

> > diff --git a/arch/arm/Makefile b/arch/arm/Makefile
> 
> > +dtbs_install: dtbs
> > +	$(CONFIG_SHELL) $(srctree)/scripts/installdtbs.sh $(KERNELRELEASE) \
> > +	"$(MODLIB)/devicetree" "$(srctree)/$(boot)/dts"
> 
> I still think this rule should be in Makefile not arch/arm/Makefile.

d*mn.  I sent this version too quick.  Thanks for catching that.  I
didn't expand my test coverage after moving installdtbs.sh.

> Aside from those couple of issues, this version looks OK to me.

Great!  Hopefully Linus won't have any concerns when it passes through
him.

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
