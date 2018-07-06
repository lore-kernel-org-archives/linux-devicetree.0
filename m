From: Guodong Xu <guodong.xu@linaro.org>
Subject: Re: [PATCH 1/3] dt-bindings: k3dma: add optional property dma_min_chan
Date: Fri, 6 Jul 2018 11:17:03 +0800
Message-ID: <CAFGCpxwEi-uG=K_KCRA2hmwmN=BEdU2jjTae1=jnugb04VEG7g@mail.gmail.com>
References: <20180622032416.20133-1-guodong.xu@linaro.org> <20180622032416.20133-2-guodong.xu@linaro.org>
 <20180703185442.GA18008@rob-hp-laptop> <CAFGCpxyx1fqo0ZmthumQbHVJZTZ=mpX7HGg_V8oowmKRfb46VA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFGCpxyx1fqo0ZmthumQbHVJZTZ=mpX7HGg_V8oowmKRfb46VA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: vkoul@kernel.org, Mark Rutland <mark.rutland@arm.com>, dan.j.williams@intel.com, liyu65@hisilicon.com, Suzhuangluan <suzhuangluan@hisilicon.com>, "xuhongtao (A)" <xuhongtao8@hisilicon.com>, zhongkaihua <zhongkaihua@huawei.com>, Xuezhiliang <xuezhiliang@hisilicon.com>, "xupeng (Q)" <xupeng7@huawei.com>, sunliang10@huawei.com, "Fengbaopeng (kevin, Kirin Solution Dept)" <fengbaopeng@hisilicon.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 4, 2018 at 9:14 AM Guodong Xu <guodong.xu@linaro.org> wrote:
>
> On Wed, Jul 4, 2018 at 2:54 AM Rob Herring <robh@kernel.org> wrote:
> >
> > On Fri, Jun 22, 2018 at 11:24:14AM +0800, Guodong Xu wrote:
> > > From: Li Yu <liyu65@hisilicon.com>
> > >
> > > Add optional property dma_min_chan for k3dma.
> > >
> > > Signed-off-by: Li Yu <liyu65@hisilicon.com>
> > > ---
> > >  Documentation/devicetree/bindings/dma/k3dma.txt | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >
> > > diff --git a/t b/Documentation/devicetree/bindings/dma/k3dma.txt
> > > index 4945aeac4dc4..2fa1370c3173 100644
> > > --- a/Documentation/devicetree/bindings/dma/k3dma.txt
> > > +++ b/Documentation/devicetree/bindings/dma/k3dma.txt
> > > @@ -12,6 +12,11 @@ Required properties:
> > >               have specific request line
> > >  - clocks: clock required
> > >
> > > +Optional properties:
> > > +- dma_min_chan: the minimum number of DMA channel which begin to use
> > > +             the default value is 0, but in some platform is
> > > +             configured 1, like hi3660 platform
> >
> > Can't this be implied by the compatible?
> >
>
> No. "hisilicon,k3-dma-1.0" can work with series of hisilicon kirin
> SoC. And each has different reservation of channels for on-chip
> coprocessors.
>
> > If not, needs vendor prefix and don't use '_' in property names.
> >
>
> Sure, thanks. Will change that when design new property. As Vinod
> suggested, it makes sense to change this to a mask.
>

After checking with Kirin SoC design team, I prefer to stay with
minimum channel number instead of mask. So, I will change this
property to:

hisilicon,dma-min-chan

-Guodong



>
> -Guodong
>
> > Rob
