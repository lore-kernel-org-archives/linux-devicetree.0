From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH RESEND] w1: masters: omap_hdq: Add support for 1-wire
 mode
Date: Wed, 13 May 2015 13:49:58 -0700
Message-ID: <20150513134958.e21e538c3c8fe00d3fcd8854@linux-foundation.org>
References: <1430728735-22747-1-git-send-email-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1430728735-22747-1-git-send-email-vigneshr@ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: Vignesh R <vigneshr@ti.com>
Cc: Evgeniy Polyakov <zbr@ioremap.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, NeilBrown <neilb@suse.de>, Tony Lindgren <tony@atomide.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Fabian Frederick <fabf@skynet.be>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 4 May 2015 14:08:55 +0530 Vignesh R <vigneshr@ti.com> wrote:

> This patches makes following changes to omap_hdq driver
>  - Enable 1-wire mode.
>  - Implement w1_triplet callback to facilitate search rom
>    procedure and auto detection of 1-wire slaves.
>  - Proper enabling and disabling of interrupt.
>  - Cleanups (formatting and return value checks).
> 
> HDQ mode remains unchanged.
> 
> ...
>
> +/*
> + * W1 triplet callback function - used for searching ROM addresses.
> + * Registered only when controller is in 1-wire mode.
> + */
> +static u8 omap_w1_triplet(void *_hdq, u8 bdir)
> +{
> +	u8 ret, id_bit, comp_bit;
> +	struct hdq_data *hdq_data = _hdq;
> +	u8 ctrl = OMAP_HDQ_CTRL_STATUS_SINGLE | OMAP_HDQ_CTRL_STATUS_GO |
> +		  OMAP_HDQ_CTRL_STATUS_INTERRUPTMASK;
> +	u8 mask = ctrl | OMAP_HDQ_CTRL_STATUS_DIR;
> +
> +	omap_hdq_get(_hdq);
> +
> +	ret = mutex_lock_interruptible(&hdq_data->hdq_mutex);
> +	if (ret < 0) {
> +		ret = -EINTR;
> +		goto rtn;

Has this code path been tested?  What happens when it is taken?  Driver
initialization fails?  If so, why is this desirable behaviour?

> +	}
> +
> +	hdq_data->hdq_irqstatus = 0;
> +	/* read id_bit */
> +	hdq_reg_merge(_hdq, OMAP_HDQ_CTRL_STATUS,
> +		      ctrl | OMAP_HDQ_CTRL_STATUS_DIR, mask);
> +	wait_event_timeout(hdq_wait_queue,
> +			   (hdq_data->hdq_irqstatus
> +			   & OMAP_HDQ_INT_STATUS_RXCOMPLETE),
> +			   OMAP_HDQ_TIMEOUT);

It seems bad to ignore a timeout.  Shouldn't the code clean up and
report error when this occurs?


> +	id_bit = (hdq_reg_in(_hdq, OMAP_HDQ_RX_DATA) & 0x01);
> +
> +	hdq_data->hdq_irqstatus = 0;
> +	/* read comp_bit */
> +	hdq_reg_merge(_hdq, OMAP_HDQ_CTRL_STATUS,
> +		      ctrl | OMAP_HDQ_CTRL_STATUS_DIR, mask);
> +	wait_event_timeout(hdq_wait_queue,
> +			   (hdq_data->hdq_irqstatus
> +			   & OMAP_HDQ_INT_STATUS_RXCOMPLETE),
> +			   OMAP_HDQ_TIMEOUT);

Here too.

> +	comp_bit = (hdq_reg_in(_hdq, OMAP_HDQ_RX_DATA) & 0x01);
> +
> +	if (id_bit && comp_bit) {
> +		ret = 0x03;  /* error */
> +		goto rtn;
> +	}
> +	if (!id_bit && !comp_bit) {
> +		/* Both bits are valid, take the direction given */
> +		ret = bdir ? 0x04 : 0;
> +	} else {
> +		/* Only one bit is valid, take that direction */
> +		bdir = id_bit;
> +		ret = id_bit ? 0x05 : 0x02;
> +	}
> +
> +	/* write bdir bit */
> +	hdq_reg_out(_hdq, OMAP_HDQ_TX_DATA, bdir);
> +	hdq_reg_merge(_hdq, OMAP_HDQ_CTRL_STATUS, ctrl, mask);
> +	wait_event_timeout(hdq_wait_queue,
> +			   (hdq_data->hdq_irqstatus
> +			   & OMAP_HDQ_INT_STATUS_TXCOMPLETE),
> +			   OMAP_HDQ_TIMEOUT);

And here.

> +	hdq_reg_merge(_hdq, OMAP_HDQ_CTRL_STATUS, 0,
> +		      OMAP_HDQ_CTRL_STATUS_SINGLE);
> +
> +rtn:
> +	mutex_unlock(&hdq_data->hdq_mutex);
> +	omap_hdq_put(_hdq);
> +	return ret;
> +}
>
> ...
>
