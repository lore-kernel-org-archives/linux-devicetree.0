From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH V6] kbuild: dtbs_install: new make target
Date: Tue, 3 Dec 2013 17:41:37 +0000
Message-ID: <20131203174137.GV16735@n2100.arm.linux.org.uk>
References: <1384201760-16785-1-git-send-email-jason@lakedaemon.net> <1385942188-21831-1-git-send-email-jason@lakedaemon.net> <529E16D8.3060608@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <529E16D8.3060608-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 03, 2013 at 10:37:28AM -0700, Stephen Warren wrote:
> On 12/01/2013 04:56 PM, Jason Cooper wrote:
> > Unlike other build products in the Linux kernel, there is no 'make
> > *install' mechanism to put devicetree blobs in a standard place.
> > 
> > This patch is an attempt to fix this problem.  Akin to 'make install',
> > this creates a new make target, dtbs_install.  The script that gets
> > called defers to a distribution or user supplied installdtbs binary,
> > if found in the system.  Otherwise, the default action is to install the
> > built dtbs into
> > 
> >   /lib/devicetrees/${kernel_version}/${dts_filename}.dtb
> > 
> > This is done to keep dtbs from different kernel versions separate until
> > things have settled down.  Once the dtbs are stable, and not so strongly
> > linked to the kernel version, the devicetree files will most likely move
> > to their own repo.  Users will need to upgrade install scripts at that
> > time.
> > 
> > /lib has been selected over /boot since /boot is often a FAT filesystem
> > and a majority of the dts filenames are longer than 8+3.
> > 
> > Signed-off-by: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
> > ---
> > Note: Stephen, I haven't added your Ack because I wanted to make sure you were
> > Ok with the change to /lib in light of /boot partitions formatted to FAT
> 
> This script shouldn't be installing directly to the filesystem, but
> rather some staging area that then gets copied to the desired location
> by distro-/use-specific scripts. As such, the filesystem in /boot isn't
> relevant.

Why do you think that?  All the other install targets install direct to
the common destinations unless you ask for an alternative location.  Why
should this be any different?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
