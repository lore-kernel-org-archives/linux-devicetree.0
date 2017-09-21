From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] dt-bindings: nand: denali: reduce the register space in
 the example
Date: Thu, 21 Sep 2017 20:10:42 +0900
Message-ID: <CAK7LNASvTg0-S-OkVJ7Ke1o0fWLOWoXubXQ4rkZwPLQ53xrnRA@mail.gmail.com>
References: <1505373456-24047-1-git-send-email-yamada.masahiro@socionext.com>
 <3c17c272-40ec-4eeb-0dc3-59a64400e6f8@pengutronix.de> <CAK7LNAS9PZM49HJJRegQ9C+nrHKJntvHeURqO5Y07L5_dJpTeQ@mail.gmail.com>
 <630e651e-3d38-7a39-0327-e9b398d97e2d@pengutronix.de> <CAK7LNATRT4NYShu9MHPwfnxFC8k-rTak_bS-PrBmS+m5TUA72g@mail.gmail.com>
 <e92b8fc2-7a37-7fc2-f034-44ea870b87b1@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e92b8fc2-7a37-7fc2-f034-44ea870b87b1@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Oleksij Rempel <ore@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, Dinh Nguyen <dinguyen@kernel.org>, Boris Brezillon <boris.brezillon@free-electrons.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Oleksij Rempel <o.rempel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>
List-Id: devicetree@vger.kernel.org

2017-09-21 15:09 GMT+09:00 Oleksij Rempel <ore@pengutronix.de>:
> Hi,
>
> On 21.09.2017 07:26, Masahiro Yamada wrote:
>>
>> Hi.
>
>
> ......
>
>>> Hm.. according to
>>>
>>> https://www.altera.com/en_US/pdfs/literature/hb/cyclone-v/cyclone5_handbook.pdf
>>> Table 13-18: NAND Controller Module Data Space Address Range
>>>
>>> Module Instance       Start Address        End Address
>>> NAND_DATA             0xFF900000           0xFF9FFFFF
>>>
>>> So <0xff900000 0x100000> seems to be a proper value.
>>>
>>
>> The Alrera's SOCFPGA document describes so.
>> It is up to each SoC vendor how to describe the register space.
>>
>> I am focusing on the Denali IP
>> because this IP is used among several SoCs.
>>
>>
>>
>> You can see the peripheral region map
>> starting at page 1-18 of the document you referred to:
>>
>> Slave ID      Description                  Base Addr      Size
>> ---------------------------------------------------------------
>> L3REGS        L3 interconnect GPV          0xFF800000      1 MB
>> NANDDATA      NAND flash controller data   0xFF900000     64 KB
>> QSPIDATA      Quad SPI flash data          0xFFA00000      1 MB
>>
>> (In the doc, the base is described as 0xFFB900000, but this is
>> apparently a typo.)
>>
>>
>> The rationale of the "End Address 0xFF9FFFFF" of NAND_DATA
>> is the fact that the base address of the next peripheral (QSPIDATA) is
>> 0xFFA00000.
>>
>>
>>
>>
>> One more, if you look at the next page,
>>
>> Slave ID      Description                      Base Addr     Size
>> ---------------------------------------------------------------
>> NANDREGS      NAND flash controller registers   0xFFB80000   64 KB
>> FPGAMGRDATA   FPGA manager configuration data   0xFFB90000    4 KB
>>
>>
>> The size of NAND register space is described as 64KB,
>> but the rationale is just the start of the next peripheral is 0xFFB90000.
>>
>> (0xFFB90000 - 0xFFB80000 = 0x10000 = 64KB)
>>
>>
>>
>> Altera apparently reserved address space just for the purpose
>> of matching the end address to the base address of the next peripheral.
>>
>>
>> That means, this document specifies address region
>> much bigger than the IP actually provides.
>>
>>
>> If you look at page 13-6, there are only two registers
>> in NANDDATA space.
>>
>> Table 13-4: Register Map for Indexed Addressing
>> Control   0x0
>> Data      0x10
>>
>>
>>
>> For NANDREGS, in page 13-106, the following is the last register
>> in the NANDREGS space.
>>
>> lun_status_cmd
>> Offset 0x7A0
>>
>> Obviously, 0x1000 (4KB) is enough for NANDREGS.
>>
>> To conclude this, this binding document was written
>> based on the Altera's SOCFPGA specification.
>>
>> Altera specifies the region size
>> so that end address matches to the base of the next peripheral.
>> This is just a matter of SOCFPGA address mapping.
>>
>> In my opinion, the binding document should not be oriented
>> to a particular SoC, which is not true for other SoCs.
>
> ok. Thank you for detailed response.



BTW, I am not forcing you to change the SOCFPGA DTS.
It is up to you and Dihn whether change it or not.

I do not have any SOCFPGA board.



-- 
Best Regards
Masahiro Yamada
