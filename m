From: Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RESEND RFC/PATCH 6/8] media: platform: mtk-vcodec: Add Mediatek
 V4L2 Video Encoder Driver
Date: Wed, 2 Dec 2015 16:02:50 +0000
Message-ID: <565F162A.4070106@linaro.org>
References: <1447764885-23100-1-git-send-email-tiffany.lin@mediatek.com>
 <1447764885-23100-7-git-send-email-tiffany.lin@mediatek.com>
 <56588622.8060600@linaro.org> <1448883594.25093.45.camel@mtksdaap41>
 <CAMTL27FchgtJZS4YpVge-x+TstnVHmG1aAnaOV32qCU3zMUbAQ@mail.gmail.com>
 <1448966550.7534.95.camel@mtksdaap41> <565DBFF3.1000409@linaro.org>
 <1449061708.8326.5.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449061708.8326.5.camel@mtksdaap41>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: tiffany lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Mikhail Ulyanov <mikhail.ulyanov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Fabien Dessenne <fabien.dessenne-qxv4g6HH51o@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Darren Etheridge <detheridge-l0cyMroinI0@public.gmane.org>, Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>, =?UTF-8?B?QW5kcmV3LUNUIENoZW4gKOm
List-Id: devicetree@vger.kernel.org

On 02/12/15 13:08, tiffany lin wrote:
>>> We need MTK_STATE_ABORT to inform encoder thread (mtk_venc_worker) that
>>> stop encodeing job from stopped ctx instance.
>>> When user space qbuf, we need to make sure everything is ready to sent
>>> buf to encode.
>>
>> Agree that you need a flag here. In fact currently you have two,
>> MTK_STATE_ABORT and an unused one called aborting.
>>
>> You need to be very careful with these flags though. They are a magnet
>> for data race bugs (especially combined with SMP).
>>
>> For example at present I can't see any locking in the worker code. This
>> means there is nothing to make all those read-modify-write sequences
>> that manage the state atomic (thus risking state corruption).
>>
> We prevent that one function set the flag and others clear the flag.
> So there is no special lock to protect state.

What prevents concurrent access from different calling contexts? It 
looks to me like the work on the work queue may run concurrently with 
the ioctl calls.


> +static void vb2ops_venc_stop_streaming(struct vb2_queue *q)
> +{
> +	struct mtk_vcodec_ctx *ctx = vb2_get_drv_priv(q);
> +	struct v4l2_device *v4l2_dev = &ctx->dev->v4l2_dev;
> +	struct vb2_buffer *src_buf, *dst_buf;
> +	int retry;
> +	int ret;
> +
> +	mtk_v4l2_debug(2, "[%d]-> type=%d", ctx->idx, q->type);
> +
> +	retry = 0;
> +	while ((ctx->state & MTK_STATE_RUNNING) && (retry < 10)) {
> +		mtk_vcodec_clean_ctx_int_flags(ctx);
> +		ctx->state |= MTK_STATE_ABORT;

As a simple example I think the above line can run concurrently with the 
following code near the end of the worker code.

> +	ctx->state &= ~MTK_STATE_RUNNING;
> +	v4l2_m2m_job_finish(ctx->dev->m2m_dev_enc, ctx->m2m_ctx);

If I'm right then the state of the flags can definitely get clobbered 
due to the read-modify-write actions on the state.


Daniel.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
