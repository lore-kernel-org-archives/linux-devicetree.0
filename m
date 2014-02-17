From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: devicetree repository separation/migration
Date: Mon, 17 Feb 2014 13:05:44 -0500
Message-ID: <20140217180544.GU7862@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

All,

At last weeks devicetree irc meeting, I took on the task of writing this
email.  I'm a bit behind.

One of the outcomes of the ARM/devicetree discussion at the 2013 Kernel
Summit was that we were going to hold off on separating the devicetree
from the Linux kernel tree.  The primary reason for this was to get
through the backlog of patches.

It's been several months, and we're seeing evidence of other projects
having difficulty keeping in sync with the kernel tree.  Specifically,
barebox is having trouble syncing:

  http://list-archives.org/2014/02/07/barebox-lists-infradead-org/devicetree-maintenance-in-barebox/f/5820726136

U-boot has some questionable (admittedly from early on) nodes.  I'll
refrain from singling out a board file or commit.  Interested
individuals can look through the irc archives for #devicetree.  At any
rate, reportedly, Wolfgang confirmed at the U-Boot minisummit that the
dts files in U-Boot would match the ones from the kernel.  So U-Boot is
in the same situation as barebox, wrt syncing.

BSD is also adopting devicetree, but I'm not personally familiar with
the status of that.  Nor whether it's diverged from what we have.

On the Linux side, it appears to me that we have successfully removed
the bottleneck, and patches seem to be flowing fairly well now.

For the past few months, Ian has been maintaining a devicetree repo at

  http://xenbits.xen.org/gitweb/?p=people/ianc/device-tree-rebasing.git;a=summary


Now for the questions:

  - Is the Linux development workflow ready for devicetree to move out
    of the Linux Kernel?

  - Would having the devicetree in it's own repo, with it's own workflow
    and release schedule help the other users of it?

  - Where should it be hosted?

  - How do we envision projects will use it?  git submodule?  reference
    a version tag?  (this is primarily targeted at bootloaders that need
    to compile in a dtb or subset of a dtb into the bootloader)

Other thoughts I may have missed?

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
