Return-Path: <SRS0=MDPI=7D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55A78C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 21 May 2020 17:11:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2DB6920759
	for <linux-devicetree@archiver.kernel.org>; Thu, 21 May 2020 17:11:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oMC3yZa5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728707AbgEURLH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 21 May 2020 13:11:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728659AbgEURLH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 21 May 2020 13:11:07 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA6BAC061A0E
        for <devicetree@vger.kernel.org>; Thu, 21 May 2020 10:11:05 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id k13so7427663wrx.3
        for <devicetree@vger.kernel.org>; Thu, 21 May 2020 10:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2YwOR8lo9fEQo3/VcqBff/dFzuaCVkdrHNiMan7lYfs=;
        b=oMC3yZa52bcy2SsjHm4z8NPHD/7aVhSHTn2dQ2SQPI4UnBbD0Y4efwbIVa1l5oFepl
         gu+7e/bcOEIIAgqMME/+6QShCYVw/0M28lZztpLVGnVct+JCiM/xqiBnYgCTPsJhrdOs
         79Kktj7vtSesuSDdFJcNZF8FxFcThWWKu5FyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2YwOR8lo9fEQo3/VcqBff/dFzuaCVkdrHNiMan7lYfs=;
        b=N3x319kfnwNsOcRja8T5wIlc7VInzshYcD6MsnkBo/VZmjZAtLQfRpLakNWVTTXC3Q
         DFHuz4kDnVwAL5xtjJRGe9mu6o7fqHqe7Mg0gBGSWmyo43hsVifjD7ghlX0jvFKrDXDM
         1QTjJVW6KuSVxlxwJGrj0dQjcSSB9TUPuXgPUAaI3VE98J1Um+qGwoXFRDye77iUWZIY
         oUnkKdSdQdfrvoLsUF80ZMQc+9GAgZ7FSImd8AIZ8czzA5Z94hPPinh/bhfNvGWyEFrj
         aQ7NXLW+X1psgYVQL+QN7KBWf2nf2XWgesIYmKGkZd917TitrnvttgA0U2OWW61gIrbG
         s4qw==
X-Gm-Message-State: AOAM5326x/nw1aOdZcCoqHgkEHBdRijPIAtbwIobWs+A75Q7xZCCCwZ5
        ifbQDF3dZVfS+KsRB7RZEnZ6fQ==
X-Google-Smtp-Source: ABdhPJyalFzY/329jsR0udLrkGAaMOvnHOWO2TScGUsIP0HOjdvvEOY1hhpVY3V7qytj0Q9F7A/KTw==
X-Received: by 2002:a5d:44c6:: with SMTP id z6mr2368580wrr.20.1590081064371;
        Thu, 21 May 2020 10:11:04 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id 81sm7682882wme.16.2020.05.21.10.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 10:11:03 -0700 (PDT)
Date:   Thu, 21 May 2020 17:11:01 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Jerry-ch Chen <Jerry-Ch.chen@mediatek.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        laurent.pinchart+renesas@ideasonboard.com, matthias.bgg@gmail.com,
        mchehab@kernel.org, pihsun@chromium.org, yuzhao@chromium.org,
        zwisler@chromium.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, Sean.Cheng@mediatek.com,
        sj.huang@mediatek.com, christie.yu@mediatek.com,
        frederic.chen@mediatek.com, jungo.lin@mediatek.com,
        Rynn.Wu@mediatek.com, linux-media@vger.kernel.org,
        srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
        Jerry-ch Chen <jerry-ch.chen@mediatek.corp-partner.google.com>
Subject: Re: [RFC PATCH V4 1/4] media: v4l2-mem2mem: add v4l2_m2m_suspend,
 v4l2_m2m_resume
Message-ID: <20200521171101.GA243874@chromium.org>
References: <20191204124732.10932-1-Jerry-Ch.chen@mediatek.com>
 <20191204124732.10932-2-Jerry-Ch.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191204124732.10932-2-Jerry-Ch.chen@mediatek.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Jerry,

