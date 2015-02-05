From: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: SPDX-License-Identifier
Date: Wed, 4 Feb 2015 22:41:30 -0800
Message-ID: <20150205064130.GB22075@kroah.com>
References: <774153d4-d33f-4bb4-813b-582762bc3af9@TX2EHSMHS021.ehs.local>
 <20140220182257.GF23217@saruman.home>
 <5306F458.9010706@monstr.eu>
 <20140221160442.GA17506@kroah.com>
 <5307790A.4050806@monstr.eu>
 <20140221161246.GM31902@saruman.home>
 <53077C5F.9000407@monstr.eu>
 <54CF9B12.2070807@denx.de>
 <20150202160622.GA9852@kroah.com>
 <54D24BA4.3070509@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54D24BA4.3070509-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>
Cc: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 04, 2015 at 05:41:08PM +0100, Stefan Roese wrote:
> On 02.02.2015 17:06, Greg Kroah-Hartman wrote:
> >On Mon, Feb 02, 2015 at 04:43:14PM +0100, Stefan Roese wrote:
> >>On 21.02.2014 17:18, Michal Simek wrote:
> >>>On 02/21/2014 05:12 PM, Felipe Balbi wrote:
> >>>>On Fri, Feb 21, 2014 at 05:04:26PM +0100, Michal Simek wrote:
> >>>>>On 02/21/2014 05:04 PM, Greg Kroah-Hartman wrote:
> >>>>>>On Fri, Feb 21, 2014 at 07:38:16AM +0100, Michal Simek wrote:
> >>>>>>>BTW: u-boot started to use SPDX-License-Identifier
> >>>>>>>which will be nice to start to use.
> >>>>>>
> >>>>>>I agree, feel free to start sending patches to use this type of
> >>>>>>identifier for drivers.
> >>>>>
> >>>>>But we probably need to add that Licenses to one location.
> >>>>>Documentation/Licenses?
> >>>>
> >>>>Just add to the drivers themselves, just like u-boot is doing. A simple:
> >>>>
> >>>>	$ git grep -e SPDX-License-Identifier
> >>>>
> >>>>will tell you filename and license. Or did I misunderstand your question ?
> >>>
> >>>But for doing this it is probably necessary to have location where
> >>>you will place that licenses and you will explain what it is how
> >>>it is done by Wolfgang in this commit.
> >>>
> >>>http://git.denx.de/?p=u-boot.git;a=commitdiff;h=eca3aeb352c964bdb28b8e191d6326370245e03f
> >>>
> >>>Then yes, adding one line is enough.
> >>I would like to revive this thread regarding SPDX license identifiers in the
> >>Linux kernel. And check how to best start / proceed with the integration
> >>now.
> >
> >Why do you want to do this?
> 
> The main idea behind these SPDX license tags in the source files is, that it
> makes license clearing for projects easier.

What do you mean by "projects" here?

I know what SPDX is, I've been well aware of it for many years now, I
just don't think it serves any value at all to go around and attempt to
mark each file of a project.

As a specific example, the Linux kernel contains 48444 files at the
moment, and it grows by a many thousands every few months.  It would be
a full-time job of someone just to try to mark all of the _new_ files,
let alone try to go back and mark all 48444 now.

> As those tags simplify the automated tools that scan all source files
> of projects,

I have no goal to do any work to make people's automated tools (several
of which are horrid and don't do any real work), just to have them check
a tag on a file.  How do you know you can "trust" such a tag?  If you
can, can't you just "trust" the overall project license of the project
in the first place?

> in this case the
> Linux kernel. One of the problems with the current licenses in the files is,
> that even the same licenses are referred to by a number of slightly varying
> text blocks (full, abbreviated, different indentation, line wrapping and/or
> white space, with obsolete address information, ...) which makes automatic
> processing a nightmare.

That's not our problem, it's yours if you feel that somehoe automatic
processing of a codebase means anything.  Hint, when I have seen license
problems, it is because people put the _wrong_ license on a file from
where it originally came from.  SPDX doesn't do anything to address this
as it would just blindly trust that the tag was correct, when in reality
you need to look at the code itself.  So it means nothing more than
making someone feel better about nothing in reality.

