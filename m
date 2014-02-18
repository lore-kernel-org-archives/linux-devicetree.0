From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: devicetree repository separation/migration
Date: Tue, 18 Feb 2014 16:57:50 +0100
Message-ID: <20140218155750.GS17250@pengutronix.de>
References: <20140217180544.GU7862@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140217180544.GU7862-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 17, 2014 at 01:05:44PM -0500, Jason Cooper wrote:
> All,
> 
> At last weeks devicetree irc meeting, I took on the task of writing this
> email.  I'm a bit behind.
> 
> One of the outcomes of the ARM/devicetree discussion at the 2013 Kernel
> Summit was that we were going to hold off on separating the devicetree
> from the Linux kernel tree.  The primary reason for this was to get
> through the backlog of patches.
> 
> It's been several months, and we're seeing evidence of other projects
> having difficulty keeping in sync with the kernel tree.  Specifically,
> barebox is having trouble syncing:
> 
>   http://list-archives.org/2014/02/07/barebox-lists-infradead-org/devicetree-maintenance-in-barebox/f/5820726136
> 
> U-boot has some questionable (admittedly from early on) nodes.  I'll
> refrain from singling out a board file or commit.  Interested
> individuals can look through the irc archives for #devicetree.  At any
> rate, reportedly, Wolfgang confirmed at the U-Boot minisummit that the
> dts files in U-Boot would match the ones from the kernel.  So U-Boot is
> in the same situation as barebox, wrt syncing.
> 
> BSD is also adopting devicetree, but I'm not personally familiar with
> the status of that.  Nor whether it's diverged from what we have.
> 
> On the Linux side, it appears to me that we have successfully removed
> the bottleneck, and patches seem to be flowing fairly well now.
> 
> For the past few months, Ian has been maintaining a devicetree repo at
> 
>   http://xenbits.xen.org/gitweb/?p=people/ianc/device-tree-rebasing.git;a=summary
> 
> 
> Now for the questions:
> 
>   - Is the Linux development workflow ready for devicetree to move out
>     of the Linux Kernel?

I hope so since keeping the devicetrees in sync with the kernel is a
pain for all external users.

> 
>   - Would having the devicetree in it's own repo, with it's own workflow
>     and release schedule help the other users of it?
> 
>   - Where should it be hosted?
> 
>   - How do we envision projects will use it?  git submodule?  reference
>     a version tag?  (this is primarily targeted at bootloaders that need
>     to compile in a dtb or subset of a dtb into the bootloader)

I would prefer to use it as a submodule. I'll likely need some barebox
specific additions to the devicetrees. Right now our idea is to leave
the provided devicetrees untouched and instead of compiling the board
dts files directly we create <boardname>-barebox.dts files which include
the original board files. That would allow us to provide additional
information to barebox without having to carry patches for the
devicetrees.

> 
> Other thoughts I may have missed?

It will be interesting to see which rules should apply for merging new
bindings. I know that devicetrees should be OS agnostic, but sometimes
they are modelled after how Linux currently works. What happens when the
*BSD guys have different ideas how a good binding looks like? How will
such conflicts be resolved?

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
