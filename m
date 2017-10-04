From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH v7 2/2] media:imx274 V4l2 driver for Sony imx274 CMOS
 sensor
Date: Wed, 4 Oct 2017 16:14:52 +0300
Message-ID: <20171004131452.6yjaa57xr56v6jza@valkosipuli.retiisi.org.uk>
References: <20171002202649.10897-1-leonl@leopardimaging.com>
 <20171002202649.10897-2-leonl@leopardimaging.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171002202649.10897-2-leonl-+iDsysdzPxZTt5vwKEO50dBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leon Luo <leonl-+iDsysdzPxZTt5vwKEO50dBPR1lH4CV8@public.gmane.org>
Cc: mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Leon,

One more question below.

On Mon, Oct 02, 2017 at 01:26:49PM -0700, Leon Luo wrote:
...
> +/*
> + * imx274_set_frame_interval - Function called when setting frame interval
> + * @priv: Pointer to device structure
> + * @frame_interval: Variable for frame interval
> + *
> + * Change frame interval by updating VMAX value
> + * The caller should hold the mutex lock imx274->lock if necessary
> + *
> + * Return: 0 on success
> + */
> +static int imx274_set_frame_interval(struct stimx274 *priv,
> +				     struct v4l2_fract frame_interval)
> +{
> +	int err;
> +	u32 frame_length, req_frame_rate;
> +	u16 svr;
> +	u16 hmax;
> +	u8 reg_val[2];
> +
> +	dev_dbg(&priv->client->dev, "%s: input frame interval = %d / %d",
> +		__func__, frame_interval.numerator,
> +		frame_interval.denominator);
> +
> +	if (frame_interval.denominator == 0) {

Shouldn't this be numerator? If numerator is 0, then there will be division
by zero below.

> +		err = -EINVAL;
> +		goto fail;
> +	}
> +
> +	req_frame_rate = (u32)(frame_interval.denominator
> +				/ frame_interval.numerator);
> +
> +	/* boundary check */
> +	if (req_frame_rate > max_frame_rate[priv->mode_index]) {
> +		frame_interval.numerator = 1;
> +		frame_interval.denominator =
> +					max_frame_rate[priv->mode_index];
> +	} else if (req_frame_rate < IMX274_MIN_FRAME_RATE) {
> +		frame_interval.numerator = 1;
> +		frame_interval.denominator = IMX274_MIN_FRAME_RATE;
> +	}
> +
> +	/*
> +	 * VMAX = 1/frame_rate x 72M / (SVR+1) / HMAX
> +	 * frame_length (i.e. VMAX) = (frame_interval) x 72M /(SVR+1) / HMAX
> +	 */
> +
> +	/* SVR */
> +	err = imx274_read_reg(priv, IMX274_SVR_REG_LSB, &reg_val[0]);
> +	if (err)
> +		goto fail;
> +	err = imx274_read_reg(priv, IMX274_SVR_REG_MSB, &reg_val[1]);
> +	if (err)
> +		goto fail;
> +	svr = (reg_val[1] << IMX274_SHIFT_8_BITS) + reg_val[0];
> +	dev_dbg(&priv->client->dev,
> +		"%s : register SVR = %d\n", __func__, svr);
> +
> +	/* HMAX */
> +	err = imx274_read_reg(priv, IMX274_HMAX_REG_LSB, &reg_val[0]);
> +	if (err)
> +		goto fail;
> +	err = imx274_read_reg(priv, IMX274_HMAX_REG_MSB, &reg_val[1]);
> +	if (err)
> +		goto fail;
> +	hmax = (reg_val[1] << IMX274_SHIFT_8_BITS) + reg_val[0];
> +	dev_dbg(&priv->client->dev,
> +		"%s : register HMAX = %d\n", __func__, hmax);
> +
> +	frame_length = IMX274_PIXCLK_CONST1 / (svr + 1) / hmax
> +					* frame_interval.numerator
> +					/ frame_interval.denominator;
> +
> +	err = imx274_set_frame_length(priv, frame_length);
> +	if (err)
> +		goto fail;
> +
> +	priv->frame_interval = frame_interval;
> +	return 0;
> +
> +fail:
> +	dev_err(&priv->client->dev, "%s error = %d\n", __func__, err);
> +	return err;
> +}

-- 
Regards,

Sakari Ailus
e-mail: sakari.ailus-X3B1VOXEql0@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
