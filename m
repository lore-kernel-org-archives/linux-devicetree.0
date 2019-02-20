From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 4/4] drm/panel: Add OSD101T2587-53TS driver
Date: Wed, 20 Feb 2019 13:41:20 +0100
Message-ID: <20190220124120.GB18603@ravnborg.org>
References: <20190215140315.18046-1-peter.ujfalusi@ti.com>
 <20190215140315.18046-5-peter.ujfalusi@ti.com>
 <20190215180759.GA26944@ravnborg.org>
 <2398a647-be4c-15e4-3e28-36382a834dce@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2398a647-be4c-15e4-3e28-36382a834dce@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: thierry.reding@gmail.com, airlied@linux.ie, daniel@ffwll.ch, devicetree@vger.kernel.org, tomi.valkeinen@ti.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

Hi Peter.

Always good to see that feedback input is used.
 
> OK.
> 
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static void osd101t2587_panel_shutdown(struct mipi_dsi_device *dsi)
> >> +{
> >> +	struct osd101t2587_panel *osd101t2587 = mipi_dsi_get_drvdata(dsi);
> >> +
> > Maybe call osd101t2587_panel_unprepare() here to turn off power supply?
> 
> Make sense, in this order:
> 	osd101t2587_panel_disable(&osd101t2587->base);
> 	osd101t2587_panel_unprepare(&osd101t2587->base);
> 
> But should the osd101t2587_panel_remove() do the same thing? or the
> osd101t2587_panel_disable() is redundant in the osd101t2587_panel_remove()?

I do not know the details to answer this.
In other words - I do not know if we can rely on that panel->disbale is always
called when a driver is removed.
Try to read the descriptions and maybe test it.

Other drivers do as far as I recall use disable in the remove function.

	Sam
