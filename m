From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2 5/5] ARM: dts: r8a7794: add sound support
Date: Fri, 12 Feb 2016 19:47:45 +0300
Message-ID: <56BE0CB1.4070408@cogentembedded.com>
References: <12033353.rt0nolnBmD@wasted.cogentembedded.com>
 <2543047.yYrDdYb9v5@wasted.cogentembedded.com>
 <874mdhtn7d.wl%kuninori.morimoto.gx@renesas.com>
 <20160210171455.GB17671@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20160210171455.GB17671@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 02/10/2016 08:14 PM, Simon Horman wrote:

>> Sorry for my un-ordered response
>>
>>> Define the generic R8A7794 part of  the sound device node.
>>> This sound device  is a complex one and comprises the Audio Clock Generator
>>> (ADG), Sampling Rate Converter Unit (SCU), Serial Sound Interface [Unit]
>>> (SSI[U]), and Audio DMAC-Peripheral-Peripheral.
>>> It is up  to the board file to enable the device.
>>>
>>> This patch is based on the R8A7791 sound work by Kuninori Morimoto.
>>>
>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>> (snip)
>>> +		rcar_sound,src {
>>> +			src1: src@1 {
>>> +				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
>>> +				dmas = <&audma0 0x87>, <&audma0 0x9c>;
>>> +				dma-names = "rx", "tx";
>>> +			};
>>> +			src2: src@2 {
>>> +				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
>>> +				dmas = <&audma0 0x89>, <&audma0 0x9e>;
>>> +				dma-names = "rx", "tx";
>>> +			};
>>> +			src3: src@3 {
>>> +				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
>>> +				dmas = <&audma0 0x8b>, <&audma0 0xa0>;
>>> +				dma-names = "rx", "tx";
>>> +			};
>>> +			src4: src@4 {
>>> +				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
>>> +				dmas = <&audma0 0x8d>, <&audma0 0xb0>;
>>> +				dma-names = "rx", "tx";
>>> +			};
>>> +			src5: src@5 {
>>> +				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
>>> +				dmas = <&audma0 0x8f>, <&audma0 0xb2>;
>>> +				dma-names = "rx", "tx";
>>> +			};
>>> +			src6: src@6 {
>>> +				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
>>> +				dmas = <&audma0 0x91>, <&audma0 0xb4>;
>>> +				dma-names = "rx", "tx";
>>> +			};
>>> +		};
>>
>> I think this can't work correctly, because driver is assuming
>> DT has all channles (from 0). (see linux/sound/soc/sh/rcar/src.c :: rsnd_src_probe)
>> Can you adds dummy src0 with some comments ? or fix src.c driver ?
>
> I would prefer the driver to be fixed (I had a similar patchset locally
> and I found it doesn't work).

    You mean you had R8A7794 sound patch set too?

> The reason is that DT should describe
> the hardware rather than the current state of the software.

    Yes, of course. Just tell me do I have to fix the driver *before* this 
patch set is accepted?

MBR, Sergei
