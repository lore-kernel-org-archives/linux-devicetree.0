From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/2] drm/bridge: Add Cadence DSI driver
Date: Tue, 6 Jun 2017 12:20:53 +0200
Message-ID: <20170606122053.604f9582@bbrezillon>
References: <1496405096-18275-1-git-send-email-boris.brezillon@free-electrons.com>
        <29776d56-b6ae-9f92-0b94-8c55b46169fd@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <29776d56-b6ae-9f92-0b94-8c55b46169fd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Neil Webb <neilw-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Richard Sproul <sproul-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Simon Hatliff <hatliff-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Cyprian Wronka <cwronka-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Alan Douglas <adouglas-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Archit,

On Sun, 4 Jun 2017 00:20:06 +0530
Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:


> > +
> > +#define DPHY_CFG0			0x1b0
> > +#define DPHY_C_RSTB			BIT(20)
> > +#define DPHY_D_RSTB(x)			((x) << 16)
> > +#define DPHY_TIF_FORCE_WRITE		BIT(12)
> > +#define DPHY_PLL_PDN			BIT(10)
> > +#define DPHY_CMN_PDN			BIT(9)
> > +#define DPHY_C_PDN			BIT(8)
> > +#define DPHY_D_PDN(x)			((x) << 4)
> > +#define DPHY_PLL_PSO			BIT(1)
> > +#define DPHY_CMN_PSO			BIT(0)
> > +
> > +#define DPHY_CFG1			0x1b4
> > +#define PDHY_PLL_OPDIV(x)		((x) << 20)
> > +#define PDHY_PLL_IPDIV(x)		((x) << 12)
> > +#define PDHY_PLL_FBDIV(x)		(x)
> > +
> > +#define DPHY_PLL_TM_LO			0x1b8
> > +#define DPHY_PLL_TM_MID			0x1bc
> > +#define DPHY_PLL_TM_HI			0x1c0
> > +
> > +#define DPHY_STATUS			0x1c4
> > +#define PPI_D_RX_ULPS_ESC(x)		((x) >> 12)
> > +#define PPI_C_TX_READY_HS		BIT(8)
> > +#define PPI_PLL_LOCK			BIT(7)
> > +#define PPI_PLL_COARSE			BIT(6)
> > +#define PPI_PLL_COARSE_CODE(x)		((x) & GENMASK(5, 0))
> > +
> > +#define DPHY_BIST			0x1c8
> > +#define PSO_BYPASS_CTX_EN		BIT(12)
> > +#define PSO_BYPASS_TX_EN(l)		BIT(8 + (l))
> > +#define BIST_CTX_EN			BIT(4)
> > +#define BIST_TX_EN(l)			BIT(l)
> > +  
> 
> Do the above DPHY registers actually configure the PHY used with the
> controller, or do we need to configure any additional register outside
> of this block to get things working?

The DPHY has a separate I/O mem range with its own interface. I didn't
provide support for this part yet because the interface is not stable
yet.

> 
> I ask because they aren't used in the code below, and the DT binding
> for this device specifies the PHY as a separate device. What's the
> plan in the future for PHY?

The short-term plan is to add support for this DPHY in the cdns-dsi
driver. The driver will just retrieve the I/O mem range and interrupt
attached to the cdns DPHY block by following the phandle and using
of helpers to do the conversion, and then use these resources
internally.

The mid/long-term plan is to add a dphy framework (on top of the PHY
framework) to let dphy providers expose their features in a generic
manner.
There are 2 pros to this generic DPHY framework/layer:
- you could possibly use DPHY and DSI blocks provided by 2 different
  vendors (not sure how feasible this is in practice)
- CSI can also use DPHY as its PHY layer, so DPHY drivers could be
  shared between V4L and DRM drivers

Note that I can't promise the mid/long-term goals are achievable,
because my knowledge on DPHY is quite limited, but designing the DT
bindings to handle this use case is really important, because of the DT
stable ABI thing. 


