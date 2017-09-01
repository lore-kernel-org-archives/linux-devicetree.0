From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 1/2] drm/bridge: Add Cadence DSI driver
Date: Fri, 1 Sep 2017 10:09:55 +0200
Message-ID: <20170901100955.4e7295a0@bbrezillon>
References: <CGME20170831155543epcas2p3003246c8d124c032c513a5fed2792992@epcas2p3.samsung.com>
        <20170831155519.3704-1-boris.brezillon@free-electrons.com>
        <6404fb07-9c42-78bf-f76e-e7aa1abf5549@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6404fb07-9c42-78bf-f76e-e7aa1abf5549-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Cyprian Wronka <cwronka-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Simon Hatliff <hatliff-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, Alan Douglas <adouglas-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Sproul <sproul-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Neil Webb <neilw-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 01 Sep 2017 09:51:59 +0200
Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:

> On 31.08.2017 17:55, Boris Brezillon wrote:
> > Add a driver for Cadence DPI -> DSI bridge.
> >
> > This driver only support a subset of Cadence DSI bridge capabilities.
> >
> > Here is a non-exhaustive list of missing features:
> >  * burst mode
> >  * dynamic configuration of the DPHY based on the
> >  * support for additional input interfaces (SDI input)
> >
> > Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > ---
> > Changes in v3:
> > - replace magic values by real timing calculation. The DPHY PLL clock
> >   is still hardcoded since we don't have a working DPHY block yet, and
> >   this is the piece of HW we need to dynamically configure the PLL
> >   rate based on the display refresh rate and the resolution.
> > - parse DSI devices represented with the OF-graph. This is needed to
> >   support DSI devices controlled through an external bus like I2C or
> >   SPI.
> > - use the DRM panel-bridge infrastructure to simplify the DRM panel
> >   logic
> >
> > Changes in v2:
> > - rebase on v4.12-rc1 and adapt to driver to the drm_bridge API changes
> > - return the correct error when devm_clk_get(sysclk) fails
> > - add missing depends on OF and select DRM_PANEL in the Kconfig entry
> > ---
> >  drivers/gpu/drm/bridge/Kconfig    |    9 +
> >  drivers/gpu/drm/bridge/Makefile   |    1 +
> >  drivers/gpu/drm/bridge/cdns-dsi.c | 1090 +++++++++++++++++++++++++++++++++++++
> >  3 files changed, 1100 insertions(+)
> >  create mode 100644 drivers/gpu/drm/bridge/cdns-dsi.c
> >
> > diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> > index adf9ae0e0b7c..88c324b12e16 100644
> > --- a/drivers/gpu/drm/bridge/Kconfig
> > +++ b/drivers/gpu/drm/bridge/Kconfig
> > @@ -25,6 +25,15 @@ config DRM_ANALOGIX_ANX78XX
> >  	  the HDMI output of an application processor to MyDP
> >  	  or DisplayPort.
> >  
> > +config DRM_CDNS_DSI
> > +	tristate "Cadence DPI/DSI bridge"
> > +	select DRM_KMS_HELPER
> > +	select DRM_MIPI_DSI
> > +	select DRM_PANEL  
> 
> what about:
> select DRM_PANEL_BRIDGE

Oops, indeed. I'll add this dependency.

[...]

> > +
> > +static const struct of_device_id cdns_dsi_of_match[] = {
> > +	{ .compatible = "cdns,dsi-1.3.1" },  
> 
> Do you really need version here? Wouldn't be enough checking ID_REG?
> This is only suggestion, no strong feelings.

You're right, I'll drop the version number.

> 
> The rest looks OK, so with Eric's comments addressed you can add:
> Reviewed-by: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Thanks for your review.

Boris
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
