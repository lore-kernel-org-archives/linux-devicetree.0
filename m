From: Alexandre Courbot <acourbot@chromium.org>
Subject: Re: [RFC v2 4/4] media: platform: mtk-mdp3: Add Mediatek MDP3 driver
Date: Thu, 20 Jun 2019 13:48:15 +0900
Message-ID: <CAPBb6MUCYK3eyk5Oq_p8yBvFh1EszzPDcvbB0VLTu_KKzCLTMA@mail.gmail.com>
References: <20190516032332.56844-1-daoyuan.huang@mediatek.com>
 <20190516032332.56844-5-daoyuan.huang@mediatek.com>
 <20190604112039.GA12168@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190604112039.GA12168@chromium.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tomasz Figa <tfiga@chromium.org>
Cc: devicetree@vger.kernel.org, Sean.Cheng@mediatek.com, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Rynn.Wu@mediatek.com, christie.yu@mediatek.com, srv_heupstream@mediatek.com, Daoyuan Huang <daoyuan.huang@mediatek.com>, holmes.chiou@mediatek.com, Jerry-ch.Chen@mediatek.com, jungo.lin@mediatek.com, Sj Huang <sj.huang@mediatek.com>, yuzhao@chromium.org, Hans Verkuil <hans.verkuil@cisco.com>, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, zwisler@chromium.org, frederic.chen@mediatek.com, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org, Linux Media Mailing List <linux-media@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 4, 2019 at 8:20 PM Tomasz Figa <tfiga@chromium.org> wrote:
> > +
> > +     ret = mdp_vpu_get_locked(mdp);
> > +     if (ret < 0)
> > +             goto err_load_vpu;
>
> This shouldn't happen in open(), but rather the latest possible point in
> time. If one needs to keep the VPU running for the time of streaming, then
> it should be start_streaming. If one can safely turn the VPU off if there is
> no frame queued for long time, it should be just in m2m job_run.
>
> Generally the userspace should be able to
> just open an m2m device for querying it, without any side effects like
> actually powering on the hardware or grabbing a hardware instance (which
> could block some other processes, trying to grab one too).

OTOH looking at the code of mdp_vpu_get_locked(), we do the whole
rproc_boot and VPU init procedure if we were the only user. So I can
understand we want to avoid doing this too often.

Maybe mdp_vpu_get_locked() can be reorganized in a better way. I feel
like the call to mdp_vpu_register() should be done in probe, and maybe
we can use runtime PM (with a reasonable timeout) to control the rproc
and VPU init?


>
> > +
> > +     mutex_unlock(&mdp->m2m_lock);
> > +
> > +     mdp_dbg(0, "%s [%d]", dev_name(&mdp->pdev->dev), ctx->id);
> > +
> > +     return 0;
> > +
> > +err_load_vpu:
> > +     mdp_frameparam_release(ctx->curr_param);
> > +err_param_init:
> > +     v4l2_m2m_ctx_release(ctx->m2m_ctx);
> > +err_m2m_ctx:
> > +     v4l2_ctrl_handler_free(&ctx->ctrl_handler);
> > +     v4l2_fh_del(&ctx->fh);
> > +err_ctrls_create:
> > +     v4l2_fh_exit(&ctx->fh);
> > +     mutex_unlock(&mdp->m2m_lock);
> > +err_lock:
>
> Incorrect naming of all the error labels here.
>
> > +     kfree(ctx);
> > +
> > +     return ret;
> > +}
> [snip]
> > +enum mdp_ycbcr_profile mdp_map_ycbcr_prof_mplane(struct v4l2_format *f,
> > +                                              u32 mdp_color)
> > +{
> > +     struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
> > +
> > +     if (MDP_COLOR_IS_RGB(mdp_color))
> > +             return MDP_YCBCR_PROFILE_FULL_BT601;
> > +
> > +     switch (pix_mp->colorspace) {
> > +     case V4L2_COLORSPACE_JPEG:
> > +             return MDP_YCBCR_PROFILE_JPEG;
> > +     case V4L2_COLORSPACE_REC709:
> > +     case V4L2_COLORSPACE_DCI_P3:
> > +             if (pix_mp->quantization == V4L2_QUANTIZATION_FULL_RANGE)
> > +                     return MDP_YCBCR_PROFILE_FULL_BT709;
> > +             return MDP_YCBCR_PROFILE_BT709;
> > +     case V4L2_COLORSPACE_BT2020:
> > +             if (pix_mp->quantization == V4L2_QUANTIZATION_FULL_RANGE)
> > +                     return MDP_YCBCR_PROFILE_FULL_BT2020;
> > +             return MDP_YCBCR_PROFILE_BT2020;
> > +     }
> > +     /* V4L2_COLORSPACE_SRGB or else */
> > +     if (pix_mp->quantization == V4L2_QUANTIZATION_FULL_RANGE)
> > +             return MDP_YCBCR_PROFILE_FULL_BT601;
> > +     return MDP_YCBCR_PROFILE_BT601;
>
> Putting this under the default clause of the switch statement would be
> cleaner and the comment wouldn't be needed.
>
> [snip]
> > +struct mdp_frameparam *mdp_frameparam_init(void)
> > +{
> > +     struct mdp_frameparam *param;
> > +     struct mdp_frame *frame;
> > +
> > +     param = kzalloc(sizeof(*param), GFP_KERNEL);
> > +     if (!param)
> > +             return ERR_PTR(-ENOMEM);
>
> We could just embed mdp_frameparam into the mdp_m2m_ctx struct and then
> wouldn't need any dynamic allocation here anymore. And as a side effect, the
> function could be just made void, because it couldn't fail.
>
> > +
> > +     INIT_LIST_HEAD(&param->list);
> > +     mutex_init(&param->lock);
> > +     param->state = 0;
> > +     param->limit = &mdp_def_limit;
> > +     param->type = MDP_STREAM_TYPE_UNKNOWN;
>
> We always seem to use MDP_STREAM_TYPE_BITBLT in this driver.
>
> > +     param->frame_no = 0;
>
> No need for explicit initialization to 0.
>
> Best regards,
> Tomasz
>