On Wed, Dec 04, 2019 at 08:47:29PM +0800, Jerry-ch Chen wrote:
> From: Pi-Hsun Shih <pihsun@chromium.org>
> 
> Add two functions that can be used to stop new jobs from being queued /
> continue running queued job. This can be used while a driver using m2m
> helper is going to suspend / wake up from resume, and can ensure that
> there's no job running in suspend process.
> 
> BUG=b:143046833
> TEST=build
> 
> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> Signed-off-by: Jerry-ch Chen <jerry-ch.chen@mediatek.corp-partner.google.com>
> ---
>  drivers/media/v4l2-core/v4l2-mem2mem.c | 40 ++++++++++++++++++++++++++
>  include/media/v4l2-mem2mem.h           | 22 ++++++++++++++
>  2 files changed, 62 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
> index 5bbdec55b7d7..76ba203e0035 100644
> --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> @@ -47,6 +47,10 @@ module_param(debug, bool, 0644);
>  #define TRANS_ABORT		(1 << 2)
>  
>  
> +/* The job queue is not running new jobs */
> +#define QUEUE_PAUSED		(1 << 0)
> +
> +
>  /* Offset base for buffers on the destination queue - used to distinguish
>   * between source and destination buffers when mmapping - they receive the same
>   * offsets but for different queues */
> @@ -88,6 +92,7 @@ static const char * const m2m_entity_name[] = {
>   * @job_queue:		instances queued to run
>   * @job_spinlock:	protects job_queue
>   * @job_work:		worker to run queued jobs.
> + * @job_queue_flags:	flags of the queue status, %QUEUE_PAUSED.
>   * @m2m_ops:		driver callbacks
>   */
>  struct v4l2_m2m_dev {
> @@ -105,6 +110,7 @@ struct v4l2_m2m_dev {
>  	struct list_head	job_queue;
>  	spinlock_t		job_spinlock;
>  	struct work_struct	job_work;
> +	unsigned long		job_queue_flags;
>  
>  	const struct v4l2_m2m_ops *m2m_ops;
>  };
> @@ -267,6 +273,12 @@ static void v4l2_m2m_try_run(struct v4l2_m2m_dev *m2m_dev)
>  		return;
>  	}
>  
> +	if (m2m_dev->job_queue_flags & QUEUE_PAUSED) {
> +		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> +		dprintk("Running new jobs is paused\n");
> +		return;
> +	}
> +
>  	m2m_dev->curr_ctx = list_first_entry(&m2m_dev->job_queue,
>  				   struct v4l2_m2m_ctx, queue);
>  	m2m_dev->curr_ctx->job_flags |= TRANS_RUNNING;
> @@ -447,6 +459,34 @@ void v4l2_m2m_job_finish(struct v4l2_m2m_dev *m2m_dev,
>  }
>  EXPORT_SYMBOL(v4l2_m2m_job_finish);
>  
> +void v4l2_m2m_suspend(struct v4l2_m2m_dev *m2m_dev)
> +{
> +	unsigned long flags;
> +	struct v4l2_m2m_ctx *curr_ctx;
> +
> +	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
> +	m2m_dev->job_queue_flags |= QUEUE_PAUSED;
> +	curr_ctx = m2m_dev->curr_ctx;
> +	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> +
> +	if (curr_ctx)
> +		wait_event(curr_ctx->finished,
> +			   !(curr_ctx->job_flags & TRANS_RUNNING));
> +}
> +EXPORT_SYMBOL(v4l2_m2m_suspend);
> +
> +void v4l2_m2m_resume(struct v4l2_m2m_dev *m2m_dev)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
> +	m2m_dev->job_queue_flags &= ~QUEUE_PAUSED;
> +	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> +
> +	v4l2_m2m_try_run(m2m_dev);
> +}
> +EXPORT_SYMBOL(v4l2_m2m_resume);
> +
>  int v4l2_m2m_reqbufs(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
>  		     struct v4l2_requestbuffers *reqbufs)
>  {
> diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
> index 5467264771ec..119a195da390 100644
> --- a/include/media/v4l2-mem2mem.h
> +++ b/include/media/v4l2-mem2mem.h
> @@ -183,6 +183,28 @@ v4l2_m2m_buf_done(struct vb2_v4l2_buffer *buf, enum vb2_buffer_state state)
>  	vb2_buffer_done(&buf->vb2_buf, state);
>  }
>  
> +/**
> + * v4l2_m2m_suspend() - stop new jobs from being run and wait for current job
> + * to finish
> + *
> + * @m2m_dev: opaque pointer to the internal data to handle M2M context
> + *
> + * Called by a driver in the suspend hook. Stop new jobs from being run, and
> + * wait for current running job to finish.
> + */
> +void v4l2_m2m_suspend(struct v4l2_m2m_dev *m2m_dev);
> +
> +/**
> + * v4l2_m2m_resume() - resume job running and try to run a queued job
> + *
> + * @m2m_dev: opaque pointer to the internal data to handle M2M context
> + *
> + * Called by a driver in the resume hook. This reverts the operation of
> + * v4l2_m2m_suspend() and allows job to be run. Also try to run a queued job if
> + * there is any.
> + */
> +void v4l2_m2m_resume(struct v4l2_m2m_dev *m2m_dev);
> +
>  /**
>   * v4l2_m2m_reqbufs() - multi-queue-aware REQBUFS multiplexer
>   *
> -- 
> 2.18.0

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

[Corrected Hans's email address.]
Hans, does this look good to you?

Best regards,
Tomasz

