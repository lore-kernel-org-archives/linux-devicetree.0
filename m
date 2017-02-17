From: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 18/36] media: Add i.MX media core driver
Date: Thu, 16 Feb 2017 17:33:14 -0800
Message-ID: <c22dfd68-a41c-08d2-4b8d-c7ee1884ea31@gmail.com>
References: <1487211578-11360-1-git-send-email-steve_longerbeam@mentor.com>
 <1487211578-11360-19-git-send-email-steve_longerbeam@mentor.com>
 <1487250123.2377.53.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1487250123.2377.53.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 02/16/2017 05:02 AM, Philipp Zabel wrote:
> On Wed, 2017-02-15 at 18:19 -0800, Steve Longerbeam wrote:
<snip>
>> +
>> +- Clean up and move the ov5642 subdev driver to drivers/media/i2c, and
>> +  create the binding docs for it.
>
> This is done already, right?


I cleaned up ov5640 and moved it to drivers/media/i2c with binding docs,
but not the ov5642 yet.


>
>> +- The Frame Interval Monitor could be exported to v4l2-core for
>> +  general use.
>> +
>> +- The subdev that is the original source of video data (referred to as
>> +  the "sensor" in the code), is called from various subdevs in the
>> +  pipeline in order to set/query the video standard ({g|s|enum}_std)
>> +  and to get/set the original frame interval from the capture interface
>> +  ([gs]_parm). Instead, the entities that need this info should call its
>> +  direct neighbor, and the neighbor should propagate the call to its
>> +  neighbor in turn if necessary.
>
> Especially the [gs]_parm fix is necessary to present userspace with the
> correct frame interval in case of frame skipping in the CSI.


Right, understood. I've added this to list of fixes for version 5.

What a pain though! It means propagating every call to g_frame_interval
upstream until a subdev "that cares" returns ret == 0 or
ret != -ENOIOCTLCMD. And that goes for any other chained subdev call
as well.

I've thought of writing something like a v4l2_chained_subdev_call()
macro to do this, but it would be a big macro.





>
>> +- At driver load time, the device-tree node that is the original source
>> +  (the "sensor"), is parsed to record its media bus configuration, and
>> +  this info is required in various subdevs to setup the pipeline.
>> +  Laurent Pinchart argues that instead the subdev should call its
>> +  neighbor's g_mbus_config op (which should be propagated if necessary)
>> +  to get this info. However Hans Verkuil is planning to remove the
>> +  g_mbus_config op. For now this driver uses the parsed DT mbus config
>> +  method until this issue is resolved.
>> +
>> diff --git a/drivers/staging/media/imx/imx-media-dev.c b/drivers/staging/media/imx/imx-media-dev.c
>> new file mode 100644
>> index 0000000..e2041ad
>> --- /dev/null
>> +++ b/drivers/staging/media/imx/imx-media-dev.c
> [...]
>> +static inline u32 pixfmt_to_colorspace(const struct imx_media_pixfmt *fmt)
>> +{
>> +	return (fmt->cs == IPUV3_COLORSPACE_RGB) ?
>> +		V4L2_COLORSPACE_SRGB : V4L2_COLORSPACE_SMPTE170M;
>> +}
>
> This ...
>
> [...]
>> +int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
>> +				  struct v4l2_mbus_framefmt *mbus,
>> +				  const struct imx_media_pixfmt *cc)
>> +{
>> +	u32 stride;
>> +
>> +	if (!cc) {
>> +		cc = imx_media_find_format(0, mbus->code, true, false);
>> +		if (!cc)
>> +			return -EINVAL;
>> +	}
>> +
>> +	stride = cc->planar ? mbus->width : (mbus->width * cc->bpp) >> 3;
>> +
>> +	pix->width = mbus->width;
>> +	pix->height = mbus->height;
>> +	pix->pixelformat = cc->fourcc;
>> +	pix->colorspace = pixfmt_to_colorspace(cc);
>
> ... is not right. The colorspace should be taken from the input pad
> colorspace everywhere (except for the IC output pad in the future, once
> that supports changing YCbCr encoding and quantization), not guessed
> based on the media bus format.

Ok, will fix this to assign pix->colorspace to mbus->colorspace, after
all the subdevs assign colorspace values to their pads.


Steve

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
