From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH v13 01/25] v4l: fwnode: Move KernelDoc documentation to
 the header
Date: Tue, 19 Sep 2017 14:10:37 +0300
Message-ID: <20170919111036.5va2unwqh2vymojr@valkosipuli.retiisi.org.uk>
References: <20170915141724.23124-1-sakari.ailus@linux.intel.com>
 <20170915141724.23124-2-sakari.ailus@linux.intel.com>
 <9077921.hsjkiRftLf@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <9077921.hsjkiRftLf@avalon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Laurent,

On Tue, Sep 19, 2017 at 01:48:27PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Friday, 15 September 2017 17:17:00 EEST Sakari Ailus wrote:
> > In V4L2 the practice is to have the KernelDoc documentation in the header
> > and not in .c source code files. This consequently makes the V4L2 fwnode
> > function documentation part of the Media documentation build.
> > 
> > Also correct the link related function and argument naming in
> > documentation.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> > Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>
> > Acked-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
> > Acked-by: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
> 
> I'm still very opposed to this. In addition to increasing the risk of 
> documentation becoming stale, it also makes review more difficult. I'm 
> reviewing patch 05/25 of this series and I have to jump around the patch to 
> verify that the documentation matches the implementation, it's really 
> annoying.

I'd like to have this discussion separately from the patchset, which is
right now in its 13th version. This patch simply makes the current state
consistent; V4L2 async was the only part of V4L2 with KernelDoc
documentation in .c files.

-- 
Regards,

Sakari Ailus
e-mail: sakari.ailus-X3B1VOXEql0@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