> > +
> > +static int cdns_dsi_bridge_attach(struct drm_bridge *bridge)
> > +{
> > +	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
> > +	struct cdns_dsi_output *output = input->dsi->output;
> > +	int ret;
> > +
> > +	if (!drm_core_check_feature(bridge->dev, DRIVER_ATOMIC)) {
> > +		dev_err(input->dsi->base.dev,
> > +			"cdns-dsi driver is only compatible with DRM devices supporting atomic updates");
> > +		return -ENOTSUPP;
> > +	}
> > +
> > +	switch (output->type) {
> > +	case CDNS_DSI_PANEL:
> > +		ret = cdns_dsi_output_attach_panel(output);
> > +		break;
> > +
> > +	case CDNS_DSI_BRIDGE:
> > +		ret = drm_bridge_attach(bridge->encoder, output->bridge,
> > +					bridge);
> > +		break;  
> 
> Could you have a look at Eric's dsi-panel-bridge patch-set? I think it
> should simplify things for this driver too.

Yep, that was planned. Was just waiting for this feature to reach
drm-misc-next (which seems to be the case ;-)).

> 
> > +
> > +	default:
> > +		ret = -ENOTSUPP;
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static bool cdns_dsi_bridge_mode_fixup(struct drm_bridge *bridge,
> > +				       const struct drm_display_mode *mode,
> > +				       struct drm_display_mode *adj)
> > +{
> > +	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
> > +	int bpp;
> > +
> > +	/*
> > +	 * VFP_DSI should be less than VFP_DPI and VFP_DSI should be at
> > +	 * least 1.
> > +	 */
> > +	if (adj->crtc_vtotal - adj->crtc_vsync_end < 2)
> > +		return false;
> > +
> > +	/* VSA_DSI = VSA_DPI and must be at least 2. */
> > +	if (adj->crtc_vsync_end - adj->crtc_vsync_start < 2)
> > +		return false;
> > +
> > +	/* HACT must be a 32-bits aligned. */
> > +	bpp = mipi_dsi_pixel_format_to_bpp(input->dsi->output->dev->format);
> > +	if ((adj->hdisplay * bpp) % 32)
> > +		return false;
> > +
> > +	return true;  
> 
> We could consider using the new mode_valid helpers that Jose recently
> added. This might be better as bridge mode_valid() op.

Ditto. It was on my TODO list. I'll address that in my v3.

> 
> 
> > +}

[...]

> > +
> > +static int cdns_dsi_attach(struct mipi_dsi_host *host,
> > +			   struct mipi_dsi_device *dev)
> > +{
> > +	struct cdns_dsi *dsi = to_cdns_dsi(host);
> > +	struct cdns_dsi_output *output;
> > +	int ret;
> > +
> > +	/* TODO: support multi-devices setup? */
> > +	if (dsi->output)
> > +		return -EBUSY;
> > +
> > +	output = devm_kzalloc(host->dev, sizeof(*output), GFP_KERNEL);
> > +	if (!output)
> > +		return -ENOMEM;
> > +
> > +	output->dev = dev;
> > +
> > +	output->panel = of_drm_find_panel(dev->dev.of_node);
> > +	if (output->panel) {
> > +		output->type = CDNS_DSI_PANEL;
> > +	} else {
> > +		output->bridge = of_drm_find_bridge(dev->dev.of_node);
> > +		if (!output->bridge) {
> > +			dev_err(host->dev,
> > +				"%s is neither a panel nor a bridge",
> > +				dev->name);
> > +			return -ENOTSUPP;
> > +		}
> > +
> > +		output->type = CDNS_DSI_BRIDGE;
> > +		dsi->input->bridge.next = output->bridge;
> > +	}
> > +
> > +	dsi->output = output;
> > +
> > +	ret = cdns_dsi_init_link(dsi);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* FIXME: should be moved somewhere else. */
> > +	return drm_bridge_add(&dsi->input->bridge);  
> 
> In the driver probe?

I assumed that not everything was in place at probe time, but maybe I
was wrong. This should be good, as long as all DSI devices have been
instantiated and attached after calling mipi_dsi_host_register(). I
guess this is something we can ensure by using the proposed bindings
(with all DSI output ports described in the DT) and returning
EPROBE_DEFER if at least one of the DSI device is missing at probe time.

> 
> > +}
> > +

[...]

> > +
> > +static int cdns_dsi_drm_probe(struct platform_device *pdev)  
> 
> I wanted to bring up the point I made in the DT patch too: Is it
> more suitable to implement this is a library with bind/unbind, and
> probe/remove helpers like it's done for dw-hdmi. Could there be SoCs
> that integrate this IP but require some additional wrapper
> configurations to make things work?

As answered in my previous reply, yes it can be done this way, but is it
worth introducing this infrastructure right now? Note that we can still
overload the compatible to support SoC specific integration of this IP
directly in this driver.
For the rest, it should be pretty transparent to connect a DPI encoder
to this DSI bridge.

Right now, we have an easy way to connect a DPI encoder to this DSI
bridge. The only thing that could be missing is the pixel format
negotiation (the format transiting on the DPI bus), and this is a
runtime thing, so maybe we can extend the drm_bridge interface to allow
such negotiation.

Note that this is a need I had on atmel platforms as well, because the
DPI bus can be connected to several devices (panels or external
bridges), and, depending on the device we are enabling in the pipeline,
we have to reconfigure the DPI encoder to send the pixel in the
appropriate format.

> 
> Looks good otherwise.

Thanks for your review.

Boris
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
