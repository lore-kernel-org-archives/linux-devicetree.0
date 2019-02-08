From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 1/2] drm/omap: panel-tpo-td028ttec1: add backlight
 support
Date: Fri, 8 Feb 2019 03:05:42 +0200
Message-ID: <20190208010542.GI10386@pendragon.ideasonboard.com>
References: <20190205063813.14873-1-andreas@kemnade.info>
 <20190205063813.14873-2-andreas@kemnade.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190205063813.14873-2-andreas@kemnade.info>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Kemnade <andreas@kemnade.info>
Cc: tomi.valkeinen@ti.com, airlied@linux.ie, daniel@ffwll.ch, sre@kernel.org, dri-devel@lists.freedesktop.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org
List-Id: devicetree@vger.kernel.org

Hi Andreas,

Thank you for the patch.

On Tue, Feb 05, 2019 at 07:38:12AM +0100, Andreas Kemnade wrote:
> This panel has a backlight, so fetch it from devicetree using the
> corresponding property as documented in panel-common.txt. It is
> implemented the same way as in panel-dpi.c
> This ensures the backlight is also disabled when the display is
> turned off like when doing xset dpms force off.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Changes in v2: 
>  - do not reorder initialisation
>  - fix commit message
> 
>  drivers/gpu/drm/omapdrm/displays/panel-tpo-td028ttec1.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/omapdrm/displays/panel-tpo-td028ttec1.c b/drivers/gpu/drm/omapdrm/displays/panel-tpo-td028ttec1.c
> index 7ddc8c574a61..1db8740f3c21 100644
> --- a/drivers/gpu/drm/omapdrm/displays/panel-tpo-td028ttec1.c
> +++ b/drivers/gpu/drm/omapdrm/displays/panel-tpo-td028ttec1.c
> @@ -35,6 +35,8 @@ struct panel_drv_data {
>  
>  	struct videomode vm;
>  
> +	struct backlight_device *backlight;
> +
>  	struct spi_device *spi_dev;
>  };
>  
> @@ -268,6 +270,8 @@ static int td028ttec1_panel_enable(struct omap_dss_device *dssdev)
>  
>  	r |= jbt_ret_write_0(ddata, JBT_REG_DISPLAY_ON);
>  
> +	backlight_enable(ddata->backlight);
> +
>  	dssdev->state = OMAP_DSS_DISPLAY_ACTIVE;
>  
>  transfer_err:
> @@ -283,6 +287,8 @@ static void td028ttec1_panel_disable(struct omap_dss_device *dssdev)
>  	if (!omapdss_device_is_enabled(dssdev))
>  		return;
>  
> +	backlight_disable(ddata->backlight);
> +
>  	dev_dbg(dssdev->dev, "td028ttec1_panel_disable()\n");
>  
>  	jbt_ret_write_0(ddata, JBT_REG_DISPLAY_OFF);
> @@ -334,6 +340,10 @@ static int td028ttec1_panel_probe(struct spi_device *spi)
>  	if (ddata == NULL)
>  		return -ENOMEM;
>  
> +	ddata->backlight = devm_of_find_backlight(&spi->dev);
> +	if (IS_ERR(ddata->backlight))
> +		return PTR_ERR(ddata->backlight);
> +
>  	dev_set_drvdata(&spi->dev, ddata);
>  
>  	ddata->spi_dev = spi;

-- 
Regards,

Laurent Pinchart
