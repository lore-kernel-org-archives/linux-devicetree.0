From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH V5] kbuild: dtbs_install: new make target
Date: Fri, 22 Nov 2013 08:33:59 -0500
Message-ID: <20131122133359.GE29241@titan.lakedaemon.net>
References: <1384201760-16785-1-git-send-email-jason@lakedaemon.net>
 <1385062552-9882-1-git-send-email-jason@lakedaemon.net>
 <20131122074411.47DE5C40753@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131122074411.47DE5C40753-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 22, 2013 at 07:44:11AM +0000, Grant Likely wrote:
> On Thu, 21 Nov 2013 19:35:52 +0000, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org> wrote:
> > Unlike other build products in the Linux kernel, there is no 'make
> > *install' mechanism to put devicetree blobs in a standard place.
> > 
> > This patch is an attempt to fix this problem.  Akin to 'make install',
> > this creates a new make target, dtbs_install.  The script that gets
> > called defers to a distribution or user supplied installdtbs binary,
> > if found in the system.  Otherwise, the default action is to install a
> > given dtb into
> > 
> >   /boot/devicetrees/${kernel_version}/${dts_filename}.dtb
> > 
> > This is done to keep dtbs from different kernel versions separate until
> > things have settled down.  Once the dtbs are stable, and not so strongly
> > linked to the kernel version, the devicetree files will most likely move
> > to their own repo.  Users will need to upgrade install scripts at that
> > time.
> > 
> > Signed-off-by: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
> > ---
> > changes since v4:
> >  - move make target from arch/arm/Makefile to Makefile (swarren)
> >  - change default install location to /boot/devicetrees/$KERNVER (swarren/gcl)
> >  - add INSTALL_DTBS_PATH for changing build root (jac)
> > 
> > changes since v3:
> >  - drop renaming files to ${compat}.dtb (rmk/swarren)
> >  - move installdtbs.sh to ./scripts/ (gcl)
> > 
> > changes since v2:
> >  - use fdtget instead of a modified dtc to get the board compat string
> > 
> > changes since v1:
> >  - added this patch
> > 
> >  Makefile               | 20 +++++++++++++++++++-
> 
> Adding it to Makefile enables it unconditionally for all architectures,
> even the ones with no DT support. I suspect (but have no evidence for)
> that this will be considered bad form. I have no problem with each
> architecture adding the build rule explicitly. The script is in a common
> place and that is the important bit.

Ok, once we nail down Olof's concern, I'll move the target back to
arch/arm/Makefile

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
