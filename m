From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH v13 01/25] v4l: fwnode: Move KernelDoc documentation to
 the header
Date: Tue, 19 Sep 2017 14:22:10 +0300
Message-ID: <20170919112210.pnlipm6mfaazmo6b@valkosipuli.retiisi.org.uk>
References: <20170915141724.23124-1-sakari.ailus@linux.intel.com>
 <20170915141724.23124-2-sakari.ailus@linux.intel.com>
 <9077921.hsjkiRftLf@avalon>
 <29354478-ec46-278b-c457-4e6f3cc6848c@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <29354478-ec46-278b-c457-4e6f3cc6848c-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Cc: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Hans,

On Tue, Sep 19, 2017 at 01:04:36PM +0200, Hans Verkuil wrote:
> On 09/19/17 12:48, Laurent Pinchart wrote:
> > Hi Sakari,
> > 
> > Thank you for the patch.
> > 
> > On Friday, 15 September 2017 17:17:00 EEST Sakari Ailus wrote:
> >> In V4L2 the practice is to have the KernelDoc documentation in the header
> >> and not in .c source code files. This consequently makes the V4L2 fwnode
> >> function documentation part of the Media documentation build.
> >>
> >> Also correct the link related function and argument naming in
> >> documentation.
> >>
> >> Signed-off-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> >> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>
> >> Acked-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
> >> Acked-by: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
> > 
> > I'm still very opposed to this. In addition to increasing the risk of 
> > documentation becoming stale, it also makes review more difficult. I'm 
> > reviewing patch 05/25 of this series and I have to jump around the patch to 
> > verify that the documentation matches the implementation, it's really 
> > annoying.
> > 
> > We should instead move all function documentation from header files to source 
> > files.
> 
> I disagree with this. Yes, it makes reviewing harder, but when you have to
> *use* these functions as e.g. a driver developer, then having it in the
> header is much more convenient.

For developers writing a driver and _not_ using e.g. the HTML
documentation, programs like cscope point the user to the implementation of
the function --- which is in the .c file, not the header. This is what I
personally tend to do at least; for most of the time I ignore where exactly
a given function is implemented (this is actually not self-evident in V4L2
outside async / fwnode).

The rest of the kernel appears to generally have the KernelDoc in .c files,
for a reason or another:

14:05:15 nauris sailus [~/scratch/src/linux]git grep '/\*\*$' -- include/|wc -l
6997
14:14:46 nauris sailus [~/scratch/src/linux]git grep '/\*\*$' -- drivers/ net/ mm/ lib/ kernel/ fs/ firmware/ init/ ipc/ block/ crypto/ |wc -l
44756

I think I'm slightly leaning towards moving it: having the documentation
where the implementation is does help keeping it up-to-date. It's currently
all too easy to change a function without realising it was actually
documented somewhere.

-- 
Regards,

Sakari Ailus
e-mail: sakari.ailus-X3B1VOXEql0@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
