From: Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [RFC PATCH V3 4/5] platform: mtk-isp: Add Mediatek DIP driver
Date: Thu, 12 Sep 2019 14:58:05 +0900
Message-ID: <CAAFQd5Cd2-dyQnMEy0LBwaajn7UfzEbHiJp7AkDy=T8Zy6t_=A@mail.gmail.com>
References: <20190909192244.9367-1-frederic.chen@mediatek.com>
 <20190909192244.9367-5-frederic.chen@mediatek.com>
 <CAAFQd5DEn_N26M7B4X7fKHVA=XBtWJN=Y4VF7D9B=TkgXf_i+Q@mail.gmail.com>
 <1568223671.19171.12.camel@mtksdccf07>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1568223671.19171.12.camel@mtksdccf07>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Frederic Chen <frederic.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Shik Chen <shik-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= <Sean.Cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, =?UTF-8?B?UnlubiBXdSAo5ZCz6IKy5oGpKQ==?= <Rynn.Wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, =?UTF-8?B?Q2hyaXN0aWUgWXUgKOa4uOmbheaDoCk=?= <christie.yu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, =?UTF-8?B?QWxsYW4gWWFuZyAo5qWK5pm66YieKQ==?= <Allan.Yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, =?UTF-8?B?SG9sbWVzIENoaW91ICjpgrHmjLop?= <holmes.chiou-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, suleiman-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Jerry-ch Chen <Jerry-ch.Chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, =?UTF-8?B?SnVuZ28gTGluICjmnpfmmI7kv4op?= <jungo.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sj Huang <sj.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, yuzhao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, zwisler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWOunwaRDDq4rA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 12, 2019 at 2:41 AM Frederic Chen
