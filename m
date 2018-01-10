From: jacopo mondi <jacopo-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 2/4] media: ov5695: add support for OV5695 sensor
Date: Wed, 10 Jan 2018 10:08:36 +0100
Message-ID: <20180110090836.GB6834@w540>
References: <1515549967-5302-1-git-send-email-zhengsq@rock-chips.com>
 <1515549967-5302-3-git-send-email-zhengsq@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1515549967-5302-3-git-send-email-zhengsq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shunqian Zheng <zhengsq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ddl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Shunqian,

On Wed, Jan 10, 2018 at 10:06:05AM +0800, Shunqian Zheng wrote:

[snip]

> +static int __ov5695_start_stream(struct ov5695 *ov5695)
> +{
> +	int ret;
> +
> +	ret = ov5695_write_array(ov5695->client, ov5695_global_regs);
> +	if (ret)
> +		return ret;
> +	ret = ov5695_write_array(ov5695->client, ov5695->cur_mode->reg_list);
> +	if (ret)
> +		return ret;
> +
> +	/* In case these controls are set before streaming */
> +	ret = __v4l2_ctrl_handler_setup(&ov5695->ctrl_handler);
> +	if (ret)
> +		return ret;
> +
> +	return ov5695_write_reg(ov5695->client, OV5695_REG_CTRL_MODE,
> +				OV5695_REG_VALUE_08BIT, OV5695_MODE_STREAMING);
> +}
> +
> +static int __ov5695_stop_stream(struct ov5695 *ov5695)
> +{
> +	return ov5695_write_reg(ov5695->client, OV5695_REG_CTRL_MODE,
> +				OV5695_REG_VALUE_08BIT, OV5695_MODE_SW_STANDBY);
> +}
> +
> +static int ov5695_s_stream(struct v4l2_subdev *sd, int on)
> +{
> +	struct ov5695 *ov5695 = to_ov5695(sd);
> +	struct i2c_client *client = ov5695->client;
> +	int ret = 0;
> +
> +	mutex_lock(&ov5695->mutex);
> +	on = !!on;
> +	if (on == ov5695->streaming)
> +		goto unlock_and_return;
> +
> +	if (on) {
> +		ret = pm_runtime_get_sync(&client->dev);
> +		if (ret < 0) {
> +			pm_runtime_put_noidle(&client->dev);
> +			goto unlock_and_return;
> +		}
> +
> +		ret = __ov5695_start_stream(ov5695);
> +		if (ret) {
> +			v4l2_err(sd, "start stream failed while write regs\n");
> +			pm_runtime_put(&client->dev);
> +			goto unlock_and_return;
> +		}
> +	} else {
> +		__ov5695_stop_stream(ov5695);
> +		ret = pm_runtime_put(&client->dev);

I would return the result of __ov5695_stop_stream() instead of
pm_runtime_put().

I know I asked for this, but if the first s_stream(0) fails, the
sensor may not have been stopped but the interface will be put in
"streaming = 0" state, preventing a second s_stream(0) to be issued
because of your check "on == ov5695->streaming" a few lines above.

I can't tell how bad this is. Imho is acceptable but I would like to
hear someone else opinion here :)

> +	}
> +
> +	ov5695->streaming = on;
> +
> +unlock_and_return:
> +	mutex_unlock(&ov5695->mutex);
> +
> +	return ret;
> +}
> +
> +

[snip]

> +static const struct of_device_id ov5695_of_match[] = {
> +	{ .compatible = "ovti,ov5695" },
> +	{},
> +};

If you don't list CONFIG_OF as a dependecy for this driver (which you
should not imho), please guard this with:

#if IS_ENABLED(CONFIG_OF)

#endif

> +
> +static struct i2c_driver ov5695_i2c_driver = {
> +	.driver = {
> +		.name = "ov5695",
> +		.owner = THIS_MODULE,
> +		.pm = &ov5695_pm_ops,
> +		.of_match_table = ov5695_of_match
> +	},
> +	.probe		= &ov5695_probe,
> +	.remove		= &ov5695_remove,
> +};
> +
> +module_i2c_driver(ov5695_i2c_driver);
> +
> +MODULE_DESCRIPTION("OmniVision ov5695 sensor driver");
> +MODULE_LICENSE("GPL v2");

As you've fixed my comments on v1, and with the above bits addressed:

Reviewed-by: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>

Thanks
   j

> --
> 1.9.1
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
