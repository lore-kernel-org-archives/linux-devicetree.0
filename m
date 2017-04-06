From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: Re: [PATCH] [media] imx: csi: retain current field order and
 colorimetry setting as default
Date: Thu, 6 Apr 2017 16:20:21 +0200
Message-ID: <0f9690f8-c7f6-59ff-9e3e-123af9972d4b@xs4all.nl>
References: <1490661656-10318-1-git-send-email-steve_longerbeam@mentor.com>
 <1490661656-10318-22-git-send-email-steve_longerbeam@mentor.com>
 <1491486929.2392.29.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1491486929.2392.29.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel@driverdev
List-Id: devicetree@vger.kernel.org

On 04/06/2017 03:55 PM, Philipp Zabel wrote:
> If the the field order is set to ANY in set_fmt, choose the currently
> set field order. If the colorspace is set to DEFAULT, choose the current
> colorspace.  If any of xfer_func, ycbcr_enc or quantization are set to
> DEFAULT, either choose the current setting, or the default setting for the
> new colorspace, if non-DEFAULT colorspace was given.
> 
> This allows to let field order and colorimetry settings be propagated
> from upstream by calling media-ctl on the upstream entity source pad,
> and then call media-ctl on the sink pad to manually set the input frame
> interval, without changing the already set field order and colorimetry
> information.
> 
> Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
> This is based on imx-media-staging-md-v14, and it is supposed to allow
> configuring the pipeline with media-ctl like this:
> 
> 1) media-ctl --set-v4l2 "'tc358743 1-000f':0[fmt:UYVY8_1X16/1920x1080]"
> 2) media-ctl --set-v4l2 "'imx6-mipi-csi2':1[fmt:UYVY8_1X16/1920x108]"
> 3) media-ctl --set-v4l2 "'ipu1_csi0_mux':2[fmt:UYVY8_1X16/1920x1080]"
> 4) media-ctl --set-v4l2 "'ipu1_csi0':0[fmt:UYVY8_1X16/1920x1080@1/60]"
> 5) media-ctl --set-v4l2 "'ipu1_csi0':2[fmt:AYUV32/1920x1080@1/30]"
> 
> Without having step 4) overwrite the colorspace and field order set on
> 'ipu1_csi0':0 by the propagation in step 3).
> ---
>  drivers/staging/media/imx/imx-media-csi.c | 34 +++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
> index 64dc454f6b371..d94ce1de2bf05 100644
> --- a/drivers/staging/media/imx/imx-media-csi.c
> +++ b/drivers/staging/media/imx/imx-media-csi.c
> @@ -1325,6 +1325,40 @@ static int csi_set_fmt(struct v4l2_subdev *sd,
>  	csi_try_fmt(priv, sensor, cfg, sdformat, crop, compose, &cc);
>  
>  	fmt = __csi_get_fmt(priv, cfg, sdformat->pad, sdformat->which);
> +
> +	/* Retain current field setting as default */
> +	if (sdformat->format.field == V4L2_FIELD_ANY)
> +		sdformat->format.field = fmt->field;

sdformat->format.field should never be FIELD_ANY. If it is, then that's a
subdev bug and I'm pretty sure FIELD_NONE was intended.

> +
> +	/* Retain current colorspace setting as default */
> +	if (sdformat->format.colorspace == V4L2_COLORSPACE_DEFAULT) {
> +		sdformat->format.colorspace = fmt->colorspace;

No! Subdevs should never return COLORSPACE_DEFAULT. If they do, then fix
them. If this happens a lot (I'm not sure how reliably subdevs fill this
in) you could set it to COLORSPACE_RAW. Perhaps with a WARN_ON_ONCE.

> +		if (sdformat->format.xfer_func == V4L2_XFER_FUNC_DEFAULT)
> +			sdformat->format.xfer_func = fmt->xfer_func;
> +		if (sdformat->format.ycbcr_enc == V4L2_YCBCR_ENC_DEFAULT)
> +			sdformat->format.ycbcr_enc = fmt->ycbcr_enc;
> +		if (sdformat->format.quantization == V4L2_QUANTIZATION_DEFAULT)
> +			sdformat->format.quantization = fmt->quantization;

Nack. This is meaningless.

> +	} else {
> +		if (sdformat->format.xfer_func == V4L2_XFER_FUNC_DEFAULT) {
> +			sdformat->format.xfer_func =
> +				V4L2_MAP_XFER_FUNC_DEFAULT(
> +						sdformat->format.colorspace);
> +		}
> +		if (sdformat->format.ycbcr_enc == V4L2_YCBCR_ENC_DEFAULT) {
> +			sdformat->format.ycbcr_enc =
> +				V4L2_MAP_YCBCR_ENC_DEFAULT(
> +						sdformat->format.colorspace);
> +		}
> +		if (sdformat->format.quantization == V4L2_QUANTIZATION_DEFAULT) {
> +			sdformat->format.quantization =
> +				V4L2_MAP_QUANTIZATION_DEFAULT(
> +						cc->cs != IPUV3_COLORSPACE_YUV,
> +						sdformat->format.colorspace,
> +						sdformat->format.ycbcr_enc);
> +		}

This isn't wrong, but it is perfectly fine to keep the DEFAULT here and let
the application call V4L2_MAP_.

I get the feeling this patch is a workaround for subdev errors. Either that,
or the commit log doesn't give me enough information to really understand the
problem that's being addressed here.

Regards,

	Hans

> +	}
> +
>  	*fmt = sdformat->format;
>  
>  	if (sdformat->pad == CSI_SINK_PAD) {
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
