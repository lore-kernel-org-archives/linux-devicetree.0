From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: clk: add documentation for the SiFive
 PRCI driver
Date: Fri, 16 Nov 2018 15:18:59 -0800 (PST)
Message-ID: <alpine.DEB.2.21.9999.1811161510590.25712@viisi.sifive.com>
References: <20181020135024.28573-1-paul.walmsley@sifive.com> <20181020135024.28573-3-paul.walmsley@sifive.com> <20181024184757.GA22367@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181024184757.GA22367@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@sifive.com>, Megan Wachs <megan@sifive.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Paul Walmsley <paul@pwsan.com>
List-Id: devicetree@vger.kernel.org

On Wed, 24 Oct 2018, Rob Herring wrote:

> On Sat, Oct 20, 2018 at 06:50:23AM -0700, Paul Walmsley wrote:
>> Add DT binding documentation for the Linux driver for the SiFive
>> PRCI clock & reset control IP block, as found on the SiFive
>> FU540 chip.
>>
>> Cc: Michael Turquette <mturquette@baylibre.com>
>> Cc: Stephen Boyd <sboyd@kernel.org>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: Palmer Dabbelt <palmer@sifive.com>
>> Cc: Megan Wachs <megan@sifive.com>
>> Cc: linux-clk@vger.kernel.org
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-riscv@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
>> Signed-off-by: Paul Walmsley <paul@pwsan.com>
>> ---
>> v2: remove out-of-date example, add documentation for the compatible
>>     string and for the required PCB clock nodes
>>
>> .../bindings/clock/sifive/fu540-prci.txt      | 43 +++++++++++++++++++
>>  1 file changed, 43 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt
>>
>> diff --git a/Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt b/Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt
>> new file mode 100644
>> index 000000000000..d7c1e83fa5ed
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt
>> @@ -0,0 +1,43 @@
>> +SiFive FU540 PRCI bindings
>> +
>> +On the FU540 family of SoCs, most system-wide clock and reset integration
>> +is via the PRCI IP block.
>> +
>> +Required properties:
>> +- compatible: Should be "sifive,<chip>-prci<version>".  As of the time this
>> +              file was written, only one value is supported:
>> +	      "sifive,fu540-c000-prci0"
>
> What happens with this depends on the discussion on the other bindings.

We'll drop the trailing 0 since the SoC identifier prefix should be 
sufficiently precise.

> Though here you are inconsistent without a fallback. Of course, I've
> never seen a clock controller be the same across SoCs.

As you write, the assumption is that chip integration IP blocks like this 
one are likely to be specific to individual SoCs.

This may not be universally true for SiFive looking into the future, but 
since we don't yet have a clear sense of the extent of exact reuse (i.e. 
chip "families"), am not yet comfortable with advocating something like 
"sifive,prci0" yet, as we do with the sifive-blocks.

>> +- reg: Should describe the PRCI's register target physical address region
>> +- clocks: Should point to the hfclk device tree node and the rtcclk
>> +          device tree node.  The RTC clock here is not a time-of-day clock,
>> +	  but is instead a high-stability clock source for system timers
>> +	  and cycle counters.
>> +- #clock-cells: Should be <1>
>> +
>> +The clock consumer should specify the desired clock via the clock ID
>> +macros defined in include/linux/clk/sifive-fu540-prci.h.  These macros
>> +begin with PRCI_CLK_.
>> +
>> +The hfclk and rtcclk nodes are required, and represent physical
>> +crystals or resonators located on the PCB.
>> +
>> +Examples:
>> +
>> +hfclk: hfclk {
>> +	#clock-cells = <0>;
>> +	compatible = "fixed-clock";
>> +	clock-frequency = <33333333>;
>> +	clock-output-names = "hfclk";
>> +};
>> +rtcclk: rtcclk {
>> +	#clock-cells = <0>;
>> +	compatible = "fixed-clock";
>> +	clock-frequency = <1000000>;
>> +	clock-output-names = "rtcclk";
>> +};
>> +prci0: prci@10000000 {
>
> clock-controller@...

Thanks; fixed.


- Paul
