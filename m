From: Vineet Gupta <vgupta@synopsys.com>
Subject: Re: [PATCH 2/9] ARC: [dts] Introduce Timer bindings
Date: Tue, 2 Feb 2016 19:59:03 +0530
Message-ID: <56B0BD2F.5080409@synopsys.com>
References: <1454410739-24444-1-git-send-email-vgupta@synopsys.com>
 <1454410739-24444-3-git-send-email-vgupta@synopsys.com>
 <1454418916.25997.18.camel@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1454418916.25997.18.camel@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>, Vineet Gupta <Vineet.Gupta1@synopsys.com>
Cc: "robh@kernel.org" <robh@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "noamc@ezchip.com" <noamc@ezchip.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Alexey,

On Tuesday 02 February 2016 06:45 PM, Alexey Brodkin wrote:
> Hi Vineet,
> 
> On Tue, 2016-02-02 at 16:28 +0530, Vineet Gupta wrote:
>> +
>> +Required properties:
>> +
>> +- compatible : should be "snps,arc-timer0"
>> +- interrupts : single Interrupt going into parent intc
>> +	       (16 for ARCHS cores, 3 for ARC700 cores)
>> +- clocks     : phandle to the source clock
> 
> Actually we're not flexible here.
> See we have hard-coded "core_clk" in [PATCH 8/9].
> We use it directly in show_cpuinfo() for reading clock speed
> as well as in axs103_early_init().
> 
> So "source clock" here MUST be "core_clk", otherwise
> /proc/cpuinfo will report junk instead of meaningful data at least.

Using hardcoded DT names in generic code is total BS and I slap myself for missing
that in reviewing 8/9. Please fix it !

FWIW, it is OK to have such hardcoding in say AXS103 DTS and AXS103 platform code
but it is not the way to go in setup.c

>> +Required properties:
>> +
>> +- compatible : should be "snps,arc-timer1"
>> +- clocks     : phandle to the source clock
>> +
>> +Example:
>> +
>> +	timer1: timer_clksrc {
>> +		compatible = "snps,arc-timer1";
>> +		clocks = <&timer0_clk>;
> 
> Ditto, "clocks = <&core_clk>".

Yeah I fixed all those !

>> diff --git a/arch/arc/boot/dts/abilis_tb10x.dtsi b/arch/arc/boot/dts/abilis_tb10x.dtsi
>> index cfb5052239a1..f9f138efa92c 100644
>> --- a/arch/arc/boot/dts/abilis_tb10x.dtsi
>> +++ b/arch/arc/boot/dts/abilis_tb10x.dtsi
>> @@ -35,6 +35,18 @@
>>  		};
>>  	};
>>  
>> +	timer0: timer_clkevt {
>> +		compatible = "snps,arc-timer0";
>> +		interrupts = <3>;
>> +		interrupt-parent = <&intc>;
>> +		clocks = <&cpu_clk>;
>>
>> +	};
>> +
>> +	timer1: timer_clksrc {
>> +		compatible = "snps,arc-timer1";
>> +		clocks = <&cpu_clk>;
>> +	};
>> +
> 
> Hm now that's a question how to fix /proc/cpuinfo output
> for Abilis? There's no "core_clk" DTS node for Abilis and so
> show_cpuinfo() won't get proper clock value.
> 
> Probably we may fix it with modification of their "pll" node
> from
> ------------------------>8----------------------
> 		pll0: oscillator {
> 			clock-frequency  = <1000000000>;
> 		};
> ------------------------>8----------------------
> 
> to
> ------------------------>8----------------------
> 		core_clk: oscillator {
> 			clock
> -frequency  = <1000000000>;
> 		};
> ------------------------>8----------------------

This is all moot once we fix the orig problem.
