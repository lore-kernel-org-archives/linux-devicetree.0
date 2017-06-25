From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/3] remoteproc/keystone: Add a remoteproc driver for
 Keystone 2 DSPs
Date: Sun, 25 Jun 2017 13:15:45 -0700
Message-ID: <20170625201545.GA26155@builder>
References: <20170613234513.7624-1-s-anna@ti.com>
 <20170613234513.7624-3-s-anna@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170613234513.7624-3-s-anna-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
Cc: Ohad Ben-Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>, Sam Nelson <sam.nelson-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue 13 Jun 16:45 PDT 2017, Suman Anna wrote:

> +static int keystone_rproc_start(struct rproc *rproc)
> +{
> +	struct keystone_rproc *ksproc = rproc->priv;
> +	int ret;
> +
> +	INIT_WORK(&ksproc->workqueue, handle_event);
> +
> +	ret = request_irq(ksproc->irq_ring, keystone_rproc_vring_interrupt, 0,
> +			  dev_name(ksproc->dev), ksproc);
> +	if (ret) {
> +		dev_err(ksproc->dev, "failed to enable vring interrupt, ret = %d\n",
> +			ret);
> +		goto out;
> +	}
> +
> +	ret = request_irq(ksproc->irq_fault, keystone_rproc_exception_interrupt,
> +			  0, dev_name(ksproc->dev), ksproc);
> +	if (ret) {
> +		dev_err(ksproc->dev, "failed to enable exception interrupt, ret = %d\n",
> +			ret);
> +		goto free_vring_irq;
> +	}

I do prefer that your request any resources during probe() and
potentially enable/disable them here. If below concern about using a
GPIO driver is cleared already I'll take it as is though.

[..]
> +static void keystone_rproc_kick(struct rproc *rproc, int vqid)
> +{
> +	struct keystone_rproc *ksproc = rproc->priv;
> +
> +	if (WARN_ON(ksproc->kick_gpio < 0))
> +		return;
> +
> +	gpio_set_value(ksproc->kick_gpio, 1);
> +}
> +

This doesn't sound like a gpio-controller and the GPIO maintainer did
reject an attempt by me to use the GPIO framework to abstract a similar
thing. Do you already have this driver upstream or have you clarified
with the maintainer that the GPIO framework is an acceptable abstraction
for this?

It looks equivalent to the "APCS IPC" register found in Qualcomm
platforms, previously implemented through a syscon but in v4.13 being
pushed to being a mailbox driver.


Apart from this I think the series looks good.

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
