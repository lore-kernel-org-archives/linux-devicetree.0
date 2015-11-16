From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH 08/19] drm: Add Allwinner A10 Display Engine support
Date: Mon, 16 Nov 2015 16:04:08 +0100
Message-ID: <20151116150408.GT16848@phenom.ffwll.local>
References: <1446214865-3972-1-git-send-email-maxime.ripard@free-electrons.com>
 <1446214865-3972-9-git-send-email-maxime.ripard@free-electrons.com>
 <20151030144409.GZ16848@phenom.ffwll.local>
 <20151111221412.GH6114@lukather>
Reply-To: daniel-/w4YWyX8dFk@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDYZDG4VSMIRB27AU6ZAKGQEM7RP7LY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20151111221412.GH6114@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Wynter Woods <wynter-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 11, 2015 at 02:14:12PM -0800, Maxime Ripard wrote:
> Hi Daniel,
> 
> Thanks for your review!

Back from vacation, sorry for the delay.

> 
> On Fri, Oct 30, 2015 at 03:44:09PM +0100, Daniel Vetter wrote:
> > > +static void sun4i_crtc_disable(struct drm_crtc *crtc)
> > > +{
> > > +	struct sun4i_crtc *scrtc = drm_crtc_to_sun4i_crtc(crtc);
> > > +	struct sun4i_drv *drv = scrtc->drv;
> > > +
> > > +	DRM_DEBUG_DRIVER("Disabling the CRTC\n");
> > > +
> > > +	if (!scrtc->enabled)
> > > +		return;
> > 
> > Please don't do this - the atomic state should always reflect the true hw
> > state (fix that up with either hw state readout or reset in the ->reset
> > callbacks), and the atomic helpers guarantee that they'll never call you
> > when not needed. If you don't trust them do a WARN_ON at least, but no
> > early silent returns.
> > 
> > Personally I'd just rip it out, it's too much trouble. And for debugging
> > the atomic helpers already trace it all (or at least should).
> 
> Ok. Is there a preferred way to do HW state readout, or should I just
> add that to my probe?

There's no preferred way yet (i.e. something supported in a standard
fashion through helpers). I'd place it in your various ->reset hooks
though. The idea from atomic helpers is that ->reset should make sure that
atomic state structures (i.e. drm_crtc/connector/plane_state or your
driver-specific subclasses of them) should match with the hw state. Either
by resetting the hw or by reading out the hw state inte freshly-allocated
structures.

> > > +static int sun4i_drv_connector_plug_all(struct drm_device *drm)
> > 
> > Laurent Pinchart has this as a rfc patch for drm core, please coordinate
> > with him and rebase on top of his patches.
> 
> Ack, I will.
> 
> > > +static int sun4i_drv_enable_vblank(struct drm_device *drm, int pipe)
> > > +{
> > > +	struct sun4i_drv *drv = drm->dev_private;
> > > +	struct sun4i_tcon *tcon = drv->tcon;
> > > +
> > > +	DRM_DEBUG_DRIVER("Enabling VBLANK on pipe %d\n", pipe);
> > > +
> > > +	sun4i_tcon_enable_vblank(tcon, true);
> > > +
> > > +	return 0;
> > 
> > atomic helpers rely on enable_vblank failing correctly when the pipe is
> > off and vlbanks will never happen. You probably need a correct error code
> > here that checks crtc->state->active (well not that directly but something
> > derived from it, since the pointer chase would be racy).
> 
> Ok.
> 
> > I know it's a bit a mess since we don't have kms-native vblank driver
> > hooks yet and really the drm core should get this right for you. It'll
> > happen eventually, but drm_irq.c is a bit moldy ;-)
> 
> I can't really use drm_irq anyway, since we don't have a single
> interrupt for the VBLANK, but two, that we have to use depending on
> the output.

drm_irq has 2 parts: irq handling, which only supports 1 hw irq line, and
which is totally optional.

2nd part is the vblank support (all the drm_vblank and drm_crtc_vblank_)
functions, which are completely agnostic to how exactly your hw signals a
vblank for a given output. Those are mandatory if you want to support
vblanks (and really, you want to support vblanks). So whether you have 2
hw irq lines or 1 hw irq line with some additional status register doesn't
matter, since the hw irq -> logical drm_crtc mapping for vblank events is
done in the driver.

Yes I know we should split up the various bits in drm_irq, it's on my todo
;-)

> > > +static void sun4i_drv_disable_vblank(struct drm_device *drm, int pipe)
> > > +{
> > > +	struct sun4i_drv *drv = drm->dev_private;
> > > +	struct sun4i_tcon *tcon = drv->tcon;
> > > +
> > > +	DRM_DEBUG_DRIVER("Disabling VBLANK on pipe %d\n", pipe);
> > > +
> > > +	sun4i_tcon_enable_vblank(tcon, false);
> > > +}
> > > +
> > > +static int sun4i_drv_load(struct drm_device *drm, unsigned long flags)
> > 
> > load/unload callbacks are depracated since fundamentally racy, and we
> > can't fix that due to the pile of legacy dri1 drivers. Please use
> > drm_dev_alloc/register/unregister/unref functions instead, with the
> > load/unload code placed in between to avoid races with userspace seeing
> > the device/driver (e.g. in sysfs) while it's in a partially defunct state.
> > 
> > Relevant kerneldoc has the details, at least in linux-next.
> 
> Ok.
> 
> > > +static void sun4i_backend_layer_atomic_update(struct drm_plane *plane,
> > > +					      struct drm_plane_state *old_state)
> > > +{
> > > +	struct sun4i_layer *layer = plane_to_sun4i_layer(plane);
> > > +	struct sun4i_drv *drv = layer->drv;
> > > +	struct sun4i_backend *backend = drv->backend;
> > > +
> > > +	sun4i_backend_update_layer_coord(backend, layer->id, plane);
> > > +	sun4i_backend_update_layer_formats(backend, layer->id, plane);
> > > +	sun4i_backend_update_layer_buffer(backend, layer->id, plane);
> > > +	sun4i_backend_layer_enable(backend, layer->id, true);
> > > +	sun4i_backend_commit(backend);
> > 
> > Not idea how exactly your hw works, but the call to sun4i_backend_commit
> > probably should be in the crtc->atomic_flush function, to make sure that
> > plane updates across multiple planes are indeed atomic.
> 
> The hardware will not take the register writes into account until a
> bit is set (in the _commit function), so I guess putting it in
> atomic_flush makes sense.

Yeah that's what I suspected, so sun4i_backend_commit definitely needs to
be moved to atomic_flush.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
