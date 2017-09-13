From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH v12 06/26] v4l: fwnode: Support generic parsing of graph
 endpoints, per port
Date: Wed, 13 Sep 2017 11:18:21 +0300
Message-ID: <20170913081821.4kqf2kfmkidkaqah@valkosipuli.retiisi.org.uk>
References: <20170912134200.19556-1-sakari.ailus@linux.intel.com>
 <20170912134200.19556-7-sakari.ailus@linux.intel.com>
 <0b73f576-c37b-ad58-6f74-71ffc3f8f176@xs4all.nl>
 <a6cdf6cb-6abc-ac3b-274d-e8b43e2ac2c6@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <a6cdf6cb-6abc-ac3b-274d-e8b43e2ac2c6-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Cc: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Hans,

Thanks for the review.

On Wed, Sep 13, 2017 at 09:06:11AM +0200, Hans Verkuil wrote:
> On 09/13/2017 09:01 AM, Hans Verkuil wrote:
> > On 09/12/2017 03:41 PM, Sakari Ailus wrote:
> >> This is just like like v4l2_async_notifier_parse_fwnode_endpoints but it
> >> only parses endpoints on a single port. The behaviour is useful on devices
> >> that have both sinks and sources, in other words only some of these should
> >> be parsed.
> 
> I forgot to mention that I think the log message can be improved: it is not
> clear why you would only parse some of the ports for devices that have both
> sinks and sources. That should be explained better. And probably also in the
> header documentation.

I'll add both.

-- 
Sakari Ailus
e-mail: sakari.ailus-X3B1VOXEql0@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
