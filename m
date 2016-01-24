From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH v2 13/26] drm/fb_cma_helper: Remove implicit call to disable_unused_functions
Date: Mon, 25 Jan 2016 00:19:27 +0200
Message-ID: <1484612.l42nGNbAu5__49836.821066174$1453702963$gmane$org@avalon>
References: <1452785109-6172-1-git-send-email-maxime.ripard@free-electrons.com> <2014724.QmjXVju9UW@avalon> <20160115101730.GH19130@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160115101730.GH19130-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Wynter Woods <wynter-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Daniel,

On Friday 15 January 2016 11:17:30 Daniel Vetter wrote:
> On Fri, Jan 15, 2016 at 01:13:05AM +0200, Laurent Pinchart wrote:
> > On Thursday 14 January 2016 16:24:56 Maxime Ripard wrote:
> >> The drm_fbdev_cma_init function always calls the
> >> drm_helper_disable_unused_functions. Since it's part of the usual probe
> >> process, all the drivers using that helper will end up having their
> >> encoder and CRTC disable functions called at probe if their device has
> >> not been reported as enabled.
> >> 
> >> This could be fixed by reading out from the registers the current state
> >> of the device if it is enabled, but even that will not handle the case
> >> where the device is actually disabled.
> >> 
> >> Moreover, the drivers using the atomic modesetting expect that their
> >> enable and disable callback to be called when the device is already
> >> enabled or disabled (respectively).
> >> 
> >> We can however fix this issue by moving the call to
> >> drm_helper_disable_unused_functions out of drm_fbdev_cma_init and make
> >> the drivers needing it (all the drivers calling drm_fbdev_cma_init and
> >> not using the atomic modesetting) explicitly call it.
> > 
> > I'd rather add it to all drivers that call drm_fbdev_cma_init(). All the
> > atomic ones must have special code to cope with it that could be rendered
> > useless by the removal of the drm_helper_disable_unused_functions() call.
> > That code should be removed too, and it would be easier to check drivers
> > one by one and fixing them individually (outside of this patch series,
> > unless you insist ;-)) when removing the explicit
> > drm_helper_disable_unused_functions() call.
>
> I had the same thought, but figured there's really no good reason ever to
> do this. I suspect most of that disable_unused_function stuff we have all
> over is supreme cargo-cult anyway ;-)

I'm not sure you got my point. Yes, the drm_helper_disable_unused_functions() 
call should be removed from atomic drivers, but that will leave support code 
added for the sole reason of avoiding the crash in the drivers. That code will 
likely not be noticed and will stay there rotting. If we added 
drm_helper_disable_unused_functions() calls to all atomic drivers then driver 
authors will hopefully check carefully if there's any support code that can be 
removed when removing the function call. It would act as a kind of FIXME 
reminder.

> > Other than that the patch looks fine to me.
> 
> So went ahead and applied to drm-misc.

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
