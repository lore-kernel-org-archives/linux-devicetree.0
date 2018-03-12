From: =?UTF-8?Q?Joonas_Kylm=c3=a4l=c3=a4?= <joonas.kylmala-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH 2/9] media: videobuf2-v4l2: Copy planes when
 needed in request qbuf
Date: Mon, 12 Mar 2018 18:18:00 +0000
Message-ID: <f5b1c8b7-d7c7-a81b-181b-46ef0323dfdd@iki.fi>
References: <20180309100933.15922-1-paul.kocialkowski@bootlin.com>
 <20180309100933.15922-3-paul.kocialkowski@bootlin.com>
Reply-To: joonas.kylmala-X3B1VOXEql0@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDKPPPP3Z4PBBZUITPKQKGQETRCO3QQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180309100933.15922-3-paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Content-Language: en-US
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, Florent Revest <revestflo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <acourbot-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Thomas van Kleef <thomas-XCRq7eEM0/pmR6Xm/wNWPw@public.gmane.org>, "Signed-off-by : Bob Ham" <rah-2mWpNWY8JZLk1uMJSBkQmQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Paul Kocialkowski:
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index 0627c3339572..c14528d4a518 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -592,6 +592,7 @@ int vb2_qbuf_request(struct vb2_queue *q, struct v4l2_buffer *b,
>  	struct media_request *req;
>  	struct vb2_buffer *vb;
>  	int ret = 0;
> +	int i;
>  
>  	if (b->request_fd <= 0)
>  		return vb2_qbuf(q, b);
> @@ -657,6 +658,17 @@ int vb2_qbuf_request(struct vb2_queue *q, struct v4l2_buffer *b,
>  	qb->pre_req_state = vb->state;
>  	qb->queue = q;
>  	memcpy(&qb->v4l2_buf, b, sizeof(*b));
> +
> +	if (V4L2_TYPE_IS_MULTIPLANAR(b->type) && b->length > 0) {
> +		qb->v4l2_buf.m.planes = kcalloc(b->length,
> +						sizeof(struct v4l2_plane),
> +						GFP_KERNEL);
> +
> +		for (i = 0; i < b->length; i++)
> +			 memcpy(&qb->v4l2_buf.m.planes[i], &b->m.planes[i],
> +				sizeof(struct v4l2_plane));
> +	}
> +
>  	vb->request = req;
>  	vb->state = VB2_BUF_STATE_QUEUED;
>  	list_add_tail(&qb->node, &data->queued_buffers);
> @@ -672,6 +684,7 @@ EXPORT_SYMBOL_GPL(vb2_qbuf_request);
>  int vb2_request_submit(struct v4l2_request_entity_data *data)
>  {
>  	struct v4l2_vb2_request_buffer *qb, *n;
> +	int i;
>  
>  	/* v4l2 requests require at least one buffer to reach the device */
>  	if (list_empty(&data->queued_buffers)) {
> @@ -686,6 +699,12 @@ int vb2_request_submit(struct v4l2_request_entity_data *data)
>  		list_del(&qb->node);
>  		vb->state = qb->pre_req_state;
>  		ret = vb2_core_qbuf(q, vb->index, &qb->v4l2_buf);
> +
> +		if (V4L2_TYPE_IS_MULTIPLANAR(qb->v4l2_buf.type) &&
> +		    qb->v4l2_buf.length > 0)

The test "qb->v4l2_buf.length > 0" seems unnecessary as it's already
checked in the loop:

> +			for (i = 0; i < qb->v4l2_buf.length; i++)
> +				kfree(&qb->v4l2_buf.m.planes[i]);
> +
>  		kfree(qb);
>  		if (ret)
>  			return ret;
> 
