From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [PATCH 2/3] drm/rockchip: Add optional support for CRTC gamma LUT
Date: Tue, 18 Jun 2019 17:47:22 -0400
Message-ID: <CAKb7UvgvY0tJDV9A=4+8=iqraziyt8SGF-QrX=M8jz+R+5JC=A@mail.gmail.com>
References: <20190618213406.7667-1-ezequiel@collabora.com> <20190618213406.7667-3-ezequiel@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190618213406.7667-3-ezequiel@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ezequiel Garcia <ezequiel@collabora.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, linux-rockchip@lists.infradead.org, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>, kernel@collabora.com, Sean Paul <seanpaul@chromium.org>, Boris Brezillon <boris.brezillon@collabora.com>, Douglas Anderson <dianders@chromium.org>, Jacopo Mondi <jacopo@jmondi.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 18, 2019 at 5:43 PM Ezequiel Garcia <ezequiel@collabora.com> wrote:
>
> Add an optional CRTC gamma LUT support, and enable it on RK3288.
> This is currently enabled via a separate address resource,
> which needs to be specified in the devicetree.
>
> The address resource is required because on some SoCs, such as
> RK3288, the LUT address is after the MMU address, and the latter
> is supported by a different driver. This prevents the DRM driver
> from requesting an entire register space.
>
> The current implementation works for RGB 10-bit tables, as that
> is what seems to work on RK3288.
>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
> Changes from RFC:
> * Request (an optional) address resource for the LUT.
> * Drop support for RK3399, which doesn't seem to work
>   out of the box and needs more research.
> * Support pass-thru setting when GAMMA_LUT is NULL.
> * Add a check for the gamma size, as suggested by Ilia.
> * Move gamma setting to atomic_commit_tail, as pointed
>   out by Jacopo/Laurent, is the correct way.
> ---
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> index 12ed5265a90b..5b6edbe2673f 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
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
> +               return;
> +
> +       spin_lock(&vop->reg_lock);
> +
> +       if (crtc->state->gamma_lut) {
> +               if (!old_state->gamma_lut || (crtc->state->gamma_lut->base.id !=
> +                                             old_state->gamma_lut->base.id))
> +                       vop_crtc_write_gamma_lut(vop, crtc);
> +       } else {
> +               for (i = 0; i < crtc->gamma_size; i++) {
> +                       u32 word;
> +
> +                       word = (i << 20) | (i << 10) | i;
> +                       writel(word, vop->lut_regs + i * 4);
> +               }

Note - I'm not in any way familiar with the hardware, so take with a
grain of salt --

Could you just leave dsp_lut_en turned off in this case?

Cheers,

  -ilia

> +       }
> +
> +       VOP_REG_SET(vop, common, dsp_lut_en, 1);
> +       vop_cfg_done(vop);
> +       spin_unlock(&vop->reg_lock);
> +}
