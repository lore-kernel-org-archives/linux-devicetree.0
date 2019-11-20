Return-Path: <SRS0=8557=ZM=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 836D0C432C0
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 Nov 2019 09:33:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 46F24206EC
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 Nov 2019 09:33:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EuPFRLmh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728297AbfKTJdu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 20 Nov 2019 04:33:50 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:35290 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725956AbfKTJdu (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 20 Nov 2019 04:33:50 -0500
Received: by mail-ed1-f65.google.com with SMTP id r16so19740602edq.2
        for <devicetree@vger.kernel.org>; Wed, 20 Nov 2019 01:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qmQfT9BiuQnO46OU7mfXnep8G6jLicKZR3ttzOnNhl0=;
        b=EuPFRLmhgkvsFaiavhEKAt8PH+omZ/bRL5TYZtc1klAXiNjcvXV5hI6poTbwV/w8D9
         hYATNFfrHdU8PkDmXkHYFckmGwuIn9vkJsa9USlOkuPUkTPXDdrNhC+IwxbVkD/O6bMo
         iTOmB3dFulb4ES/bOkuReD3h78H+qzlEOAZRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qmQfT9BiuQnO46OU7mfXnep8G6jLicKZR3ttzOnNhl0=;
        b=l+YENUFIzvaGePC4Xw/uhZvCC5oL2rP13PGNjYPpH5rdXpgkHM7L0JkK/CkiWdbJaP
         fuS6CbPKfwG9uJzq0LfdEUOlsKaUy9xKPmEaZyE38BZQV5wj9Xs1+Ydf0HFRdG8UJHAG
         qF4tG2fgW18GZoXLw3JQNGbFx311iXQbR0HHJ7pEgcTqbPqy9fVYdDULSTvraqnnyf/w
         7q+Jf8N1GP/lQu4Rvcc3IWvKTMucYlY2ra3Ya2H48mbwTDUOwH8oNjTkVSUwiZVX0NU0
         EJ2YzJaXfNdxLS0iTq0yIgiqU22GSsS+CqfGnhyjBhY4yHLjsFOwh6Z2N+xkNYQxJauM
         1wWw==
X-Gm-Message-State: APjAAAVTwsvnl3xaRoDyVgyjJ4cq3SHGnrvUCwHJxPkzK+TTd0aAJFZV
        J2cASjlaLIuzZkOjsnbHtjjuHyNsz8rZig==
X-Google-Smtp-Source: APXvYqxGWidm8SLzt6grlTZ0SVfCEG44mfP2HsCBuXAUtBwUKewVNQ8WjRXoeBs54c7RoZ4JFbtTcA==
X-Received: by 2002:a17:906:b7c6:: with SMTP id fy6mr4182242ejb.90.1574242427994;
        Wed, 20 Nov 2019 01:33:47 -0800 (PST)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id o59sm1382855eda.80.2019.11.20.01.33.47
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2019 01:33:47 -0800 (PST)
Received: by mail-wr1-f47.google.com with SMTP id t1so27254678wrv.4
        for <devicetree@vger.kernel.org>; Wed, 20 Nov 2019 01:33:47 -0800 (PST)
X-Received: by 2002:a5d:62cf:: with SMTP id o15mr1924844wrv.7.1574242106960;
 Wed, 20 Nov 2019 01:28:26 -0800 (PST)
MIME-Version: 1.0
References: <20190906101125.3784-1-Jerry-Ch.chen@mediatek.com>
 <20190906101125.3784-4-Jerry-Ch.chen@mediatek.com> <1571109375.3706.40.camel@mtksdccf07>
 <20191025035211.GA67000@chromium.org> <1574237450.20087.17.camel@mtksdccf07>
In-Reply-To: <1574237450.20087.17.camel@mtksdccf07>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 20 Nov 2019 18:28:14 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DPErhL0_1f6BzDMMOVhxNfJdctBsK=mcBP6oNcmw-r=w@mail.gmail.com>
Message-ID: <CAAFQd5DPErhL0_1f6BzDMMOVhxNfJdctBsK=mcBP6oNcmw-r=w@mail.gmail.com>
Subject: Re: [RFC PATCH V3 3/3] platform: mtk-isp: Add Mediatek FD driver
To:     Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>
Cc:     "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "lkml@metux.net" <lkml@metux.net>,
        =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
        "yuzhao@chromium.org" <yuzhao@chromium.org>,
        "zwisler@chromium.org" <zwisler@chromium.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= 
        <Sean.Cheng@mediatek.com>,
        =?UTF-8?B?U2ogSHVhbmcgKOm7g+S/oeeSiyk=?= <sj.huang@mediatek.com>,
        =?UTF-8?B?Q2hyaXN0aWUgWXUgKOa4uOmbheaDoCk=?= 
        <christie.yu@mediatek.com>,
        =?UTF-8?B?RnJlZGVyaWMgQ2hlbiAo6Zmz5L+K5YWDKQ==?= 
        <Frederic.Chen@mediatek.com>,
        =?UTF-8?B?SnVuZ28gTGluICjmnpfmmI7kv4op?= <jungo.lin@mediatek.com>,
        =?UTF-8?B?UG8tWWFuZyBIdWFuZyAo6buD5p+P6Zm9KQ==?= 
        <po-yang.huang@mediatek.com>,
        =?UTF-8?B?UnlubiBXdSAo5ZCz6IKy5oGpKQ==?= <Rynn.Wu@mediatek.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Nov 20, 2019 at 5:11 PM Jerry-ch Chen
<Jerry-ch.Chen@mediatek.com> wrote:
>
> Hi Tomasz,
>
> On Fri, 2019-10-25 at 11:52 +0800, Tomasz Figa wrote:
> > On Tue, Oct 15, 2019 at 11:16:15AM +0800, Jerry-ch Chen wrote:
> > > Hi Tomasz,
> > >
> > > On Fri, 2019-09-06 at 18:11 +0800, Jerry-ch Chen wrote:
> > > > From: Jerry-ch Chen <jerry-ch.chen@mediatek.com>
> > > >
> > > > This patch adds the driver of Face Detection (FD) unit in
> > > > Mediatek camera system, providing face detection function.
> > > >
> > > > The mtk-isp directory will contain drivers for multiple IP
> > > > blocks found in Mediatek ISP system. It will include ISP Pass 1
> > > > driver (CAM), sensor interface driver, DIP driver and face
> > > > detection driver.
> > > >
> > > > Signed-off-by: Jerry-ch Chen <jerry-ch.chen@mediatek.com>
> > > > ---
> > > >  drivers/media/platform/Kconfig                |    2 +
> > > >  drivers/media/platform/Makefile               |    2 +
> > > >  drivers/media/platform/mtk-isp/fd/Kconfig     |   19 +
> > > >  drivers/media/platform/mtk-isp/fd/Makefile    |    5 +
> > > >  drivers/media/platform/mtk-isp/fd/mtk_fd.h    |  148 ++
> > > >  drivers/media/platform/mtk-isp/fd/mtk_fd_40.c | 1219 +++++++++++++++++
> > > >  include/uapi/linux/mtk-fd-v4l2-controls.h     |   69 +
> > > >  include/uapi/linux/v4l2-controls.h            |    4 +
> > > >  8 files changed, 1468 insertions(+)
> > > >  create mode 100644 drivers/media/platform/mtk-isp/fd/Kconfig
> > > >  create mode 100644 drivers/media/platform/mtk-isp/fd/Makefile
> > > >  create mode 100644 drivers/media/platform/mtk-isp/fd/mtk_fd.h
> > > >  create mode 100644 drivers/media/platform/mtk-isp/fd/mtk_fd_40.c
> > > >  create mode 100644 include/uapi/linux/mtk-fd-v4l2-controls.h
> > > >
> >
> > [snip]
> >
> > > > +static int mtk_fd_job_abort(struct mtk_fd_dev *fd)
> > > > +{
> > > > + u32 ret;
> > > > +
> > > > + ret = wait_for_completion_timeout(&fd->fd_irq_done,
> > > > +                                   msecs_to_jiffies(MTK_FD_HW_TIMEOUT));
> > > > + /* Reset FD HW */
> > > > + if (!ret) {
> > > > +         struct ipi_message fd_ipi_msg;
> > > > +
> > > > +         fd_ipi_msg.cmd_id = MTK_FD_IPI_CMD_RESET;
> > > > +         if (scp_ipi_send(fd->scp_pdev, SCP_IPI_FD_CMD, &fd_ipi_msg,
> > > > +                          sizeof(fd_ipi_msg), MTK_FD_IPI_SEND_TIMEOUT))
> > > > +                 dev_err(fd->dev, "FD Reset HW error\n");
> > > > +         return -ETIMEDOUT;
> > > > + }
> > > > + return 0;
> > > > +}
> > > > +
> > >
> > > Continue the discussion about job abort in RFC v2,
> > >
> > > I think the job_abort callback in v4l2_m2m_ops() might be useful.
> > >
> > > ref:
> > > https://elixir.bootlin.com/linux/v5.4-rc2/source/drivers/media/v4l2-core/v4l2-mem2mem.c#L398
> > > https://elixir.bootlin.com/linux/v5.4-rc2/source/include/media/v4l2-mem2mem.h#L43
> > >
> > > in drivers/media/v4l2-core/v4l2-mem2mem.c #398 v4l2_m2m_cancel_job()
> > > ...
> > > if (m2m_ctx->job_flags & TRANS_RUNNING) {
> > >     spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> > >     if (m2m_dev->m2m_ops->job_abort)
> > >             m2m_dev->m2m_ops->job_abort(m2m_ctx->priv);
> > >     dprintk("m2m_ctx %p running, will wait to complete\n", m2m_ctx);
> > >     wait_event(m2m_ctx->finished,
> > >                     !(m2m_ctx->job_flags & TRANS_RUNNING));
> > > } ...
> > >
> > > If this operation is set, we might use the v4l2_m2m_cancel_job() when
> > > suspend, and it will do mtk_fd_job_abort() here.
> > >
> >
> > The expectation for .job_abort() is that signals the hardware to
> > instantly abandon the current job. Do we have a way to tell the
> > firmware/hardware to do so?
> >
> > Also, suspend must not abort the current job. Anything that was already
> > running is expected to complete successfuly and further jobs should
> > continue executing once the system resumes.
> >
> I appreciate your comments and Pi-Hsun's patch,
>
> Ok, I see.
> For FD40, we can't tell the firmware/hardware to instantly abandon the
> current job.
> Therefore, for suspend, we stop sending further jobs to hardware and
> wait for the completion of the running job.
> For resume, we continue sending jobs to hardware.
>
> > [snip]
> >
> > > > +
> > > > +static int mtk_fd_suspend(struct device *dev)
> > > > +{
> > > > + struct mtk_fd_dev *fd = dev_get_drvdata(dev);
> > > > +
> > > > + if (pm_runtime_suspended(dev))
> > > > +         return 0;
> > > > +
> > > > + if (fd->fd_stream_count)
> > > > +         if (mtk_fd_job_abort(fd))
> > > > +                 mtk_fd_hw_job_finish(fd, VB2_BUF_STATE_ERROR);
> > > > +
> > >
> > > To avoid mtk_fd_hw_job_finish() trigger the next job,
> > > I suppose that we could use v4l2_m2m_cancel_job instead of job_abort and
> > > job_finish here.
> > >
> > > /**
> > >  * v4l2_m2m_cancel_job() - cancel pending jobs for the context
> > >  * @m2m_ctx: m2m context with jobs to be canceled
> > >  *
> > >  * In case of streamoff or release called on any context,
> > >  * 1] If the context is currently running, then abort job will be called
> > >  * 2] If the context is queued, then the context will be removed from
> > >  *    the job_queue
> > >  */
> > >
> > > or another way,
> > > we may add a flag and implement mtk_fd_job_ready() that reads the flag
> > > if we suspend, we set the flag and do job_abort and job_finish, even if
> > > it try enqueue, it will still not really queue the job, until we reset
> > > the flag in mtk_fd_resume().
> > >
> > > how do you think?
> > >
> >
> > As per my comment above, suspend must just pause the execution of the
> > jobs. It must not cause any jobs to be skipped.
> >
> > After analyzing the m2m framework and existing m2m drivers I realized
> > that they currently provide no way to correctly handle suspend/resume.
> > Pi-Hsun has been looking into fixing this in crrev.com/c/1878112 and
> > we'll send it upstream as soon as we get something that should handle
> > all the cases correctly.
> >
> Ok, thanks for the patches.
>
> > > > + /* suspend FD HW */
> > > > + writel(0x0, fd->fd_base + MTK_FD_REG_OFFSET_INT_EN);
> > > > + writel(0x0, fd->fd_base + MTK_FD_REG_OFFSET_HW_ENABLE);
> > > > + clk_disable_unprepare(fd->fd_clk);
> > > > + dev_dbg(dev, "%s:disable clock\n", __func__);
> > > > +
> > > > + return 0;
> > > > +}
> > > > +
> > > > +static int mtk_fd_resume(struct device *dev)
> > > > +{
> > > > + struct mtk_fd_dev *fd = dev_get_drvdata(dev);
> > > > + int ret;
> > > > +
> > > > + if (pm_runtime_suspended(dev))
> > > > +         return 0;
> > > > +
> > > > + ret = clk_prepare_enable(fd->fd_clk);
> > > > + if (ret < 0) {
> > > > +         dev_dbg(dev, "Failed to open fd clk:%d\n", ret);
> > > > +         return ret;
> > > > + }
> > > > +
> > > > + /* resume FD HW */
> > > > + writel(MTK_FD_SET_HW_ENABLE, fd->fd_base + MTK_FD_REG_OFFSET_HW_ENABLE);
> > > > + writel(0x1, fd->fd_base + MTK_FD_REG_OFFSET_INT_EN);
> > > > + dev_dbg(dev, "%s:enable clock\n", __func__);
> >
> > By the way, we need to kick the m2m framework here to schedule further
> > jobs. Pi-Hsun's patch will also take care of this.
> >
> Ok, I see.
> I would like to use Pi-Hsun's patch, otherwise I would need to call
> v4l2_m2m_try_run() here.
>

Yes, please include Pi-Hsun's patch (with original author, sign-off +
your sign-off added) at the beginning of the next version of your
series.

> > [snip]
> >
> > > > +/* Set the face angle and directions to be detected */
> > > > +#define V4L2_CID_MTK_FD_DETECT_POSE              (V4L2_CID_USER_MTK_FD_BASE + 1)
> > > > +
> > > > +/* Set image widths for an input image to be scaled down for face detection */
> > > > +#define V4L2_CID_MTK_FD_SCALE_DOWN_IMG_WIDTH     (V4L2_CID_USER_MTK_FD_BASE + 2)
> > > > +
> > > > +/* Set image heights for an input image to be scaled down for face detection */
> > > > +#define V4L2_CID_MTK_FD_SCALE_DOWN_IMG_HEIGHT    (V4L2_CID_USER_MTK_FD_BASE + 3)
> > > > +
> > > > +/* Set the length of scale down size array */
> > > > +#define V4L2_CID_MTK_FD_SCALE_IMG_NUM            (V4L2_CID_USER_MTK_FD_BASE + 4)
> > > > +
> > > > +/* Set the detection speed, usually reducing accuracy. */
> > > > +#define V4L2_CID_MTK_FD_DETECT_SPEED             (V4L2_CID_USER_MTK_FD_BASE + 5)
> > > > +
> > > > +/* Select the detection model or algorithm to be used. */
> > > > +#define V4L2_CID_MTK_FD_DETECTION_MODEL          (V4L2_CID_USER_MTK_FD_BASE + 6)
> > > > +
> > > > +/* We reserve 16 controls for this driver. */
> > > > +#define V4L2_CID_MTK_FD_MAX                      16
> > > > +
> > >
> > > For these control IDs, I think the following should be remained as chip
> > > specific controls.
> > > V4L2_CID_MTK_FD_SCALE_DOWN_IMG_WIDTH,
> > > V4L2_CID_MTK_FD_SCALE_DOWN_IMG_HEIGHT and V4L2_CID_MTK_FD_SCALE_IMG_NUM
> > >
> > > Hope there would be standardizing face detection api that cover the rest
> > > controls: V4L2_CID_MTK_FD_DETECT_POSE, V4L2_CID_MTK_FD_DETECT_SPEED and
> > > V4L2_CID_MTK_FD_DETECTION_MODEL
> > >
> > > Would you have any suggestions on how to propose the standard face
> > > detection apis?
> > >
> >
> > Given no follow up feedback from the community, I think we can keep them
> > as driver-specific, but should make sure that they have some reasonable
> > default values in case an application doesn't recognize them.
> >
> > Best regards,
> > Tomasz
> >
> Should I keep the file "mtk-fd-v4l2-controls.h" which defines the
> control ids under the folder "/include/uapi/linux"?

We should define the CID base for the FD driver in v4l2-controls.h,
but the controls themselves should be only defined inside the driver.

For example:
https://elixir.bootlin.com/linux/v5.4-rc8/source/include/uapi/linux/v4l2-controls.h#L178
https://elixir.bootlin.com/linux/v5.4-rc8/source/drivers/media/i2c/adv7180.c#L181

Best regards,
Tomasz
