From: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH 1/3] k3dma: Upgrade k3dma drever to support hisi_asp_dma hardware
Date: Fri, 4 Jan 2019 09:32:06 -0800
Message-ID: <CALAqxLVrK+cBNsyt62Q6gb_SXc_04-LjO02hnhG24bJ6TAXapQ@mail.gmail.com>
References: <1545978983-124360-1-git-send-email-hutenghui@huawei.com> <20190104172405.GR13372@vkoul-mobl.Dlink>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190104172405.GR13372@vkoul-mobl.Dlink>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>
Cc: h00249924 <hutenghui@huawei.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Youlin Wang <wwx575822@notesmail.huawei.com>, hanxiaolong3@hisilicon.com, Zhuangluan Su <suzhuangluan@hisilicon.com>, Hantanglei <hantanglei@huawei.com>, lkml <linux-kernel@vger.kernel.org>, Kongfei <kongfei@hisilicon.com>, ninggaoyu <ninggaoyu@hisilicon.com>, Liyuequan <liyuequan@hisilicon.com>, dmaengine@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, "huangli (I)" <huangli295@hisilicon.com>, wangyoulin <wangyoulin1@hisilicon.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "Qianli (A)" <cash.qianli@hisilicon.com>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 4, 2019 at 9:25 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> On 28-12-18, 14:36, h00249924 wrote:
> > From: Youlin Wang <wwx575822@notesmail.huawei.com>
> >
> > There is an new "hisi-pcm-asp-dma-1.0" device added in
> > "arch/arm64/boot/dts/hisilicon/hi3660.dtsi".
> > So we have to add a matching id in the driver file:
> > "{ .compatible = "hisilicon,hisi-pcm-asp-dma-1.0", }"
> >
> > And also hisi-pcm-asp dma device needs no setting to the clock.
> > So we skip this by "if" sentence on id string matching:
> > "if (strcasecmp((of_id->compatible), (k3_pdma_dt_ids[0].compatible)) == 0)"
> >
> > After above this driver will support both k3 and hisi_asp dma hardware.
> >
> > Signed-off-by: Youlin Wang <wwx575822@notesmail.huawei.com>
> > Signed-off-by: Tanglei Han <hantanglei@huawei.com>
> > Cc: Dan Williams <dan.j.williams@intel.com>
> > Cc: Vinod Koul <vkoul@kernel.org>
> > ---
> >  drivers/dma/k3dma.c | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/dma/k3dma.c b/drivers/dma/k3dma.c
> > index fdec2b6..10eecc2 100644
> > --- a/drivers/dma/k3dma.c
> > +++ b/drivers/dma/k3dma.c
> > @@ -792,6 +792,7 @@ static int k3_dma_transfer_resume(struct dma_chan *chan)
> >
> >  static const struct of_device_id k3_pdma_dt_ids[] = {
> >       { .compatible = "hisilicon,k3-dma-1.0", },
> > +     { .compatible = "hisilicon,hisi-pcm-asp-dma-1.0", },
>
> The binding doc patch should precede this..
>
> >       {}
> >  };
> >  MODULE_DEVICE_TABLE(of, k3_pdma_dt_ids);
> > @@ -835,10 +836,12 @@ static int k3_dma_probe(struct platform_device *op)
> >                               "dma-requests", &d->dma_requests);
> >       }
> >
> > -     d->clk = devm_clk_get(&op->dev, NULL);
> > -     if (IS_ERR(d->clk)) {
> > -             dev_err(&op->dev, "no dma clk\n");
> > -             return PTR_ERR(d->clk);
> > +     if (strcasecmp((of_id->compatible), (k3_pdma_dt_ids[0].compatible)) == 0) {
> > +             d->clk = devm_clk_get(&op->dev, NULL);
>
> who provides clk in this case? how does this scale if you have another
> compatible in future for newer version of controller?

Yea, I've pushed a few times in internal review to use match_data() here.

Tanglei Han: If its ok, I've spent some time integrating these changes
with some other pending k3dma changes. So I'll rework and integrate
some of the review feedback on this and resend it so we can get this
moving a little faster.

I'll leave the i2s feedback to you, so please continue reworking and
resubmitting those, but I'll handle upstreaming the k3dma changes
(keeping you on cc of course).

thanks
-john
