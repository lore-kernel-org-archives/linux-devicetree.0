From: Sean Paul <sean@poorly.run>
Subject: Re: [Freedreno] [v1] drm/msm/dpu: Cleanup dpu plane interface
Date: Tue, 22 Jan 2019 15:11:44 -0500
Message-ID: <20190122201144.GK114153@art_vandelay>
References: <1545139238-8395-1-git-send-email-jshekhar@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1545139238-8395-1-git-send-email-jshekhar@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jayant Shekhar <jshekhar@codeaurora.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, abhinavk@codeaurora.org, robdclark@gmail.com, nganji@codeaurora.org, seanpaul@chromium.org, hoegsberg@chromium.org, jsanka@codeaurora.org, chandanu@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 18, 2018 at 06:50:38PM +0530, Jayant Shekhar wrote:
> Remove unused functions from dpu plane interface
> and unused variables from dpu plane state structure.
> 
> Signed-off-by: Jayant Shekhar <jshekhar@codeaurora.org>

Applied to dpu-staging, thanks!

Sean
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h | 27 ---------------------------
>  1 file changed, 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> index 7fed0b6..0e6063a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> @@ -28,23 +28,18 @@
>  /**
>   * struct dpu_plane_state: Define dpu extension of drm plane state object
>   * @base:	base drm plane state object
> - * @property_state: Local storage for msm_prop properties
> - * @property_values:	cached plane property values
>   * @aspace:	pointer to address space for input/output buffers
> - * @input_fence:	dereferenced input fence pointer
>   * @stage:	assigned by crtc blender
>   * @multirect_index: index of the rectangle of SSPP
>   * @multirect_mode: parallel or time multiplex multirect mode
>   * @pending:	whether the current update is still pending
>   * @scaler3_cfg: configuration data for scaler3
>   * @pixel_ext: configuration data for pixel extensions
> - * @scaler_check_state: indicates status of user provided pixel extension data
>   * @cdp_cfg:	CDP configuration
>   */
>  struct dpu_plane_state {
>  	struct drm_plane_state base;
>  	struct msm_gem_address_space *aspace;
> -	void *input_fence;
>  	enum dpu_stage stage;
>  	uint32_t multirect_index;
>  	uint32_t multirect_mode;
> @@ -107,12 +102,6 @@ void dpu_plane_get_ctl_flush(struct drm_plane *plane, struct dpu_hw_ctl *ctl,
>  void dpu_plane_flush(struct drm_plane *plane);
>  
>  /**
> - * dpu_plane_kickoff - final plane operations before commit kickoff
> - * @plane: Pointer to drm plane structure
> - */
> -void dpu_plane_kickoff(struct drm_plane *plane);
> -
> -/**
>   * dpu_plane_set_error: enable/disable error condition
>   * @plane: pointer to drm_plane structure
>   */
> @@ -147,14 +136,6 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
>  void dpu_plane_clear_multirect(const struct drm_plane_state *drm_state);
>  
>  /**
> - * dpu_plane_wait_input_fence - wait for input fence object
> - * @plane:   Pointer to DRM plane object
> - * @wait_ms: Wait timeout value
> - * Returns: Zero on success
> - */
> -int dpu_plane_wait_input_fence(struct drm_plane *plane, uint32_t wait_ms);
> -
> -/**
>   * dpu_plane_color_fill - enables color fill on plane
>   * @plane:  Pointer to DRM plane object
>   * @color:  RGB fill color value, [23..16] Blue, [15..8] Green, [7..0] Red
> @@ -164,12 +145,4 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
>  int dpu_plane_color_fill(struct drm_plane *plane,
>  		uint32_t color, uint32_t alpha);
>  
> -/**
> - * dpu_plane_set_revalidate - sets revalidate flag which forces a full
> - *	validation of the plane properties in the next atomic check
> - * @plane: Pointer to DRM plane object
> - * @enable: Boolean to set/unset the flag
> - */
> -void dpu_plane_set_revalidate(struct drm_plane *plane, bool enable);
> -
>  #endif /* _DPU_PLANE_H_ */
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno

-- 
Sean Paul, Software Engineer, Google / Chromium OS
