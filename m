From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH v14 15/28] v4l: async: Allow binding notifiers to
 sub-devices
Date: Tue, 26 Sep 2017 11:20:46 +0300
Message-ID: <20170926082046.sfmhyf7xmkutzjbe@valkosipuli.retiisi.org.uk>
References: <20170925222540.371-1-sakari.ailus@linux.intel.com>
 <20170925222540.371-16-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170925222540.371-16-sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 26, 2017 at 01:25:26AM +0300, Sakari Ailus wrote:
> Registering a notifier has required the knowledge of struct v4l2_device
> for the reason that sub-devices generally are registered to the
> v4l2_device (as well as the media device, also available through
> v4l2_device).
> 
> This information is not available for sub-device drivers at probe time.
> 
> What this patch does is that it allows registering notifiers without
> having v4l2_device around. Instead the sub-device pointer is stored in the
> notifier. Once the sub-device of the driver that registered the notifier
> is registered, the notifier will gain the knowledge of the v4l2_device,
> and the binding of async sub-devices from the sub-device driver's notifier
> may proceed.
> 
> The root notifier's complete callback is only called when all sub-device
> notifiers are completed.

This paragraph is actually no longer true. I changed it to:

	The complete callbacks will be called only when the v4l2_device is
	available and no notifier has pending sub-devices to bind.

-- 
Sakari Ailus
e-mail: sakari.ailus-X3B1VOXEql0@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
