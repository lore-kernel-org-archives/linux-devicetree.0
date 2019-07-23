From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 2/3] dt-bindings: rng: add bindings for MediaTek ARMv8 SoCs
Date: Tue, 23 Jul 2019 08:35:47 -0600
Message-ID: <CAL_Jsq+SRhd=-5O2G_CMfJX9Z188kvA05MQOXaU1J8iExwUixQ@mail.gmail.com>
References: <1561361052-13072-1-git-send-email-neal.liu@mediatek.com>
 <1561361052-13072-3-git-send-email-neal.liu@mediatek.com> <20190722171320.GA9806@bogus>
 <1563848465.31451.4.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1563848465.31451.4.camel@mtkswgap22>
Sender: linux-kernel-owner@vger.kernel.org
To: Neal Liu <neal.liu@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, wsd_upstream <wsd_upstream@mediatek.com>, Sean Wang <sean.wang@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?UTF-8?B?Q3J5c3RhbCBHdW8gKOmDreaZtik=?= <Crystal.Guo@mediatek.com>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, Matt Mackall <mpm@selenic.com>, Matthias Brugger <matthias.bgg@gmail.com>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 22, 2019 at 8:21 PM Neal Liu <neal.liu@mediatek.com> wrote:
>

Please don't top post to lists.

> Dear Rob,
>         You can check my driver for detail:
>         http://patchwork.kernel.org/patch/11012475/ or patchset 3/3

I could, or you could just answer my question.

>
>         This driver is registered as hardware random number generator, and
> combines with rng-core.
>         We want to add one rng hw based on the dts. Is this proper or do you
> have other suggestion to meet this requirement?

It depends. There doesn't appear to be any resource configuration, so
why does it need to be in DT. DT is not the only way instantiate
drivers.

Rob

>
>         Thanks
>
>
> On Tue, 2019-07-23 at 01:13 +0800, Rob Herring wrote:
> > On Mon, Jun 24, 2019 at 03:24:11PM +0800, Neal Liu wrote:
> > > Document the binding used by the MediaTek ARMv8 SoCs random
> > > number generator with TrustZone enabled.
> > >
> > > Signed-off-by: Neal Liu <neal.liu@mediatek.com>
> > > ---
> > >  .../devicetree/bindings/rng/mtk-sec-rng.txt        |   10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/rng/mtk-sec-rng.txt
> > >
> > > diff --git a/Documentation/devicetree/bindings/rng/mtk-sec-rng.txt b/Documentation/devicetree/bindings/rng/mtk-sec-rng.txt
> > > new file mode 100644
> > > index 0000000..c04ce15
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/rng/mtk-sec-rng.txt
> > > @@ -0,0 +1,10 @@
> > > +MediaTek random number generator with TrustZone enabled
> > > +
> > > +Required properties:
> > > +- compatible : Should be "mediatek,mtk-sec-rng"
> >
> > What's the interface to access this?
> >
> > A node with a 'compatible' and nothing else is a sign of something that
> > a parent device should instantiate and doesn't need to be in DT. IOW,
> > what do complete bindings for firmware functions look like?
> >
> > > +
> > > +Example:
> > > +
> > > +hwrng: hwrng {
> > > +   compatible = "mediatek,mtk-sec-rng";
> > > +}
> > > --
> > > 1.7.9.5
> > >
> >
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek
>
>
