From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 2/2] drm/panel: simple: Add support for Sharp
 LD-D5116Z01B panel
Date: Fri, 5 Jul 2019 19:20:58 +0200
Message-ID: <20190705172058.GA2788@ravnborg.org>
References: <20190705165450.329-1-jeffrey.l.hugo@gmail.com>
 <20190705165755.515-1-jeffrey.l.hugo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190705165755.515-1-jeffrey.l.hugo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc: thierry.reding@gmail.com, airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org, mark.rutland@arm.com, bjorn.andersson@linaro.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Jeffrey.

Patch looks good, but there is a few fields that are not initialized.
Did you forget them, or are they not needed?

On Fri, Jul 05, 2019 at 09:57:55AM -0700, Jeffrey Hugo wrote:
> The Sharp LD-D5116Z01B is a 12.3" eDP panel with a 1920X1280 resolution.
> 
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 5a93c4edf1e4..e6f578667324 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2354,6 +2354,29 @@ static const struct panel_desc samsung_ltn140at29_301 = {
>  	},
>  };
>  
> +static const struct drm_display_mode sharp_ld_d5116z01b_mode = {
> +	.clock = 168480,
> +	.hdisplay = 1920,
> +	.hsync_start = 1920 + 48,
> +	.hsync_end = 1920 + 48 + 32,
> +	.htotal = 1920 + 48 + 32 + 80,
> +	.vdisplay = 1280,
> +	.vsync_start = 1280 + 3,
> +	.vsync_end = 1280 + 3 + 10,
> +	.vtotal = 1280 + 3 + 10 + 57,
> +	.vrefresh = 60,
> +};
No .flags? Is it not needed for an eDP panel?

> +
> +static const struct panel_desc sharp_ld_d5116z01b = {
> +	.modes = &sharp_ld_d5116z01b_mode,
> +	.num_modes = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 260,
> +		.height = 120,
> +	},
> +};
No .bus_format?
No .bus_flags?

	Sam
