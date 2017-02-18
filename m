From: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 29/36] media: imx: mipi-csi2: enable setting and
 getting of frame rates
Date: Fri, 17 Feb 2017 17:12:44 -0800
Message-ID: <24d42948-a77d-445f-e3e9-ab595b0cfc3e@gmail.com>
References: <1487211578-11360-1-git-send-email-steve_longerbeam@mentor.com>
 <1487211578-11360-30-git-send-email-steve_longerbeam@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1487211578-11360-30-git-send-email-steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 02/15/2017 06:19 PM, Steve Longerbeam wrote:
> From: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
>
> Setting and getting frame rates is part of the negotiation mechanism
> between subdevs.  The lack of support means that a frame rate at the
> sensor can't be negotiated through the subdev path.
>
> Add support at MIPI CSI2 level for handling this part of the
> negotiation.
>
> Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
> Signed-off-by: Steve Longerbeam <steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>


Hi Russell,

I signed-off on this but after more review I'm not sure this is right.

The CSI-2 receiver really has no control over frame rate. It's output
frame rate is the same as the rate that is delivered to it.

So this subdev should either not implement these ops, or it should
refer them to the attached source subdev.

Steve

> ---
>  drivers/staging/media/imx/imx6-mipi-csi2.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
> index 23dca80..c62f14e 100644
> --- a/drivers/staging/media/imx/imx6-mipi-csi2.c
> +++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
> @@ -34,6 +34,7 @@ struct csi2_dev {
>  	struct v4l2_subdev      sd;
>  	struct media_pad       pad[CSI2_NUM_PADS];
>  	struct v4l2_mbus_framefmt format_mbus;
> +	struct v4l2_fract      frame_interval;
>  	struct clk             *dphy_clk;
>  	struct clk             *cfg_clk;
>  	struct clk             *pix_clk; /* what is this? */
> @@ -397,6 +398,30 @@ static int csi2_set_fmt(struct v4l2_subdev *sd,
>  	return 0;
>  }
>
> +static int csi2_g_frame_interval(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_frame_interval *fi)
> +{
> +	struct csi2_dev *csi2 = sd_to_dev(sd);
> +
> +	fi->interval = csi2->frame_interval;
> +
> +	return 0;
> +}
> +
> +static int csi2_s_frame_interval(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_frame_interval *fi)
> +{
> +	struct csi2_dev *csi2 = sd_to_dev(sd);
> +
> +	/* Output pads mirror active input pad, no limits on input pads */
> +	if (fi->pad != CSI2_SINK_PAD)
> +		fi->interval = csi2->frame_interval;
> +
> +	csi2->frame_interval = fi->interval;
> +
> +	return 0;
> +}
> +
>  /*
>   * retrieve our pads parsed from the OF graph by the media device
>   */
> @@ -430,6 +455,8 @@ static struct v4l2_subdev_core_ops csi2_core_ops = {
>
>  static struct v4l2_subdev_video_ops csi2_video_ops = {
>  	.s_stream = csi2_s_stream,
> +	.g_frame_interval = csi2_g_frame_interval,
> +	.s_frame_interval = csi2_s_frame_interval,
>  };
>
>  static struct v4l2_subdev_pad_ops csi2_pad_ops = {
>

-- 
Steve Longerbeam | Senior Embedded Engineer, ESD Services
Mentor Embedded(tm) | 46871 Bayside Parkway, Fremont, CA 94538
P 510.354.5838 | M 408.410.2735
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
