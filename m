From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: Re: [PATCH v9 5/9] media: platform: Add Cedrus VPU
 decoder driver
Date: Fri, 7 Sep 2018 15:13:19 +0200
Message-ID: <4b30c0bf-e525-1868-f625-569d4a104aa0@xs4all.nl>
References: <20180906222442.14825-1-contact@paulk.fr>
 <20180906222442.14825-6-contact@paulk.fr>
Reply-To: hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBC3MVVMX3ELBB57SZHOAKGQEC7GP4AY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180906222442.14825-6-contact-W9ppeneeCTY@public.gmane.org>
Content-Language: en-US
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org
Cc: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>, Ezequiel Garcia <ezequiel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Alexandre Courbot <acourbot-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/07/2018 12:24 AM, Paul Kocialkowski wrote:
> From: Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
> 
> This introduces the Cedrus VPU driver that supports the VPU found in
> Allwinner SoCs, also known as Video Engine. It is implemented through
> a V4L2 M2M decoder device and a media device (used for media requests).
> So far, it only supports MPEG-2 decoding.
> 
> Since this VPU is stateless, synchronization with media requests is
> required in order to ensure consistency between frame headers that
> contain metadata about the frame to process and the raw slice data that
> is used to generate the frame.
> 
> This driver was made possible thanks to the long-standing effort
> carried out by the linux-sunxi community in the interest of reverse
> engineering, documenting and implementing support for the Allwinner VPU.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
> Acked-by: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>

One high-level comment:

Can you add a TODO file for this staging driver? This can be done in
a follow-up patch.

It should contain what needs to be done to get this out of staging:

- Request API needs to stabilize
- Userspace support for stateless codecs must be created
- Ideally one other stateless decoder driver and at least one
  stateless encoder driver should be implemented to ensure that nothing
  was forgotten in the Request API.
- Anything else?

And a few last code comments:

> ---
>  MAINTAINERS                                   |   7 +
>  drivers/staging/media/Kconfig                 |   2 +
>  drivers/staging/media/Makefile                |   1 +
>  drivers/staging/media/sunxi/Kconfig           |  15 +
>  drivers/staging/media/sunxi/Makefile          |   1 +
>  drivers/staging/media/sunxi/cedrus/Kconfig    |  14 +
>  drivers/staging/media/sunxi/cedrus/Makefile   |   3 +
>  drivers/staging/media/sunxi/cedrus/cedrus.c   | 422 ++++++++++++++
>  drivers/staging/media/sunxi/cedrus/cedrus.h   | 165 ++++++
>  .../staging/media/sunxi/cedrus/cedrus_dec.c   |  70 +++
>  .../staging/media/sunxi/cedrus/cedrus_dec.h   |  27 +
>  .../staging/media/sunxi/cedrus/cedrus_hw.c    | 322 +++++++++++
>  .../staging/media/sunxi/cedrus/cedrus_hw.h    |  30 +
>  .../staging/media/sunxi/cedrus/cedrus_mpeg2.c | 237 ++++++++
>  .../staging/media/sunxi/cedrus/cedrus_regs.h  | 233 ++++++++
>  .../staging/media/sunxi/cedrus/cedrus_video.c | 544 ++++++++++++++++++
>  .../staging/media/sunxi/cedrus/cedrus_video.h |  30 +
>  17 files changed, 2123 insertions(+)
>  create mode 100644 drivers/staging/media/sunxi/Kconfig
>  create mode 100644 drivers/staging/media/sunxi/Makefile
>  create mode 100644 drivers/staging/media/sunxi/cedrus/Kconfig
>  create mode 100644 drivers/staging/media/sunxi/cedrus/Makefile
>  create mode 100644 drivers/staging/media/sunxi/cedrus/cedrus.c
>  create mode 100644 drivers/staging/media/sunxi/cedrus/cedrus.h
>  create mode 100644 drivers/staging/media/sunxi/cedrus/cedrus_dec.c
>  create mode 100644 drivers/staging/media/sunxi/cedrus/cedrus_dec.h
>  create mode 100644 drivers/staging/media/sunxi/cedrus/cedrus_hw.c
>  create mode 100644 drivers/staging/media/sunxi/cedrus/cedrus_hw.h
>  create mode 100644 drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
>  create mode 100644 drivers/staging/media/sunxi/cedrus/cedrus_regs.h
>  create mode 100644 drivers/staging/media/sunxi/cedrus/cedrus_video.c
>  create mode 100644 drivers/staging/media/sunxi/cedrus/cedrus_video.h
> 

<snip>

> +static int cedrus_request_validate(struct media_request *req)
> +{
> +	struct media_request_object *obj;
> +	struct v4l2_ctrl_handler *parent_hdl, *hdl;
> +	struct cedrus_ctx *ctx = NULL;
> +	struct v4l2_ctrl *ctrl_test;
> +	unsigned int i;
> +
> +	if (vb2_request_buffer_cnt(req) != 1)
> +		return -ENOENT;

I would return ENOENT if there are no buffers, and EINVAL if there are too
many. Returning ENOENT in the latter case would be very confusing.

I also highly recommend that you add v4l2_info lines for these errors.

> +
> +	list_for_each_entry(obj, &req->objects, list) {
> +		struct vb2_buffer *vb;
> +
> +		if (vb2_request_object_is_buffer(obj)) {
> +			vb = container_of(obj, struct vb2_buffer, req_obj);
> +			ctx = vb2_get_drv_priv(vb->vb2_queue);
> +
> +			break;
> +		}
> +	}
> +
> +	if (!ctx)
> +		return -ENOENT;
> +
> +	parent_hdl = &ctx->hdl;
> +
> +	hdl = v4l2_ctrl_request_hdl_find(req, parent_hdl);
> +	if (!hdl) {
> +		v4l2_err(&ctx->dev->v4l2_dev, "Missing codec control(s)\n");

Should be v4l2_info: it is not a driver error, it is just an info message.

> +		return -ENOENT;
> +	}
> +
> +	for (i = 0; i < CEDRUS_CONTROLS_COUNT; i++) {
> +		if (cedrus_controls[i].codec != ctx->current_codec ||
> +		    !cedrus_controls[i].required)
> +			continue;
> +
> +		ctrl_test = v4l2_ctrl_request_hdl_ctrl_find(hdl,
> +			cedrus_controls[i].id);
> +		if (!ctrl_test) {
> +			v4l2_err(&ctx->dev->v4l2_dev,
> +				 "Missing required codec control\n");

Ditto.

> +			return -ENOENT;
> +		}
> +	}
> +
> +	v4l2_ctrl_request_hdl_put(hdl);
> +
> +	return vb2_request_validate(req);
> +}

Not worth making a v10, but you can do this in a follow-up patch.

Once I have the two follow-up patches I'll make a pull request.

Regards,

	Hans
