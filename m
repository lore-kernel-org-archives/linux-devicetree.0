From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH V5] kbuild: dtbs_install: new make target
Date: Fri, 22 Nov 2013 08:31:29 -0500
Message-ID: <20131122133129.GD29241@titan.lakedaemon.net>
References: <1384201760-16785-1-git-send-email-jason@lakedaemon.net>
 <1385062552-9882-1-git-send-email-jason@lakedaemon.net>
 <653B066B-5B24-4817-86EF-D4D9F129123D@codeaurora.org>
 <CAOesGMjsYxhjpg7Gsw69-x5v5XgZ1NZifJ+z48sMizfdMW-tAg@mail.gmail.com>
 <20131122074224.4984DC40753@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131122074224.4984DC40753-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 22, 2013 at 07:42:24AM +0000, Grant Likely wrote:
> On Thu, 21 Nov 2013 15:36:47 -0800, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
> > On Thu, Nov 21, 2013 at 3:31 PM, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> > >
> > > On Nov 21, 2013, at 1:35 PM, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org> wrote:
> > >
> > >> Unlike other build products in the Linux kernel, there is no 'make
> > >> *install' mechanism to put devicetree blobs in a standard place.
> > >>
> > >> This patch is an attempt to fix this problem.  Akin to 'make install',
> > >> this creates a new make target, dtbs_install.  The script that gets
> > >> called defers to a distribution or user supplied installdtbs binary,
> > >> if found in the system.  Otherwise, the default action is to install a
> > >> given dtb into
> > >>
> > >>  /boot/devicetrees/${kernel_version}/${dts_filename}.dtb
> > 
> > Random bikeshed of the day. Maybe this was already covered in the long
> > thread and just tell me to shut up and go away if it was and I'm not
> > presenting new arguments:
> > 
> > I like this whole approach, but I'm all for shorter pathnames as long
> > as they are unique. Also, keeping it below 8 can be useful for FAT
> > /boot filesystems. I propose /boot/dtb/ instead.
> 
> Makes sense to me.

hmm, following that logic, there are 497 dts files in todays HEAD.  Only
116 of those are 8 characters or less (114 if you remove dupes).  Which
means a vast majority of dtb file names would have issues in Olof's
scenario.

Might I re-suggest /lib/devicetrees (or, /lib/dtb, or /lib/dtbs)?

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
