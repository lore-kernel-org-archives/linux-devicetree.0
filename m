From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 2/3] drm/rockchip: Add optional support for CRTC gamma LUT
Date: Thu, 20 Jun 2019 10:25:25 -0700
Message-ID: <CAD=FV=XoKNA4aW2LT7g8K2t+ABwgt=QJGAyiet1-Gyz3CgWmvg@mail.gmail.com>
References: <20190618213406.7667-1-ezequiel@collabora.com> <20190618213406.7667-3-ezequiel@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190618213406.7667-3-ezequiel@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ezequiel Garcia <ezequiel@collabora.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>, kernel@collabora.com, Sean Paul <seanpaul@chromium.org>, Boris Brezillon <boris.brezillon@collabora.com>, Jacopo Mondi <jacopo@jmondi.org>, Ilia Mirkin <imirkin@alum.mit.edu>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, Jun 18, 2019 at 2:43 PM Ezequiel Garcia <ezequiel@collabora.com> wrote:
>
> +static void vop_crtc_gamma_set(struct vop *vop, struct drm_crtc *crtc,
> +                              struct drm_crtc_state *old_state)
> +{
> +       int idle, ret, i;
> +
> +       spin_lock(&vop->reg_lock);
> +       VOP_REG_SET(vop, common, dsp_lut_en, 0);
> +       vop_cfg_done(vop);
> +       spin_unlock(&vop->reg_lock);
> +
> +       ret = readx_poll_timeout(vop_dsp_lut_is_enable, vop,
> +                          idle, !idle, 5, 30 * 1000);
> +       if (ret)

Worth an error message?


> @@ -1205,6 +1294,7 @@ static void vop_crtc_atomic_flush(struct drm_crtc *crtc,
>
>  static const struct drm_crtc_helper_funcs vop_crtc_helper_funcs = {
>         .mode_fixup = vop_crtc_mode_fixup,
> +       .atomic_check = vop_crtc_atomic_check,

At first I was worried that there was a bug here since in the context
of dw_hdmi (an encoder) adding ".atomic_check" caused ".mode_fixup" to
stop getting called as per mode_fixup() in
"drivers/gpu/drm/drm_atomic_helper.c".

...but it seems like it's OK for CRTCs, so I think we're fine.


> @@ -1323,6 +1413,7 @@ static const struct drm_crtc_funcs vop_crtc_funcs = {
>         .disable_vblank = vop_crtc_disable_vblank,
>         .set_crc_source = vop_crtc_set_crc_source,
>         .verify_crc_source = vop_crtc_verify_crc_source,
> +       .gamma_set = drm_atomic_helper_legacy_gamma_set,

Are there any issues in adding this ".gamma_set" property even though
we may or may not actually have the ability to set the gamma
(depending on whether or not the LUT register range was provided in
the device tree)?  I am a DRM noob but
drm_atomic_helper_legacy_gamma_set() is not a trivial little function
and now we'll be running it in some cases where we don't actually have
gamma.

I also notice that there's at least one bit of code that seems to
check if ".gamma_set" is NULL.  ...and if it is, it'll return -ENOSYS
right away.  Do we still properly return -ENOSYS on devices that don't
have the register range?

It seems like the absolute safest would be to have two copies of this
struct: one used for VOPs that have the range and one for VOPs that
don't.

...but possibly I'm just paranoid and as I've said I'm a clueless
noob.  If someone says it's fine to always provide the .gamma_set
property that's fine too.


>  static void vop_fb_unref_worker(struct drm_flip_work *work, void *val)
> @@ -1480,6 +1571,10 @@ static int vop_create_crtc(struct vop *vop)
>                 goto err_cleanup_planes;
>
>         drm_crtc_helper_add(crtc, &vop_crtc_helper_funcs);
> +       if (vop_data->lut_size) {
> +               drm_mode_crtc_set_gamma_size(crtc, vop_data->lut_size);
> +               drm_crtc_enable_color_mgmt(crtc, 0, false, vop_data->lut_size);

Should we only do the above calls if we successfully mapped the resources?


> @@ -1776,6 +1871,17 @@ static int vop_bind(struct device *dev, struct device *master, void *data)
>         if (IS_ERR(vop->regs))
>                 return PTR_ERR(vop->regs);
>
> +       res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "lut");

As per comments in the bindings, shouldn't use the name "lut" but
should just pick resource #1.
