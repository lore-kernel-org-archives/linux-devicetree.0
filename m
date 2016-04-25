From: tiffany lin <tiffany.lin@mediatek.com>
Subject: Re: [PATCH v7 5/8] [media] vcodec: mediatek: Add Mediatek V4L2
 Video Encoder Driver
Date: Mon, 25 Apr 2016 15:02:48 +0800
Message-ID: <1461567768.11415.14.camel@mtksdaap41>
References: <1461299131-57851-1-git-send-email-tiffany.lin@mediatek.com>
	 <1461299131-57851-2-git-send-email-tiffany.lin@mediatek.com>
	 <1461299131-57851-3-git-send-email-tiffany.lin@mediatek.com>
	 <1461299131-57851-4-git-send-email-tiffany.lin@mediatek.com>
	 <1461299131-57851-5-git-send-email-tiffany.lin@mediatek.com>
	 <1461299131-57851-6-git-send-email-tiffany.lin@mediatek.com>
	 <571A2B70.7040402@xs4all.nl> <1461561405.11415.12.camel@mtksdaap41>
	 <CAOMLVLj+zM2-s2_O4G0hXH+SWPk1j=VwUZtA3y5wvEyd1VkAEQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOMLVLj+zM2-s2_O4G0hXH+SWPk1j=VwUZtA3y5wvEyd1VkAEQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wu-Cheng Li =?UTF-8?Q?=28=E6=9D=8E=E5=8B=99=E8=AA=A0=29?= <wuchengli@chromium.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Hans Verkuil <hans.verkuil@cisco.com>, Daniel Thompson <daniel.thompson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel Kurtz <djkurtz@chromium.org>, Pawel Osciak <posciak@chromium.org>, Eddie Huang <eddie.huang@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, Lin PoChun <PoChun.Lin@mediatek.com>
List-Id: devicetree@vger.kernel.org

Hi Wucheng,

