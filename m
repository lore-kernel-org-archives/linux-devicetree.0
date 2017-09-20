From: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v13 06/25] omap3isp: Use generic parser for parsing
 fwnode endpoints
Date: Wed, 20 Sep 2017 18:50:58 +0300
Message-ID: <20170920155057.ded5rjcb3egi3yse@paasikivi.fi.intel.com>
References: <20170915141724.23124-1-sakari.ailus@linux.intel.com>
 <1555926.RTv2yyCEgl@avalon>
 <20170919124326.f3q4c6kwt3cfyyno@paasikivi.fi.intel.com>
 <3468276.k9eAkeO3hH@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3468276.k9eAkeO3hH@avalon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Laurent,

On Tue, Sep 19, 2017 at 03:46:18PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Tuesday, 19 September 2017 15:43:26 EEST Sakari Ailus wrote:
> > On Tue, Sep 19, 2017 at 02:40:29PM +0300, Laurent Pinchart wrote:
> > > > @@ -2256,7 +2210,9 @@ static int isp_probe(struct platform_device *pdev)
> > > > 
> > > >  	if (ret)
> > > >  	
> > > >  		return ret;
> > > > 
> > > > -	ret = isp_fwnodes_parse(&pdev->dev, &isp->notifier);
> > > > +	ret = v4l2_async_notifier_parse_fwnode_endpoints(
> > > > +		&pdev->dev, &isp->notifier, sizeof(struct isp_async_subdev),
> > > > +		isp_fwnode_parse);
> > > > 
> > > >  	if (ret < 0)
> > > 
> > > The documentation in patch 05/25 states that v4l2_async_notifier_release()
> > > should be called even if v4l2_async_notifier_parse_fwnode_endpoints()
> > > fails. I don't think that's needed here, so you might want to update the
> > > documentation (and possibly the implementation of the function).
> > 
> > It is. If parsing fails, async sub-devices may have been already set up.
> > This happens e.g. when the parsing fails after the first one has been
> > successfully set up already.
> 
> But for v4l2_async_notifier_parse_fwnode_endpoints() we could clean up 
> internally when an error occurs. Otherwise you need to call 
> v4l2_async_notifier_release() here.

If a driver uses the variant that parses the endpoints by port, how should
that function behave? Release just as many async sub-devices it set up, and
leave the rest for the driver to handle?

The reason I left it as such as to make the responsibility clear: it
belongs to the driver.

I can change that if you really think it makes a difference for better. I'm
just not that certain about it.

-- 
Regards,

Sakari Ailus
sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
