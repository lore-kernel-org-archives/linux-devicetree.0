Return-Path: <SRS0=DAy5=UA=vger.kernel.org=devicetree-owner@kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46322 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726134AbfFAJQx (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 1 Jun 2019 05:16:53 -0400
Date: Sat, 1 Jun 2019 11:16:49 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v3 06/10] media: hantro: add support for separate
 control block
Message-ID: <20190601111649.51118ad5@collabora.com>
In-Reply-To: <20190531085523.10892-7-p.zabel@pengutronix.de>
References: <20190531085523.10892-1-p.zabel@pengutronix.de>
        <20190531085523.10892-7-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Ezequiel Garcia <ezequiel@collabora.com>, Nicolas Dufresne <nicolas@ndufresne.ca>, Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

On Fri, 31 May 2019 10:55:19 +0200
Philipp Zabel <p.zabel@pengutronix.de> wrote:

> On i.MX8MQ/MM a separate control block contains registers for per-core
> resets, clock gating, and fuse register control.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/staging/media/hantro/hantro.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
> index feaa439a17b3..295a00d59a5f 100644
> --- a/drivers/staging/media/hantro/hantro.h
> +++ b/drivers/staging/media/hantro/hantro.h
> @@ -167,6 +167,7 @@ hantro_vdev_to_func(struct video_device *vdev)
>   * @bases:		Mapped addresses of VPU registers.
>   * @enc_base:		Mapped address of VPU encoder register for convenience.
>   * @dec_base:		Mapped address of VPU decoder register for convenience.
> + * @ctrl_base:		Mapped address of VPU control block.
>   * @vpu_mutex:		Mutex to synchronize V4L2 calls.
>   * @irqlock:		Spinlock to synchronize access to data structures
>   *			shared with interrupt handlers.
> @@ -185,6 +186,7 @@ struct hantro_dev {
>  	void __iomem **bases;
>  	void __iomem *enc_base;
>  	void __iomem *dec_base;
> +	void __iomem *ctrl_base;
>  
>  	struct mutex vpu_mutex;	/* video_device lock */
>  	spinlock_t irqlock;
