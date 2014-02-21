From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: devicetree repository separation/migration
Date: Fri, 21 Feb 2014 15:11:36 +0100
Message-ID: <20140221141136.GI17250@pengutronix.de>
References: <20140217180544.GU7862@titan.lakedaemon.net>
 <5306A6C0.9000206@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5306A6C0.9000206-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 20, 2014 at 05:07:12PM -0800, Frank Rowand wrote:
> On 2/17/2014 10:05 AM, Jason Cooper wrote:
> > All,
> > 
> > At last weeks devicetree irc meeting, I took on the task of writing this
> > email.  I'm a bit behind.
> > 
> > One of the outcomes of the ARM/devicetree discussion at the 2013 Kernel
> > Summit was that we were going to hold off on separating the devicetree
> > from the Linux kernel tree.  The primary reason for this was to get
> > through the backlog of patches.
> > 
> > It's been several months, and we're seeing evidence of other projects
> > having difficulty keeping in sync with the kernel tree.  Specifically,
> > barebox is having trouble syncing:
> > 
> >   http://list-archives.org/2014/02/07/barebox-lists-infradead-org/devicetree-maintenance-in-barebox/f/5820726136
> 
> < snip >
> 
> Sascha,
> 
> (Directing this to you, because the devicetree-maintenance-in-barebox thread
> begins with an email from you.)
> 
> I have read through the referenced thread, but do not yet understand the cause
> of the issues the barebox project is facing.  What I got from the thread is
> that the barebox project maintains some devicetree changes in the project
> repository, and it is difficult to manage these changes as the upstream
> project (the Linux kernel) makes changes.
> 
> What are the barebox changes to dts files?

Mostly mtd partitions and descriptions where barebox can find its
environment.

> 
> Why are the changes not submitted upstream?  (Or if they were submitted, why
> were they not accepted?)

The descriptions where to find the environment are obviously barebox
specific and not acceptable upstream. mtd partitions shouldn't be
upstream either since they should be changeable on a per project or even
per board basis.

As mentioned before we can put the changes into barebox specific dts
files which include the original upstream dts files. This way we can
keep the changes separated from the original files and don't have to
patch them.

> 
> I'm not sure what else to ask to try to understand the issues for barebox.  Is
> there anything else you can say to help me understand?
> 
> How would moving the devicetree files to another repository (also external to
> the barebox project) resolve the issues for the barebox project?

When I start supporting a new board I start with porting the bootloader.
For doing so I create an initial dts for the board which is then part of
barebox. At some point barebox development is done, further work is done
in the kernel, so the dts is copied there. The graphics nodes are added
which are irrelevant for barebox. Along the way I find some bugs in
the dts which are relevant for barebox, so I have to sync the dts back
to barebox at some point.
When someone posts barebox patches for a new board I normally would have
to ask him to post the patches for Linux inclusion first, because
otherwise I will get conflicting devicetrees downstream in barebox
later when the board is ported to the kernel.
None of the above is magically solved when the dts files are external to
the kernel, it just simplifies the process. It would allow me to use
version control systems to do the sync rather than copying files back
and forth.
Ians dts repository is a good start, but it contains a complete kernel
history and this is not very suitable as a submodule for other projects.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
