From: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v14 22/28] v4l: fwnode: Add a convenience function for
 registering sensors
Date: Tue, 26 Sep 2017 11:29:47 +0300
Message-ID: <20170926082947.xwwhn6k2v5dktviz@paasikivi.fi.intel.com>
References: <20170925222540.371-1-sakari.ailus@linux.intel.com>
 <20170925222540.371-24-sakari.ailus@linux.intel.com>
 <ac50fc71-c528-a703-04bb-6abc1fc7c19a@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <ac50fc71-c528-a703-04bb-6abc1fc7c19a-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 26, 2017 at 10:26:35AM +0200, Hans Verkuil wrote:
> On 26/09/17 00:25, Sakari Ailus wrote:
> > Add a convenience function for parsing firmware for information on related
> > devices using v4l2_async_notifier_parse_fwnode_sensor_common() registering
> > the notifier and finally the async sub-device itself.
> > 
> > This should be useful for sensor drivers that do not have device specific
> > requirements related to firmware information parsing or the async
> > framework.
> 
> I'm confused. This is a second patch 22/28 that appears to be identical to the
> previous one.
> 
> I'm ignoring this one, I assume something went wrong when you mailed this series.

Yes. I changed the subject but accidentally used the same directory for the
patches. The patch is the same.

The intended subject prefix is "v4l: fwnode".

-- 
Sakari Ailus
sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
