From: Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>
Subject: Re: [Patch v6 3/3] media: ti-vpe: Add CAL v4l2 camera capture driver
Date: Fri, 19 Feb 2016 13:21:48 -0600
Message-ID: <20160219192147.GJ1380@ti.com>
References: <1452123446-5424-1-git-send-email-bparrot@ti.com>
 <1452123446-5424-4-git-send-email-bparrot@ti.com>
 <20160219145423.49aaa0b9@recife.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160219145423.49aaa0b9-+RedX5hVuTR+urZeOPWqwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Cc: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Mauro,

Thanks for the proposed fix.
But I decided to fix it in a different way.
I'll send a patch shortly.

Regards,
Benoit

Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org> wrote on Fri [2016-Feb-19 14:54:23 -0200]:
> Em Wed, 6 Jan 2016 17:37:26 -0600
> Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org> escreveu:
> 
> > The Camera Adaptation Layer (CAL) is a block which consists of a dual
> > port CSI2/MIPI camera capture engine.
> > Port #0 can handle CSI2 camera connected to up to 4 data lanes.
> > Port #1 can handle CSI2 camera connected to up to 2 data lanes.
> > The driver implements the required API/ioctls to be V4L2 compliant.
> > Driver supports the following:
> >     - V4L2 API using DMABUF/MMAP buffer access based on videobuf2 api
> >     - Asynchronous sensor sub device registration
> >     - DT support
> > 
> > Signed-off-by: Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>
> > Signed-off-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
> > ---
> 
> ...
> 
> > +/* timeperframe is arbitrary and continuous */
> > +static int cal_enum_frameintervals(struct file *file, void *priv,
> > +				   struct v4l2_frmivalenum *fival)
> > +{
> > +	struct cal_ctx *ctx = video_drvdata(file);
> > +	const struct cal_fmt *fmt;
> > +	struct v4l2_subdev_frame_size_enum fse;
> > +	int ret;
> > +
> > +	if (fival->index)
> > +		return -EINVAL;
> > +
> > +	fmt = find_format_by_pix(ctx, fival->pixel_format);
> > +	if (!fmt)
> > +		return -EINVAL;
> > +
> > +	/* check for valid width/height */
> > +	ret = 0;
> > +	fse.pad = 0;
> > +	fse.code = fmt->code;
> > +	fse.which = V4L2_SUBDEV_FORMAT_ACTIVE;
> > +	for (fse.index = 0; ; fse.index++) {
> > +		ret = v4l2_subdev_call(ctx->sensor, pad, enum_frame_size,
> > +				       NULL, &fse);
> > +		if (ret)
> > +			return -EINVAL;
> > +
> > +		if ((fival->width == fse.max_width) &&
> > +		    (fival->height == fse.max_height))
> > +			break;
> > +		else if ((fival->width >= fse.min_width) &&
> > +			 (fival->width <= fse.max_width) &&
> > +			 (fival->height >= fse.min_height) &&
> > +			 (fival->height <= fse.max_height))
> > +			break;
> > +
> > +		return -EINVAL;
> > +	}
> > +
> > +	fival->type = V4L2_FRMIVAL_TYPE_DISCRETE;
> > +	fival->discrete.numerator = 1;
> > +	fival->discrete.denominator = 30;
> > +
> > +	return 0;
> > +}
> 
> The above routine is too complex and sounds wrong. Why do you
> need a loop there, if the loop will either return -EINVAL or
> be aborted the first time it runs?
> 
> The way it is, it is just confusing and produces a smatch error:
> 
> 	drivers/media/platform/ti-vpe/cal.c:1219 cal_enum_frameintervals() info: ignoring unreachable code.
> 
> If all you want here is to run the loop once, this patch would do the
> same, with a clearer logic.
> 
> ti-vpe/cal: Simplify the logic to avoid confusing smatch
> 
> drivers/media/platform/ti-vpe/cal.c:1219 cal_enum_frameintervals() info: ignoring unreachable code.
> 
> This is caused by a very confusing logic that looks like a loop, but
> it runs only once.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index 35fa1071c5b2..62721ee7b9bc 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -1216,29 +1216,28 @@ static int cal_enum_frameintervals(struct file *file, void *priv,
>  	fse.pad = 0;
>  	fse.code = fmt->code;
>  	fse.which = V4L2_SUBDEV_FORMAT_ACTIVE;
> -	for (fse.index = 0; ; fse.index++) {
> -		ret = v4l2_subdev_call(ctx->sensor, pad, enum_frame_size,
> -				       NULL, &fse);
> -		if (ret)
> -			return -EINVAL;
> -
> -		if ((fival->width == fse.max_width) &&
> -		    (fival->height == fse.max_height))
> -			break;
> -		else if ((fival->width >= fse.min_width) &&
> -			 (fival->width <= fse.max_width) &&
> -			 (fival->height >= fse.min_height) &&
> -			 (fival->height <= fse.max_height))
> -			break;
> +	fse.index = 0;
>  
> +	ret = v4l2_subdev_call(ctx->sensor, pad, enum_frame_size,
> +			       NULL, &fse);
> +	if (ret)
>  		return -EINVAL;
> -	}
>  
>  	fival->type = V4L2_FRMIVAL_TYPE_DISCRETE;
>  	fival->discrete.numerator = 1;
>  	fival->discrete.denominator = 30;
>  
> -	return 0;
> +	if ((fival->width == fse.max_width) &&
> +	    (fival->height == fse.max_height))
> +		return 0;
> +
> +	if ((fival->width >= fse.min_width) &&
> +	    (fival->width <= fse.max_width) &&
> +	    (fival->height >= fse.min_height) &&
> +	    (fival->height <= fse.max_height))
> +		return 0;
> +
> +	return -EINVAL;
>  }
>  
>  /*
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
