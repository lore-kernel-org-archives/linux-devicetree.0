From: Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/4] Document: DT: Add bindings for mediatek MT6797 SoC
 Platform
Date: Mon, 12 Sep 2016 09:51:43 +0800
Message-ID: <1473645103.27628.6.camel@mtkswgap22>
References: <1473331794-27542-1-git-send-email-mars.cheng@mediatek.com>
         <1473331794-27542-2-git-send-email-mars.cheng@mediatek.com>
         <57D15B6C.6080305@arm.com> <1473343735.1896.15.camel@mtkswgap22>
         <57D17667.1020201@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57D17667.1020201-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Erin Lo <erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, CC Hwang <cc.hwang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Loda Choui <loda.chou-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Miles Chen <miles.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Scott Shu <scott.shu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jades Shih <jades.shih-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, My Chuang <my.chuang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2016-09-08 at 15:32 +0100, Marc Zyngier wrote:
> On 08/09/16 15:08, Mars Cheng wrote:
> > Hi Marc
> > 
> > Thanks for your review. the response inlined.
> > 
> > On Thu, 2016-09-08 at 13:37 +0100, Marc Zyngier wrote:
> >> On 08/09/16 11:49, Mars Cheng wrote:
> >>> This adds DT binding documentation for Mediatek MT6797.
> >>>
> >>> Signed-off-by: Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> >>> ---
> > [...]
> >>
> >>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
> >>> index 9d1d72c..3d97eb4 100644
> >>> --- a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
> >>> +++ b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
> >>> @@ -8,6 +8,7 @@ Required properties:
> >>>  	"mediatek,mt8173-sysirq"
> >>>  	"mediatek,mt8135-sysirq"
> >>>  	"mediatek,mt8127-sysirq"
> >>> +	"mediatek,mt6797-sysirq"
> >>>  	"mediatek,mt6795-sysirq"
> >>>  	"mediatek,mt6755-sysirq"
> >>>  	"mediatek,mt6592-sysirq"
> >>> @@ -21,7 +22,8 @@ Required properties:
> >>>  - interrupt-parent: phandle of irq parent for sysirq. The parent must
> >>>    use the same interrupt-cells format as GIC.
> >>>  - reg: Physical base address of the intpol registers and length of memory
> >>> -  mapped region.
> >>> +  mapped region. Could be up to 2 registers here at max. Ex: 6797 needs 2 reg,
> >>> +  others need 1.
> >>
> >> Two things:
> >>
> >> - Please make this a separate patch that can be reviewed independently
> >> of the rest of the changes, which are just adding new compatible
> >> identifiers.
> > 
> > Will fix this in the next patch set.
> > 
> >>
> >> - Why can't you simply expose it as a separate controller? Looking at
> >> the way you're changing the corresponding driver, it looks like you're
> >> simply adding an extra base/size. If you simply had a base for the
> >> corresponding GIC interrupts, you could handle as many region as you
> >> want, and have a more generic driver.
> >>
> > 
> > May I know the meaning of "simply expose it as a separate controller"?
> 
> At the moment, you have something like this:
> 
> 	sysirq: intpol-controller@10200620 {
> 		compatible = "mediatek,mt6755-sysirq",
> 			     "mediatek,mt6577-sysirq";
> 		interrupt-controller;
> 		#interrupt-cells = <3>;
> 		interrupt-parent = <&gic>;
> 		reg = <0 0x10200620 0 0x20>;
> 	};
> 
> I suggest that, when you have a second base (which is effectively
> another controller), you add:
> 
> 	sysirq2: intpol-controller@10201620 {
> 		compatible = "mediatek,mt6755-sysirq",
> 			     "mediatek,mt6577-sysirq";
> 		interrupt-controller;
> 		#interrupt-cells = <3>;
> 		interrupt-parent = <&gic>;
> 		irq-base = <32>;
> 		reg = <0 0x10201620 0 0x20>;
> 	};
> 
> Where irq-base is the first SPI this is connected to (the lack of
> property indicates implies that irq-base is 0). This becomes a very
> simple change in the driver.
> 
> > Or you might like to suggest me any similar driver as a reference? I
> > will examine it. Current design is based on the fact: We expect
> > irq-mtk-sysirq needs the optional second base but the third one will not
> > happen.
> > 
> > If we really need more than 2 bases, we can figure out a more generic
> > driver at the time, right?
> 
> I'd rather fix the driver and the binding to do the right thing once and
> for all. In my experience, you will need to add a third base in six
> months, and a fourth soon after. I'd rather either support an arbitrary
> number of bases, or a single one per controller (and have multiple
> controllers).
Hi Marc

Thanks for suggesting this approach I never thought.

However, I will modify the irq-mtk-sysirq driver to handle as many bases
as we specify in current node in the next patch set. Will not use the
second interrupt node in DT. The main reason is to simplify the writing
of DT. Or we need to know which interrupt node to be specified for other
nodes. As you said that might be the third or fourth bases, that will
complicate the writing of DT more.

Would you think this is OK?

Thanks.
> 
> Thanks,
> 
> 	M.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
