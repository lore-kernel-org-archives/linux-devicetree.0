From: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v7] media: i2c: add support for omnivision's ov2659 sensor
Date: Thu, 19 Mar 2015 00:13:17 +0200
Message-ID: <5509F87D.9060603@linux.intel.com>
References: <1426628910-11927-1-git-send-email-prabhakar.csengg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426628910-11927-1-git-send-email-prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lad Prabhakar <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Cc: LMML <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Prabhakar,

Lad Prabhakar wrote:
...
> +static int ov2659_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct ov2659 *ov2659 =
> +			container_of(ctrl->handler, struct ov2659, ctrls);
> +	struct v4l2_mbus_framefmt *fmt = &ov2659->format;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_PIXEL_RATE:
> +		if (fmt->code != MEDIA_BUS_FMT_SBGGR8_1X8)
> +			ov2659->link_frequency->val =
> +					ov2659->pdata->link_frequency / 2;
> +		else
> +			ov2659->link_frequency->val =
> +					ov2659->pdata->link_frequency;

You should simply use v4l2_ctrl_s_ctrl_int64() in ..._set_fmt() as this 
isn't really a proper volatile control, but its value depends on the format.

-- 
Sakari Ailus
sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
