From: Jose Abreu <Jose.Abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v4 1/4] [media] platform: Add Synopsys Designware HDMI RX
 PHY e405 Driver
Date: Mon, 26 Jun 2017 17:46:40 +0100
Message-ID: <8e66df79-64dd-5a1b-4c30-77bf971e92cf@synopsys.com>
References: <cover.1497978962.git.joabreu@synopsys.com>
 <83bcf6996bfce22948df7963ddfe3c0cb56b96dc.1497978962.git.joabreu@synopsys.com>
 <eea50b14-73f2-ed7f-3928-2c394af02259@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <eea50b14-73f2-ed7f-3928-2c394af02259-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sylwester Nawrocki <snawrocki-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jose Abreu <Jose.Abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Carlos Palminha <CARLOS.PALMINHA-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Sylwester,


On 25-06-2017 22:13, Sylwester Nawrocki wrote:
> Hi Jose,
>
> Thank you for addressing my review comments. Couple more suggestions below.
>
> On 06/20/2017 07:26 PM, Jose Abreu wrote:
>> This adds support for the Synopsys Designware HDMI RX PHY e405. This
>> phy receives and decodes HDMI video that is delivered to a controller.
>> +static int dw_phy_config(struct dw_phy_dev *dw_dev, unsigned char color_depth,
>> +		bool hdmi2, bool scrambling)
>> +{
>> +	phy_reset(dw_dev, 1);
>> +	phy_pddq(dw_dev, 1);
>> +	phy_svsmode(dw_dev, 1);
>> +
>> +	phy_zcal_reset(dw_dev);
>> +	do {
>> +		udelay(1000);
> Could be mdelay(1) or better e.g. usleep_range(1000, 1100);

Ok.

>
>> +		zcal_done = phy_zcal_done(dw_dev);
>> +	} while (!zcal_done && timeout--);
>> +
>> +	if (!zcal_done) {
>> +		dev_err(dw_dev->dev, "Zcal calibration failed\n");
>> +		return -ETIMEDOUT;
>> +	}
>> +	return 0;
>> +}
>> +static int dw_phy_probe(struct platform_device *pdev)
>> +{
>> +	struct dw_phy_pdata *pdata = pdev->dev.platform_data;
>> +	struct device *dev = &pdev->dev;
>> +	struct dw_phy_dev *dw_dev;
>> +	struct v4l2_subdev *sd;
>> +	int ret;
>> +
>> +	dev_dbg(dev, "probe start\n");
>> +
>> +	/* Resource allocation */
> This comment is not needed.
>
>> +	dw_dev = devm_kzalloc(dev, sizeof(*dw_dev), GFP_KERNEL);
>> +	if (!dw_dev)
>> +		return -ENOMEM;
>> +
>> +	/* Resource initialization */
> Ditto.

Ok.

>
>> +	if (!pdata) {
>> +		dev_err(dev, "no platform data suplied\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	dw_dev->dev = dev;
>> +	dw_dev->config = pdata;
>> +	dw_dev->version = 405;
> How about storing the version number in the dw_hdmi_phy_e405_id[] table
> and retrieving it here with of_device_get_match_data() ?

Yeah, seems nice :)

>
>> +	mutex_init(&dw_dev->lock);
>> +
>> +	/* Get config clock value */
> The comment is not needed, it's clear from the code we are getting the clock 
> and its rate.

Ok.

>
>> +	dw_dev->clk = devm_clk_get(dev, "cfg-clk");
> As Rob suggested, it would be good to change name of the clock to just "cfg".

Yes, I will change.

>
>> +	if (IS_ERR(dw_dev->clk)) {
>> +		dev_err(dev, "failed to get cfg-clk\n");
>> +		return PTR_ERR(dw_dev->clk);
>> +	}
>> +
>> +	ret = clk_prepare_enable(dw_dev->clk);
>> +	if (ret) {
>> +		dev_err(dev, "failed to enable cfg-clk\n");
>> +		return ret;
>> +	}
>> +
>> +	dw_dev->cfg_clk = clk_get_rate(dw_dev->clk) / 1000000;
> 1000000U ?

Ok.

>
>> +	if (!dw_dev->cfg_clk) {
>> +		dev_err(dev, "invalid cfg-clk frequency\n");> +		ret = -EINVAL;
>> +		goto err_clk;
>> +	}
>> +
>> +	/* V4L2 initialization */
>> +	sd = &dw_dev->sd;
>> +	v4l2_subdev_init(sd, &dw_phy_sd_ops);
>> +	strlcpy(sd->name, dev_name(dev), sizeof(sd->name));
>> +	sd->dev = dev;
>> +
>> +	/* Force phy disabling */
>> +	dw_dev->phy_enabled = true;
>> +	dw_phy_disable(dw_dev);
>> +
>> +	/* Register subdev */
>> +	ret = v4l2_async_register_subdev(sd);
>> +	if (ret) {
>> +		dev_err(dev, "failed to register subdev\n");
>> +		goto err_clk;
>> +	}
>> +
>> +	/* All done */
> Superfluous comment.

Ok.

>
>> +	dev_set_drvdata(dev, sd);
>> +	dev_info(dev, "driver probed (cfg-clk=%d)\n", dw_dev->cfg_clk);
> This should be at dev_dbg() level.

Ok.

>
>> +	return 0;
>> +
>> +err_clk:
>> +	clk_disable_unprepare(dw_dev->clk);
>> +	return ret;
>> +}
>> +
>> +static int dw_phy_remove(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
> The assignment here could be dropped and &pdev->dev used directly below.

Ok.

>
>> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>> +	struct dw_phy_dev *dw_dev = to_dw_dev(sd);
>> +
>> +	v4l2_async_unregister_subdev(sd);
>> +	clk_disable_unprepare(dw_dev->clk);
>> +	dev_info(dev, "driver removed\n");
> This should be at dev_dbg() level or dropped entirely.

Ok.

Thanks for the review!

Best regards,
Jose Miguel Abreu
>
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id dw_hdmi_phy_e405_id[] = {
>> +	{ .compatible = "snps,dw-hdmi-phy-e405" },
>> +	{ },
>> +};
>> +MODULE_DEVICE_TABLE(of, dw_hdmi_phy_e405_id);
> --
> Regards,
> Sylwester

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
