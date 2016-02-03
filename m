From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH 2/9] ARC: [dts] Introduce Timer bindings
Date: Wed, 3 Feb 2016 08:04:03 +0000
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F4E87B33@us01wembx1.internal.synopsys.com>
References: <1454410739-24444-1-git-send-email-vgupta@synopsys.com>
 <1454410739-24444-3-git-send-email-vgupta@synopsys.com>
 <20160202220353.GA10273@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: arcml <linux-snps-arc@lists.infradead.org>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>, Noam Camus <noamc@ezchip.com>, lkml <linux-kernel@vger.kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Wednesday 03 February 2016 03:33 AM, Rob Herring wrote:
> On Tue, Feb 02, 2016 at 04:28:52PM +0530, Vineet Gupta wrote:
>> +Required properties:
>> +
>> +- compatible : should be "snps,arc-timer0"
> 
> timer0 and timer1 are different h/w blocks, not just different 
> instances?

Functionality wise they are identical (only the address of aux regs used to
program them are different). Either can be configured to interrupt-on-limit or
free-run-and-wrap-around. So we can indeed consider them 2 instances. ARC Linux
uses timer0 for tick handling, timer1 for gtod.

Do you prefer they not be differentiated as timer0 and timer1 ?

So we have

CLOCKSOURCE_OF_DECLARE(arc_clkevt, "snps,arc-timer0", arc_clockevent_setup);
CLOCKSOURCE_OF_DECLARE(arc_timer1, "snps,arc-timer1", arc_cs_setup_timer1);

I don't know how to achieve above, by keeping the DT names the same.

> 
>> +- interrupts : single Interrupt going into parent intc
>> +	       (16 for ARCHS cores, 3 for ARC700 cores)
>> +- clocks     : phandle to the source clock
>> +
>> +Optional properties:
>> +
>> +- interrupt-parent : phandle to parent intc
>> +
>> +Example:
>> +
>> +	timer0: timer_clkevt {
> 
> just "timer" for node name. clkevt is a Linuxism.

OK. So to document that this is for clockevent, change the label ?

timer_clkevent: timer {

> 
>> +		compatible = "snps,arc-timer0";
>> +		interrupts = <3>;
>> +		interrupt-parent = <&core_intc>;
>> +		clocks = <&timer0_clk>;
>> +	};
>> diff --git a/Documentation/devicetree/bindings/timer/snps,arc-timer1.txt b/Documentation/devicetree/bindings/timer/snps,arc-timer1.txt
>> new file mode 100644
>> index 000000000000..4886192ce2f2
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/timer/snps,arc-timer1.txt
>> @@ -0,0 +1,17 @@
>> +Synopsys ARC Free Running Local 32-bit Timer
>> +- Found on all ARC CPUs (ARC700/ARCHS)
>> +- Mandatory clocksource provider on ARC700
>> +- Optional clocksource provider on UP ARC HS CPUs
>> +  (and if better timer archs-rtc not available in SoC)
>> +
>> +Required properties:
>> +
>> +- compatible : should be "snps,arc-timer1"
>> +- clocks     : phandle to the source clock
> 
> No interrupt because it doesn't have one or you use this as a 
> clocksource and don't need it?

Latter !


>> +
>> +Example:
>> +
>> +	timer1: timer_clksrc {
>> +		compatible = "snps,arc-timer1";
>> +		clocks = <&timer0_clk>;
>> +	};
>> diff --git a/Documentation/devicetree/bindings/timer/snps,archs-gfrc.txt b/Documentation/devicetree/bindings/timer/snps,archs-gfrc.txt
>> new file mode 100644
>> index 000000000000..cce60e16aa0d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/timer/snps,archs-gfrc.txt
>> @@ -0,0 +1,14 @@
>> +Synopsys ARC Free Running 64-bit Global Timer for ARC HS CPUs
>> +- clocksourc provider for SMP SoC
>> +
>> +Required properties:
>> +
>> +- compatible : should be "snps,archs-gfrc"
>> +- clocks     : phandle to the source clock
>> +
>> +Example:
>> +
>> +	timer1: timer_clksrc {
>> +		compatible = "snps,archs-gfrc";
>> +		clocks = <&timer0_clk>;
>> +	};
>> diff --git a/Documentation/devicetree/bindings/timer/snps,archs-rtc.txt b/Documentation/devicetree/bindings/timer/snps,archs-rtc.txt
>> new file mode 100644
>> index 000000000000..f3b49938812b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/timer/snps,archs-rtc.txt
>> @@ -0,0 +1,14 @@
>> +Synopsys ARC Free Running 64-bit Local Timer for ARC HS CPUs
>> +- clocksourc provider for UP SoC
> 
> local timer on a UP processor?

Not sure what you mean to change.

This timer could be present in UP or SMP hardware configs but only usable as
clocksource for UP since it is local and we don't do tick broadcast etc for SMP.

To me clocksource is one level higher in level of abstraction than processor and
thus applies to overall system / SoC than the processor.

Thx,
-Vineet

>> +Required properties:
>> +
>> +- compatible : should be "snps,archs-rtc"
>> +- clocks     : phandle to the source clock
>> +
>> +Example:
>> +
>> +	timer1: timer_clksrc {
>> +		compatible = "snps,arc-rtc";
>> +		clocks = <&timer0_clk>;
>> +	};
> --