> Please note that we don't want to "disturb" any kernel developers in their
> work with this SPDX license ID addition. The licenses will not be changed in
> any way. We only want to make life easier for users that need to run such
> automated license clearing tools on the source code that they embed / ship /
> deploy. And this one additional line in the header is here definitely
> helpful.

How are you going to even start marking up 48 thousand files?  And how
are you going to know you got it right?  Are you going to do the work to
track down the maintainers and original authors to verify that the
license of the file really is what you think it is?  If not, then how
can it be deemed "valid"?  If you don't think you need to track these
people down, and can just trust the mark that is currently on all of the
files, well, then you don't really need to do anything at all, right?

> >Is one tag per directory sufficient?  Is one tag per file sufficient?
> >How about one tag per package?  If package, then isn't a single tag for
> >the whole kernel source tree sufficient, as we all know the overall
> >license for the kernel source tree.
> 
> We really need one tag per file.

I fail to see the justification for this, why?  Why not per directory?
Why not per function?  Why not per driver?  Why not per line?  Why not
per project?  Who has dictated this seemingly arbitrary rule?

> Of course the resulting license for the Linux kernel is clear.

Great, then why do any additional work here that is going to take you
man-years to complete and then be forced to constantly keep it up to
date with new submissions?

> But
> there are many things to take into account here.
> Some of them are (I'm not telling you something new, I know - just a summary
> of arguments):
> 
> - The Linux source code is not homogeneous and neither perfect nor
>   without errors. Who ensures that all parts of the kernel really
>   are GPLv2 compatible?

Our DCO process ensures that.

> - Some parts of the Linux source code are also used by other projects.
>   Or are derived from other projects. Because of this they are
>   explicitly licensed under different licenses than the GPLv2
>   (compatible to it though of course). Or are dual-licensed. So that
>   they can be used by these other projects.

That's fine, we encourage that and want to see that happen.  How will
SPDX change that at all?  It's obvious as to the license of the files
that this happens with, why do anything extra?

> For example "Documentation/SubmittingDrivers" mentions:
> 
>   	The code must be released to us under the
> 	GNU General Public License. We don't insist on any kind
> 	of exclusive GPL licensing, and if you wish the driver
> 	to be useful to other communities such as BSD you may well
> 	wish to release under multiple licenses.
> 	See accepted licenses at include/linux/module.h
> 
> Because of this it is really important to know the exact license(s) for each
> and every file. And they can vary very much. Here some examples:
> 
> GPL v3 or later:
> 
> 	Documentation/filesystems/cifs/winucase_convert.pl
> 	scripts/dtc/dtc-parser.tab.c_shipped
> 	scripts/dtc/dtc-parser.tab.h_shipped
> 	scripts/kconfig/zconf.tab.c_shipped
> 	scripts/genksyms/parse.tab.h_shipped
> 	scripts/genksyms/parse.tab.c_shipped
> 	drivers/staging/lustre/lustre/include/lustre_dlm_flags.h
> 
> So there seems to be problem with this lustre code.

Great, tell us about the problem files and we will be glad to resolve
them.  I'm the person responsible for the drivers/staging/ directory,
please start a new thread about that file if you have concern about it
and cc: the maintainers of that code along with the mailing list that
get_maintainers.pl says to and we will work to resolve your questions.

So if you want to go through the tree and point out potential questions,
great, I'd love to see that happen.  But blindly putting tags on files
isn't going to do anything at all, except quiet some stupid automated
tools that we care _nothing_ about.

> Dual BSD/GPL:
> 
> 	crypto/aes_generic.c
> 	crypto/cts.c
> 	crypto/fcrypt.c
> 	drivers/block/skd_main.c
> 	drivers/block/xen-blkback/blkback.c
> 	...
> 
> Dual MIT/GPL:
> 
> 	lib/glob.c
> 
> Dual MPL/GPL:
> 
> 	drivers/ide/ide-cs.c
> 	drivers/isdn/hisax/elsa_cs.c
> 	drivers/isdn/hisax/sedlbauer_cs.c
> 	drivers/mtd/ftl.c
> 	drivers/net/ethernet/xircom/xirc2ps_cs.c
> 	...
> 
> and so on...

I fail to understand the problem with these dual licensed files, care to
expand on that?

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
