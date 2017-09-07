From: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v3 1/2] drm/bridge: Add Cadence DSI driver
Date: Thu, 7 Sep 2017 15:06:13 +0530
Message-ID: <c17e158a-3e37-8ae6-e31c-7ed89429166a@codeaurora.org>
References: <20170831155519.3704-1-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170831155519.3704-1-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Neil Webb <neilw-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Richard Sproul <sproul-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Simon Hatliff <hatliff-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Cyprian Wronka <cwronka-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Alan Douglas <adouglas-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 08/31/2017 09:25 PM, Boris Brezillon wrote:
> Add a driver for Cadence DPI -> DSI bridge.
> 
> This driver only support a subset of Cadence DSI bridge capabilities.
> 
> Here is a non-exhaustive list of missing features:
>   * burst mode
>   * dynamic configuration of the DPHY based on the
>   * support for additional input interfaces (SDI input)
> 
> Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
> Changes in v3:
> - replace magic values by real timing calculation. The DPHY PLL clock
>    is still hardcoded since we don't have a working DPHY block yet, and
>    this is the piece of HW we need to dynamically configure the PLL
>    rate based on the display refresh rate and the resolution.
> - parse DSI devices represented with the OF-graph. This is needed to
>    support DSI devices controlled through an external bus like I2C or
>    SPI.
> - use the DRM panel-bridge infrastructure to simplify the DRM panel
>    logic
> 
> Changes in v2:
> - rebase on v4.12-rc1 and adapt to driver to the drm_bridge API changes
> - return the correct error when devm_clk_get(sysclk) fails
> - add missing depends on OF and select DRM_PANEL in the Kconfig entry
> ---
>   drivers/gpu/drm/bridge/Kconfig    |    9 +
>   drivers/gpu/drm/bridge/Makefile   |    1 +
>   drivers/gpu/drm/bridge/cdns-dsi.c | 1090 +++++++++++++++++++++++++++++++++++++
>   3 files changed, 1100 insertions(+)
>   create mode 100644 drivers/gpu/drm/bridge/cdns-dsi.c
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index adf9ae0e0b7c..88c324b12e16 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -25,6 +25,15 @@ config DRM_ANALOGIX_ANX78XX
>   	  the HDMI output of an application processor to MyDP
>   	  or DisplayPort.
>   
> +config DRM_CDNS_DSI
> +	tristate "Cadence DPI/DSI bridge"
> +	select DRM_KMS_HELPER
> +	select DRM_MIPI_DSI
> +	select DRM_PANEL
> +	depends on OF
> +	help
> +	  Support Cadence DPI to DSI bridge.

Maybe we can briefly mention here that it's a internal bridge/IP, and not an external chip?

> +
>   config DRM_DUMB_VGA_DAC
>   	tristate "Dumb VGA DAC Bridge support"
>   	depends on OF
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index defcf1e7ca1c..77b65e8ecf59 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -1,4 +1,5 @@
>   obj-$(CONFIG_DRM_ANALOGIX_ANX78XX) += analogix-anx78xx.o
> +obj-$(CONFIG_DRM_CDNS_DSI) += cdns-dsi.o
>   obj-$(CONFIG_DRM_DUMB_VGA_DAC) += dumb-vga-dac.o
>   obj-$(CONFIG_DRM_LVDS_ENCODER) += lvds-encoder.o
>   obj-$(CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW) += megachips-stdpxxxx-ge-b850v3-fw.o
> diff --git a/drivers/gpu/drm/bridge/cdns-dsi.c b/drivers/gpu/drm/bridge/cdns-dsi.c

<snip>

