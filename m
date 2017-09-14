From: Oleksij Rempel <ore@pengutronix.de>
Subject: Re: [PATCH] dt-bindings: nand: denali: reduce the register space in
 the example
Date: Thu, 14 Sep 2017 11:06:08 +0200
Message-ID: <630e651e-3d38-7a39-0327-e9b398d97e2d@pengutronix.de>
References: <1505373456-24047-1-git-send-email-yamada.masahiro@socionext.com>
 <3c17c272-40ec-4eeb-0dc3-59a64400e6f8@pengutronix.de>
 <CAK7LNAS9PZM49HJJRegQ9C+nrHKJntvHeURqO5Y07L5_dJpTeQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK7LNAS9PZM49HJJRegQ9C+nrHKJntvHeURqO5Y07L5_dJpTeQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Oleksij Rempel <o.rempel@pengutronix.de>, Dinh Nguyen <dinguyen@kernel.org>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Boris Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On 14.09.2017 10:16, Masahiro Yamada wrote:
> Hi.
> 
> 
> 2017-09-14 17:04 GMT+09:00 Oleksij Rempel <ore@pengutronix.de>:
>> Hi,
>>
>> i assume arch/arm/boot/dts/socfpga.dtsi should be update as well. Right?
> 
> I think so.
> (also arch/arm/boot/dts/socfpga_arria10.dtsi in the same way)

Hm.. according to
https://www.altera.com/en_US/pdfs/literature/hb/cyclone-v/cyclone5_handbook.pdf
Table 13-18: NAND Controller Module Data Space Address Range

Module Instance       Start Address        End Address
NAND_DATA             0xFF900000           0xFF9FFFFF

So <0xff900000 0x100000> seems to be a proper value.

> The wrong property "dma-mask" was removed by
> commit 60d920d32ca40660e382cf9ccbc236599a49e607.
> 
> 
> 
>> On 14.09.2017 09:17, Masahiro Yamada wrote:
>>>
>>> This example allocates too much for register regions.  Especially,
>>> there are only two registers in the "nand_data" interface of this
>>> hardware (ADDR: 0x00, DATA: 0x10).
>>>
>>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>>> ---
>>>
>>>    Documentation/devicetree/bindings/mtd/denali-nand.txt | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt
>>> b/Documentation/devicetree/bindings/mtd/denali-nand.txt
>>> index 504291d..0ee8edb 100644
>>> --- a/Documentation/devicetree/bindings/mtd/denali-nand.txt
>>> +++ b/Documentation/devicetree/bindings/mtd/denali-nand.txt
>>> @@ -29,7 +29,7 @@ nand: nand@ff900000 {
>>>          #address-cells = <1>;
>>>          #size-cells = <1>;
>>>          compatible = "altr,socfpga-denali-nand";
>>> -       reg = <0xff900000 0x100000>, <0xffb80000 0x10000>;
>>> +       reg = <0xff900000 0x20>, <0xffb80000 0x1000>;
>>>          reg-names = "nand_data", "denali_reg";
>>>          interrupts = <0 144 4>;
>>>    };
>>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe devicetree" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
> 
