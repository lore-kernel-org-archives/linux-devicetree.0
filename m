From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCHv1 4/6] firmware: add Intel Stratix10 remote system update
 driver
Date: Thu, 25 Apr 2019 22:33:41 +0200
Message-ID: <20190425203341.GF22307@kroah.com>
References: <1554835562-25056-1-git-send-email-richard.gong@linux.intel.com>
 <1554835562-25056-5-git-send-email-richard.gong@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1554835562-25056-5-git-send-email-richard.gong@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: richard.gong@linux.intel.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, dinguyen@kernel.org, atull@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Richard Gong <richard.gong@intel.com>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 09, 2019 at 01:46:00PM -0500, richard.gong@linux.intel.com wrote:
> +static ssize_t reboot_image_store(struct device *dev,
> +				  struct device_attribute *attr,
> +				  const char *buf, size_t count)
> +{
> +	struct stratix10_rsu_priv *priv = dev_get_drvdata(dev);
> +	unsigned long address;
> +	int ret;
> +
> +	if (priv == 0)
> +		return -ENODEV;
> +
> +	ret = kstrtoul(buf, 0, &address);
> +	if (ret)
> +		return ret;
> +
> +	rsu_send_msg(priv, COMMAND_RSU_UPDATE,
> +			address, rsu_update_callback);
> +
> +	return count;
> +}

No error checking that the value was a sane one?  That this message
actually worked?  I can write any random number in here and have no
error happen at all?  Nice!  :(

> +static ssize_t notify_store(struct device *dev,
> +			    struct device_attribute *attr,
> +			    const char *buf, size_t count)
> +{
> +	struct stratix10_rsu_priv *priv = dev_get_drvdata(dev);
> +	unsigned long status;
> +	int ret;
> +
> +	if (priv == 0)
> +		return -ENODEV;
> +
> +	ret = kstrtoul(buf, 0, &status);
> +	if (ret)
> +		return ret;
> +
> +	rsu_send_msg(priv, COMMAND_RSU_NOTIFY,
> +			status, rsu_notify_callback);
> +
> +	return count;
> +}

Same comment here.

> +
> +static DEVICE_ATTR_RO(current_image);
> +static DEVICE_ATTR_RO(fail_image);
> +static DEVICE_ATTR_RO(state);
> +static DEVICE_ATTR_RO(version);
> +static DEVICE_ATTR_RO(error_location);
> +static DEVICE_ATTR_RO(error_details);
> +static DEVICE_ATTR_WO(reboot_image);
> +static DEVICE_ATTR_WO(notify);
> +
> +static struct attribute *attrs[] = {
> +	&dev_attr_current_image.attr,
> +	&dev_attr_fail_image.attr,
> +	&dev_attr_state.attr,
> +	&dev_attr_version.attr,
> +	&dev_attr_error_location.attr,
> +	&dev_attr_error_details.attr,
> +	&dev_attr_reboot_image.attr,
> +	&dev_attr_notify.attr,
> +	NULL
> +};
> +
> +static struct attribute_group attr_group = {
> +	.attrs = attrs
> +};

ATTRIBUTE_GROUP()?

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
> +							 SVC_CLIENT_RSU);
> +	if (IS_ERR(priv->chan)) {
> +		dev_err(dev, "couldn't get service channel (%s)\n",
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
> +		dev_err(dev, "Error getting RSU status (%i)\n", ret);
> +		stratix10_svc_free_channel(priv->chan);
> +		return ret;
> +	}
> +
> +	ret = sysfs_create_group(&dev->kobj, &attr_group);

Why not add this to the device earlier so that the driver core creates
it all for your automatically?

Or does platform devices not do this?  I can never remember...

> +	if (ret)
> +		stratix10_svc_free_channel(priv->chan);
> +
> +	pr_info("Intel RSU Driver Initialized\n");

Don't be noisy, if all goes well, never say anything.

thanks,

greg k-h
