From: Sean Paul <sean@poorly.run>
Subject: Re: [DPU =?iso-8859-1?Q?PATCH=A0?= =?iso-8859-1?Q?=5D?= drm/msm/dpu:
 Ignore alpha for XBGR8888 format
Date: Fri, 14 Dec 2018 10:53:28 -0500
Message-ID: <20181214155328.GS154160@art_vandelay>
References: <1543578770-25708-1-git-send-email-jshekhar@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1543578770-25708-1-git-send-email-jshekhar@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jayant Shekhar <jshekhar@codeaurora.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robdclark@gmail.com, seanpaul@chromium.org, hoegsberg@chromium.org, abhinavk@codeaurora.org, jsanka@codeaurora.org, chandanu@codeaurora.org, nganji@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 30, 2018 at 05:22:50PM +0530, Jayant Shekhar wrote:
> Alpha enable in the pixel format will help in
> selecting the blend rule. By keeping alpha enable
> to true we are allowing foreground alpha to blend
> with the layer. If alpha is don't care, then we
> should not allow pixel alpha to be part of blend
> equation.
> 
> Signed-off-by: Jayant Shekhar <jshekhar@codeaurora.org>

Pushed to dpu-staging/for-next.

Thanks for your patch!

Sean

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> index bfcd165..d743e7c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> @@ -216,7 +216,7 @@ struct dpu_media_color_map {
>  	INTERLEAVED_RGB_FMT(XBGR8888,
>  		COLOR_8BIT, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
>  		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		true, 4, 0,
> +		false, 4, 0,
>  		DPU_FETCH_LINEAR, 1),
>  
>  	INTERLEAVED_RGB_FMT(RGBA8888,
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
