From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v3] Add OLPC AP-SP input driver
Date: Fri, 28 Jun 2013 11:20:00 -0700
Message-ID: <20130628182000.GA21589@core.coreip.homeip.net>
References: <20130628171958.CC031FAAD5@dev.laptop.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-input-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130628171958.CC031FAAD5@dev.laptop.org>
Sender: linux-input-owner@vger.kernel.org
To: Daniel Drake <dsd@laptop.org>
Cc: linux-input@vger.kernel.org, pgf@laptop.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Hi Daniel,

On Fri, Jun 28, 2013 at 01:19:58PM -0400, Daniel Drake wrote:
> +static int olpc_apsp_open(struct serio *port)
> +{
> +	struct olpc_apsp *priv = port->port_data;
> +	unsigned int tmp;
> +
> +	if (priv->open_count++ == 0) {
> +		/* Enable interrupt 0 by clearing its bit */
> +		tmp = readl(priv->base + PJ_INTERRUPT_MASK);
> +		writel(tmp & ~INT_0, priv->base + PJ_INTERRUPT_MASK);
> +	}
> +
> +	return 0;
> +}
> +
> +static void olpc_apsp_close(struct serio *port)
> +{
> +	struct olpc_apsp *priv = port->port_data;
> +	unsigned int tmp;
> +
> +	if (--priv->open_count == 0) {

Both need locking. It looks like you need the song and dance similar to
what i8042 has to do with it's multiplexed ports. Or ps2mult.c...

-- 
Dmitry
