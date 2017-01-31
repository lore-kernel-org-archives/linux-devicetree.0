From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v3 17/24] media: imx: Add CSI subdev driver
Date: Tue, 31 Jan 2017 16:51:22 +0100
Message-ID: <1485877882.2932.70.camel@pengutronix.de>
References: <1483755102-24785-1-git-send-email-steve_longerbeam@mentor.com>
         <1483755102-24785-18-git-send-email-steve_longerbeam@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1483755102-24785-18-git-send-email-steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Steve Longerbeam <steve_longerbeam@me>
List-Id: devicetree@vger.kernel.org

On Fri, 2017-01-06 at 18:11 -0800, Steve Longerbeam wrote:
[...]
> +static int csi_set_fmt(struct v4l2_subdev *sd,
> +		       struct v4l2_subdev_pad_config *cfg,
> +		       struct v4l2_subdev_format *sdformat)
> +{
> +	struct csi_priv *priv = v4l2_get_subdevdata(sd);
> +	struct v4l2_mbus_framefmt *infmt, *outfmt;
> +	struct v4l2_rect crop;
> +	int ret;
> +
> +	if (sdformat->pad >= CSI_NUM_PADS)
> +		return -EINVAL;
> +
> +	if (priv->stream_on)
> +		return -EBUSY;
> +
> +	infmt = &priv->format_mbus[priv->input_pad];
> +	outfmt = &priv->format_mbus[priv->output_pad];
> +
> +	if (sdformat->pad == priv->output_pad) {
> +		sdformat->format.code = infmt->code;
> +		sdformat->format.field = infmt->field;
> +		crop.left = priv->crop.left;
> +		crop.top = priv->crop.top;
> +		crop.width = sdformat->format.width;
> +		crop.height = sdformat->format.height;
> +		ret = csi_try_crop(priv, &crop);

This is the wrong way around, see also below.

Here the the output sdformat->format.width/height should be set to the
priv->crop.width/height (or priv->crop.width/height / 2, to enable
downscaling). The crop rectangle should not be changed by an output pad
set_fmt.

> +		if (ret)
> +			return ret;
> +		sdformat->format.width = crop.width;
> +		sdformat->format.height = crop.height;
> +	}
> +
> +	if (sdformat->which == V4L2_SUBDEV_FORMAT_TRY) {
> +		cfg->try_fmt = sdformat->format;
> +	} else {
> +		priv->format_mbus[sdformat->pad] = sdformat->format;
> +		/* Update the crop window if this is output pad  */
> +		if (sdformat->pad == priv->output_pad)
> +			priv->crop = crop;

The crop rectangle instead should be reset to the full input frame when
the input pad format is set.

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
