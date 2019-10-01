From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v3 5/5] RFC: drm/atomic-helper: Reapply color
 transformation after resume
Date: Tue, 1 Oct 2019 17:55:56 +0300
Message-ID: <20191001145556.GP1208@intel.com>
References: <20190930222802.32088-1-ezequiel@collabora.com>
 <20190930222802.32088-6-ezequiel@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190930222802.32088-6-ezequiel@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ezequiel Garcia <ezequiel@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Douglas Anderson <dianders@chromium.org>, linux-rockchip@lists.infradead.org, Boris Brezillon <boris.brezillon@collabora.com>, Sean Paul <seanpaul@chromium.org>, kernel@collabora.com
List-Id: devicetree@vger.kernel.org

On Mon, Sep 30, 2019 at 07:28:02PM -0300, Ezequiel Garcia wrote:
> Some platforms are not able to maintain the color transformation
> state after a system suspend/resume cycle.
> 
> Set the colog_mgmt_changed flag so that CMM on the CRTCs in
> the suspend state are reapplied after system resume.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
> This is an RFC, and it's mostly based on Jacopo Mondi's work https://lkml.org/lkml/2019/9/6/498.
> 
> Changes from v2:
> * New patch.
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index e41db0f202ca..518488125575 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -3234,8 +3234,20 @@ int drm_atomic_helper_resume(struct drm_device *dev,
>  			     struct drm_atomic_state *state)
>  {
>  	struct drm_modeset_acquire_ctx ctx;
> +	struct drm_crtc_state *crtc_state;
> +	struct drm_crtc *crtc;
> +	unsigned int i;
>  	int err;
>  
> +	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
> +		/*
> +		 * Force re-enablement of CMM after system resume if any
> +		 * of the DRM color transformation properties was set in
> +		 * the state saved at system suspend time.
> +		 */
> +		if (crtc_state->gamma_lut)

You say "any" but you check the one?

> +			crtc_state->color_mgmt_changed = true;

But I'm not convinced this is the best way to go about it. 
I would generally expect that you repgrogram everything
when doing a full modeset since the state was possibly
lost while the crtc was disabled.

> +	}
>  	drm_mode_config_reset(dev);
>  
>  	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, err);
> -- 
> 2.22.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Ville Syrjälä
Intel
