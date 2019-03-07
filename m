From: houlong wei <houlong.wei@mediatek.com>
Subject: Re: [PATCH] arm64: dts: add gce node for mt8183
Date: Thu, 7 Mar 2019 09:47:39 +0800
Message-ID: <1551923259.32207.10.camel@mhfsdcap03>
References: <1551867024-52951-1-git-send-email-bibby.hsieh@mediatek.com>
         <1551921866.20144.1.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551921866.20144.1.camel@mtksdaap41>
Sender: linux-kernel-owner@vger.kernel.org
To: CK Hu <ck.hu@mediatek.com>, bibby.hsieh@mediatek.com
Cc: Bibby Hsieh =?UTF-8?Q?=28=E8=AC=9D=E6=BF=9F=E9=81=A0=29?= <Bibby.Hsieh@mediatek.com>, Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Daniel Kurtz <djkurtz@chromium.org>, Sascha Hauer <s.hauer@pengutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, srv_heupstream <srv_heupstream@mediatek.com>, Sascha Hauer <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Nicolas Boichat <drinkcat@chromium.org>, YT
List-Id: devicetree@vger.kernel.org

On Thu, 2019-03-07 at 09:24 +0800, CK Hu wrote:
> Hi, Bibby:
> 
> On Wed, 2019-03-06 at 18:10 +0800, Bibby Hsieh wrote: 
> > This patch need based on v5.0-rc1 and these series
> > http://lists.infradead.org/pipermail/linux-mediatek/2019-February/017570.html
> > http://lists.infradead.org/pipermail/linux-mediatek/2019-February/017320.html
> > http://lists.infradead.org/pipermail/linux-mediatek/2019-January/017196.html
> > http://lists.infradead.org/pipermail/linux-mediatek/2019-March/018005.html
> > 
> > add gce device node for mt8183
> > 
> > Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> > ---
> >  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > index 165b859..5006368 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > @@ -8,6 +8,7 @@
> >  #include <dt-bindings/clock/mt8183-clk.h>
> >  #include <dt-bindings/interrupt-controller/arm-gic.h>
> >  #include <dt-bindings/interrupt-controller/irq.h>
> > +#include <dt-bindings/gce/mt8183-gce.h>
> >  #include "mt8183-pinfunc.h"
> >  
> >  / {
> > @@ -238,6 +239,18 @@
> >  			clock-names = "spi", "wrap";
> >  		};
> >  
> > +		gce: gce@10238000 {
> > +			compatible = "mediatek,mt8183-gce";
> > +			reg = <0 0x10238000 0 0x4000>;
> > +			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_LOW>;
> > +			thread-num = <CMDQ_THR_MAX_COUNT>;
> 
> I does not find 'thread-num' in binding document [1].
> 
> [1]
> https://www.kernel.org/doc/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
> 
> Regards,
> CK

The property "thread-num" is not used and and it was removed from the
properties description, but I forgot to remove it from the example. That
is misleading and I'm sorry for that. @Bibby, could you please help
remove it from the example in mtk-gce.txt if you would upload a new
version?
> 
> > +			#mbox-cells = <3>;
> > +			#gce-event-cells = <1>;
> > +			#gce-subsys-cells = <2>;
> > +			clocks = <&infracfg CLK_INFRA_GCE>;
> > +			clock-names = "gce";
> > +		};
> > +
> >  		uart0: serial@11002000 {
> >  			compatible = "mediatek,mt8183-uart",
> >  				     "mediatek,mt6577-uart";
> 
