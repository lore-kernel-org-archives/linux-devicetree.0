From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH v13 06/25] omap3isp: Use generic parser for parsing
 fwnode endpoints
Date: Thu, 21 Sep 2017 11:46:21 +0300
Message-ID: <20170921084621.gtvqyad4uf6jxjsp@valkosipuli.retiisi.org.uk>
References: <20170915141724.23124-1-sakari.ailus@linux.intel.com>
 <3468276.k9eAkeO3hH@avalon>
 <20170919144722.4s5j3vos3xsyaaa2@valkosipuli.retiisi.org.uk>
 <2111815.EclloaXXVN@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2111815.EclloaXXVN@avalon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Laurent,

On Tue, Sep 19, 2017 at 07:12:14PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Tuesday, 19 September 2017 17:47:22 EEST Sakari Ailus wrote:
> > On Tue, Sep 19, 2017 at 03:46:18PM +0300, Laurent Pinchart wrote:
> > > On Tuesday, 19 September 2017 15:43:26 EEST Sakari Ailus wrote:
> > >> On Tue, Sep 19, 2017 at 02:40:29PM +0300, Laurent Pinchart wrote:
> > >>>> @@ -2256,7 +2210,9 @@ static int isp_probe(struct platform_device
> > >>>> *pdev)
> > >>>>  	if (ret)
> > >>>>  		return ret;
> > >>>> 
> > >>>> -	ret = isp_fwnodes_parse(&pdev->dev, &isp->notifier);
> > >>>> +	ret = v4l2_async_notifier_parse_fwnode_endpoints(
> > >>>> +		&pdev->dev, &isp->notifier, sizeof(struct isp_async_subdev),
> > >>>> +		isp_fwnode_parse);
> > >>>>  	if (ret < 0)
> > >>> 
> > >>> The documentation in patch 05/25 states that
> > >>> v4l2_async_notifier_release() should be called even if
> > >>> v4l2_async_notifier_parse_fwnode_endpoints() fails. I don't think that's
> > >>> needed here, so you might want to update the documentation (and possibly
> > >>> the implementation of the function).
> > >> 
> > >> It is. If parsing fails, async sub-devices may have been already set up.
> > >> This happens e.g. when the parsing fails after the first one has been
> > >> successfully set up already.
> > > 
> > > But for v4l2_async_notifier_parse_fwnode_endpoints() we could clean up
> > > internally when an error occurs. Otherwise you need to call
> > > v4l2_async_notifier_release() here.
> > 
> > The functions that set up async sub-devices can be called multiple times
> > (on separate references). This is quite alike setting up a control handler
> > really, so I adopted the same pattern.
> > 
> > If there is a failure, how many async sub-devices should be cleaned up, if
> > there have been async sub-devices already set up before calling this
> > function?
> 
> I'm not opposed to that pattern, I just thought that cleanup could be 
> automated for v4l2_async_notifier_parse_fwnode_endpoints() failures, as 
> opposed to v4l2_async_notifier_parse_fwnode_endpoints_by_port() failures.
> 
> As this patch, written by the author of 
> v4l2_async_notifier_parse_fwnode_endpoints() and part of the same patch 
> series, is missing a call to v4l2_async_notifier_release(), I expect driver 
> authors to make the same mistake and was thus wondering how to prevent that.
> 
> I believe that the issue here is that initialization of the notifier is done 
> implicitly by the first call to a parsing function. With explicit notification 
> it should be clear to driver authors that they need to call the cleanup 
> function:
> 
> ret = init()
> if (ret)
> 	return ret;
> 
> ret = parse()
> if (ret) {
> 	cleanup();
> 	return ret;
> }
> 
> ret = parse()
> if (ret) {
> 	cleanup();
> 	return ret;
> }
> 
> ret = parse()
> if (ret) {
> 	cleanup();
> 	return ret;
> }
> 
> But with an implicit initialization it's easy to miss cleanup when 
> v4l2_async_notifier_parse_fwnode_endpoints() fails, as that function can be 
> considered as an initilization function that performs cleanup internally.
> 
> I'm not sure what the best pattern would be. At the very least you need to fix 
> this patch, but that wouldn't prevent future mistakes.

The patch was actually originally written before this was apparent. I agree
that it is not a common pattern to require cleanup function to be called on
a failure.

I'll fix the patch for v14.

Going forward, I see no reason why we couldn't automate much of this for
drivers: the bindings are generic after all. The notifier could be
registered through registration of the v4l2_device. It could be simply
released immediately if there would be no async sub-devices around.

It's not a trivial change, and I'd think well out of scope of this set:
we'll need to move link creation to the framework and detach async
sub-deviecs from parsing the endpoint properties as well.

-- 
Kind regards,

Sakari Ailus
e-mail: sakari.ailus-X3B1VOXEql0@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
