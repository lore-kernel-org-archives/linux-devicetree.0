From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH V6] kbuild: dtbs_install: new make target
Date: Tue, 04 Feb 2014 12:40:50 +0000
Message-ID: <20140204124050.60C59C407C9@trevor.secretlab.ca>
References: <1384201760-16785-1-git-send-email-jason@lakedaemon.net> < 1385942188-21831-1-git-send-email-jason@lakedaemon.net> <20140110182923. GM19878@titan.lakedaemon.net>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140110182923.GM19878-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 10 Jan 2014 13:29:23 -0500, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org> wrote:
> Grant,
> 
> On Sun, Dec 01, 2013 at 11:56:28PM +0000, Jason Cooper wrote:
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
> 
> Is this good to go?

I took another look at it and did some rework. It bothered my that the
install script didnt' have any knowledge of the actual build targets and
just blindly copied the files it finds. I've reworked the patch to make
each file a separate target and also fixed a few bugs in the process.

I also removed the call out to an external script. I'm not convinced a
call out hook is the best approach when a buildroot tool can post
process the install directory. It wouldn't be hard to add back in, but I
don't want it to block this feature. I'll post my version in a minute.

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
