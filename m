From: Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: [PATCH] arm: dts: socfpga: denali needs nand_x_clk too
Date: Wed, 27 Jun 2018 09:55:59 -0500
Message-ID: <333ae81b-af62-ec2e-3311-5487b1cc90c1@kernel.org>
References: <20180619120719.26921-1-richard@nod.at>
 <CAK7LNASgPa4D0Siyo3mvK_AJ2zaECDXGaMEn-iNzQ9PFXFir+w@mail.gmail.com>
 <3320422.EJ8D6C0VHL@blindfold>
 <d4fdcd1d-db20-1837-a037-0982a042d357@kernel.org>
 <20180625165506.484e025f@bbrezillon>
 <CAK7LNATyo+7gauyQcRmNfCs8CagU1XdpHHgREMeTvf4rqxpeNQ@mail.gmail.com>
 <20180626200928.29aca979@xps13>
 <CAK7LNATbmNadK=xPcaQ+seRS_YvH5ZP5SX8z74iOyYcJ0Soicw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK7LNATbmNadK=xPcaQ+seRS_YvH5ZP5SX8z74iOyYcJ0Soicw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>, Richard Weinberger <richard@nod.at>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Boris Brezillon <boris.brezillon@bootlin.com>, Rob Herring <robh+dt@kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, =?UTF-8?Q?Marek_Va=c5=a1ut?= <marek.vasut@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Masahiro,

On 06/26/2018 09:52 PM, Masahiro Yamada wrote:
> 2018-06-27 3:09 GMT+09:00 Miquel Raynal <miquel.raynal@bootlin.com>:
>> Hi Masahiro,
>>
>> On Tue, 26 Jun 2018 11:38:21 +0900, Masahiro Yamada
>> <yamada.masahiro@socionext.com> wrote:
>>
>>> 2018-06-25 23:55 GMT+09:00 Boris Brezillon <boris.brezillon@bootlin.com>:
>>>> On Mon, 25 Jun 2018 09:50:18 -0500
>>>> Dinh Nguyen <dinguyen@kernel.org> wrote:
>>>>
>>>>> On 06/22/2018 10:58 AM, Richard Weinberger wrote:
>>>>>> Masahiro,
>>>>>>
>>>>>> Am Freitag, 22. Juni 2018, 16:37:21 CEST schrieb Masahiro Yamada:
>>>>>>> Hi Richard,
>>>>>>>
>>>>>>>
>>>>>>> 2018-06-19 21:07 GMT+09:00 Richard Weinberger <richard@nod.at>:
>>>>>>>> The denali NAND flash controller needs at least two clocks to operate,
>>>>>>>> nand_clk and nand_x_clk.
>>>>>>>> Since 1bb88666775e ("mtd: nand: denali: handle timing parameters by
>>>>>>>> setup_data_interface()") nand_x_clk is used to derive timing settings.
>>>>>>>>
>>>>>>>> Signed-off-by: Richard Weinberger <richard@nod.at>
>>>>>>>> ---
>>>>>>>> Strictly speaking denali needs a ecc_clk too, but AFAIK such a clock
>>>>>>>> is not present on this SoC.
>>>>>>>> But my SoCFPGA knowledge is very limited.
>>>>>>>>
>>>>>>>> Thanks,
>>>>>>>> //richard
>>>>>>>> ---
>>>>>>>>  arch/arm/boot/dts/socfpga.dtsi | 3 ++-
>>>>>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
>>>>>>>> index 486d4e7433ed..562f7b375bbd 100644
>>>>>>>> --- a/arch/arm/boot/dts/socfpga.dtsi
>>>>>>>> +++ b/arch/arm/boot/dts/socfpga.dtsi
>>>>>>>> @@ -754,7 +754,8 @@
>>>>>>>>                         reg-names = "nand_data", "denali_reg";
>>>>>>>>                         interrupts = <0x0 0x90 0x4>;
>>>>>>>>                         dma-mask = <0xffffffff>;
>>>>>>>> -                       clocks = <&nand_clk>;
>>>>>>>> +                       clocks = <&nand_clk>, <&nand_x_clk>;
>>>>>>>> +                       clock-names = "nand", "nand_x";
>>>>>>>
>>>>>>>
>>>>>>> IMHO, this should be
>>>>>>>
>>>>>>>                           clocks = <&nand_clk>, <&nand_x_clk>, <&nand_x_clk>;
>>>>>>>                           clock-names = "nand", "nand_x", "ecc";
>>>>>
>>>>> No, it should be just the nand_x and ecc.
>>>>>
>>>>> There's already a patch to use the nand_x_clk and not the nand_clk.
>>>
>>>
>>> Different people try to fix the problem in different ways.
>>>
>>> I think it is due to miscommunication across sub-systems.
>>
>> Is the series named
>>
>>         mtd: rawnand: denali: add new clocks and improve
>>                               setup_data_interface
>>
>> still valid?
> 
> Yes.
> I believe V4 is valid.
> 
> 
> Information for Dinh Nguyen:
> 
> http://patchwork.ozlabs.org/patch/933507/
> http://patchwork.ozlabs.org/patch/933487/
> http://patchwork.ozlabs.org/patch/933494/
> http://patchwork.ozlabs.org/patch/933506/
> 
> 
> If he is not convinced, I am open to discussion, though.

I wasn't aware of these patches. This patch is staged to go into
v4.17-rc3 through the arm-soc:

https://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc.git/commit/arch/arm/boot/dts/socfpga.dtsi?h=fixes&id=4eda9b766b042ea38d84df91581b03f6145a2ab0

I think your patch will handle a case where only 1 clock is passed in,
so it should be okay right?

Dinh
