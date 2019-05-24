From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCHv3 2/4] firmware: add Intel Stratix10 remote system update
 driver
Date: Fri, 24 May 2019 20:58:58 +0200
Message-ID: <20190524185858.GB13200@kroah.com>
References: <1558616610-499-1-git-send-email-richard.gong@linux.intel.com>
 <1558616610-499-3-git-send-email-richard.gong@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1558616610-499-3-git-send-email-richard.gong@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: richard.gong@linux.intel.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, dinguyen@kernel.org, atull@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, sen.li@intel.com, Richard Gong <richard.gong@intel.com>
List-Id: devicetree@vger.kernel.org

On Thu, May 23, 2019 at 08:03:28AM -0500, richard.gong@linux.intel.com wrote:
> +static int stratix10_rsu_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct stratix10_rsu_priv *priv;
> +	int ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->client.dev = dev;
> +	priv->client.receive_cb = NULL;
> +	priv->client.priv = priv;
> +	priv->status.current_image = 0;
> +	priv->status.fail_image = 0;
> +	priv->status.error_location = 0;
> +	priv->status.error_details = 0;
> +	priv->status.version = 0;
> +	priv->status.state = 0;
> +
> +	mutex_init(&priv->lock);
> +	priv->chan = stratix10_svc_request_channel_byname(&priv->client,
> +							  SVC_CLIENT_RSU);
> +	if (IS_ERR(priv->chan)) {
> +		dev_err(dev, "couldn't get service channel %s\n",
> +			SVC_CLIENT_RSU);
> +		return PTR_ERR(priv->chan);
> +	}
> +
> +	init_completion(&priv->completion);
> +	platform_set_drvdata(pdev, priv);
> +
> +	/* status is only updated after reboot */
> +	ret = rsu_send_msg(priv, COMMAND_RSU_STATUS,
> +			   0, rsu_status_callback);
> +	if (ret) {
> +		dev_err(dev, "Error, getting RSU status %i\n", ret);
> +		stratix10_svc_free_channel(priv->chan);
> +	}
> +
> +	ret = devm_device_add_groups(dev, rsu_groups);
> +	if (ret) {
> +		dev_err(dev, "unable to create sysfs group");
> +		stratix10_svc_free_channel(priv->chan);
> +	}
> +
> +	return ret;
> +}
> +
> +static int stratix10_rsu_remove(struct platform_device *pdev)
> +{
> +	struct stratix10_rsu_priv *priv = platform_get_drvdata(pdev);
> +
> +	stratix10_svc_free_channel(priv->chan);
> +	devm_device_remove_groups(&pdev->dev, rsu_groups);

When you are the only caller of a function in the kernel, that's a HUGE
flag that maybe you should not be calling it...

Which reminds me, I need to go remove this...

Anyway, no, don't do this, you are racing userspace with your sysfs
files.  Reference the groups in the platform_driver structure and the
driver core will properly create, and remove, them for you, and
userspace will be happy they show up at the correct time.

This also makes your probe/remove function smaller.

thanks,

greg k-h
