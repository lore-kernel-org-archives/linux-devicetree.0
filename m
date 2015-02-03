From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH v5 2/7] mailbox: arm_mhu: add driver for ARM MHU
 controller
Date: Tue, 3 Feb 2015 12:32:16 +0000
Message-ID: <20150203123216.GO8656@n2100.arm.linux.org.uk>
References: <1422955310-6542-1-git-send-email-Vincent.Yang@tw.fujitsu.com>
 <1422955763-6630-1-git-send-email-Vincent.Yang@tw.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1422955763-6630-1-git-send-email-Vincent.Yang-l16TxrwUIHTQFUHtdCDX3A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vincent Yang <vincent.yang.fujitsu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sudeep.holla-5wv7dgnIgG8@public.gmane.org, andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Vincent Yang <Vincent.Yang-l16TxrwUIHTQFUHtdCDX3A@public.gmane.org>, Tetsuya Nuriya <nuriya.tetsuya-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 03, 2015 at 05:29:23PM +0800, Vincent Yang wrote:
> +static int mhu_send_data(struct mbox_chan *chan, void *data)
> +{
> +	struct mhu_link *mlink = chan->con_priv;
> +
> +	pr_debug("%s:%d\n", __func__, __LINE__);
> +	if (!mhu_last_tx_done(chan)) {
> +		dev_err(chan->mbox->dev, "Last TX(%d) pending!\n", mlink->irq);
> +		return -EBUSY;
> +	}
> +
> +	writel_relaxed((u32)data, mlink->tx_reg + INTR_SET_OFS);

Doesn't that cause a GCC warning?

> +static int mhu_probe(struct amba_device *adev, const struct amba_id *id)
> +{
> +	int i, err;
> +	struct arm_mhu *mhu;
> +	struct device *dev = &adev->dev;
> +	int mhu_reg[3] = {0x0, 0x20, 0x200};
> +
> +	err = amba_request_regions(adev, NULL);
> +	if (err)
> +		return err;
> +
> +	/* Allocate memory for device */
> +	mhu = devm_kzalloc(dev, sizeof(*mhu), GFP_KERNEL);
> +	if (!mhu)
> +		return -ENOMEM;
> +
> +	mhu->base = devm_ioremap(dev, adev->res.start,
> +				 resource_size(&adev->res));
> +	if (!mhu->base) {
> +		dev_err(dev, "ioremap failed\n");
> +		return -ENXIO;

	mhu->base = devm_ioremap_resource(dev, &adev->res);
	if (IS_ERR(mhu->base)) {
		dev_err(dev, "ioremap failed\n");
		return PTR_ERR(mhu->base);

> +	}
> +
> +	for (i = 0; i < 3; i++) {
> +		mhu->chan[i].con_priv = &mhu->mlink[i];
> +		mhu->mlink[i].irq = adev->irq[i];
> +		mhu->mlink[i].rx_reg = mhu->base + mhu_reg[i];
> +		mhu->mlink[i].tx_reg = mhu->mlink[i].rx_reg + 0x100;
> +	}
> +
> +	mhu->mbox.dev = dev;
> +	mhu->mbox.chans = &mhu->chan[0];
> +	mhu->mbox.num_chans = 3;
> +	mhu->mbox.ops = &mhu_ops;
> +	mhu->mbox.txdone_irq = false;
> +	mhu->mbox.txdone_poll = true;
> +	mhu->mbox.txpoll_period = 10;
> +
> +	amba_set_drvdata(adev, mhu);
> +
> +	err = mbox_controller_register(&mhu->mbox);
> +	if (err) {
> +		dev_err(dev, "Failed to register mailboxes %d\n", err);
> +		return err;
> +	}
> +
> +	dev_err(dev, "ARM MHU Mailbox registered\n");

Why is this an error?

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
