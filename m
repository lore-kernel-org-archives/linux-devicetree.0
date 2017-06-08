From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 46/58] clocksource/drivers: Add a new driver for the
 Atmel ARM TC blocks
Date: Thu, 8 Jun 2017 09:59:01 +0200
Message-ID: <20170608075900.i554dgbh3p5sq5ml@piout.net>
References: <20170530215139.9983-1-alexandre.belloni@free-electrons.com>
 <20170530215139.9983-47-alexandre.belloni@free-electrons.com>
 <20170606152104.GC2345@mai>
 <20170606180559.pkrr7ux2qqnmsd6y@piout.net>
 <20170607141735.GH2345@mai>
 <20170607152750.tksmyf5p3oajbsac@piout.net>
 <20170607210848.GJ2345@mai>
 <20170607231715.ns2vcxza2eexnzjs@piout.net>
 <20170608074236.62924f01@bbrezillon>
 <20170608074446.GM2345@mai>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170608074446.GM2345@mai>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 08/06/2017 at 09:44:46 +0200, Daniel Lezcano wrote:
> 
> +Mark Rutland, +Rob Herring
> 
> 
> Alexandre, Boris, have a look at https://www.spinics.net/lists/arm-kernel/msg572652.html
> 
> That will tell you the story.
> 

Ok, so is the solution putting the driver back in mach-at91 were we can
do whatever we want like mach-omap2 is doing?

> On Thu, Jun 08, 2017 at 07:42:36AM +0200, Boris Brezillon wrote:
> > Le Thu, 8 Jun 2017 01:17:15 +0200,
> > Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> a écrit :
> > 
> > > On 07/06/2017 at 23:08:48 +0200, Daniel Lezcano wrote:
> > > > > I was going to agree but this is not flexible enough because the
> > > > > quadrature decoder always uses the first two channels. So on some
> > > > > products, we may have:
> > > > >  - TCB0:
> > > > >    o channels 0,1: qdec
> > > > >    o channel 2: clocksource
> > > > > 
> > > > >  - TCB1:
> > > > >    o channels 0,1: qdec
> > > > >    o channel 2: clockevent
> > > > > 
> > > > > This avoids wasting TCB channels.  
> > > > 
> > > > Ok. In this case you can check if the interrupt is specified for the node, if
> > > > yes, then it is a clockevent.
> > > >   
> > > 
> > > But currently it is always specified in the SoC's dtsi. I don't find
> > > that too practical to push that to the board's dts. Also, lying by
> > > omission (the IRQ is always wired) in the DT is not different from
> > > having a property selecting which timer is the clocksource and which is
> > > the clockevent.
> > > 
> > 
> > I agree with Alexandre here. Really, there's not much we can do to
> > detect which timer should be used as a clockevent and which one should
> > be used as a clocksource except explicitly specifying it in the DT.
> > Having an interrupt defined in one case (clockevent) and undefined in
> > the other case (clocksource), is just as hack-ish as the detection logic
> > Alexandre developed to avoid explicitly specifying the function
> > assigned to a specific timer.
> > 
> > Can we please find a solution that makes everyone happy (DT,
> > clocksoure/clockevent and at91 maintainers)?
> > 
> > How about adding a linux,timer-function property to specify which
> > function this timer is providing?
> > 
> > Something like that for example:
> > 
> > 	tcb0: timer@fff7c000 {
> > 		compatible = "atmel,at91rm9200-tcb", "simple-mfd", "syscon";
> > 		#address-cells = <1>;
> > 		#size-cells = <0>;
> > 		reg = <0xfff7c000 0x100>;
> > 		interrupts = <18 4>;
> > 		clocks = <&tcb0_clk>, <&clk32k>;
> > 		clock-names = "t0_clk", "slow_clk";
> > 
> > 		timer@0 {
> > 			compatible = "atmel,tcb-timer";
> > 			reg = <0>, <1>;
> > 			linux,timer-function = "clocksource";
> > 		};
> > 
> > 		timer@2 {
> > 			compatible = "atmel,tcb-timer";
> > 			reg = <2>;
> > 			linux,timer-function = "clockevent";
> > 		};
> > 	};
> > 
> > Alternatively, we could have a property or a node in chosen describing which
> > timer should be used:
> > 
> > 	chosen {
> > 		clockevent {
> > 			timer = <&timer2>;
> > 		};
> > 
> > 		clocksource {
> > 			timer = <&timer0>;
> > 		};
> > 
> > 		/*
> > 		 * or
> > 		 *
> > 		 * clockevent = <&timer2>;
> > 		 * clocksource = <&timer0>;
> > 		 *
> > 		 * but I think the clocksource/clockevent node approach
> > 		 * is more future proof in case we need to add extra
> > 		 * information like the expected resolution/precision or
> > 		 * anything that could be tweakable.
> > 		 */
> > 	};
> > 
> > 	tcb0: timer@fff7c000 {
> > 		compatible = "atmel,at91rm9200-tcb", "simple-mfd", "syscon";
> > 		#address-cells = <1>;
> > 		#size-cells = <0>;
> > 		reg = <0xfff7c000 0x100>;
> > 		interrupts = <18 4>;
> > 		clocks = <&tcb0_clk>, <&clk32k>;
> > 		clock-names = "t0_clk", "slow_clk";
> > 
> > 		timer0: timer@0 {
> > 			compatible = "atmel,tcb-timer";
> > 			reg = <0>, <1>;
> > 		};
> > 
> > 		timer2: timer@2 {
> > 			compatible = "atmel,tcb-timer";
> > 			reg = <2>;
> > 		};
> > 	};
> 
> -- 
> 
>  <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs
> 
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
