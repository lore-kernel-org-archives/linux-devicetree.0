From: Mars Cheng <mars.cheng@mediatek.com>
Subject: Re: [PATCH 1/4] Document: DT: Add bindings for mediatek MT6797 SoC
 Platform
Date: Thu, 8 Sep 2016 22:08:55 +0800
Message-ID: <1473343735.1896.15.camel@mtkswgap22>
References: <1473331794-27542-1-git-send-email-mars.cheng@mediatek.com>
         <1473331794-27542-2-git-send-email-mars.cheng@mediatek.com>
         <57D15B6C.6080305@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <57D15B6C.6080305@arm.com>
Sender: linux-clk-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Erin Lo <erin.lo@mediatek.com>, James Liao <jamesjj.liao@mediatek.com>, linux-clk@vger.kernel.org, CC Hwang <cc.hwang@mediatek.com>, Loda Choui <loda.chou@mediatek.com>, Miles Chen <miles.chen@mediatek.com>, Scott Shu <scott.shu@mediatek.com>, Jades Shih <jades.shih@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, My Chuang <my.chuang@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com
List-Id: devicetree@vger.kernel.org

Hi Marc

Thanks for your review. the response inlined.

On Thu, 2016-09-08 at 13:37 +0100, Marc Zyngier wrote:
> On 08/09/16 11:49, Mars Cheng wrote:
> > This adds DT binding documentation for Mediatek MT6797.
> > 
> > Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
> > ---
[...]
> 
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
> > index 9d1d72c..3d97eb4 100644
> > --- a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
> > @@ -8,6 +8,7 @@ Required properties:
> >  	"mediatek,mt8173-sysirq"
> >  	"mediatek,mt8135-sysirq"
> >  	"mediatek,mt8127-sysirq"
> > +	"mediatek,mt6797-sysirq"
> >  	"mediatek,mt6795-sysirq"
> >  	"mediatek,mt6755-sysirq"
> >  	"mediatek,mt6592-sysirq"
> > @@ -21,7 +22,8 @@ Required properties:
> >  - interrupt-parent: phandle of irq parent for sysirq. The parent must
> >    use the same interrupt-cells format as GIC.
> >  - reg: Physical base address of the intpol registers and length of memory
> > -  mapped region.
> > +  mapped region. Could be up to 2 registers here at max. Ex: 6797 needs 2 reg,
> > +  others need 1.
> 
> Two things:
> 
> - Please make this a separate patch that can be reviewed independently
> of the rest of the changes, which are just adding new compatible
> identifiers.

Will fix this in the next patch set.

> 
> - Why can't you simply expose it as a separate controller? Looking at
> the way you're changing the corresponding driver, it looks like you're
> simply adding an extra base/size. If you simply had a base for the
> corresponding GIC interrupts, you could handle as many region as you
> want, and have a more generic driver.
> 

May I know the meaning of "simply expose it as a separate controller"?
Or you might like to suggest me any similar driver as a reference? I
will examine it. Current design is based on the fact: We expect
irq-mtk-sysirq needs the optional second base but the third one will not
happen.

If we really need more than 2 bases, we can figure out a more generic
driver at the time, right?

Thanks.
> Thanks,
> 
> 	M.


