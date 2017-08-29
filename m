From: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v5 1/5] v4l: fwnode: Move KernelDoc documentation to the
 header
Date: Tue, 29 Aug 2017 16:20:10 +0300
Message-ID: <20170829132010.nfofeofidvpipw4h@paasikivi.fi.intel.com>
References: <20170829110313.19538-1-sakari.ailus@linux.intel.com>
 <20170829110313.19538-2-sakari.ailus@linux.intel.com>
 <2676284.rKR023OhTM@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2676284.rKR023OhTM@avalon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Laurent,

On Tue, Aug 29, 2017 at 04:15:22PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Tuesday, 29 August 2017 14:03:09 EEST Sakari Ailus wrote:
> > In V4L2 the practice is to have the KernelDoc documentation in the header
> > and not in .c source code files. This consequientally makes the V4L2
> > fwnode function documentation part of the Media documentation build.
> > 
> > Also correct the link related function and argument naming in
> > documentation.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> 
> I prefer documenting functions in the C file. Documentation in header files 
> will get out-of-sync with the implementation much more easily.

The fact is that there's very little KernelDoc documentation left in the .c
files in V4L2. This actually appears to be the only exception. And it seems
to have been in the Sphinx build; I missed that earlier, so that part of
the commit message doesn't apply.

-- 
Sakari Ailus
sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
