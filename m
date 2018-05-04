From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: Re: [PATCH v5 2/2] dt/bindings: Add bindings for Layerscape external
 irqs
Date: Fri, 4 May 2018 10:07:36 +0200
Message-ID: <0bb4533d-c749-d8ff-e1f2-4b08eb724713@prevas.dk>
References: <20180125150230.7234-1-rasmus.villemoes@prevas.dk>
 <20180223210901.23480-1-rasmus.villemoes@prevas.dk>
 <20180223210901.23480-3-rasmus.villemoes@prevas.dk>
 <20180302194935.yq3xw4nxyrxuonz5@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180302194935.yq3xw4nxyrxuonz5@rob-hp-laptop>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Mark Rutland <mark.rutland@arm.com>, Andy Tang <andy.tang@nxp.com>, Alexander Stein <alexander.stein@systec-electronic.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2018-03-02 20:49, Rob Herring wrote:
> On Fri, Feb 23, 2018 at 10:09:00PM +0100, Rasmus Villemoes wrote:
>> This adds Device Tree binding documentation for the external interrupt
>> lines with configurable polarity present on some Layerscape SOCs.
>>
>> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
>> ---
>>  .../interrupt-controller/fsl,ls-extirq.txt         | 44 ++++++++++++++++++++++
>>  1 file changed, 44 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/fsl,ls-extirq.txt
>>
>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-extirq.txt b/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-extirq.txt
>> new file mode 100644
>> index 000000000000..e510c715e8f6
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-extirq.txt
>> @@ -0,0 +1,44 @@
>> +* Freescale Layerscape external IRQs
>> +
>> +Some Layerscape SOCs (LS1021A, LS1043A, LS1046A) support inverting
>> +the polarity of certain external interrupt lines.
>> +
>> +The device node must be a child of the node representing the
>> +Supplemental Configuration Unit (SCFG).
>> +
>> +Required properties:
>> +- compatible: should be "fsl,<soc-name>-extirq", e.g. "fsl,ls1021a-extirq".
>> +- interrupt-controller: Identifies the node as an interrupt controller
>> +- #interrupt-cells: Must be 2. The first element is the index of the
>> +  external interrupt line. The second element is the trigger type.
>> +- interrupt-parent: phandle of GIC.
>> +- reg: Specifies the Interrupt Polarity Control Register (INTPCR) in the SCFG.
>> +- fsl,extirq-map: Specifies the mapping to interrupt numbers in the parent
>> +  interrupt controller. Interrupts are mapped one-to-one to parent
>> +  interrupts.
> 
> Use the interrupt-map property for this.

Please point me at some documentation for that. AFAICT, that would
require the property to consist of n*(3+2)*4 values, instead of just n
(with 3+2 being sum of #interrupt-cells and 4 being the four different
allowed incoming IRQ_TYPE_*). That seems quite excessive.

I used a private property based on advice from Marc

  Most interrupt controllers use a private property, potentially with a
  range (see the recent example of the Qualcomm PDC [1]).

  [1] https://patchwork.kernel.org/patch/10208037/

and the qcom,pdc-ranges has this description (and that patch has your
Reviewed-by):

+- qcom,pdc-ranges:
+       Usage: required
+       Value type: <u32 array>
+       Definition: Specifies the PDC pin offset and the number of PDC
ports.
+                   The tuples indicates the valid mapping of valid PDC
ports
+                   and their hwirq mapping.
+                   The first element of the tuple is the starting PDC port.
+                   The second element is the GIC hwirq number for the
PDC port.
+                   The third element is the number of interrupts in
sequence.

In my case, this is simplified by the external irq lines being numbered
consecutively from 0, so the array index itself serves as the "starting
pdc port". I also omit the "number of interrupts in sequence", and have
that be 1 implicitly, since it will only ever be either 6 or 12
elements. So I end up with a simple array of GIC hwirq numbers.


>> +
>> +Optional properties:
>> +- fsl,bit-reverse: This boolean property should be set on the LS1021A
>> +  if the SCFGREVCR register has been set to all-ones (which is usually
>> +  the case), meaning that all reads and writes of SCFG registers are
>> +  implicitly bit-reversed. Other compatible platforms do not have such
>> +  a register.
>> +
>> +Example:
>> +	scfg: scfg@1570000 {
>> +		compatible = "fsl,ls1021a-scfg", "syscon";
>> +		...
>> +		extirq: interrupt-controller {
>> +			compatible = "fsl,ls1021a-extirq";
>> +			#interrupt-cells = <2>;
>> +			interrupt-controller;
>> +			interrupt-parent = <&gic>;
>> +			reg = <0x1ac>;
> 
> This needs the length too. What is buys us is following the standard in 
> which mmio has a #size-cells >= 1. BTW, you need a #size-cells and 
> #address-cells properties in the parent. (I think dtc will complain if 
> not).

Well, the parent consists solely of 32 bit registers, so I think it
would make sense to have #size-cells = 0, to avoid redundant boilerplate
in subnodes' reg properties. But you're right, the ls1021a scfg node
currently has neither #size-cells or #address-cells, so I'll have to add
a patch adding those before adding this subnode. And if #size-cells=0 is
somehow frowned upon, I'll just make it 1.

-- 
Rasmus Villemoes
Software Developer
Prevas A/S
Hedeager 3
DK-8200 Aarhus N
+45 51210274
rasmus.villemoes@prevas.dk
www.prevas.dk
