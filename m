From: Zhiyong Tao <zhiyong.tao@mediatek.com>
Subject: Re: [PATCH 1/2] dt-bindings: adc: mt8183: add binding document
Date: Wed, 24 Apr 2019 08:51:31 +0800
Message-ID: <1556067091.21970.16.camel@mhfsdcap03>
References: <20190422115417.16751-1-zhiyong.tao@mediatek.com>
         <20190422115417.16751-2-zhiyong.tao@mediatek.com>
         <4c7f244f-4111-9e28-5134-8f108b1dbafa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4c7f244f-4111-9e28-5134-8f108b1dbafa@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: robh+dt@kernel.org, jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, srv_heupstream@mediatek.com, hui.liu@mediatek.com, yingjoe.chen@mediatek.com, sean.wang@mediatek.com, erin.lo@mediatek.com, eddie.huang@mediatek.com, s.hauer@pengutronix.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, 2019-04-23 at 16:35 +0200, Matthias Brugger wrote:
> 
> On 22/04/2019 13:54, Zhiyong Tao wrote:
> > The commit adds mt8183 compatible node in binding document.
> > 
> > Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/iio/adc/mt6577_auxadc.txt | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/iio/adc/mt6577_auxadc.txt b/Documentation/devicetree/bindings/iio/adc/mt6577_auxadc.txt
> > index 0df9befdaecc..05bc79d8483c 100644
> > --- a/Documentation/devicetree/bindings/iio/adc/mt6577_auxadc.txt
> > +++ b/Documentation/devicetree/bindings/iio/adc/mt6577_auxadc.txt
> > @@ -15,6 +15,7 @@ Required properties:
> >      - "mediatek,mt2712-auxadc": For MT2712 family of SoCs
> >      - "mediatek,mt7622-auxadc": For MT7622 family of SoCs
> >      - "mediatek,mt8173-auxadc": For MT8173 family of SoCs
> > +    - "mediatek,mt8183-auxadc": For MT8183 family of SoCs
> >    - reg: Address range of the AUXADC unit.
> >    - clocks: Should contain a clock specifier for each entry in clock-names
> >    - clock-names: Should contain "main".
> > 
> 
> You are missing the logic in the driver to bind against this compatible.
> If there is nothing different from other SoCs then you could add a compatible
> with a fallback, like:
> 
> "mediatek,mt8183-auxadc", "mediatek,mt7622-auxadc": For MT8183 family of SoCs

==> Thanks for your suggestion. In v2, we will add the comment here:
- "mediatek,mt8183-auxadc", "mediatek,mt8173-auxadc": For MT8183 family
of SoCs.

> 
> Regards,
> Matthias
