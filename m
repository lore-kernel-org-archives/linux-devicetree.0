From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH v3 1/3] omap3isp: Drop redundant isp->subdevs field and
 ISP_MAX_SUBDEVS
Date: Tue, 22 Aug 2017 15:33:07 +0300
Message-ID: <20170822123307.gdgtg33vgppd4fog@valkosipuli.retiisi.org.uk>
References: <20170818112317.30933-1-sakari.ailus@linux.intel.com>
 <20170818112317.30933-2-sakari.ailus@linux.intel.com>
 <3810750.ISKOUEcbCg@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3810750.ISKOUEcbCg@avalon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 22, 2017 at 03:30:22PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Friday, 18 August 2017 14:23:15 EEST Sakari Ailus wrote:
> > struct omap3isp.subdevs field and ISP_MAX_SUBDEVS macro are both unused.
> > Remove them.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> 
> The field and macro are still used, you only remove them in patch 2/3. You can 
> squash 1/3 and 2/3 together.

Oh, I missed this indeed. I'll squash the patches.

> 
> > ---
> >  drivers/media/platform/omap3isp/isp.h | 3 ---
> >  1 file changed, 3 deletions(-)
> > 
> > diff --git a/drivers/media/platform/omap3isp/isp.h
> > b/drivers/media/platform/omap3isp/isp.h index e528df6efc09..848cd96b67ca
> > 100644
> > --- a/drivers/media/platform/omap3isp/isp.h
> > +++ b/drivers/media/platform/omap3isp/isp.h
> > @@ -220,9 +220,6 @@ struct isp_device {
> > 
> >  	unsigned int sbl_resources;
> >  	unsigned int subclk_resources;
> > -
> > -#define ISP_MAX_SUBDEVS		8
> > -	struct v4l2_subdev *subdevs[ISP_MAX_SUBDEVS];
> >  };
> > 
> >  struct isp_async_subdev {
> 
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> 

-- 
Sakari Ailus
e-mail: sakari.ailus-X3B1VOXEql0@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
