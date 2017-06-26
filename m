From: Zhiyong Tao <zhiyong.tao@mediatek.com>
Subject: Re: [PATCH 1/3] dt-bindings: adc: mt7622: add binding document
Date: Mon, 26 Jun 2017 18:45:19 +0800
Message-ID: <1498473919.844.7.camel@mhfsdcap03>
References: <1498110274-18678-1-git-send-email-zhiyong.tao@mediatek.com>
         <1498110274-18678-2-git-send-email-zhiyong.tao@mediatek.com>
         <20170624210241.361743b3@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170624210241.361743b3@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>
Cc: robh+dt@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, srv_heupstream@mediatek.com, liguo.zhang@mediatek.com, yingjoe.chen@mediatek.com, sean.wang@mediatek.com, matthias.bgg@gmail.com, s.hauer@pengutronix.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sat, 2017-06-24 at 21:02 +0100, Jonathan Cameron wrote:
> On Thu, 22 Jun 2017 13:44:32 +0800
> Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:
> 
> > The commit adds mt7622 compatible node in binding document.
> > 
> > Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> > ---
> >  .../devicetree/bindings/iio/adc/mt6577_auxadc.txt  |    1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/iio/adc/mt6577_auxadc.txt b/Documentation/devicetree/bindings/iio/adc/mt6577_auxadc.txt
> > index 68c45cb..e6aa30a 100644
> > --- a/Documentation/devicetree/bindings/iio/adc/mt6577_auxadc.txt
> > +++ b/Documentation/devicetree/bindings/iio/adc/mt6577_auxadc.txt
> > @@ -13,6 +13,7 @@ Required properties:
> >    - compatible: Should be one of:
> >      - "mediatek,mt2701-auxadc": For MT2701 family of SoCs
> >      - "mediatek,mt8173-auxadc": For MT8173 family of SoCs
> > +    - "mediatek,mt7622-auxadc": For MT7622 family of SoCs
> numeric order?
==> yes, we have changed it as numeric order in v2. Thanks.
> >    - reg: Address range of the AUXADC unit.
> >    - clocks: Should contain a clock specifier for each entry in clock-names
> >    - clock-names: Should contain "main".
> 
