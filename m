From: Tomasz Figa <tfiga@chromium.org>
Subject: Re: [RFC PATCH V2 4/4] platform: mtk-isp: Add Mediatek FD driver
Date: Tue, 3 Sep 2019 14:19:32 +0900
Message-ID: <CAAFQd5AGgeFbto6V1KkL0dp1QPziOKV3pWQDU2OJ+S1QKvnBdg@mail.gmail.com>
References: <1562661672-22439-1-git-send-email-Jerry-Ch.chen@mediatek.com>
 <1562661672-22439-5-git-send-email-Jerry-Ch.chen@mediatek.com>
 <20190802082815.GA203993@chromium.org> <1566724680.20680.8.camel@mtksdccf07>
 <CAAFQd5Dw+jaT-+LAUEVeB8W1zdnOgPw7u+aCfDWhYW1SfbzO8g@mail.gmail.com>
 <1566957625.20680.33.camel@mtksdccf07>
 <CAAFQd5D-Yg1FjUE_rwmqfS1gvfE0=MZ=r-ziueU_37-uo9QTbw@mail.gmail.com>
 <1567424859.18318.32.camel@mtksdccf07>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1567424859.18318.32.camel@mtksdccf07>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= <Sean.Cheng@mediatek.com>, "laurent.pinchart+renesas@ideasonboard.com" <laurent.pinchart+renesas@ideasonboard.com>, =?UTF-8?B?UnlubiBXdSAo5ZCz6IKy5oGpKQ==?= <Rynn.Wu@mediatek.com>, srv_heupstream <srv_heupstream@mediatek.com>, =?UTF-8?B?UG8tWWFuZyBIdWFuZyAo6buD5p+P6Zm9KQ==?= <po-yang.huang@mediatek.com>, "mchehab@kernel.org" <mchehab@kernel.org>, "suleiman@chromium.org" <suleiman@chromium.org>, "shik@chromium.org" <shik@chromium.org>, =?UTF-8?B?SnVuZ28gTGluICjmnpfmmI7kv4op?= <jungo.lin@mediatek.com>, =?UTF-8?B?U2ogSHVhbmcgKOm7g+S/oeeSiyk=?= <sj.huang@mediatek.com>, "yuzhao@chromium.org" <yuzhao@chromium.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "zwisler@chromium.org" <zwisler@chromium.org>, "matthias.bgg@gmail.com" <matthias.bgg>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 2, 2019 at 8:47 PM Jerry-ch Chen <Jerry-ch.Chen@mediatek.com> wrote:
>
> Hi Tomasz,
>
> On Fri, 2019-08-30 at 16:33 +0800, Tomasz Figa wrote:
> > On Wed, Aug 28, 2019 at 11:00 AM Jerry-ch Chen
> > <Jerry-ch.Chen@mediatek.com> wrote:
> > >
> > > Hi Tomasz,
> > >
> > > On Mon, 2019-08-26 at 14:36 +0800, Tomasz Figa wrote:
> > > > Hi Jerry,
> > > >
> > > > On Sun, Aug 25, 2019 at 6:18 PM Jerry-ch Chen
> > > > <Jerry-ch.Chen@mediatek.com> wrote:
> > > > >
> > > > > Hi Tomasz,
> > > > >
> > > > > On Fri, 2019-08-02 at 16:28 +0800, Tomasz Figa wrote:
> > > > > > Hi Jerry,
> > > > > >
> > > > > > On Tue, Jul 09, 2019 at 04:41:12PM +0800, Jerry-ch Chen wrote:
[snip]
> > > static int mtk_fd_vb2_queue_setup(struct vb2_queue *vq,
> > >                                   unsigned int *num_buffers,
> > >                                   unsigned int *num_planes,
> > >                                   unsigned int sizes[],
> > >                                   struct device *alloc_devs[])
> > > {
> > >         struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vq);
> > >         struct device *dev = ctx->dev;
> > >         unsigned int size[2];
> > >
> > >         switch (vq->type) {
> > >         case V4L2_BUF_TYPE_META_CAPTURE:
> > >                 size[0] = ctx->dst_fmt.buffersize;
> > >                 break;
> > >         case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> > >                 size[0] = ctx->src_fmt.plane_fmt[0].sizeimage;
> > >                 if (*num_planes == 2)
> > >                         size[1] = ctx->src_fmt.plane_fmt[1].sizeimage;
> > >                 break;
> > >         }
> > >
> > >         if (*num_planes == 1) {
> > >                 if (sizes[0] < size[0])
> > >                         return -EINVAL;
> > >         } else if (*num_planes == 2) {
> > >                 if ((sizes[0] < size[0]) && (sizes[1] < size[1]))
> > >                         return -EINVAL;
> >
> > Can we just use a loop here and combine the 2 cases above?
> >
> > Also, we need to fail with -EINVAL if *num_planes is > 2.
> >
> > >         } else {
> > >                 *num_planes = 1;
> > >                 sizes[0] = size[0];
> >
> > This should be the case if *num_planes == 0 and the number of planes
> > and sizes should match the currently active format.
> >
> I appreciate your comments,
>
> Ok, I will update as following:
> static int mtk_fd_vb2_queue_setup(struct vb2_queue *vq,
>                                   unsigned int *num_buffers,
>                                   unsigned int *num_planes,
>                                   unsigned int sizes[],
>                                   struct device *alloc_devs[])
> {
>         struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vq);
>         unsigned int size[2];
>         unsigned int plane;
>
>         switch (vq->type) {
>         case V4L2_BUF_TYPE_META_CAPTURE:
>                 size[0] = ctx->dst_fmt.buffersize;
>                 break;
>         case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>                 size[0] = ctx->src_fmt.plane_fmt[0].sizeimage;
>                 if (*num_planes == 2)
>                         size[1] = ctx->src_fmt.plane_fmt[1].sizeimage;
>                 break;
>         }
>
>         if (*num_planes > 2)
>                 return -EINVAL;
>         if (*num_planes == 0) {
>                 if (vq->type == V4L2_BUF_TYPE_META_CAPTURE) {
>                         sizes[0] = ctx->dst_fmt.buffersize;
>                         *num_planes = 1;
>                         return 0;
>                 }
>
>                 *num_planes = ctx->src_fmt.num_planes;
>                 for (plane = 0; plane < *num_planes; plane++)
>                         sizes[plane] = ctx->src_fmt.plane_fmt[plane].sizeimage;
>                 return 0;
>         }
>
>         for (plane = 0; plane < *num_planes; plane++) {
>                 if(sizes[plane] < size[plane])
>                         return -EINVAL;
>         }
>         return 0;
> }
>

Looks good, thanks!

> > >         }
> > >
> > >         return 0;
> > > }
> > >
> > > > [snip]
> > > >
> > > > > > > +static void mtk_fd_vb2_stop_streaming(struct vb2_queue *vq)
> > > > > > > +{
> > > > > > > +   struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vq);
> > > > > > > +   struct vb2_buffer *vb;
> > > > > >
> > > > > > How do we guarantee here that the hardware isn't still accessing the buffers
> > > > > > removed below?
> > > > > >
> > > > > Maybe we can check the driver state flag and aborting the unfinished
> > > > > jobs?
> > > > > (fd_hw->state == FD_ENQ)
> > > > >
> > > >
> > > > Yes, we need to either cancel or wait for the currently processing
> > > > job. It depends on hardware capabilities, but cancelling is generally
> > > > preferred for the lower latency.
> > > >
> > > Ok, it the state is ENQ, then we can disable the FD hw by controlling
> > > the registers.
> > >
> > > for example:
> > >         writel(0x0, fd->fd_base + FD_HW_ENABLE);
> > >         writel(0x0, fd->fd_base + FD_INT_EN);
> > >
> >
> > What's exactly the effect of writing 0 to FD_HW_ENABLE?
> >
> Sorry, my last reply didn't solve the question,
> we should implement a mtk_fd_job_abort() for v4l2_m2m_ops().
>
> which is able to readl_poll_timeout_atomic()
> and check the HW busy bits in the register FD_INT_EN;
>
> if they are not cleared until timeout, we could handle the last
> processing job.
> Otherwise, the FD irq handler should have handled the last processing
> job and we could continue the stop_streaming().
>
> For job_abort():
> static void mtk_fd_job_abort(void *priv)
> {
>         struct mtk_fd_ctx *ctx = priv;
>         struct mtk_fd_dev *fd = ctx->fd_dev;
>         u32 val;
>         u32 ret;
>
>         ret = readl_poll_timeout_atomic(fd->fd_base + MTK_FD_REG_OFFSET_INT_EN,
>                                         val,
>                                         (val & MTK_FD_HW_BUSY_MASK) ==
>                                         MTK_FD_HW_STATE_IS_BUSY,
>                                         USEC_PER_MSEC, MTK_FD_STOP_HW_TIMEOUT);

Hmm, would it be possible to avoid the busy wait by having a
completion that could be signalled from the interrupt handler?

Best regards,
Tomasz