On Mon, 2016-04-25 at 13:42 +0800, Wu-Cheng Li (=E6=9D=8E=E5=8B=99=E8=AA=
=A0) wrote:
> > >
> > > ...
> > >
> > > > +static int fops_vcodec_open(struct file *file)
> > > > +{
> > > > +   struct video_device *vfd =3D video_devdata(file);
> > > > +   struct mtk_vcodec_dev *dev =3D video_drvdata(file);
> > > > +   struct mtk_vcodec_ctx *ctx =3D NULL;
> > > > +   int ret =3D 0;
> > > > +
> > > > +   if (dev->instance_mask =3D=3D ~0UL) {
> > > > +           /* ffz Undefined if no zero exists, err handling he=
re */
> > > > +           mtk_v4l2_err("Too many open contexts");
> > > > +           ret =3D -EBUSY;
> > > > +           goto err_alloc;
> > >
> > > I'm not happy seeing this here. You should always be able to open=
 the device.
> > > I would expect to see a check like this in e.g. start_streaming, =
since that's
> > > where you start to use the hardware for real, and checking if you=
 have enough
> > > resources there is perfectly fine.
> > >
> > > If this is an artificial constraint (i.e. not based on a real har=
dware limitation),
> > > then it should perhaps just be dropped. Such constraints tend to =
be pointless.
> > > If you want to encode 20 streams simultaneously, then why not? It=
 will be very
> > > slow, but that's not this driver's problem :-)
> > >
> > We use ffz to get instance index.
> > This only make sure that instance id is correct since in ffz
> > description,
> > "Undefined if no zero exists, so code should check against ~0UL fir=
st."
> > In this case, it may not be able to move to start_streaming.
> > Any suggestion that how we do this?
> The instance index is only used for printing the debug information.
> No? If that's the case, you can remove instance index and print
> mtk_vcodec_ctx address for debugging.
> >
Got it, will remove it in next version.


best regards,
Tiffany
> >
> > > > +   }
> > > > +
> > > > +   mutex_lock(&dev->dev_mutex);
> > > > +
> > > > +   ctx =3D devm_kzalloc(&dev->plat_dev->dev, sizeof(*ctx), GFP=
_KERNEL);
> > >
> > > Why is this a devm_ call? It is not managed by a device, so it se=
ems to me that
> > > a regular kzalloc is good enough here.
> > >
> > > > +   if (!ctx) {
> > > > +           ret =3D -ENOMEM;
> > > > +           goto err_alloc;
> > > > +   }
> > > > +
> > > > +   ctx->idx =3D ffz(dev->instance_mask);
> > > > +   v4l2_fh_init(&ctx->fh, video_devdata(file));
> > > > +   file->private_data =3D &ctx->fh;
> > > > +   v4l2_fh_add(&ctx->fh);
> > > > +   INIT_LIST_HEAD(&ctx->list);
> > > > +   ctx->dev =3D dev;
> > > > +   init_waitqueue_head(&ctx->queue);
> > > > +
> > > > +   if (vfd =3D=3D dev->vfd_enc) {
> > > > +           ctx->type =3D MTK_INST_ENCODER;
> > > > +           ret =3D mtk_vcodec_enc_ctrls_setup(ctx);
> > > > +           if (ret) {
> > > > +                   mtk_v4l2_err("Failed to setup controls() (%=
d)",
> > > > +                                  ret);
> > > > +                   goto err_ctrls_setup;
> > > > +           }
> > > > +           ctx->m2m_ctx =3D v4l2_m2m_ctx_init(dev->m2m_dev_enc=
, ctx,
> > > > +                                            &mtk_vcodec_enc_qu=
eue_init);
> > > > +           if (IS_ERR(ctx->m2m_ctx)) {
> > > > +                   ret =3D PTR_ERR(ctx->m2m_ctx);
> > > > +                   mtk_v4l2_err("Failed to v4l2_m2m_ctx_init()=
 (%d)",
> > > > +                                  ret);
> > > > +                   goto err_m2m_ctx_init;
> > > > +           }
> > > > +           mtk_vcodec_enc_set_default_params(ctx);
> > > > +   } else {
> > > > +           mtk_v4l2_err("Invalid vfd !");
> > >
> > > This shouldn't be possible at all. I would just drop the 'if (vfd=
 =3D=3D dev->vfd_enc)' check.
> > Got it, will remove in next version.
> >
> > >
> > > > +           ret =3D -ENOENT;
> > > > +           goto err_m2m_ctx_init;
> > > > +   }
> > > > +
> > > > +   if (v4l2_fh_is_singular(&ctx->fh)) {
> > > > +           ret =3D vpu_load_firmware(dev->vpu_plat_dev);
> > > > +           if (ret < 0) {
> > > > +                   /*
> > > > +                     * Return 0 if downloading firmware succes=
sfully,
> > > > +                     * otherwise it is failed
> > > > +                     */
> > > > +                   mtk_v4l2_err("vpu_load_firmware failed!");
> > > > +                   goto err_load_fw;
> > > > +           }
> > >
> > > The fw load seems to be a one-time thing, but here it is done eve=
ry time
> > > someone opens the device and nobody else had it open.
> > >
> > > If this is a one time thing, then using a bool 'loaded_fw' makes =
more sense.
> > >
> > More than one module use vpu firmware, encoder/decoder/mdp...etc.
> > If this is first encode instance, we need to check and load vpu
> > firmware.
> > vpu_load_firmware will check and load firmware when necessary.
> >
> > best regards,
> > Tiffany
> > > > +
> > > > +           dev->enc_capability =3D
> > > > +                   vpu_get_venc_hw_capa(dev->vpu_plat_dev);
> > > > +           mtk_v4l2_debug(0, "encoder capability %x", dev->enc=
_capability);
> > > > +   }
> > > > +
> > > > +   mtk_v4l2_debug(2, "Create instance [%d]@%p m2m_ctx=3D%p ",
> > > > +                    ctx->idx, ctx, ctx->m2m_ctx);
> > > > +   set_bit(ctx->idx, &dev->instance_mask);
> > > > +   dev->num_instances++;
> > > > +   list_add(&ctx->list, &dev->ctx_list);
> > > > +
> > > > +   mutex_unlock(&dev->dev_mutex);
> > > > +   mtk_v4l2_debug(0, "%s encoder [%d]", dev_name(&dev->plat_de=
v->dev),
> > > > +                              ctx->idx);
> > > > +   return ret;
> > > > +
> > > > +   /* Deinit when failure occurred */
> > > > +err_load_fw:
> > > > +   v4l2_m2m_ctx_release(ctx->m2m_ctx);
> > > > +err_m2m_ctx_init:
> > > > +   v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
> > > > +err_ctrls_setup:
> > > > +   v4l2_fh_del(&ctx->fh);
> > > > +   v4l2_fh_exit(&ctx->fh);
> > > > +   devm_kfree(&dev->plat_dev->dev, ctx);
> > > > +err_alloc:
> > > > +   mutex_unlock(&dev->dev_mutex);
> > > > +
> > > > +   return ret;
> > > > +}
> > > > +
> > > > +static int fops_vcodec_release(struct file *file)
> > > > +{
> > > > +   struct mtk_vcodec_dev *dev =3D video_drvdata(file);
> > > > +   struct mtk_vcodec_ctx *ctx =3D fh_to_ctx(file->private_data=
);
> > > > +
> > > > +   mtk_v4l2_debug(1, "[%d] encoder", ctx->idx);
> > > > +   mutex_lock(&dev->dev_mutex);
> > > > +
> > > > +   mtk_vcodec_enc_release(ctx);
> > > > +   v4l2_fh_del(&ctx->fh);
> > > > +   v4l2_fh_exit(&ctx->fh);
> > > > +   v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
> > > > +   v4l2_m2m_ctx_release(ctx->m2m_ctx);
> > > > +
> > > > +   list_del_init(&ctx->list);
> > > > +   dev->num_instances--;
> > > > +   clear_bit(ctx->idx, &dev->instance_mask);
> > > > +   devm_kfree(&dev->plat_dev->dev, ctx);
> > > > +   mutex_unlock(&dev->dev_mutex);
> > > > +   return 0;
> > > > +}
> > > > +
> > > > +static const struct v4l2_file_operations mtk_vcodec_fops =3D {
> > > > +   .owner                          =3D THIS_MODULE,
> > > > +   .open                           =3D fops_vcodec_open,
> > > > +   .release                        =3D fops_vcodec_release,
> > > > +   .poll                           =3D v4l2_m2m_fop_poll,
> > > > +   .unlocked_ioctl                 =3D video_ioctl2,
> > > > +   .mmap                           =3D v4l2_m2m_fop_mmap,
> > > > +};
> > > > +
> > > > +static int mtk_vcodec_probe(struct platform_device *pdev)
> > > > +{
> > > > +   struct mtk_vcodec_dev *dev;
> > > > +   struct video_device *vfd_enc;
> > > > +   struct resource *res;
> > > > +   int i, j, ret;
> > > > +   DEFINE_DMA_ATTRS(attrs);
> > > > +
> > > > +   dev =3D devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
> > > > +   if (!dev)
> > > > +           return -ENOMEM;
> > > > +
> > > > +   INIT_LIST_HEAD(&dev->ctx_list);
> > > > +   dev->plat_dev =3D pdev;
> > > > +
> > > > +   dev->vpu_plat_dev =3D vpu_get_plat_device(dev->plat_dev);
> > > > +   if (dev->vpu_plat_dev =3D=3D NULL) {
> > > > +           mtk_v4l2_err("[VPU] vpu device in not ready");
> > > > +           return -EPROBE_DEFER;
> > > > +   }
> > > > +
> > > > +   vpu_wdt_reg_handler(dev->vpu_plat_dev, mtk_vcodec_enc_reset=
_handler,
> > > > +                                           dev, VPU_RST_ENC);
> > > > +
> > > > +   ret =3D mtk_vcodec_init_enc_pm(dev);
> > > > +   if (ret < 0) {
> > > > +           dev_err(&pdev->dev, "Failed to get mt vcodec clock =
source!");
> > > > +           return ret;
> > > > +   }
> > > > +
> > > > +   for (i =3D VENC_SYS, j =3D 0; i < NUM_MAX_VCODEC_REG_BASE; =
i++, j++) {
> > > > +           res =3D platform_get_resource(pdev, IORESOURCE_MEM,=
 j);
> > > > +           if (res =3D=3D NULL) {
> > > > +                   dev_err(&pdev->dev, "get memory resource fa=
iled.");
> > > > +                   ret =3D -ENXIO;
> > > > +                   goto err_res;
> > > > +           }
> > > > +           dev->reg_base[i] =3D devm_ioremap_resource(&pdev->d=
ev, res);
> > > > +           if (IS_ERR(dev->reg_base[i])) {
> > > > +                   dev_err(&pdev->dev,
> > > > +                           "devm_ioremap_resource %d failed.",=
 i);
> > > > +                   ret =3D PTR_ERR(dev->reg_base[i]);
> > > > +                   goto err_res;
> > > > +           }
> > > > +           mtk_v4l2_debug(2, "reg[%d] base=3D0x%p", i, dev->re=
g_base[i]);
> > > > +   }
> > > > +
> > > > +   res =3D platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> > > > +   if (res =3D=3D NULL) {
> > > > +           dev_err(&pdev->dev, "failed to get irq resource");
> > > > +           ret =3D -ENOENT;
> > > > +           goto err_res;
> > > > +   }
> > > > +
> > > > +   dev->enc_irq =3D platform_get_irq(pdev, 0);
> > > > +   ret =3D devm_request_irq(&pdev->dev, dev->enc_irq,
> > > > +                          mtk_vcodec_enc_irq_handler,
> > > > +                          0, pdev->name, dev);
> > > > +   if (ret) {
> > > > +           dev_err(&pdev->dev, "Failed to install dev->enc_irq=
 %d (%d)",
> > > > +                   dev->enc_irq,
> > > > +                   ret);
> > > > +           ret =3D -EINVAL;
> > > > +           goto err_res;
> > > > +   }
> > > > +
> > > > +   dev->enc_lt_irq =3D platform_get_irq(pdev, 1);
> > > > +   ret =3D devm_request_irq(&pdev->dev,
> > > > +                          dev->enc_lt_irq, mtk_vcodec_enc_lt_i=
rq_handler,
> > > > +                          0, pdev->name, dev);
> > > > +   if (ret) {
> > > > +           dev_err(&pdev->dev,
> > > > +                   "Failed to install dev->enc_lt_irq %d (%d)"=
,
> > > > +                   dev->enc_lt_irq, ret);
> > > > +           ret =3D -EINVAL;
> > > > +           goto err_res;
> > > > +   }
> > > > +
> > > > +   disable_irq(dev->enc_irq);
> > > > +   disable_irq(dev->enc_lt_irq); /* VENC_LT */
> > > > +   mutex_init(&dev->enc_mutex);
> > > > +   mutex_init(&dev->dev_mutex);
> > > > +   spin_lock_init(&dev->irqlock);
> > > > +
> > > > +   snprintf(dev->v4l2_dev.name, sizeof(dev->v4l2_dev.name), "%=
s",
> > > > +            "[MTK_V4L2_VENC]");
> > > > +
> > > > +   ret =3D v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
> > > > +   if (ret) {
> > > > +           mtk_v4l2_err("v4l2_device_register err=3D%d", ret);
> > > > +           goto err_res;
> > > > +   }
> > > > +
> > > > +   init_waitqueue_head(&dev->queue);
> > > > +
> > > > +   /* allocate video device for encoder and register it */
> > > > +   vfd_enc =3D video_device_alloc();
> > > > +   if (!vfd_enc) {
> > > > +           mtk_v4l2_err("Failed to allocate video device");
> > > > +           ret =3D -ENOMEM;
> > > > +           goto err_enc_alloc;
> > > > +   }
> > > > +   vfd_enc->fops           =3D &mtk_vcodec_fops;
> > > > +   vfd_enc->ioctl_ops      =3D &mtk_venc_ioctl_ops;
> > > > +   vfd_enc->release        =3D video_device_release;
> > > > +   vfd_enc->lock           =3D &dev->dev_mutex;
> > > > +   vfd_enc->v4l2_dev       =3D &dev->v4l2_dev;
> > > > +   vfd_enc->vfl_dir        =3D VFL_DIR_M2M;
> > > > +   vfd_enc->device_caps    =3D V4L2_CAP_VIDEO_M2M_MPLANE |
> > > > +                                           V4L2_CAP_STREAMING;
> > > > +
> > > > +   snprintf(vfd_enc->name, sizeof(vfd_enc->name), "%s",
> > > > +            MTK_VCODEC_ENC_NAME);
> > > > +   video_set_drvdata(vfd_enc, dev);
> > > > +   dev->vfd_enc =3D vfd_enc;
> > > > +   platform_set_drvdata(pdev, dev);
> > > > +
> > > > +   dev->alloc_ctx =3D vb2_dma_contig_init_ctx(&pdev->dev);
> > > > +   if (IS_ERR(dev->alloc_ctx)) {
> > > > +           dev->alloc_ctx =3D NULL;
> > > > +           mtk_v4l2_err("Failed to alloc vb2 dma context 0");
> > > > +           ret =3D PTR_ERR(dev->alloc_ctx);
> > > > +           goto err_vb2_ctx_init;
> > > > +   }
> > > > +
> > > > +   dev->m2m_dev_enc =3D v4l2_m2m_init(&mtk_venc_m2m_ops);
> > > > +   if (IS_ERR(dev->m2m_dev_enc)) {
> > > > +           mtk_v4l2_err("Failed to init mem2mem enc device");
> > > > +           ret =3D PTR_ERR(dev->m2m_dev_enc);
> > > > +           goto err_enc_mem_init;
> > > > +   }
> > > > +
> > > > +   dev->encode_workqueue =3D
> > > > +                   alloc_ordered_workqueue(MTK_VCODEC_ENC_NAME=
,
> > > > +                                                           WQ_=
MEM_RECLAIM |
> > > > +                                                           WQ_=
=46REEZABLE);
> > > > +   if (!dev->encode_workqueue) {
> > > > +           mtk_v4l2_err("Failed to create encode workqueue");
> > > > +           ret =3D -EINVAL;
> > > > +           goto err_event_workq;
> > > > +   }
> > > > +
> > > > +   ret =3D video_register_device(vfd_enc, VFL_TYPE_GRABBER, 1)=
;
> > > > +   if (ret) {
> > > > +           mtk_v4l2_err("Failed to register video device");
> > > > +           goto err_enc_reg;
> > > > +   }
> > > > +
> > > > +   /* Avoid the iommu eat big hunks */
> > > > +   dma_set_attr(DMA_ATTR_ALLOC_SINGLE_PAGES, &attrs);
> > > > +
> > > > +   mtk_v4l2_debug(0, "encoder registered as /dev/video%d",
> > > > +                    vfd_enc->num);
> > > > +
> > > > +   return 0;
> > > > +
> > > > +err_enc_reg:
> > > > +   destroy_workqueue(dev->encode_workqueue);
> > > > +err_event_workq:
> > > > +   v4l2_m2m_release(dev->m2m_dev_enc);
> > > > +err_enc_mem_init:
> > > > +   vb2_dma_contig_cleanup_ctx(dev->alloc_ctx);
> > > > +err_vb2_ctx_init:
> > > > +   video_unregister_device(vfd_enc);
> > > > +err_enc_alloc:
> > > > +   v4l2_device_unregister(&dev->v4l2_dev);
> > > > +err_res:
> > > > +   mtk_vcodec_release_enc_pm(dev);
> > > > +   return ret;
> > > > +}
> > > > +
> > > > +static const struct of_device_id mtk_vcodec_enc_match[] =3D {
> > > > +   {.compatible =3D "mediatek,mt8173-vcodec-enc",},
> > > > +   {},
> > > > +};
> > > > +MODULE_DEVICE_TABLE(of, mtk_vcodec_enc_match);
> > > > +
> > > > +static int mtk_vcodec_enc_remove(struct platform_device *pdev)
> > > > +{
> > > > +   struct mtk_vcodec_dev *dev =3D platform_get_drvdata(pdev);
> > > > +
> > > > +   mtk_v4l2_debug_enter();
> > > > +   flush_workqueue(dev->encode_workqueue);
> > > > +   destroy_workqueue(dev->encode_workqueue);
> > > > +   if (dev->m2m_dev_enc)
> > > > +           v4l2_m2m_release(dev->m2m_dev_enc);
> > > > +   if (dev->alloc_ctx)
> > > > +           vb2_dma_contig_cleanup_ctx(dev->alloc_ctx);
> > > > +
> > > > +   if (dev->vfd_enc)
> > > > +           video_unregister_device(dev->vfd_enc);
> > > > +
> > > > +   v4l2_device_unregister(&dev->v4l2_dev);
> > > > +   mtk_vcodec_release_enc_pm(dev);
> > > > +   return 0;
> > > > +}
> > > > +
> > > > +static struct platform_driver mtk_vcodec_enc_driver =3D {
> > > > +   .probe  =3D mtk_vcodec_probe,
> > > > +   .remove =3D mtk_vcodec_enc_remove,
> > > > +   .driver =3D {
> > > > +           .name   =3D MTK_VCODEC_ENC_NAME,
> > > > +           .owner  =3D THIS_MODULE,
> > > > +           .of_match_table =3D mtk_vcodec_enc_match,
> > > > +   },
> > > > +};
> > > > +
> > > > +module_platform_driver(mtk_vcodec_enc_driver);
> > > > +
> > > > +
> > > > +MODULE_LICENSE("GPL v2");
> > > > +MODULE_DESCRIPTION("Mediatek video codec V4L2 encoder driver")=
;
> > >
> > > Regards,
> > >
> > >       Hans
> >
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-med=
ia" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
