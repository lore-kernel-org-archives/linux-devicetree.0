From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [RFC v2 2/4] drm/mediatek: Add DRM Driver for Mediatek SoC
 MT8173.
Date: Tue, 22 Sep 2015 12:06:22 +0200
Message-ID: <1442916382.3128.18.camel@pengutronix.de>
References: <1442592722-29004-1-git-send-email-p.zabel@pengutronix.de>
	 <1442592722-29004-3-git-send-email-p.zabel@pengutronix.de>
	 <20150922093842.GE3383@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150922093842.GE3383-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jitao Shi <jitao.shi-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Cawa Cheng <cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Daniel,

thank you for the comments.

Am Dienstag, den 22.09.2015, 11:38 +0200 schrieb Daniel Vetter:
[...]
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > new file mode 100644
> > index 0000000..fc071fe
> > --- /dev/null
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > @@ -0,0 +1,471 @@
[...]
> > +static int mtk_atomic_commit(struct drm_device *dev,
> > +			     struct drm_atomic_state *state,
> > +			     bool async)
> > +{
> > +	return drm_atomic_helper_commit(dev, state, false);
> 
> This isn't a proper async commit operation, it will still block userspace
> unecessarily. See e.g. the vc4 patches for a proper one.

I'll drop this function and assign .atomic_commit to
drm_atomic_helper_commit directly.

[...]
> > +static int mtk_plane_atomic_check(struct drm_plane *plane,
> > +		struct drm_plane_state *state)
> > +{
[...]
> > +	ret = drm_plane_helper_check_update(plane, state->crtc, fb,
> > +					    &src, &dest, &clip,
> > +					    DRM_PLANE_HELPER_NO_SCALING,
> > +					    DRM_PLANE_HELPER_NO_SCALING,
> > +					    true, true, &visible);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (!visible)
> > +		return 0;
> > +
> > +	mtk_plane->disp_size = (dest.y2 - dest.y1) << 16 | (dest.x2 - dest.x1);
> 
> I think it might work out ok but it's very fragile to update object state
> from your atomic_check hooks - atomic allows a TEST_ONLY mode and if
> that's used (generic userspace will do that a few times for each frame at
> least) then you clobber shared state. Instead it's better to store that in
> your own mtk_plane_state which subclasses drm_plane_state.

Ok, will do.

[...]
> > +static void mtk_plane_attach_zpos_property(struct drm_plane *plane,
> > +		unsigned int zpos, unsigned int max_plane)
> > +{
> > +	struct drm_device *dev = plane->dev;
> > +	struct mtk_drm_private *dev_priv = dev->dev_private;
> > +	struct drm_property *prop;
> > +
> > +	prop = dev_priv->plane_zpos_property;
> > +	if (!prop) {
> > +		prop = drm_property_create_range(dev, DRM_MODE_PROP_IMMUTABLE,
> > +						 "zpos", 0, max_plane - 1);
> 
> I know that there's lots of other drivers exposing zpos already, but I
> really think we should standardize this properly and document what it
> means. So
> - add a bit more text to the kerneldoc/doobook, especially what should
>   happen when there's a conflict in zpos.
> - move zpos registration/decoding into drm core, which means adding it to
>   drm_plane_state
> - have an open-source implementation using this somewhere (ddx, wayland,
>   hwc, ...).
> 
> I think for now it's better to drop the zpos property from initial
> mediatek enabling.

Alright, I'll separate this from the initial patchset.

best regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
