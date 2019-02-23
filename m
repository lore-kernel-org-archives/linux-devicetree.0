From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 4/4] drm/panel: Add OSD101T2587-53TS driver
Date: Sat, 23 Feb 2019 20:38:05 +0100
Message-ID: <20190223193805.GA21790@ravnborg.org>
References: <20190222131618.20520-1-peter.ujfalusi@ti.com>
 <20190222131618.20520-5-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190222131618.20520-5-peter.ujfalusi@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: thierry.reding@gmail.com, airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, tomi.valkeinen@ti.com
List-Id: devicetree@vger.kernel.org

Hi Peter.

Driver looks to be in good shape now.
With the few comments below addressed you can add my:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

	Sam

On Fri, Feb 22, 2019 at 03:16:18PM +0200, Peter Ujfalusi wrote:
> The panel is similar to OSD101T2045-53TS (which is handled by panel-simple)
> with one big difference: osd101t2587-53ts needs MIPI_DSI_TURN_ON_PERIPHERAL
> message to be sent from the host to be operational and thus can not be
> handled by panel-simple.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---
>  drivers/gpu/drm/panel/Kconfig                 |   6 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../drm/panel/panel-osd-osd101t2587-53ts.c    | 254 ++++++++++++++++++
>  3 files changed, 261 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 3e070153ef21..351661920838 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -122,6 +122,12 @@ config DRM_PANEL_ORISETECH_OTM8009A
>  	  Say Y here if you want to enable support for Orise Technology
>  	  otm8009a 480x800 dsi 2dl panel.
>  
> +config DRM_PANEL_OSD_OSD101T2587_53TS
> +	tristate "OSD OSD101T2587-53TS DSI 1920x1200 video mode panel"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
Please add a help-text

> +
> +static int osd101t2587_panel_unprepare(struct drm_panel *panel)
> +{
> +	struct osd101t2587_panel *osd101t2587 = to_osd101t2587_panel(panel);
> +
> +	if (!osd101t2587->prepared)
> +		return 0;
> +
> +	regulator_disable(osd101t2587->supply);
> +	osd101t2587->prepared = false;
> +
> +	return 0;
> +}
> +
> +static int osd101t2587_panel_prepare(struct drm_panel *panel)
> +{
> +	struct osd101t2587_panel *osd101t2587 = to_osd101t2587_panel(panel);
> +	int ret;
> +
> +	if (osd101t2587->prepared)
> +		return 0;
> +
> +	ret = regulator_enable(osd101t2587->supply);
> +	if (!ret)
> +		osd101t2587->prepared = true;

Logic is wrong here. regulator_enable() will return a negative value on error
and 0 in the good case.
So osd101t2587->prepared is set to true only in the error case, not in the good case.


> +
> +	ret = mipi_dsi_attach(dsi);
> +	if (ret)
> +		drm_panel_remove(&osd101t2587->base);

I do not see panel-simple.c do a drm_panel_remove() if mipi_dsi_attach() fails.
Maybe the driver core will call remove() is probe fails?
Or maybe panel-simple() should call drm_panel_remove()

Keep the above as is - I just wanted to express that this looks different
from the panle-simple() driver.

> +static int osd101t2587_panel_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct osd101t2587_panel *osd101t2587 = mipi_dsi_get_drvdata(dsi);
> +	int ret;
> +
> +	ret = osd101t2587_panel_disable(&osd101t2587->base);
> +	if (ret < 0)
> +		dev_warn(&dsi->dev, "failed to disable panel\n");
This is already warned in lower layers and I think you could
drop the dev_warn().

> +
> +	osd101t2587_panel_unprepare(&osd101t2587->base);
> +
> +	drm_panel_remove(&osd101t2587->base);
> +
> +	ret = mipi_dsi_detach(dsi);
> +	if (ret < 0)
> +		dev_warn(&dsi->dev, "failed to detach from DSI host\n");
Add error code in logging.
