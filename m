From: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v4 2/3] drm/rockchip: Add optional support for CRTC gamma
 LUT
Date: Thu, 10 Oct 2019 12:00:59 -0400
Message-ID: <20191010160059.GJ85762@art_vandelay>
References: <20191008230038.24037-1-ezequiel@collabora.com>
 <20191008230038.24037-3-ezequiel@collabora.com>
 <20191009180136.GE85762@art_vandelay>
 <CAAEAJfDP0PsGAoRfGyDyWj7DxgP6nwwwA1_gwLQuVy-fRDa-UA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAAEAJfDP0PsGAoRfGyDyWj7DxgP6nwwwA1_gwLQuVy-fRDa-UA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Sean Paul <sean@poorly.run>, Ezequiel Garcia <ezequiel@collabora.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Douglas Anderson <dianders@chromium.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Boris Brezillon <boris.brezillon@collabora.com>, Sean Paul <seanpaul@chromium.org>, Rob Herring <robh+dt@kernel.org>, kernel@collabora.com
List-Id: devicetree@vger.kernel.org


/snip

> > > +static void vop_crtc_write_gamma_lut(struct vop *vop, struct drm_crtc *crtc)
> > > +{
> > > +     struct drm_color_lut *lut = crtc->state->gamma_lut->data;
> > > +     unsigned int i;
> > > +
> > > +     for (i = 0; i < crtc->gamma_size; i++) {
> > > +             u32 word;
> > > +
> > > +             word = (drm_color_lut_extract(lut[i].red, 10) << 20) |
> > > +                    (drm_color_lut_extract(lut[i].green, 10) << 10) |
> > > +                     drm_color_lut_extract(lut[i].blue, 10);
> > > +             writel(word, vop->lut_regs + i * 4);
> > > +     }
> > > +}
> > > +
> > > +static void vop_crtc_gamma_set(struct vop *vop, struct drm_crtc *crtc,
> > > +                            struct drm_crtc_state *old_crtc_state)
> > > +{
> > > +     unsigned int idle;
> > > +     int ret;
> > > +
> >
> > How about:
> >
> >         if (!vop->lut_regs)
> >                 return;
> >
> > here and then you can remove that condition above the 2 callsites
> >
> 
> Yes, sounds good.
> 
> > > +     /*
> > > +      * In order to write the LUT to the internal memory,
> > > +      * we need to first make sure the dsp_lut_en bit is cleared.
> > > +      */
> > > +     spin_lock(&vop->reg_lock);
> > > +     VOP_REG_SET(vop, common, dsp_lut_en, 0);
> > > +     vop_cfg_done(vop);
> > > +     spin_unlock(&vop->reg_lock);
> > > +
> > > +     /*
> > > +      * If the CRTC is not active, dsp_lut_en will not get cleared.
> > > +      * Apparently we still need to do the above step to for
> > > +      * gamma correction to be disabled.
> > > +      */
> > > +     if (!crtc->state->active)
> > > +             return;
> > > +
> 
> I have realized that the above might no longer be needed,
> given we are now using atomic_enable and atomic_begin.
> 
> Not sure if the CRTC is supposed to clear its GAMMA
> when disabled.
> 

Yep, good catch. Since we use commit_tail_rpm, atomic_begin won't be called in
the disable path.

> > > +     ret = readx_poll_timeout(vop_dsp_lut_is_enable, vop,
> > > +                              idle, !idle, 5, 30 * 1000);
> > > +     if (ret) {
> > > +             DRM_DEV_ERROR(vop->dev, "display LUT RAM enable timeout!\n");
> > > +             return;
> > > +     }
> > > +
> > > +     if (crtc->state->gamma_lut &&
> > > +        (!old_crtc_state->gamma_lut || (crtc->state->gamma_lut->base.id !=
> > > +                                     old_crtc_state->gamma_lut->base.id))) {
> >
> > Silly question, but isn't the second part of this check redundant since you need
> > color_mgmt_changed || active_changed to get into this function?
> >
> > So maybe invert the conditional here and exit early (to save a level of
> > indentation in the block below):
> >
> 
> I took this from malidp_atomic_commit_update_gamma. I _believe_
> the rational for this is that color_mgmt_changed can be set by re-setting
> the gamma property, to the same property. But I admit I haven't
> tested it's the case.
> 
> OTOH, it won't really affect much to re-write the table, if the user
> requested a change.
> 

color_mgmt_changed is based on the output of drm_property_replace_blob() which
should return false if the blob is unchanged. So I don't think that case is
possible. 

Taking this a step further, this check could even be damaging since something
in the atomic check path could set color_mgmt_changed in order to explicitly
trigger a lut write and we'd be skipping it with the id check.


> >         if (!crtc->state->gamma_lut)
> >                 return;
> >
> 
> In any case, inverting the condition makes sense.
> 
> >         spin_lock(&vop->reg_lock);
> >
> >         vop_crtc_write_gamma_lut(vop, crtc);
> >         VOP_REG_SET(vop, common, dsp_lut_en, 1);
> >         vop_cfg_done(vop);
> >
> >         spin_unlock(&vop->reg_lock);
> >
> > > +
> > > +             spin_lock(&vop->reg_lock);
> > > +
> > > +             vop_crtc_write_gamma_lut(vop, crtc);
> > > +             VOP_REG_SET(vop, common, dsp_lut_en, 1);
> > > +             vop_cfg_done(vop);
> > > +
> > > +             spin_unlock(&vop->reg_lock);
> > > +     }
> > > +}

/snip

> > > +static int vop_crtc_atomic_check(struct drm_crtc *crtc,
> > > +                              struct drm_crtc_state *crtc_state)
> > > +{
> > > +     struct vop *vop = to_vop(crtc);
> > > +
> > > +     if (vop->lut_regs && crtc_state->color_mgmt_changed &&
> > > +         crtc_state->gamma_lut) {
> > > +             unsigned int len;
> > > +
> > > +             len = drm_color_lut_size(crtc_state->gamma_lut);
> > > +             if (len != crtc->gamma_size) {
> > > +                     DRM_DEBUG_KMS("Invalid LUT size; got %d, expected %d\n",
> > > +                                   len, crtc->gamma_size);
> > > +                     return -EINVAL;
> > > +             }
> >
> > Overflow is avoided in drm_mode_gamma_set_ioctl(), so I don't think you need
> > this function.
> >
> 
> But that only applies to the legacy path. Isn't this needed to ensure
> a gamma blob
> has the right size?

Yeah, good point, we check the element size in the atomic path, but not the max
size. I haven't looked at enough color lut stuff to have an opinion whether this
check would be useful in a helper function or not, something to consider, I
suppose.

Sean

> 
> Thanks,
> Ezequiel

-- 
Sean Paul, Software Engineer, Google / Chromium OS
