From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH v3 1/2] drm/bridge: Add Cadence DSI driver
Date: Thu, 31 Aug 2017 10:03:23 -0700
Message-ID: <87k21jzn38.fsf@anholt.net>
References: <20170831155519.3704-1-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170831155519.3704-1-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Cyprian Wronka <cwronka-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Simon Hatliff <hatliff-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, Alan Douglas <adouglas-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Sproul <sproul-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Neil Webb <neilw-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> writes:

> Add a driver for Cadence DPI -> DSI bridge.
>
> This driver only support a subset of Cadence DSI bridge capabilities.
>
> Here is a non-exhaustive list of missing features:
>  * burst mode
>  * dynamic configuration of the DPHY based on the
>  * support for additional input interfaces (SDI input)
>
> Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
> Changes in v3:
> - replace magic values by real timing calculation. The DPHY PLL clock
>   is still hardcoded since we don't have a working DPHY block yet, and
>   this is the piece of HW we need to dynamically configure the PLL
>   rate based on the display refresh rate and the resolution.
> - parse DSI devices represented with the OF-graph. This is needed to
>   support DSI devices controlled through an external bus like I2C or
>   SPI.
> - use the DRM panel-bridge infrastructure to simplify the DRM panel
>   logic

Just a few comments from me.  With the few straightforward nitpicks
fixed, it gets my:

Acked-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>

> +static enum drm_mode_status
> +cdns_dsi_bridge_mode_valid(struct drm_bridge *bridge,
> +			   const struct drm_display_mode *mode)
> +{
> +	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
> +	struct cdns_dsi *dsi = input_to_dsi(input);
> +	struct cdns_dsi_output *output = &dsi->output;
> +	int bpp;
> +
> +	/*
> +	 * VFP_DSI should be less than VFP_DPI and VFP_DSI should be at
> +	 * least 1.
> +	 */
> +	if (mode->vtotal - mode->vsync_end < 2)
> +		return MODE_V_ILLEGAL;
> +
> +	/* VSA_DSI = VSA_DPI and must be at least 2. */
> +	if (mode->vsync_end - mode->vsync_start < 2)
> +		return MODE_V_ILLEGAL;
> +
> +	/* HACT must be a 32-bits aligned. */

s/a /

> +	bpp = mipi_dsi_pixel_format_to_bpp(output->dev->format);
> +	if ((mode->hdisplay * bpp) % 32)
> +		return MODE_H_ILLEGAL;
> +
> +	return MODE_OK;
> +}


