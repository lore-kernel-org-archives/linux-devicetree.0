From: Harvey Hunt <harvey.hunt@imgtec.com>
Subject: Re: [PATCH v7,3/3] MIPS: dts: jz4780/ci20: Add NEMC, BCH and NAND
 device tree nodes
Date: Tue, 17 Nov 2015 16:29:11 +0000
Message-ID: <564B55D7.5050209@imgtec.com>
References: <1444148837-10770-1-git-send-email-harvey.hunt@imgtec.com>
 <1444148837-10770-4-git-send-email-harvey.hunt@imgtec.com>
 <20151015084727.GG14475@jhogan-linux.le.imgtec.org>
 <CAOFt0_D5mO-7_cnpvm_MwvsZNv1yCFynbeA3dSw=H5hVyQbgTA@mail.gmail.com>
 <20151016103112.GB29285@jhogan-linux.le.imgtec.org>
 <20151016104848.GA1408@NP-P-BURTON> <20151104085130.3981ac63@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151104085130.3981ac63@bbrezillon>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Paul Burton <paul.burton@imgtec.com>
Cc: James Hogan <james.hogan@imgtec.com>, devicetree@vger.kernel.org, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, linux-mips <linux-mips@linux-mips.org>, linux-kernel@vger.kernel.org, Alex Smith <alex.smith@imgtec.com>, linux-mtd@lists.infradead.org, Alex Smith <alex@alex-smith.me.uk>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Boris,

On 04/11/15 07:51, Boris Brezillon wrote:
> Paul, Harvey,
>
> On Fri, 16 Oct 2015 11:48:48 +0100
> Paul Burton <paul.burton@imgtec.com> wrote:
>
>> On Fri, Oct 16, 2015 at 11:31:12AM +0100, James Hogan wrote:
>>>>>> +
>>>>>> +&nemc {
>>>>>> +     status = "okay";
>>>>>> +
>>>>>> +     nand: nand@1 {
>>>>>> +             compatible = "ingenic,jz4780-nand";
>>>>>
>>>>> Isn't the NAND a micron part? This doesn't seem right. Is the device
>>>>> driver and binding already accepted upstream with that compatible
>>>>> string?
>>>>
>>>> This is the compatible string for the JZ4780 NAND driver, this patch
>>>> is part of the series adding that. Detection of the NAND part is
>>>> handled by the MTD subsystem.
>>>
>>> Right (didn't spot that it was part of a series).
>>>
>>> The node appears to describe the NAND interface itself, i.e. a part of
>>> the SoC, so should be in the SoC dtsi file, with overrides in the board
>>> file if necessary for it to work with a particular NAND part
>>> (potentially utilising status="disabled"). Would you agree?
>>
>> Hi James,
>>
>> The "nemc" node there is for the Nand & External Memory Controller which
>> is a hardware block inside the SoC. It has 6 banks (ie. 6 chip select
>> pins, each associated with a different address range, that connect to
>> different devices). NAND flash is one such possible device, but a board
>> could connect it to any of the 6 chip selects, or banks. To represent
>> that in the SoC dtsi you'd want to have 6 NAND nodes, each disabled by
>> default, which doesn't make a whole lot of sense to me. Other, non-NAND
>> devices can connect to the NEMC too - for example the ethernet
>> controller on the CI20 is connected to one bank.
>>
>> The NAND device nodes are sort of a mix of describing the NAND flash
>> (ie. Micron part as you point out) and its connections & properties, the
>> way the NEMC should be used to interact with it alongside the BCH block,
>> and the configuration for the NEMC such as timing parameters.
>>
>> I imagine the most semantically correct means of describing it would
>> probably be for the compatible string to reflect the Micron NAND part,
>> and the NEMC driver to pick up on the relevant properties of its child
>> nodes for configuring timings, whether the device is NAND etc. However
>> the handling of registering NAND devices with MTD would probably then
>> have to be part of the NEMC driver, which feels a bit off too.
>
> Another solution would be to describe both the NAND controller and the
> NAND chip in the DT (with the NAND chip being a chip of the NAND
> controller).
> Actually this is already what other binding are doing [1][2]. I know
> those bindings are representing NAND controllers which can interface
> with more than one NAND chip, but I think that even in the 1:1 case it
> would make it clearer to represent both the NAND chip and the NAND
> controller.
>
> In your case this would give the following representation
>
> +&nemc {
> +	status = "okay";
> +
> +	nandc: nand-controller@1 {
> +		compatible = "ingenic,jz4780-nand";
> +		reg = <1 0 0x1000000>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ingenic,bch-controller = <&bch>;
> +
> +		nand@0 {
> +			nand-ecc-mode = "hw";
> +			nand-on-flash-bbt;
> +			nand-ecc-size = <1024>;
> +			nand-ecc-strength = <24>;
> +
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +
> +			partition@0 {
> +				label = "u-boot-spl";
> +				reg = <0x0 0x0 0x0 0x800000>;
> +			};
> +			/* ... */
> +
> +		};
> +	};
> +};

I'll implement this in v8 - thanks for the example DT. :-)

> Best Regards,
>
> Boris
>
> [1]http://lxr.free-electrons.com/source/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt#L119
> [2]http://lxr.free-electrons.com/source/Documentation/devicetree/bindings/mtd/sunxi-nand.txt#L28
>
>>
>> Thanks,
>>      Paul
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>
>

Best regards,

Harvey Hunt
