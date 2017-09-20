From: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v13 13/25] v4l: async: Allow async notifier register call
 succeed with no subdevs
Date: Wed, 20 Sep 2017 13:51:53 +0300
Message-ID: <20170920105153.ohsdp4cgawdsjsae@paasikivi.fi.intel.com>
References: <20170915141724.23124-1-sakari.ailus@linux.intel.com>
 <20170919145831.uztphjdtd3fdxzvr@valkosipuli.retiisi.org.uk>
 <20170919150348.2jsqtxbk6bji4gdb@valkosipuli.retiisi.org.uk>
 <2195038.iUeBRvYfe2@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2195038.iUeBRvYfe2@avalon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Laurent,

On Tue, Sep 19, 2017 at 08:54:12PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Tuesday, 19 September 2017 18:03:48 EEST Sakari Ailus wrote:
> > On Tue, Sep 19, 2017 at 05:58:32PM +0300, Sakari Ailus wrote:
> > >> This skips adding the notifier to the notifier_list. Won't this result
> > >> in an oops when calling list_del(&notifier->list) in
> > >> v4l2_async_notifier_unregister() ?
> > > 
> > > Good point. I'll add initialising the list head to the register function,
> > > with an appropriate comment.
> > 
> > I'll set v4l2_dev NULL instead; no tricks with lists needed.
> 
> Shouldn't the notifier still be added to the notifier_list ?

Would there be any benefit of that?

The notifier's v4l2_dev field is also used to determine whether the
notifier is registered currently. If the notifier is added to the notifier
list, we need to remove it in unregistration as well.

-- 
Sakari Ailus
sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
