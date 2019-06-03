From: Neal Liu <neal.liu@mediatek.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: rng: update bindings for MediaTek
 ARMv8 SoCs
Date: Mon, 3 Jun 2019 10:27:07 +0800
Message-ID: <1559528827.6663.8.camel@mtkswgap22>
References: <1558946326-13630-1-git-send-email-neal.liu@mediatek.com>
 <1558946326-13630-3-git-send-email-neal.liu@mediatek.com>
 <CAGp9LzrQegBb9Oe-=jfkwOrsYY=eN3BSF=DWnu+aSBAhQ5bexA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAGp9LzrQegBb9Oe-=jfkwOrsYY=eN3BSF=DWnu+aSBAhQ5bexA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sean Wang <sean.wang@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, wsd_upstream@mediatek.com, lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, linux-crypto@vger.kernel.org, Matt Mackall <mpm@selenic.com>, Matthias Brugger <matthias.bgg@gmail.com>, Crystal Guo <Crystal.Guo@mediatek.com>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Sean,


On Thu, 2019-05-30 at 15:56 -0700, Sean Wang wrote:
> Hi, Neal
> 
> On Mon, May 27, 2019 at 1:39 AM Neal Liu <neal.liu@mediatek.com> wrote:
> >
> > Document the binding used by the MediaTek ARMv8 SoCs random
> > number generator with TrustZone enabled.
> >
> > Signed-off-by: Neal Liu <neal.liu@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/rng/mtk-rng.txt |   13 ++++++++++---
> >  1 file changed, 10 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/rng/mtk-rng.txt b/Documentation/devicetree/bindings/rng/mtk-rng.txt
> > index 2bc89f1..1fb9b1d 100644
> > --- a/Documentation/devicetree/bindings/rng/mtk-rng.txt
> > +++ b/Documentation/devicetree/bindings/rng/mtk-rng.txt
> > @@ -3,9 +3,12 @@ found in MediaTek SoC family
> >
> >  Required properties:
> >  - compatible       : Should be
> > -                       "mediatek,mt7622-rng",  "mediatek,mt7623-rng" : for MT7622
> > -                       "mediatek,mt7629-rng",  "mediatek,mt7623-rng" : for MT7629
> > -                       "mediatek,mt7623-rng" : for MT7623
> > +                       "mediatek,mt7622-rng", "mediatek,mt7623-rng" for MT7622
> > +                       "mediatek,mt7629-rng", "mediatek,mt7623-rng" for MT7629
> > +                       "mediatek,mt7623-rng" for MT7623
> 
> No make any change for those lines not belong to the series

There are some unused spaces and symbols. We try to align coding style
with other bindings.

> 
> > +                       "mediatek,mtk-sec-rng" for MediaTek ARMv8 SoCs
> 
> I thought "mediatek,mtk-sec-rng" is only for those MediaTek ARMv8 SoCs
> with security RNG

Yes, sure. It's better to describe with "MediaTek ARMv8 SoCs with
security RNG". 

> 
> > +
> > +Optional properties:
> >  - clocks           : list of clock specifiers, corresponding to
> >                       entries in clock-names property;
> >  - clock-names      : Should contain "rng" entries;
> > @@ -19,3 +22,7 @@ rng: rng@1020f000 {
> >         clocks = <&infracfg CLK_INFRA_TRNG>;
> >         clock-names = "rng";
> >  };
> 
> For those MediaTek ARMv8 SoCs with security RNG

Are you suggesting we create a new binding file with security RNG?

> 
> > +
> > +hwrng: hwrng {
> > +       compatible = "mediatek,mtk-sec-rng";
> > +};
> > --
> > 1.7.9.5
> >
