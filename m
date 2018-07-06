From: Guodong Xu <guodong.xu@linaro.org>
Subject: Re: [PATCH 2/3] k3dma: add support to reserved minimum channels
Date: Fri, 6 Jul 2018 11:05:21 +0800
Message-ID: <CAFGCpxwkdJQAf9bwHTLp+Zc5ASbnFQn9UDsA+zFCH7UZJy9aBQ@mail.gmail.com>
References: <20180622032416.20133-1-guodong.xu@linaro.org> <20180622032416.20133-3-guodong.xu@linaro.org>
 <20180628060239.GO22377@vkoul-mobl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180628060239.GO22377@vkoul-mobl>
Sender: linux-kernel-owner@vger.kernel.org
To: vkoul@kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dan.j.williams@intel.com, liyu65@hisilicon.com, Suzhuangluan <suzhuangluan@hisilicon.com>, "xuhongtao (A)" <xuhongtao8@hisilicon.com>, zhongkaihua <zhongkaihua@huawei.com>, Xuezhiliang <xuezhiliang@hisilicon.com>, "xupeng (Q)" <xupeng7@huawei.com>, sunliang10@huawei.com, "Fengbaopeng (kevin, Kirin Solution Dept)" <fengbaopeng@hisilicon.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 28, 2018 at 2:02 PM Vinod <vkoul@kernel.org> wrote:
>
> On 22-06-18, 11:24, Guodong Xu wrote:
> > From: Li Yu <liyu65@hisilicon.com>
> >
> > On k3 series of SoC, DMA controller reserves some channels for
> > other on-chip coprocessors. By adding support to dma_min_chan, kernel
> > will not be able to use these reserved channels.
> >
> > One example is on Hi3660 platform, channel 0 is reserved to lpm3.
> >
> > Please also refer to Documentation/devicetree/bindings/dma/k3dma.txt
>
> and if some other platform has channel X marked for co-processor, maybe
> a last channel or something in middle, how will this work then?
>
Hi=EF=BC=8C Vinod

Sorry for delayed response. We checked with Kirin hardware design
team, so far their design strategy is all Kirin SoC series reserve
only from minimum side, saying channel 0, then 1, then 2. That impacts
the current SoC in upstreaming, Kirin960 (Hi3660), and next versions
in Kirin SoC, Kirin970 and 980, which may hit upstream later.

> I am thinking this should be a mask, rather than min.
>

So, since this driver k3dma.c is only used by Kirin SoC DMA
controllers, I would prefer to keep the current design dma_min_chan
unchanged.

What do you think?

-Guodong


> >
> > Signed-off-by: Li Yu <liyu65@hisilicon.com>
> > Signed-off-by: Guodong Xu <guodong.xu@linaro.org>
> > ---
> >  drivers/dma/k3dma.c | 13 ++++++++-----
> >  1 file changed, 8 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/dma/k3dma.c b/drivers/dma/k3dma.c
> > index fa31cccbe04f..13cec12742e3 100644
> > --- a/drivers/dma/k3dma.c
> > +++ b/drivers/dma/k3dma.c
> > @@ -113,6 +113,7 @@ struct k3_dma_dev {
> >       struct dma_pool         *pool;
> >       u32                     dma_channels;
> >       u32                     dma_requests;
> > +     u32                     dma_min_chan;
> >       unsigned int            irq;
> >  };
> >
> > @@ -309,7 +310,7 @@ static void k3_dma_tasklet(unsigned long arg)
> >
> >       /* check new channel request in d->chan_pending */
> >       spin_lock_irq(&d->lock);
> > -     for (pch =3D 0; pch < d->dma_channels; pch++) {
> > +     for (pch =3D d->dma_min_chan; pch < d->dma_channels; pch++) {
> >               p =3D &d->phy[pch];
> >
> >               if (p->vchan =3D=3D NULL && !list_empty(&d->chan_pending)=
) {
> > @@ -326,7 +327,7 @@ static void k3_dma_tasklet(unsigned long arg)
> >       }
> >       spin_unlock_irq(&d->lock);
> >
> > -     for (pch =3D 0; pch < d->dma_channels; pch++) {
> > +     for (pch =3D d->dma_min_chan; pch < d->dma_channels; pch++) {
> >               if (pch_alloc & (1 << pch)) {
> >                       p =3D &d->phy[pch];
> >                       c =3D p->vchan;
> > @@ -825,6 +826,8 @@ static int k3_dma_probe(struct platform_device *op)
> >                               "dma-channels", &d->dma_channels);
> >               of_property_read_u32((&op->dev)->of_node,
> >                               "dma-requests", &d->dma_requests);
> > +             of_property_read_u32((&op->dev)->of_node,
> > +                             "dma-min-chan", &d->dma_min_chan);
> >       }
> >
> >       d->clk =3D devm_clk_get(&op->dev, NULL);
> > @@ -848,12 +851,12 @@ static int k3_dma_probe(struct platform_device *o=
p)
> >               return -ENOMEM;
> >
> >       /* init phy channel */
> > -     d->phy =3D devm_kcalloc(&op->dev,
> > -             d->dma_channels, sizeof(struct k3_dma_phy), GFP_KERNEL);
> > +     d->phy =3D devm_kcalloc(&op->dev, (d->dma_channels - d->dma_min_c=
han),
> > +                     sizeof(struct k3_dma_phy), GFP_KERNEL);
> >       if (d->phy =3D=3D NULL)
> >               return -ENOMEM;
> >
> > -     for (i =3D 0; i < d->dma_channels; i++) {
> > +     for (i =3D d->dma_min_chan; i < d->dma_channels; i++) {
> >               struct k3_dma_phy *p =3D &d->phy[i];
> >
> >               p->idx =3D i;
> > --
> > 2.17.1
>
> --
> ~Vinod
