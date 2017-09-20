From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 1/2] drm/bridge: Add Cadence DSI driver
Date: Wed, 20 Sep 2017 14:32:41 +0200
Message-ID: <20170920143241.44a20bc6@bbrezillon>
References: <20170831155519.3704-1-boris.brezillon@free-electrons.com>
        <27834b62-664f-d403-6396-2339cb4fda1c@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <27834b62-664f-d403-6396-2339cb4fda1c-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Neil Webb <neilw-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Richard Sproul <sproul-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Simon Hatliff <hatliff-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Cyprian Wronka <cwronka-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Alan Douglas <adouglas-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 20 Sep 2017 14:55:02 +0300
Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org> wrote:

> ﻿Hi Boris,
> 
> 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> 
> On 31/08/17 18:55, Boris Brezillon wrote:
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
> 
> We need some power management. At the moment the clocks are kept always
> enabled. Those need to be turned off when the IP is not used.

I can try to move the clk_prepare_enable/disable_unprepare() calls in
the bridge->enable/disable() hooks, but I'm not sure the DSI regs
content is kept when I disable dsi_p_clk.

> 
> > +static irqreturn_t cdns_dsi_interrupt(int irq, void *data)
> > +{
> > +	struct cdns_dsi *dsi = data;
> > +	irqreturn_t ret = IRQ_NONE;
> > +	u32 flag, ctl;
> > +
> > +	flag = readl(dsi->regs + DIRECT_CMD_STS_FLAG);
> > +	if (flag) {
> > +		ctl = readl(dsi->regs + DIRECT_CMD_STS_CTL);
> > +		ctl &= ~flag;
> > +		writel(ctl, dsi->regs + DIRECT_CMD_STS_CTL);  
> 
> I presume it's the enable/disable bit in STS_CTL that prevents the
> interrupt from triggering again, instead of the status flag?

Yep.

> Just making
> sure, because I think on some IPs the status flag has been the one that
> triggers the interrupt.
> 
> > +		complete(&dsi->direct_cmd_comp);
> > +		ret = IRQ_HANDLED;
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static ssize_t cdns_dsi_transfer(struct mipi_dsi_host *host,
> > +				 const struct mipi_dsi_msg *msg)
> > +{
> > +	struct cdns_dsi *dsi = to_cdns_dsi(host);
> > +	u32 cmd, sts, val, wait = WRITE_COMPLETED, ctl = 0;
> > +	struct mipi_dsi_packet packet;
> > +	int ret, i, tx_len, rx_len;
> > +
> > +	ret = mipi_dsi_create_packet(&packet, msg);
> > +	if (ret)
> > +		return ret;
> > +
> > +	tx_len = msg->tx_buf ? msg->tx_len : 0;
> > +	rx_len = msg->rx_buf ? msg->rx_len : 0;
> > +
> > +	/* For read operations, the maximum TX len is 2. */  
> 
> Hmm, why is that?

I don't know, that's what is stated in the spec.
Excerpt from the CMD_SIZE field description:

"
For read operations, any value
written which is larger than 2
bytes will be ignored and the
command payload will be truncated
to 2 bytes.
"

> 
> > +	if (rx_len && tx_len > 2)
> > +		return -ENOTSUPP;
> > +
> > +	/* TX len is limited by the CMD FIFO depth. */
> > +	if (tx_len > dsi->direct_cmd_fifo_depth)
> > +		return -ENOTSUPP;
> > +
> > +	/* RX len is limited by the RX FIFO depth. */
> > +	if (rx_len > dsi->rx_fifo_depth)
> > +		return -ENOTSUPP;
> > +
> > +	cmd = CMD_SIZE(tx_len) | CMD_VCHAN_ID(msg->channel) |
> > +	      CMD_DATATYPE(msg->type);
> > +
> > +	if (msg->flags & MIPI_DSI_MSG_USE_LPM)
> > +		cmd |= CMD_LP_EN;
> > +
> > +	if (mipi_dsi_packet_format_is_long(msg->type))
> > +		cmd |= CMD_LONG;
> > +
> > +	if (rx_len) {
> > +		cmd |= READ_CMD;
> > +		wait = READ_COMPLETED_WITH_ERR | READ_COMPLETED;
> > +		ctl = READ_EN | BTA_EN;
> > +	} else if (msg->flags & MIPI_DSI_MSG_REQ_ACK) {
> > +		cmd |= BTA_REQ;
> > +		wait = ACK_WITH_ERR_RCVD | ACK_RCVD;
> > +		ctl = BTA_EN;
> > +	}  
> 
> It's been a while since I worked with DSI, but... Shouldn't there be a
> check somewhere that the packet(s) can fit into the blanking intervals?

Hm, I'm not sure. DSI commands are usually sent when the encoder/bridge
is not transmitting video, so in this case we don't have any constraint
on the packet length. Also, it seems other drivers are not checking the
vblank timing constraint when sending commands so either it's handled in
HW and the controller is able to report invalid lengths or no one cared
enough to take this case into account.

Anyway, I'll ask Cadence engineers to know how they deal with this
video+command situation.

Thanks,

Boris

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
