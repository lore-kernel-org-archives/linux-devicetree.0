From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v2] w1: masters: omap_hdq: Add support for 1-wire mode
Date: Thu, 28 May 2015 14:27:29 -0700
Message-ID: <20150528142729.45a8e3abf3f7a8b59bdfc1ce@linux-foundation.org>
References: <1431950959-19606-1-git-send-email-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1431950959-19606-1-git-send-email-vigneshr@ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: Vignesh R <vigneshr@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Evgeniy Polyakov <zbr@ioremap.net>, Jonathan Corbet <corbet@lwn.net>, Tony Lindgren <tony@atomide.com>, NeilBrown <neilb@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Fabian Frederick <fabf@skynet.be>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 18 May 2015 17:39:19 +0530 Vignesh R <vigneshr@ti.com> wrote:

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
> +	u8 id_bit, comp_bit;
> +	int err;
> +	u8 ret = 0x3; /* no slaves responded */
> +	struct hdq_data *hdq_data = _hdq;
> +	u8 ctrl = OMAP_HDQ_CTRL_STATUS_SINGLE | OMAP_HDQ_CTRL_STATUS_GO |
> +		  OMAP_HDQ_CTRL_STATUS_INTERRUPTMASK;
> +	u8 mask = ctrl | OMAP_HDQ_CTRL_STATUS_DIR;
> +
> +	omap_hdq_get(_hdq);
> +
> +	err = mutex_lock_interruptible(&hdq_data->hdq_mutex);
> +	if (err < 0) {
> +		dev_dbg(hdq_data->dev, "Could not acquire mutex\n");
> +		goto rtn;
> +	}

The use of mutex_lock_interruptible() seems like a bad idea.  It means
that if the calling process (modprobe?) has a signal pending,
w1_search() will think that "no device responded".  That isn't really
true - a true statement is "user hit ^C".  I'm not sure what the
overall runtime effect of this will be, but I bet it hasn't been
tested!

Wouldn't it be saner/safer to use plain old mutex_lock() here?
