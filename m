Return-Path: <SRS0=L0hH=T5=vger.kernel.org=devicetree-owner@kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:52198 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726101AbfE2LfC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 29 May 2019 07:35:02 -0400
Date: Wed, 29 May 2019 13:34:56 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 4/9] media: hantro: make irq names configurable
Message-ID: <20190529133456.0096a6a4@collabora.com>
In-Reply-To: <20190529095424.23614-5-p.zabel@pengutronix.de>
References: <20190529095424.23614-1-p.zabel@pengutronix.de>
        <20190529095424.23614-5-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Ezequiel Garcia <ezequiel@collabora.com>, Nicolas Dufresne <nicolas@ndufresne.ca>, Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

On Wed, 29 May 2019 11:54:19 +0200
Philipp Zabel <p.zabel@pengutronix.de> wrote:

> The i.MX8MQ bindings will use different IRQ names ("g1" instead of
> "vdpu", and "g2"), so make them configurable. This also allows to
> register more than two IRQs, which will be required for i.MX8MM support
> later (it will add "h1" instead of "vepu").
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
> Changes since v1 [1]:
>  - Rebased onto "[PATCH v6] Add MPEG-2 decoding to Rockchip VPU" series.
> 
> [1] https://patchwork.linuxtv.org/patch/56285/
> ---
>  drivers/staging/media/hantro/hantro.h        | 11 ++++---
>  drivers/staging/media/hantro/hantro_drv.c    | 31 +++++++-------------
>  drivers/staging/media/hantro/rk3288_vpu_hw.c |  5 ++--
>  drivers/staging/media/hantro/rk3399_vpu_hw.c |  9 ++++--
>  4 files changed, 26 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
> index 296b9ffad547..6b90fe48bcdf 100644
> --- a/drivers/staging/media/hantro/hantro.h
> +++ b/drivers/staging/media/hantro/hantro.h
> @@ -26,6 +26,7 @@
>  #include "hantro_hw.h"
>  
>  #define HANTRO_MAX_CLOCKS		4
> +#define HANTRO_MAX_IRQS			3
>  
>  #define MPEG2_MB_DIM			16
>  #define MPEG2_MB_WIDTH(w)		DIV_ROUND_UP(w, MPEG2_MB_DIM)
> @@ -57,8 +58,9 @@ struct hantro_codec_ops;
>   * @codec_ops:			Codec ops.
>   * @init:			Initialize hardware.
>   * @runtime_resume:		reenable hardware after power gating
> - * @vepu_irq:			encoder interrupt handler
> - * @vdpu_irq:			decoder interrupt handler
> + * @irq_handlers:		interrupt handlers, same order as irq names
> + * @irq_names:			array of irq names
> + * @num_irqs:			number of irqs in the arrays
>   * @clk_names:			array of clock names
>   * @num_clocks:			number of clocks in the array
>   */
> @@ -73,8 +75,9 @@ struct hantro_variant {
>  	const struct hantro_codec_ops *codec_ops;
>  	int (*init)(struct hantro_dev *vpu);
>  	int (*runtime_resume)(struct hantro_dev *vpu);
> -	irqreturn_t (*vepu_irq)(int irq, void *priv);
> -	irqreturn_t (*vdpu_irq)(int irq, void *priv);
> +	irqreturn_t (*irq_handlers[HANTRO_MAX_IRQS])(int irq, void *priv);
> +	const char *irq_names[HANTRO_MAX_IRQS];

Can we have a struct instead of an array for all handlers and another
array for irq names:

	struct {
		const char *name;
		irqreturn_t (*handler)(int irq, void *priv);
	} irqs[HANTRO_MAX_IRQS];

> +	int num_irqs;

Or we could have the struct defined outside of hantro_variant and get
rid of HANTRO_MAX_IRQS (I find it annoying to have to update the MAX
value every time a new variant needs more than what was previously
defined as MAX):

struct hantro_irq {
	const char *name;
	irqreturn_t (*handler)(int irq, void *priv);
};

struct hantro_variant {
	...
	unsigned int num_irqs;
	const struct hantro_irq *irqs;
};

static const struct hantro_irq xxxx_irqs[] = {
	{ ... },
	{ ... },

};

static const struct hantro_variant xxxx_variant = {
	.num_irqs = ARRAY_SIZE(xxxx_irqs),
	.irqs = xxxx_irqs,
};
