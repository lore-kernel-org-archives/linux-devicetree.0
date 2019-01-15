From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 3/3] drm/panel: simple: add support for PDA
 91-00156-A0 panel
Date: Tue, 15 Jan 2019 23:12:32 +0100
Message-ID: <20190115221232.GA11283@ravnborg.org>
References: <1547458584-29548-1-git-send-email-eugen.hristev@microchip.com>
 <1547458584-29548-4-git-send-email-eugen.hristev@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1547458584-29548-4-git-send-email-eugen.hristev@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Eugen.Hristev@microchip.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, thierry.reding@gmail.com, airlied@linux.ie, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Nicolas.Ferre@microchip.com, Cristian.Birsan@microchip.com
List-Id: devicetree@vger.kernel.org

Hi Eugen.

Patch looks good, but a small improvement proposal.

On Mon, Jan 14, 2019 at 09:43:31AM +0000, Eugen.Hristev@microchip.com wrote:
> From: Eugen Hristev <eugen.hristev@microchip.com>
> 
> PDA 91-00156-A0 5.0 is a 5.0" WVGA TFT LCD panel.
> This panel with backlight is found in PDA 5" LCD screen (TM5000 series or
> AC320005-5).
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 9c69e73..61361ba 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2008,6 +2008,30 @@ static const struct panel_desc ortustech_com43h4m85ulc = {
>  	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_POSEDGE,
>  };
>  
> +static const struct drm_display_mode pda_91_00156_a0_mode = {
> +	.clock = 33300,
> +	.hdisplay = 800,
> +	.hsync_start = 800 + 1,
> +	.hsync_end = 800 + 1 + 64,
> +	.htotal = 800 + 1 + 64 + 64,
> +	.vdisplay = 480,
> +	.vsync_start = 480 + 1,
> +	.vsync_end = 480 + 1 + 23,
> +	.vtotal = 480 + 1 + 23 + 22,
> +	.vrefresh = 60,
> +};
.flags are omitted, as it is for many panels in simple-panel.
drm_modes.h do not document any default, so we must assume default equals no flags.

I would expect two of these as a minimum:
DRM_MODE_FLAG_PHSYNC: horizontal sync is active high.
DRM_MODE_FLAG_NHSYNC: horizontal sync is active low.
DRM_MODE_FLAG_PVSYNC: vertical sync is active high.
DRM_MODE_FLAG_NVSYNC: vertical sync is active low.

But it obviously works for a lot of panel, so one
may say why bother with it.

> +
> +static const struct panel_desc pda_91_00156_a0  = {
> +	.modes = &pda_91_00156_a0_mode,
> +	.num_modes = 1,
> +	.size = {
> +		.width = 152,
> +		.height = 91,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +};
.bus_format is specified - good!

Consider if .bus_flags needs to be specified.
(More or less same argumentation like for .flags above).

I could not find any data-sheet on the panel,
so I could not check if it is OK that all delays are 0.

So to recap - things looks fine, but consider to be more explicit
in .flags, bus_flags, and check if it is OK that all timing parameters are 0.

	Sam
