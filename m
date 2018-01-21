From: jacopo mondi <jacopo-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/2] v4l2: i2c: ov7670: Implement OF mbus configuration
Date: Sun, 21 Jan 2018 10:58:16 +0100
Message-ID: <20180121095816.GM24926@w540>
References: <1515779808-21420-1-git-send-email-jacopo+renesas@jmondi.org>
 <1515779808-21420-3-git-send-email-jacopo+renesas@jmondi.org>
 <20180118222648.kfam634qyy4eu2ed@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180118222648.kfam634qyy4eu2ed-S+BSfZ9RZZmRSg0ZkenSGLdO1Tsj/99ntUK59QYPAWc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Cc: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>, corbet-T1hC0tSOHrs@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Sakari,

On Fri, Jan 19, 2018 at 12:26:48AM +0200, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Fri, Jan 12, 2018 at 06:56:48PM +0100, Jacopo Mondi wrote:

[snip]

> > +static int ov7670_parse_dt(struct device *dev,
> > +			   struct ov7670_info *info)
> > +{
> > +	struct fwnode_handle *fwnode = dev_fwnode(dev);
> > +	struct v4l2_fwnode_endpoint bus_cfg;
> > +	struct fwnode_handle *ep;
> > +	int ret;
> > +
> > +	if (!fwnode)
> > +		return -EINVAL;
> > +
> > +	info->pclk_hb_disable = false;
> > +	if (fwnode_property_present(fwnode, "ov7670,pclk-hb-disable"))
> > +		info->pclk_hb_disable = true;
> > +
> > +	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
> > +	if (!ep) {
> > +		fwnode_handle_put(fwnode);
>
> You haven't acquired a reference to fwnode, therefore you musn't put it.
>

Oh, converting from OF to fwnode_handle doesn't increase reference
count, you're right. That makes error path even nicer :)


> Looks fine otherwise.
>

With that small fix can I have you're Reviewed-by? (The same goes for
bindings patch).

Thanks
   j

> > +		return -EINVAL;
> > +	}
> > +
> > +	ret = v4l2_fwnode_endpoint_parse(ep, &bus_cfg);
> > +	if (ret)
> > +		goto error_put_fwnodes;
> > +
> > +	if (bus_cfg.bus_type != V4L2_MBUS_PARALLEL) {
> > +		dev_err(dev, "Unsupported media bus type\n");
> > +		ret = -EINVAL;
> > +		goto error_put_fwnodes;
> > +	}
> > +	info->mbus_config = bus_cfg.bus.parallel.flags;
> > +
> > +error_put_fwnodes:
> > +	fwnode_handle_put(ep);
> > +	fwnode_handle_put(fwnode);
> > +
> > +	return ret;
> > +}
> > +
> >  static int ov7670_probe(struct i2c_client *client,
> >  			const struct i2c_device_id *id)
> >  {
> > @@ -1678,7 +1749,13 @@ static int ov7670_probe(struct i2c_client *client,
> >  #endif
> >
> >  	info->clock_speed = 30; /* default: a guess */
> > -	if (client->dev.platform_data) {
> > +
> > +	if (dev_fwnode(&client->dev)) {
> > +		ret = ov7670_parse_dt(&client->dev, info);
> > +		if (ret)
> > +			return ret;
> > +
> > +	} else if (client->dev.platform_data) {
> >  		struct ov7670_config *config = client->dev.platform_data;
> >
> >  		/*
> > @@ -1745,9 +1822,6 @@ static int ov7670_probe(struct i2c_client *client,
> >  	tpf.denominator = 30;
> >  	info->devtype->set_framerate(sd, &tpf);
> >
> > -	if (info->pclk_hb_disable)
> > -		ov7670_write(sd, REG_COM10, COM10_PCLK_HB);
> > -
> >  	v4l2_ctrl_handler_init(&info->hdl, 10);
> >  	v4l2_ctrl_new_std(&info->hdl, &ov7670_ctrl_ops,
> >  			V4L2_CID_BRIGHTNESS, 0, 255, 1, 128);
> > --
> > 2.7.4
> >
>
> --
> Sakari Ailus
> e-mail: sakari.ailus-X3B1VOXEql0@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
