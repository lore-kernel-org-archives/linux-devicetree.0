From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4, 05/33] dt-bindings: mediatek: add RDMA1 description
 for mt8183 display
Date: Thu, 25 Jul 2019 16:23:54 -0600
Message-ID: <CAL_JsqL439PCnG3B75uqCXb3-OfH2uK6qtU7XpUb-cEnPWRkkQ@mail.gmail.com>
References: <1562625253-29254-1-git-send-email-yongqiang.niu@mediatek.com>
 <1562625253-29254-6-git-send-email-yongqiang.niu@mediatek.com>
 <20190724201635.GA18345@bogus> <1564024819.2621.4.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1564024819.2621.4.camel@mtksdaap41>
Sender: linux-kernel-owner@vger.kernel.org
To: CK Hu <ck.hu@mediatek.com>
Cc: yongqiang.niu@mediatek.com, Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, dri-devel <dri-devel@lists.freedesktop.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 24, 2019 at 9:20 PM CK Hu <ck.hu@mediatek.com> wrote:
>
> Hi, Rob:
>
> On Wed, 2019-07-24 at 14:16 -0600, Rob Herring wrote:
> > On Tue, Jul 09, 2019 at 06:33:45AM +0800, yongqiang.niu@mediatek.com wrote:
> > > From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > >
> > > This patch add RDMA1 description for mt8183 display
> > >
> > > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > > ---
> > >  Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> > > index afd3c90..bb9274a 100644
> > > --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> > > +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> > > @@ -30,6 +30,7 @@ Required properties (all function blocks):
> > >     "mediatek,<chip>-disp-ovl"              - overlay (4 layers, blending, csc)
> > >     "mediatek,<chip>-disp-ovl-2l"           - overlay (2 layers, blending, csc)
> > >     "mediatek,<chip>-disp-rdma"             - read DMA / line buffer
> > > +   "mediatek,<chip>-disp-rdma1"            - function is same with RDMA, fifo size is different
> >
> > This can't be determined by which chip it is? IOW, a chip may have both
> > rdma and rdma1?
>
> In MT8183, there are two different rdma. The difference is the fifo size
> in each one. I've a question: is it better to have two compatible string
> for each one, or just one compatible string for both but with a property
> to set fifo size?

If that's the only diff, then a property for fifo size is fine. We
just don't want to be adding a new property for each new difference.