> +static void cdns_dsi_bridge_enable(struct drm_bridge *bridge)
> +{
> +	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
> +	struct cdns_dsi *dsi = input_to_dsi(input);
> +	struct cdns_dsi_output *output = &dsi->output;
> +	u32 hsize0, hsa, hline, tmp, reg_wakeup, div;
> +	unsigned long dphy_pll_period, tx_byte_period;
> +	struct drm_display_mode *mode;
> +	int bpp, nlanes;
> +
> +	mode = &bridge->encoder->crtc->state->adjusted_mode;
> +	bpp = mipi_dsi_pixel_format_to_bpp(output->dev->format);
> +	nlanes = output->dev->lanes;
> +
> +	if (output->dev->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
> +		tmp = mode->crtc_htotal - mode->crtc_hsync_end;
> +	else
> +		tmp = mode->crtc_htotal - mode->crtc_hsync_start;
> +	tmp = (tmp * bpp) / 8;
> +	tmp = tmp < DSI_HBP_FRAME_OVERHEAD ? 0 : tmp - DSI_HBP_FRAME_OVERHEAD;
> +	hsize0 = HBP_LEN(tmp);
> +
> +	tmp = mode->crtc_hsync_start - mode->crtc_hdisplay;
> +	tmp = (tmp * bpp) / 8;

How is this scaling supposed to work when you have RGB666_PACKED (bpp =
18)?  It seems like there would be bad rounding issues.

> +	tmp = tmp < DSI_HFP_FRAME_OVERHEAD ? 0 : tmp - DSI_HFP_FRAME_OVERHEAD;
> +	hsize0 |= HFP_LEN(tmp);
> +
> +	if (output->dev->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
> +		tmp = mode->crtc_hsync_end - mode->crtc_hsync_start;
> +	else
> +		tmp = 0;
> +	tmp = (tmp * 8) / bpp;

This scaling is suspiciously different from the others around it.  Did
you mean this?

> +	tmp = tmp < DSI_HSA_FRAME_OVERHEAD ? 0 : tmp - DSI_HSA_FRAME_OVERHEAD;
> +	hsa = tmp;
> +	hsize0 |= HSA_LEN(tmp);
> +
> +	writel(hsize0, dsi->regs + VID_HSIZE1);
> +	writel((mode->crtc_hdisplay * bpp) / 8, dsi->regs + VID_HSIZE2);
> +
> +	writel(VBP_LEN(mode->crtc_vtotal - mode->crtc_vsync_end - 1) |
> +	       VFP_LEN(mode->crtc_vsync_start - mode->crtc_vdisplay) |
> +	       VSA_LEN(mode->crtc_vsync_end - mode->crtc_vsync_start),
> +	       dsi->regs + VID_VSIZE1);
> +	writel(mode->crtc_vdisplay, dsi->regs + VID_VSIZE2);
> +
> +	hline = (mode->crtc_htotal * bpp) / 8;
> +	tmp = hline - DSI_HSA_FRAME_OVERHEAD;
> +	if (output->dev->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
> +		tmp -= hsa + DSI_HSA_FRAME_OVERHEAD;
> +
> +	writel(BLK_LINE_PULSE_PKT_LEN(tmp), dsi->regs + VID_BLKSIZE2);
> +	if (output->dev->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
> +		writel(MAX_LINE_LIMIT(tmp - DSI_NULL_FRAME_OVERHEAD),
> +		       dsi->regs + VID_VCA_SETTING2);
> +
> +	tmp = hline -
> +	      (DSI_HSS_VSS_VSE_FRAME_OVERHEAD + DSI_BLANKING_FRAME_OVERHEAD);
> +	writel(BLK_LINE_EVENT_PKT_LEN(tmp), dsi->regs + VID_BLKSIZE1);
> +	if (!(output->dev->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE))
> +		writel(MAX_LINE_LIMIT(tmp - DSI_NULL_FRAME_OVERHEAD),
> +		       dsi->regs + VID_VCA_SETTING2);
> +
> +	tmp = DIV_ROUND_UP(hline, nlanes) - DIV_ROUND_UP(hsa, nlanes);
> +
> +	if (!(output->dev->mode_flags & MIPI_DSI_MODE_EOT_PACKET))
> +		tmp -= DIV_ROUND_UP(DSI_EOT_PKT_SIZE, nlanes);
> +
> +	dphy_pll_period = NSEC_PER_SEC / DPHY_PLL_RATE_HZ;
> +	tx_byte_period = (dphy_pll_period * 2) / 8;
> +	reg_wakeup = REG_WAKEUP_TIME_NS / dphy_pll_period;
> +	writel(REG_WAKEUP_TIME(reg_wakeup) | REG_LINE_DURATION(tmp),
> +	       dsi->regs + VID_DPHY_TIME);
> +
> +	/*
> +	 * HSTX and LPRX timeouts are both expressed in TX byte clk cycles and
> +	 * both should be set to at least the time it takes to transmit a
> +	 * frame.
> +	 */
> +	tmp = NSEC_PER_SEC / mode->vrefresh;

vrefresh is a really rough approximation of the refresh.  You may need
some padding so that HSTX_TIMEOUT doesn't end up being just a little
short of a frame.  (Also, modes that userspace creates likely don't have
the field initialized at all, so you'd need drm_mode_vrefresh() anyway)

> +	tmp /= tx_byte_period;
> +
> +	for (div = 0; div <= CLK_DIV_MAX; div++) {
> +		if (tmp <= HSTX_TIMEOUT_MAX)
> +			break;
> +
> +		tmp >>= 1;
> +	}
> +
> +	if (tmp > HSTX_TIMEOUT_MAX)
> +		tmp = HSTX_TIMEOUT_MAX;
> +
> +	writel(CLK_DIV(div) | HSTX_TIMEOUT(tmp),
> +	       dsi->regs + MCTL_DPHY_TIMEOUT1);
> +
> +	writel(LPRX_TIMEOUT(tmp), dsi->regs + MCTL_DPHY_TIMEOUT2);
> +
> +	if (output->dev->mode_flags & MIPI_DSI_MODE_VIDEO) {
> +		switch (output->dev->format) {
> +		case MIPI_DSI_FMT_RGB888:
> +			tmp = VID_PIXEL_MODE_RGB888 |
> +			      VID_DATATYPE(MIPI_DSI_PACKED_PIXEL_STREAM_24);
> +			break;
> +
> +		case MIPI_DSI_FMT_RGB666:
> +			tmp = VID_PIXEL_MODE_RGB666 |
> +			      VID_DATATYPE(MIPI_DSI_PIXEL_STREAM_3BYTE_18);
> +			break;
> +
> +		case MIPI_DSI_FMT_RGB666_PACKED:
> +			tmp = VID_PIXEL_MODE_RGB666_PACKED |
> +			      VID_DATATYPE(MIPI_DSI_PACKED_PIXEL_STREAM_18);
> +			break;
> +
> +		case MIPI_DSI_FMT_RGB565:
> +			tmp = VID_PIXEL_MODE_RGB666_PACKED |

I think you mean VID_PIXEL_MODE_RGB565?

> +			      VID_DATATYPE(MIPI_DSI_PACKED_PIXEL_STREAM_16);
> +			break;
> +
> +		default:
> +			dev_err(dsi->base.dev, "Unsupported DSI format\n");
> +			return;
> +		}

> +static irqreturn_t cdns_dsi_interrupt(int irq, void *data)
> +{
> +	struct cdns_dsi *dsi = data;
> +	irqreturn_t ret = IRQ_NONE;
> +	u32 flag, ctl;
> +
> +	flag = readl(dsi->regs + DIRECT_CMD_STS_FLAG);
> +	if (flag) {
> +		ctl = readl(dsi->regs + DIRECT_CMD_STS_CTL);
> +		ctl &= ~flag;
> +		writel(ctl, dsi->regs + DIRECT_CMD_STS_CTL);

Are you meant to just write flag to DIRECT_CMD_STS_CLEAR, maybe?
Needing a RMW here seems odd.

> +		complete(&dsi->direct_cmd_comp);
> +		ret = IRQ_HANDLED;
> +	}
> +
> +	return ret;
> +}

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlmoQVsACgkQtdYpNtH8
nujHLw/7Bin54oQs9jZEh5JayIBssgFDtNdQyWpgFGMArT7xgYugDOd3vVb4I/fk
KtMsuhIUioGBGAKdLkx9DamlcgTIQYESN8adyNAu0UajGHpcM6D4T0Z+zP3tWxdH
LWq+ovID/NEb2zp3JwXZcxColaxBR2ogdOIt8an6JBYEPP0bAqgQQJooyjdCJRnK
WoFtYW/XvYubnHEzDQ7qO4VAalcP1BnyaC0120mxiWp7nl2MBBn6Gp//IU+B1v3z
sBe8PnM2+7dCADHU3470rjWZof2DbNJw4HsjewRJN73GOTy5cjWTbP5TeN9vf0jq
gmMft4cupDJTvGoB69O3djpdj9WRXXlHK+alXWJN6HC7m1FTes4ES4xD9icCPMOy
pQLkkVcbhQo/0li/ZJFyOjmM4DXmCNe7uEFzzf+7TOSJ38p/d7A90KmvdxnXqqC9
SLt539t/o5RvD9yl/glT0aUCohfhFCn+blnJ3BWNGRzNSq/r9vwdWETJurGJwBbt
gnUEcrWbc+Ua0Vvlss1LhOfgaaTPW4VlQO4sWvSiwFdix2rsLQ5MqkbG2ZnCqi5r
g6HA3oWU3T+7l553t1DODRZZFGQDSebEDdnYYhHiSNENS7GA+QbzypSsSihOzBMM
6FPKksvdx+HMxIVVcyoFuLdnBWOMqNB0UmSa3XZjThWMdrKnUEU=
=tYRb
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
