From: Parthiban Nallathambi <pn@denx.de>
Subject: Re: [PATCH v3 1/4] dt-bindings: interrupt-controller: Actions
 external interrupt controller
Date: Sun, 9 Dec 2018 20:26:40 +0100
Message-ID: <49bb60b8-a51b-a4e8-da29-52f0a951c37b@denx.de>
References: <20181126100356.2840578-1-pn@denx.de>
 <20181126100356.2840578-2-pn@denx.de> <20181207232934.GA28201@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181207232934.GA28201@bogus>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@cubietech.com, jason@lakedaemon.net, marc.zyngier@arm.com, catalin.marinas@arm.com, pn@denx.de, laisa.costa@lsitec.org.br, will.deacon@arm.com, linux-kernel@vger.kernel.org, thomas.liau@actions-semi.com, edgar.righi@lsitec.org.br, guilherme.simoes@lsitec.org.br, mp-cs@actions-semi.com, manivannan.sadhasivam@linaro.org, tglx@linutronix.de, mkzuffo@lsi.usp.br, afaerber@suse.de, linux-arm-kernel@lists.infradead.org, Saravanan Sekar <sravanhome@gmail.com>
List-Id: devicetree@vger.kernel.org

Hello Rob,

On 12/8/18 12:29 AM, Rob Herring wrote:
> On Mon, Nov 26, 2018 at 11:03:53AM +0100, Parthiban Nallathambi wrote:
>> Actions Semi OWL family SoC's provides support for external interrupt
>> controller to be connected and controlled using SIRQ pins. S500, S700
>> and S900 provides 3 SIRQ lines and works independently for 3 external
>> interrupt controllers.
>>
>> Signed-off-by: Parthiban Nallathambi <pn@denx.de>
>> Signed-off-by: Saravanan Sekar <sravanhome@gmail.com>
>> ---
>>  .../interrupt-controller/actions,owl-sirq.txt | 57 +++++++++++++++++++
>>  1 file changed, 57 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/actions,owl-sirq.txt
>>
>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/actions,owl-sirq.txt b/Documentation/devicetree/bindings/interrupt-controller/actions,owl-sirq.txt
>> new file mode 100644
>> index 000000000000..b3adc4bddf40
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/interrupt-controller/actions,owl-sirq.txt
>> @@ -0,0 +1,57 @@
>> +Actions Semi Owl SoCs SIRQ interrupt controller
>> +
>> +S500, S700 and S900 SoC's from Actions provides 3 SPI's from GIC,
> 
> Listing SoCs here means you have to update this line for every new SoC.

Ok, I will mark it as OWL SoC's here.

> 
>> +in which external interrupt controller can be connected. 3 SPI's
>> +45, 46, 47 from GIC are directly exposed as SIRQ. It has
>> +the following properties:
>> +
>> +- inputs three interrupt signal from external interrupt controller
>> +
>> +Required properties:
>> +
>> +- compatible: should be "actions,owl-sirq"
> 
> SoC specific compatibles needed.

Ok, I will change this into "actions,s700-sirq"

> 
>> +- reg: physical base address of the controller and length of memory mapped
>> +  region.
>> +- interrupt-controller: identifies the node as an interrupt controller
>> +- #interrupt-cells: specifies the number of cells needed to encode an interrupt
>> +  source, should be 2.
>> +- actions,sirq-shared-reg: Applicable for S500 and S700 where SIRQ register
>> +  details are maintained at same offset/register.
>> +- actions,sirq-reg-offset: register offset for SIRQ interrupts. When registers are
>> +  shared, all the three offsets will be same (S500 and S700).
> 
> These properties should be implied by the compatible string.

Agreed for sirq-shared-reg.

But for s900 sirq-reg-offset, the register offset will have different values.
So this shall not be removed.

> 
>> +- actions,ext-irq-range: Identifies external irq number range in different SoCs.
> 
> Why is this needed? It appears to always be the same.

Yes, I agree for all the existing Owl SoC's this remains same.

In the previous version we defined this as constant in the code. But based on Marc's
feedback I understood that this value should come from Device Tree instead on hard
coding in the code.

> 
>> +
>> +Example for S900:
>> +
>> +sirq: interrupt-controller@e01b0000 {
>> +	compatible = "actions,owl-sirq";
>> +	reg = <0x0 0xe01b0000 0x0 0x1000>;
>> +	interrupt-controller;
>> +	#interrupt-cells = <3>;
>> +	actions,sirq-offset = <0x200 0x528 0x52c>;
>> +	actions,ext-irq-range = <13 15>;
>> +};
>> +
>> +Example for S700:
> 
> Examples are examples, not an enumeration of all possible dts entries. 
> So 1 should be sufficient.

Sure, I will maintain only s700 here.

> 
>> +
>> +sirq: interrupt-controller@e01b0000 {
>> +	compatible = "actions,owl-sirq";
>> +	reg = <0x0 0xe01b0000 0x0 0x1000>;
>> +	interrupt-controller;
>> +	#interrupt-cells = <3>;
>> +	actions,sirq-shared-reg;
>> +	actions,sirq-reg-offset = <0x200 0x200 0x200>;
>> +	actions,ext-irq-range = <13 15>;
>> +};
>> +
>> +Example for S500:
>> +
>> +sirq: interrupt-controller@b01b0000 {
>> +	compatible = "actions,owl-sirq";
>> +	reg = <0x0 0xb01b0000 0x0 0x1000>;
>> +	interrupt-controller;
>> +	#interrupt-cells = <3>;
>> +	actions,sirq-shared-reg;
>> +	actions,sirq-offset = <0x200 0x200 0x200>;
>> +	actions,ext-irq-range = <13 15>;
>> +};
>> -- 
>> 2.17.2
>>
> 

-- 
Thanks,
Parthiban N

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-22 Fax: (+49)-8142-66989-80 Email: pn@denx.de
