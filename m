From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH V4] kbuild: dtbs_install: new make target
Date: Wed, 20 Nov 2013 12:22:08 -0500
Message-ID: <20131120172208.GK28859@titan.lakedaemon.net>
References: <1384201760-16785-1-git-send-email-jason@lakedaemon.net>
 <1384896475-8744-1-git-send-email-jason@lakedaemon.net>
 <528BDEED.8080708@wwwdotorg.org>
 <20131120132159.88E01C4079D@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131120132159.88E01C4079D-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 20, 2013 at 01:21:58PM +0000, Grant Likely wrote:
> On Tue, 19 Nov 2013 14:58:05 -0700, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> > On 11/19/2013 02:27 PM, Jason Cooper wrote:
> > > Unlike other build products in the Linux kernel, there is no 'make
> > > *install' mechanism to put devicetree blobs in a standard place.
> > > 
> > > This patch is an attempt to fix this problem.  Akin to 'make install',
> > > this creates a new make target, dtbs_install.  The script that gets
> > > called defers to a distribution or user supplied installdtbs binary,
> > > if found in the system.  Otherwise, the default action is to install a
> > > given dtb into
> > > 
> > >   /lib/modules/${kernel_version}/devicetree/${dts_filename}.dtb
> > 
> > I still don't see why you wouldn't install the files in
> > /lib/devicetrees, but I suppose that location is fine.
> 
> /boot/devicetrees/${kernel_version} would be my choice. /boot is more
> likely to be available to firmware than /lib would be.

True, but a lot of systems make /boot a small, non-automounted separate
partition.  It's not that all of the dtbs take up a lot of space, but
that only one of them is needed to boot, which is what /boot is intended
to hold.

I think it's a distribution issue to determine whether to put one, some
or all of the dtbs in /boot.  I'd prefer not to make that decision for
them.

Is /lib/devicetrees/${kernelversion}/ an acceptable middle ground?

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
