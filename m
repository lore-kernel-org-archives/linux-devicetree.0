From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 46/58] clocksource/drivers: Add a new driver for the
 Atmel ARM TC blocks
Date: Thu, 8 Jun 2017 07:42:36 +0200
Message-ID: <20170608074236.62924f01@bbrezillon>
References: <20170530215139.9983-1-alexandre.belloni@free-electrons.com>
        <20170530215139.9983-47-alexandre.belloni@free-electrons.com>
        <20170606152104.GC2345@mai>
        <20170606180559.pkrr7ux2qqnmsd6y@piout.net>
        <20170607141735.GH2345@mai>
        <20170607152750.tksmyf5p3oajbsac@piout.net>
        <20170607210848.GJ2345@mai>
        <20170607231715.ns2vcxza2eexnzjs@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170607231715.ns2vcxza2eexnzjs-m++hUPXGwpdeoWH0uzbU5w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Le Thu, 8 Jun 2017 01:17:15 +0200,
Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> a écrit :

> On 07/06/2017 at 23:08:48 +0200, Daniel Lezcano wrote:
> > > I was going to agree but this is not flexible enough because the
> > > quadrature decoder always uses the first two channels. So on some
> > > products, we may have:
> > >  - TCB0:
> > >    o channels 0,1: qdec
> > >    o channel 2: clocksource
> > > 
> > >  - TCB1:
> > >    o channels 0,1: qdec
> > >    o channel 2: clockevent
> > > 
> > > This avoids wasting TCB channels.  
> > 
> > Ok. In this case you can check if the interrupt is specified for the node, if
> > yes, then it is a clockevent.
> >   
> 
> But currently it is always specified in the SoC's dtsi. I don't find
> that too practical to push that to the board's dts. Also, lying by
> omission (the IRQ is always wired) in the DT is not different from
> having a property selecting which timer is the clocksource and which is
> the clockevent.
> 

I agree with Alexandre here. Really, there's not much we can do to
detect which timer should be used as a clockevent and which one should
be used as a clocksource except explicitly specifying it in the DT.
Having an interrupt defined in one case (clockevent) and undefined in
the other case (clocksource), is just as hack-ish as the detection logic
Alexandre developed to avoid explicitly specifying the function
assigned to a specific timer.

Can we please find a solution that makes everyone happy (DT,
clocksoure/clockevent and at91 maintainers)?

How about adding a linux,timer-function property to specify which
function this timer is providing?

Something like that for example:

	tcb0: timer@fff7c000 {
		compatible = "atmel,at91rm9200-tcb", "simple-mfd", "syscon";
		#address-cells = <1>;
		#size-cells = <0>;
		reg = <0xfff7c000 0x100>;
		interrupts = <18 4>;
		clocks = <&tcb0_clk>, <&clk32k>;
		clock-names = "t0_clk", "slow_clk";

		timer@0 {
			compatible = "atmel,tcb-timer";
			reg = <0>, <1>;
			linux,timer-function = "clocksource";
		};

		timer@2 {
			compatible = "atmel,tcb-timer";
			reg = <2>;
			linux,timer-function = "clockevent";
		};
	};

Alternatively, we could have a property or a node in chosen describing which
timer should be used:

	chosen {
		clockevent {
			timer = <&timer2>;
		};

		clocksource {
			timer = <&timer0>;
		};

		/*
		 * or
		 *
		 * clockevent = <&timer2>;
		 * clocksource = <&timer0>;
		 *
		 * but I think the clocksource/clockevent node approach
		 * is more future proof in case we need to add extra
		 * information like the expected resolution/precision or
		 * anything that could be tweakable.
		 */
	};

	tcb0: timer@fff7c000 {
		compatible = "atmel,at91rm9200-tcb", "simple-mfd", "syscon";
		#address-cells = <1>;
		#size-cells = <0>;
		reg = <0xfff7c000 0x100>;
		interrupts = <18 4>;
		clocks = <&tcb0_clk>, <&clk32k>;
		clock-names = "t0_clk", "slow_clk";

		timer0: timer@0 {
			compatible = "atmel,tcb-timer";
			reg = <0>, <1>;
		};

		timer2: timer@2 {
			compatible = "atmel,tcb-timer";
			reg = <2>;
		};
	};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