<frederic.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
>
> Hi Tomasz,
>
> I appreciate your helpful comments.
>
>
> On Tue, 2019-09-10 at 13:04 +0900, Tomasz Figa wrote:
> > Hi Frederic,
> >
> > On Tue, Sep 10, 2019 at 4:23 AM <frederic.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> > >
> > > From: Frederic Chen <frederic.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > >
> > > This patch adds the driver of Digital Image Processing (DIP)
> > > unit in Mediatek ISP system, providing image format
> > > conversion, resizing, and rotation features.
> > >
> > > The mtk-isp directory will contain drivers for multiple IP
> > > blocks found in Mediatek ISP system. It will include ISP
> > > Pass 1 driver(CAM), sensor interface driver, DIP driver and
> > > face detection driver.
> > >
> > > Signed-off-by: Frederic Chen <frederic.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > > ---
> > >  drivers/media/platform/mtk-isp/Makefile       |    7 +
> > >  .../media/platform/mtk-isp/isp_50/Makefile    |    7 +
> > >  .../platform/mtk-isp/isp_50/dip/Makefile      |   18 +
> > >  .../platform/mtk-isp/isp_50/dip/mtk_dip-dev.c |  650 +++++
> > >  .../platform/mtk-isp/isp_50/dip/mtk_dip-dev.h |  566 +++++
> > >  .../platform/mtk-isp/isp_50/dip/mtk_dip-hw.h  |  156 ++
> > >  .../platform/mtk-isp/isp_50/dip/mtk_dip-sys.c |  521 ++++
> > >  .../mtk-isp/isp_50/dip/mtk_dip-v4l2.c         | 2255 +++++++++++++++++
> > >  8 files changed, 4180 insertions(+)
> > >  create mode 100644 drivers/media/platform/mtk-isp/Makefile
> > >  create mode 100644 drivers/media/platform/mtk-isp/isp_50/Makefile
> > >  create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/Makefile
> > >  create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-dev.c
> > >  create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-dev.h
> > >  create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-hw.h
> > >  create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-sys.c
> > >  create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-v4l2.c
> > >
> >
> > Thanks for sending v3!
> >
> > I'm going to do a full review a bit later, but please check one
> > comment about power handling below.
> >
> > Other than that one comment, from a quick look, I think we only have a
> > number of style issues left. Thanks for the hard work!
> >
> > [snip]
> > > +static void dip_runner_func(struct work_struct *work)
> > > +{
> > > +       struct mtk_dip_request *req = mtk_dip_hw_mdp_work_to_req(work);
> > > +       struct mtk_dip_dev *dip_dev = req->dip_pipe->dip_dev;
> > > +       struct img_config *config_data =
> > > +               (struct img_config *)req->working_buf->config_data.vaddr;
> > > +
> > > +       /*
> > > +        * Call MDP/GCE API to do HW excecution
> > > +        * Pass the framejob to MDP driver
> > > +        */
> > > +       pm_runtime_get_sync(dip_dev->dev);
> > > +       mdp_cmdq_sendtask(dip_dev->mdp_pdev, config_data,
> > > +                         &req->img_fparam.frameparam, NULL, false,
> > > +                         dip_mdp_cb_func, req);
> > > +}
> > [snip]
> > > +static void dip_composer_workfunc(struct work_struct *work)
> > > +{
> > > +       struct mtk_dip_request *req = mtk_dip_hw_fw_work_to_req(work);
> > > +       struct mtk_dip_dev *dip_dev = req->dip_pipe->dip_dev;
> > > +       struct img_ipi_param ipi_param;
> > > +       struct mtk_dip_hw_subframe *buf;
> > > +       int ret;
> > > +
> > > +       down(&dip_dev->sem);
> > > +
> > > +       buf = mtk_dip_hw_working_buf_alloc(req->dip_pipe->dip_dev);
> > > +       if (!buf) {
> > > +               dev_err(req->dip_pipe->dip_dev->dev,
> > > +                       "%s:%s:req(%p): no free working buffer available\n",
> > > +                       __func__, req->dip_pipe->desc->name, req);
> > > +       }
> > > +
> > > +       req->working_buf = buf;
> > > +       mtk_dip_wbuf_to_ipi_img_addr(&req->img_fparam.frameparam.subfrm_data,
> > > +                                    &buf->buffer);
> > > +       memset(buf->buffer.vaddr, 0, DIP_SUB_FRM_SZ);
> > > +       mtk_dip_wbuf_to_ipi_img_sw_addr(&req->img_fparam.frameparam.config_data,
> > > +                                       &buf->config_data);
> > > +       memset(buf->config_data.vaddr, 0, DIP_COMP_SZ);
> > > +
> > > +       if (!req->img_fparam.frameparam.tuning_data.present) {
> > > +               /*
> > > +                * When user enqueued without tuning buffer,
> > > +                * it would use driver internal buffer.
> > > +                */
> > > +               dev_dbg(dip_dev->dev,
> > > +                       "%s: frame_no(%d) has no tuning_data\n",
> > > +                       __func__, req->img_fparam.frameparam.frame_no);
> > > +
> > > +               mtk_dip_wbuf_to_ipi_tuning_addr
> > > +                               (&req->img_fparam.frameparam.tuning_data,
> > > +                                &buf->tuning_buf);
> > > +               memset(buf->tuning_buf.vaddr, 0, DIP_TUNING_SZ);
> > > +       }
> > > +
> > > +       mtk_dip_wbuf_to_ipi_img_sw_addr(&req->img_fparam.frameparam.self_data,
> > > +                                       &buf->frameparam);
> > > +       memcpy(buf->frameparam.vaddr, &req->img_fparam.frameparam,
> > > +              sizeof(req->img_fparam.frameparam));
> > > +       ipi_param.usage = IMG_IPI_FRAME;
> > > +       ipi_param.frm_param.handle = req->id;
> > > +       ipi_param.frm_param.scp_addr = (u32)buf->frameparam.scp_daddr;
> > > +
> > > +       mutex_lock(&dip_dev->hw_op_lock);
> > > +       atomic_inc(&dip_dev->num_composing);
> > > +       ret = scp_ipi_send(dip_dev->scp_pdev, SCP_IPI_DIP, &ipi_param,
> > > +                          sizeof(ipi_param), 0);
> >
> > We're not holding the pm_runtime enable count here
> > (pm_runtime_get_sync() wasn't called), so rproc_shutdown() might have
> > been called. Wouldn't that affect the ability for this IPI to run?
> >
> > We had a related discussion with Jerry on the FD series and I think
> > the conclusion is:
> > a) if there is any state that needs to be preserved between jobs, that
> > would be cleared by rproc_shutdown() then we need to call
> > rproc_boot/shutdown() when we start/stop streaming.
> > b) it there is no such state, we can keep them inside runtime PM
> > callbacks, but we need to call pm_runtime_get_sync() before sending an
> > IPI and pm_runtime_mark_last_busy() + pm_runtime_put_autosuspend()
> > after the SCP signals completion. In this case the runtime PM
> > autosuspend delay should be set to around 2-3 times the delay needed
> > for rproc_shutdown() + rproc_boot() to complete.
>
> Since each IMG_IPI_FRAME command is stateless, I would like to
> use pm_runtime_get_sync()/ pm_runtime_mark_last_busy()/
> pm_runtime_put_autosuspend() to fix this issue (solution b).

What does IMG_IPI_INIT do then? Do we need it at all?

I'm worried about the fact that we call rproc_boot(), IMG_IPI_INIT and
then rproc_shutdown(). The latter can completely shutdown the SCP and
clear any state there. How would the effects of IMG_IPI_INIT be
preserved until IMG_IPI_FRAME is called?

Best regards,
Tomasz
