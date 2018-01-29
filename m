From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5 1/2] drm/bridge: Add Cadence DSI driver
Date: Mon, 29 Jan 2018 14:16:39 +0100
Message-ID: <20180129141639.6f5c4510@bbrezillon>
References: <20180118134309.13123-1-boris.brezillon@free-electrons.com>
        <9b45c6a3-f26b-59f5-d313-88290a2c5b42@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9b45c6a3-f26b-59f5-d313-88290a2c5b42-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Cc: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Richard Sproul <sproul-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Simon Hatliff <hatliff-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Suresh Punnoose <sureshp-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Alan Douglas <adouglas-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, "Menon, Nishanth" <nm-l0cyMroinI0@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 29 Jan 2018 13:56:21 +0200
Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org> wrote:

> > +static ssize_t cdns_dsi_transfer(struct mipi_dsi_host *host,
> > +				 const struct mipi_dsi_msg *msg)
> > +{
> > +	struct cdns_dsi *dsi = to_cdns_dsi(host);
> > +	u32 cmd, sts, val, wait = WRITE_COMPLETED, ctl = 0;
> > +	struct mipi_dsi_packet packet;
> > +	int ret, i, tx_len, rx_len;
> > +
> > +	ret = pm_runtime_get_sync(host->dev);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	cdns_dsi_init_link(dsi);
> > +
> > +	ret = mipi_dsi_create_packet(&packet, msg);
> > +	if (ret)
> > +		goto out;
> > +
> > +	tx_len = msg->tx_buf ? msg->tx_len : 0;
> > +	rx_len = msg->rx_buf ? msg->rx_len : 0;
> > +
> > +	/* For read operations, the maximum TX len is 2. */
> > +	if (rx_len && tx_len > 2) {
> > +		ret = -ENOTSUPP;
> > +		goto out;
> > +	}
> > +
> > +	/* TX len is limited by the CMD FIFO depth. */
> > +	if (tx_len > dsi->direct_cmd_fifo_depth) {
> > +		ret = -ENOTSUPP;
> > +		goto out;
> > +	}
> > +
> > +	/* RX len is limited by the RX FIFO depth. */
> > +	if (rx_len > dsi->rx_fifo_depth) {
> > +		ret = -ENOTSUPP;
> > +		goto out;
> > +	}
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
> > +
> > +	writel(readl(dsi->regs + MCTL_MAIN_DATA_CTL) | ctl,
> > +	       dsi->regs + MCTL_MAIN_DATA_CTL);
> > +
> > +	writel(cmd, dsi->regs + DIRECT_CMD_MAIN_SETTINGS);
> > +
> > +	for (i = 0; i < tx_len; i += 4) {
> > +		const u8 *buf = msg->tx_buf;
> > +		int j;
> > +
> > +		val = 0;
> > +		for (j = 0; j < 4 && j + i < tx_len; j++)
> > +			val |= (u32)buf[i + j] << (8 * j);
> > +
> > +		writel(val, dsi->regs + DIRECT_CMD_WRDATA);
> > +	}
> > +
> > +	/* Clear status flags before sending the command. */
> > +	writel(wait, dsi->regs + DIRECT_CMD_STS_CLR);
> > +	writel(wait, dsi->regs + DIRECT_CMD_STS_CTL);
> > +	reinit_completion(&dsi->direct_cmd_comp);
> > +	writel(0, dsi->regs + DIRECT_CMD_SEND);
> > +
> > +	wait_for_completion_timeout(&dsi->direct_cmd_comp,
> > +				    msecs_to_jiffies(1000));
> > +
> > +	sts = readl(dsi->regs + DIRECT_CMD_STS);
> > +	writel(wait, dsi->regs + DIRECT_CMD_STS_CLR);
> > +	writel(0, dsi->regs + DIRECT_CMD_STS_CTL);
> > +
> > +	writel(readl(dsi->regs + MCTL_MAIN_DATA_CTL) & ~ctl,
> > +	       dsi->regs + MCTL_MAIN_DATA_CTL);
> > +
> > +	/* We did not receive the events we were waiting for. */
> > +	if (!(sts & wait)) {
> > +		ret = -ETIMEDOUT;
> > +		goto out;
> > +	}
> > +
> > +	/* READ of WRITE with ACK failed. */  
> 
> Should that 'of' be 'or'?
> 

Yep, I'll fix that too.

Other than those trivial changes, are you happy with the rest of the
driver or should I wait a bit for a full review?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
