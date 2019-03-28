Return-Path: <SRS0=88b5=R7=xs4all.nl=hverkuil@kernel.org>
Subject: Re: [PATCH v4 1/3] media: dt-bindings: media: document allegro-dvt
 bindings
References: <20190301152718.23134-1-m.tretter@pengutronix.de>
 <20190301152718.23134-2-m.tretter@pengutronix.de>
 <e61aebce-8be4-7f6a-6d9b-69c5e4db14d2@xs4all.nl>
 <20190328095922.6602559b@litschi.hi.pengutronix.de>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <3c67c0b4-efcf-31b3-af8a-84dd421e1d9c@xs4all.nl>
Date: Thu, 28 Mar 2019 10:21:03 +0100
MIME-Version: 1.0
In-Reply-To: <20190328095922.6602559b@litschi.hi.pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Michael Tretter <m.tretter@pengutronix.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, robh+dt@kernel.org, mchehab@kernel.org, tfiga@chromium.org, dshah@xilinx.com, Rob Herring <robh@kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 3/28/19 9:59 AM, Michael Tretter wrote:
> On Wed, 27 Mar 2019 13:57:10 +0100, Hans Verkuil wrote:
>> On 3/1/19 4:27 PM, Michael Tretter wrote:
>>> Add device-tree bindings for the Allegro DVT video IP core found on the
>>> Xilinx ZynqMP EV family.
>>>
>>> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>> ---
>>> v3 -> v4:
>>> none
>>>
>>> v2 -> v3:
>>> - rename node to video-codec
>>> - drop interrupt-names
>>> - fix compatible in example
>>> - add clocks to required properties
>>>
>>> v1 -> v2:
>>> none
>>> ---
>>>  .../devicetree/bindings/media/allegro.txt     | 43 +++++++++++++++++++
>>>  1 file changed, 43 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/media/allegro.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/allegro.txt b/Documentation/devicetree/bindings/media/allegro.txt
>>> new file mode 100644
>>> index 000000000000..a92e2fbf26c9
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/media/allegro.txt
>>> @@ -0,0 +1,43 @@
>>> +Device-tree bindings for the Allegro DVT video IP codecs present in the Xilinx
>>> +ZynqMP SoC. The IP core may either be a H.264/H.265 encoder or H.264/H.265
>>> +decoder ip core.
>>> +
>>> +Each actual codec engines is controlled by a microcontroller (MCU). Host
>>> +software uses a provided mailbox interface to communicate with the MCU. The
>>> +MCU share an interrupt.
>>> +
>>> +Required properties:
>>> +  - compatible: value should be one of the following
>>> +    "allegro,al5e-1.1", "allegro,al5e": encoder IP core
>>> +    "allegro,al5d-1.1", "allegro,al5d": decoder IP core  
>>
>> checkpatch give me:
>>
>> WARNING: DT compatible string vendor "allegro" appears un-documented -- check ./Documentation/devicetree/bindings/vendor-prefixes.txt
>> #2714: FILE: drivers/staging/media/allegro-dvt/allegro-core.c:2636:
>> +       { .compatible = "allegro,al5e-1.1" },
>>
>> I think you should probably replace allegro by xlnx.
> 
> The video-codec and the firmware is actually Allegro IP. Xilinx
> integrated the IP cores into the SoC with their "VCU System-Level
> Control" module, which uses the "xlnx,vcu" binding.
> 
> I would rather add "allegro" to the vendor-prefixes.txt than replacing
> it with xlnx.

That's fine. Do that in a separate patch as I suspect that Rob might want
to merge it through his own tree.

Regards,

	Hans

> 
> Michael
> 
>>
>> Regards,
>>
>> 	Hans
>>
>>> +  - reg: base and length of the memory mapped register region and base and
>>> +    length of the memory mapped sram
>>> +  - reg-names: must include "regs" and "sram"
>>> +  - interrupts: shared interrupt from the MCUs to the processing system
>>> +  - clocks: must contain an entry for each entry in clock-names
>>> +  - clock-names: must include "core_clk", "mcu_clk", "m_axi_core_aclk",
>>> +    "m_axi_mcu_aclk", "s_axi_lite_aclk"
>>> +
>>> +Example:
>>> +	al5e: video-codec@a0009000 {
>>> +		compatible = "allegro,al5e-1.1", "allegro,al5e";
>>> +		reg = <0 0xa0009000 0 0x1000>,
>>> +		      <0 0xa0000000 0 0x8000>;
>>> +		reg-names = "regs", "sram";
>>> +		interrupts = <0 96 4>;
>>> +		clocks = <&xlnx_vcu 0>, <&xlnx_vcu 1>,
>>> +			 <&clkc 71>, <&clkc 71>, <&clkc 71>;
>>> +		clock-names = "core_clk", "mcu_clk", "m_axi_core_aclk",
>>> +			      "m_axi_mcu_aclk", "s_axi_lite_aclk"
>>> +	};
>>> +	al5d: video-codec@a0029000 {
>>> +		compatible = "allegro,al5d-1.1", "allegro,al5d";
>>> +		reg = <0 0xa0029000 0 0x1000>,
>>> +		      <0 0xa0020000 0 0x8000>;
>>> +		reg-names = "regs", "sram";
>>> +		interrupts = <0 96 4>;
>>> +		clocks = <&xlnx_vcu 2>, <&xlnx_vcu 3>,
>>> +			 <&clkc 71>, <&clkc 71>, <&clkc 71>;
>>> +		clock-names = "core_clk", "mcu_clk", "m_axi_core_aclk",
>>> +			      "m_axi_mcu_aclk", "s_axi_lite_aclk"
>>> +	};
>>>   
>>
>>
