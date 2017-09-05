From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH v7 01/18] v4l: fwnode: Move KernelDoc documentation to
 the header
Date: Tue, 5 Sep 2017 17:53:37 +0300
Message-ID: <20170905145337.h6qy42k3hv6ha73y@valkosipuli.retiisi.org.uk>
References: <20170903174958.27058-1-sakari.ailus@linux.intel.com>
 <20170903174958.27058-2-sakari.ailus@linux.intel.com>
 <20170904154940.GA19484@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170904154940.GA19484@amd>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 04, 2017 at 05:49:40PM +0200, Pavel Machek wrote:
> On Sun 2017-09-03 20:49:41, Sakari Ailus wrote:
> > In V4L2 the practice is to have the KernelDoc documentation in the header
> > and not in .c source code files. This consequientally makes the V4L2
> 
> consequientally: spelling?
> 
> > fwnode function documentation part of the Media documentation build.
> > 
> > Also correct the link related function and argument naming in
> > documentation.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> > Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>
> 
> Something funny going on with utf-8 here.
> 
> Acked-by: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>

Thanks! Will fix for v9.

I had bad commit message encoding in .gitconfig, that's now fixed.

-- 
Sakari Ailus
e-mail: sakari.ailus-X3B1VOXEql0@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
