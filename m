From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH 9/9] [DO NOT MERGE] drm/sun4i: rgb: Add 5%
 tolerance to dot clock frequency check
Date: Thu, 18 Oct 2018 16:57:03 +0300
Message-ID: <18807799.FbuUgLpiEM@avalon>
References: <20181018073327.64942-1-icenowy@aosc.io> <1585874.9P5eR8PMbl@avalon> <20181018121819.gmup3jd7ukj52rvx@flea>
Reply-To: laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDKM3GOS4YHBBMVCULPAKGQEZVUE2YQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20181018121819.gmup3jd7ukj52rvx@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Maxime,

On Thursday, 18 October 2018 15:18:19 EEST Maxime Ripard wrote:
> On Thu, Oct 18, 2018 at 02:31:01PM +0300, Laurent Pinchart wrote:
> > On Thursday, 18 October 2018 12:42:58 EEST Maxime Ripard wrote:
> >> On Thu, Oct 18, 2018 at 11:18:06AM +0200, Daniel Vetter wrote:
> >>> On Thu, Oct 18, 2018 at 10:55 AM Laurent Pinchart wrote:
> >>>> On Thursday, 18 October 2018 10:33:27 EEST Icenowy Zheng wrote:
> >>>>> From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> >>>>> 
> >>>>> The panels shipped with Allwinner devices are very "generic", i.e.
> >>>>> they do not have model numbers or reliable sources of information
> >>>>> for the timings (that we know of) other than the fex files shipped
> >>>>> on them. The dot clock frequency provided in the fex files have all
> >>>>> been rounded to the nearest MHz, as that is the unit used in them.
> >>>>> 
> >>>>> We were using the simple panel "urt,umsh-8596md-t" as a substitute
> >>>>> for the A13 Q8 tablets in the absence of a specific model for what
> >>>>> may be many different but otherwise timing compatible panels. This
> >>>>> was usable without any visual artifacts or side effects, until the
> >>>>> dot clock rate check was added in commit bb43d40d7c83 ("drm/sun4i:
> >>>>> rgb: Validate the clock rate").
> >>>>> 
> >>>>> The reason this check fails is because the dotclock frequency for
> >>>>> this model is 33.26 MHz, which is not achievable with our dot clock
> >>>>> hardware, and the rate returned by clk_round_rate deviates slightly,
> >>>>> causing the driver to reject the display mode.
> >>>>> 
> >>>>> The LCD panels have some tolerance on the dot clock frequency, even
> >>>>> if it's not specified in their datasheets.
> >>>>> 
> >>>>> This patch adds a 5% tolerence to the dot clock check.
> >>>> 
> >>>> Why do you think this shouldn't be merged ?
> >>> 
> >>> It pisses of a lot of people who really insist upon accurate timing.
> >> 
> >> It's not just about accurate timings. That 5% is a made-up limit, that
> >> never have really been confirmed by looking at the typical tolerancies
> >> of panels.
> >> 
> >> And while being to relaxed might make some panels work that are not
> >> working currently, it might also break some panels that currently work
> >> and won't now, and ideally, we should really be able to let those
> >> panels work if they can, and filter out resolutions if they can't.
> >> 
> >>> I think a better fix would be to have a dotclock range in drm_panel,
> >>> and some magic to figure out which one of these we can actually
> >>> do. Then tell userspace that this is the mode is should
> >>> request. That way userspace knows what the actual dotclock/refresh
> >>> rate is, and the panel still works.
> >> 
> >> It's not just about panels, but also bridges with EDID where the
> >> tolerancy is not exposed.
> > 
> > Given that the tolerance is a property of the panel or bridge, I agree
> > with Daniel that it should be implemented there, or at least in
> > cooperation with drm_panel and drm_bridge.
> 
> How are we supposed to deal with panels without any documentation then?

We can only guess, but if the guess comes from the panel driver, it will at 
least not affect all panels and bridges, like this patch does.

> > Semi-related information, I think the CEA and VESA standards allow a 0.5%
> > clock tolerance. What is the maximum clock frequency deviation required
> > for this platform ?
> 
> Looks like it does indeed. That's definetely good to know.

-- 
Regards,

Laurent Pinchart
