From: Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [RFC,
 v3 8/9] media: platform: Add Mediatek ISP P1 SCP communication
Date: Thu, 25 Jul 2019 19:56:28 +0900
Message-ID: <CAAFQd5BT7M425AbFicYuX+wr-twgS_cxQ937+Rgxo6Y2fA6_gA@mail.gmail.com>
References: <jungo.lin@mediatek.com>
 <20190611035344.29814-1-jungo.lin@mediatek.com>
 <20190611035344.29814-9-jungo.lin@mediatek.com>
 <20190710095827.GC181405@chromium.org>
 <1563675513.1212.444.camel@mtksdccf07>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1563675513.1212.444.camel@mtksdccf07>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Jungo Lin <jungo.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= <sean.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, =?UTF-8?B?RnJlZGVyaWMgQ2hlbiAo6Zmz5L+K5YWDKQ==?= <frederic.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, =?UTF-8?B?UnlubiBXdSAo5ZCz6IKy5oGpKQ==?= <rynn.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?B?UnlhbiBZdSAo5L2Z5a2f5L+uKQ==?= <ryan.yu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, =?UTF-8?B?RnJhbmtpZSBDaGl1ICjpgrHmloflh7Ep?= <frankie.chiu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, ddavenport-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Sj Huang <sj.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "list-Y9sIeH5OGRo@public.gmane.org:IOMMU DRIVERS <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>,
 Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, " <linux-ar>
List-Id: devicetree@vger.kernel.org

Hi Jungo,

On Sun, Jul 21, 2019 at 11:18 AM Jungo Lin <jungo.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
[snip]
> > > +           wake_up_interruptible(&isp_ctx->composer_tx_thread.wq);
> > > +           isp_ctx->composer_tx_thread.thread = NULL;
> > > +   }
> > > +
> > > +   if (isp_ctx->composer_deinit_thread.thread) {
> > > +           wake_up(&isp_ctx->composer_deinit_thread.wq);
> > > +           isp_ctx->composer_deinit_thread.thread = NULL;
> > > +   }
> > > +   mutex_unlock(&isp_ctx->lock);
> > > +
> > > +   pm_runtime_put_sync(&p1_dev->pdev->dev);
> >
> > No need to use the sync variant.
> >
>
> We don't get this point. If we will call pm_runtime_get_sync in
> mtk_isp_hw_init function, will we need to call
> pm_runtime_put_sync_autosuspend in mtk_isp_hw_release in next patch?
> As we know, we should call runtime pm functions in pair.
>

My point is that pm_runtime_put_sync() is only needed if one wants the
runtime count to be decremented after the function returns. Normally
there is no need to do so and one would call pm_runtime_put(), or if
autosuspend is used, pm_runtime_put_autosuspend() (note there is no
"sync" in the name).

[snip]
> > +static void isp_composer_handler(void *data, unsigned int len, void *priv)
> > > +{
> > > +   struct mtk_isp_p1_ctx *isp_ctx = (struct mtk_isp_p1_ctx *)priv;
> > > +   struct isp_p1_device *p1_dev = p1_ctx_to_dev(isp_ctx);
> > > +   struct device *dev = &p1_dev->pdev->dev;
> > > +   struct mtk_isp_scp_p1_cmd *ipi_msg;
> > > +
> > > +   ipi_msg = (struct mtk_isp_scp_p1_cmd *)data;
> >
> > Should we check that len == sizeof(*ipi_msg)? (Or at least >=, if data could
> > contain some extra bytes at the end.)
> >
>
> The len parameter is the actual sending bytes from SCP to kernel.
> In the runtime, it is only 6 bytes for isp_ack_info command
> However, sizeof(*ipi_msg) is large due to struct mtk_isp_scp_p1_cmd is
> union structure.
>

That said we still should check if len is enough to cover the data
we're accessing below.

> > > +
> > > +   if (ipi_msg->cmd_id != ISP_CMD_ACK)
> > > +           return;
> > > +
> > > +   if (ipi_msg->ack_info.cmd_id == ISP_CMD_FRAME_ACK) {
> > > +           dev_dbg(dev, "ack frame_num:%d",
> > > +                   ipi_msg->ack_info.frame_seq_no);
> > > +           atomic_set(&isp_ctx->composed_frame_id,
> > > +                      ipi_msg->ack_info.frame_seq_no);
> >
> > I suppose we are expecting here that ipi_msg->ack_info.frame_seq_no would be
> > just isp_ctx->composed_frame_id + 1, right? If not, we probably dropped some
> > frames and we should handle that somehow.
> >
>
> No, we use isp_ctx->composed_frame_id to save which frame sequence
> number are composed done in SCP. In new design, we will move this from
> isp_ctx to p1_dev.

But we compose the frames in order, don't we? Wouldn't every composed
frame would be just previous frame ID + 1?

[snip]
> > > +void isp_composer_hw_init(struct device *dev)
> > > +{
> > > +   struct mtk_isp_scp_p1_cmd composer_tx_cmd;
> > > +   struct isp_p1_device *p1_dev = get_p1_device(dev);
> > > +   struct mtk_isp_p1_ctx *isp_ctx = &p1_dev->isp_ctx;
> > > +
> > > +   memset(&composer_tx_cmd, 0, sizeof(composer_tx_cmd));
> > > +   composer_tx_cmd.cmd_id = ISP_CMD_INIT;
> > > +   composer_tx_cmd.frameparam.hw_module = isp_ctx->isp_hw_module;
> > > +   composer_tx_cmd.frameparam.cq_addr.iova = isp_ctx->scp_mem_iova;
> > > +   composer_tx_cmd.frameparam.cq_addr.scp_addr = isp_ctx->scp_mem_pa;
> >
> > Should we also specify the size of the buffer? Otherwise we could end up
> > with some undetectable overruns.
> >
>
> The size of SCP composer's memory is fixed to 0x200000.
> Is it necessary to specify the size of this buffer?
>
> #define MTK_ISP_COMPOSER_MEM_SIZE 0x200000
>
> ptr = dma_alloc_coherent(p1_dev->cam_dev.smem_dev,
>                         MTK_ISP_COMPOSER_MEM_SIZE, &addr, GFP_KERNEL);
>

Okay, but please add a comment saying that this is an implicit
requirement of the firmware.

Best regards,
Tomasz