> +
> +static void cdns_dsi_bridge_disable(struct drm_bridge *bridge)
> +{
> +	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
> +	struct cdns_dsi *dsi = input_to_dsi(input);
> +	u32 val;
> +
> +	val = readl(dsi->regs + MCTL_MAIN_DATA_CTL);
> +	val &= ~(IF_VID_SELECT_MASK | IF_VID_MODE | VID_EN | HOST_EOT_GEN |
> +		 DISP_EOT_GEN);

I see some truncation related sparse warnings here and a couple of other places
when building against arm32. Those would be nice to fix.

> +	writel(val, dsi->regs + MCTL_MAIN_DATA_CTL);
> +
> +	val = readl(dsi->regs + MCTL_MAIN_EN) & ~IF_EN(input->id);
> +	writel(val, dsi->regs + MCTL_MAIN_EN);
> +}
> +
> +#define DSI_HBP_FRAME_OVERHEAD		12
> +#define DSI_HSA_FRAME_OVERHEAD		14
> +#define DSI_HFP_FRAME_OVERHEAD		6
> +#define DSI_HSS_VSS_VSE_FRAME_OVERHEAD	4
> +#define DSI_BLANKING_FRAME_OVERHEAD	6
> +#define DSI_NULL_FRAME_OVERHEAD		6
> +#define DSI_EOT_PKT_SIZE		4
> +
> +#define REG_WAKEUP_TIME_NS		800
> +#define DPHY_PLL_RATE_HZ		108000000
> +
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
> +	tmp = tmp < DSI_HFP_FRAME_OVERHEAD ? 0 : tmp - DSI_HFP_FRAME_OVERHEAD;
> +	hsize0 |= HFP_LEN(tmp);
> +
> +	if (output->dev->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
> +		tmp = mode->crtc_hsync_end - mode->crtc_hsync_start;
> +	else
> +		tmp = 0;
> +	tmp = (tmp * 8) / bpp;
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
> +			      VID_DATATYPE(MIPI_DSI_PACKED_PIXEL_STREAM_16);
> +			break;
> +
> +		default:
> +			dev_err(dsi->base.dev, "Unsupported DSI format\n");
> +			return;
> +		}
> +
> +		if (output->dev->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
> +			tmp |= SYNC_PULSE_ACTIVE | SYNC_PULSE_HORIZONTAL;
> +
> +		tmp |= REG_BLKLINE_MODE(REG_BLK_MODE_BLANKING_PKT) |
> +		       REG_BLKEOL_MODE(REG_BLK_MODE_BLANKING_PKT) |
> +		       RECOVERY_MODE(RECOVERY_MODE_NEXT_HSYNC);
> +
> +		writel(tmp, dsi->regs + VID_MAIN_CTL);
> +	}
> +
> +	tmp = readl(dsi->regs + MCTL_MAIN_DATA_CTL);
> +	tmp &= ~(IF_VID_SELECT_MASK | HOST_EOT_GEN | IF_VID_MODE);
> +
> +	if (!(output->dev->mode_flags & MIPI_DSI_MODE_EOT_PACKET))
> +		tmp |= HOST_EOT_GEN;
> +
> +	if (output->dev->mode_flags & MIPI_DSI_MODE_VIDEO)
> +		tmp |= IF_VID_MODE | IF_VID_SELECT(input->id) | VID_EN;
> +
> +	writel(tmp, dsi->regs + MCTL_MAIN_DATA_CTL);
> +
> +	tmp = readl(dsi->regs + MCTL_MAIN_EN) | IF_EN(input->id);
> +	writel(tmp, dsi->regs + MCTL_MAIN_EN);
> +}
> +
> +static const struct drm_bridge_funcs cdns_dsi_bridge_funcs = {
> +	.attach = cdns_dsi_bridge_attach,
> +	.mode_valid = cdns_dsi_bridge_mode_valid,
> +	.disable = cdns_dsi_bridge_disable,
> +	.enable = cdns_dsi_bridge_enable,
> +};
> +
> +static int cdns_dsi_init_link(struct cdns_dsi *dsi)
> +{
> +	struct cdns_dsi_output *output = &dsi->output;
> +	unsigned long sysclk_period, ulpout;
> +	u32 val;
> +	int i;
> +
> +	writel(0, dsi->regs + MCTL_DPHY_STATIC);
> +
> +	val = 0;
> +	for (i = 1; i < output->dev->lanes; i++)
> +		val |= DATA_LANE_EN(i);
> +
> +	if (!(output->dev->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS))
> +		val |= CLK_CONTINUOUS;
> +
> +	writel(val, dsi->regs + MCTL_MAIN_PHY_CTL);
> +
> +	/* ULPOUT should be set to 1ms and is expressed in sysclk cycles. */
> +	sysclk_period = NSEC_PER_SEC / clk_get_rate(dsi->sysclk);
> +	ulpout = DIV_ROUND_UP(NSEC_PER_MSEC, sysclk_period);
> +	writel(CLK_LANE_ULPOUT_TIME(ulpout) | DATA_LANE_ULPOUT_TIME(ulpout),
> +	       dsi->regs + MCTL_ULPOUT_TIME);
> +
> +	writel(LINK_EN, dsi->regs + MCTL_MAIN_DATA_CTL);
> +
> +	val = CLK_LANE_EN | PLL_START;
> +	for (i = 0; i < output->dev->lanes; i++)
> +		val |= DATA_LANE_START(i);
> +
> +	writel(val, dsi->regs + MCTL_MAIN_EN);
> +
> +	ndelay(100);
> +
> +	return 0;
> +}
> +
> +static int cdns_dsi_attach(struct mipi_dsi_host *host,
> +			   struct mipi_dsi_device *dev)
> +{
> +	struct cdns_dsi *dsi = to_cdns_dsi(host);
> +	struct cdns_dsi_output *output = &dsi->output;
> +	struct cdns_dsi_input *input = &dsi->input;
> +	struct drm_bridge *bridge;
> +	struct drm_panel *panel;
> +	struct device_node *np;
> +	int ret;
> +
> +	/*
> +	 * We currently do not support connecting several DSI devices to the
> +	 * same host. In order to support that we'd need the DRM bridge
> +	 * framework to allow dynamic reconfiguration of the bridge chain.
> +	 */
> +	if (output->dev)
> +		return -EBUSY;
> +
> +	/* We do not support burst mode yet. */
> +	if (dev->mode_flags & MIPI_DSI_MODE_VIDEO_BURST)
> +		return -ENOTSUPP;
> +
> +	/*
> +	 * The host <-> device link might be described using an OF-graph
> +	 * representation, in this case we extract the device of_node from
> +	 * this representation, otherwise we use dsidev->dev.of_node which
> +	 * should have been filled by the core.
> +	 */
> +	np = of_graph_get_remote_node(dsi->base.dev->of_node, DSI_OUTPUT_PORT,
> +				      dev->channel);
> +	if (!np)
> +		np = of_node_get(dev->dev.of_node); > +
> +	panel = of_drm_find_panel(np);
> +	if (panel) {
> +		bridge = drm_panel_bridge_add(panel, DRM_MODE_CONNECTOR_DSI);
> +	} else {
> +		bridge = of_drm_find_bridge(dev->dev.of_node);
> +		if (!bridge)
> +			bridge = ERR_PTR(-EINVAL);
> +	}
> +
> +	of_node_put(np);

It would have been nice to use drm_of_find_panel_or_bridge() here, but I guess
you couldn't use it because you have to handle both OF-graph based links, and
children directly under the host DSI bus.

The patch looks good to me otherwise.

Thanks,
Archit

> +
> +	if (IS_ERR(bridge)) {
> +		ret = PTR_ERR(bridge);
> +		dev_err(host->dev, "failed to add DSI device %s (err = %d)",
> +			dev->name, ret);
> +		return ret;
> +	}
> +
> +	output->dev = dev;
> +	output->bridge = bridge;
> +	output->panel = panel;
> +
> +	ret = cdns_dsi_init_link(dsi);
> +	if (ret)
> +		goto err_rst_output;
> +
> +	/*
> +	 * The DSI output has been properly configured, we can now safely
> +	 * register the input to the bridge framework so that it can take place
> +	 * in a display pipeline.
> +	 */
> +	drm_bridge_add(&input->bridge);
> +
> +	return 0;
> +
> +err_rst_output:
> +	if (panel)
> +		drm_panel_bridge_remove(bridge);
> +
> +	output->bridge = NULL;
> +	output->panel = NULL;
> +	output->dev = NULL;
> +
> +	return ret;
> +}

<snip>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
