From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [GIT PULL] dts, kbuild: Implement support for dtb vendor subdirs
Date: Mon, 3 Nov 2014 20:47:17 -0800
Message-ID: <20141104044717.GA13562@quad.lixom.net>
References: <1409899692-1455-1-git-send-email-rric@kernel.org>
 <20141021181504.GV20170@rric.localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20141021181504.GV20170-vWBEXY7mpu73kLQC+b9v0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Richter <rric-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Michal Marek <mmarek-AlSwsSmVLrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Robert Richter <rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Andrew Bresticker <abrestic-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Abhilash Kesavan <kesavan.abhilash-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 21, 2014 at 08:15:04PM +0200, Robert Richter wrote:
> Arnd,
> 
> On 05.09.14 08:48:06, Robert Richter wrote:
> > From: Robert Richter <rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
> > 
> > For arm64 we want to put dts files into vendor's subdirectories from
> > the beginning. This patch set implements this. As this is a generic
> > kbuild implementation, vendor subdirs will be also available for
> > arch/arm and other architectures. The subdirectory tree is also
> > reflected in the install path.
> > 
> > A new makefile variable dts-dirs is introduced to point to dts
> > subdirs. This variable is used by kbuild for building and installation
> > of dtb files.
> > 
> > A dts Makefile looks now as follows:
> > 
> > ----
> > dtb-$(CONFIG_...) += some_file_1.dtb
> > dtb-$(CONFIG_...) += some_file_2.dtb
> > 
> > dts-dirs          += dir_vendor_a
> > dts-dirs          += dir_vendor_b
> > 
> > # come always afterwards:
> > always         := $(dtb-y)
> > subdir-y       := $(dts-dirs)
> > clean-files    := *.dtb
> > ----
> > 
> > This patches also introduces the dtbs_install make target for
> > arm64. Install rules are moved to Makefile.dtbinst using the same
> > style and calling convention like for modinst and fwinst.
> > 
> > Robert Richter (6):
> >   dts, arm64: Add dtbs_install make target
> >   dts, kbuild: Factor out dtbs install rules to Makefile.dtbinst
> >   dts, arm/arm64: Remove dtbs build rules in sub-makes
> >   dts, kbuild: Implement support for dtb vendor subdirs
> >   dts, arm64: Move dts files to vendor subdirs
> >   dts, arm: Remove $(MACHINE) variable from dtbs make recipes
> 
> please pull this series for inclusion into v3.19 from:
> 
>  git://git.kernel.org/pub/scm/linux/kernel/git/rric/linux.git dts-subdirs-for-arm-soc-v3.19
> 
> I have updated and rebased the patches to v3.18-rc1. No changes except
> conflict resolution of patch 5/6.

Pulled, and I added the description from 0/6 as the merge text -- feel free to
add it to the tag if you do something like this in the future.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
