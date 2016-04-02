From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] mtd: nand: denali: allow to override max_banks from DT property
Date: Sat, 2 Apr 2016 14:14:39 +0900
Message-ID: <CAK7LNATWSm6NtAarrZYv4ZtJG9TwieUadT3A02+0DQGTKxnA2Q@mail.gmail.com>
References: <1458822277-31428-1-git-send-email-yamada.masahiro@socionext.com>
	<20160325154520.199b0863@bbrezillon>
	<CAK7LNATqVEMRwa+Ss4V9sBXYZwqKX=CpB_3Oox8bM6Yow0mkXA@mail.gmail.com>
	<20160329095305.46229ad5@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160329095305.46229ad5@bbrezillon>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, Graham Moore <grmoore@opensource.altera.com>, Dinh Nguyen <dinguyen@opensource.altera.com>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Weinberger <richard@nod.at>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Brian Norris <computersforpeace@gmail.com>, Rob Herring <robh+dt@kernel.org>, David Woodhouse <dwmw2@infradead.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Hi Boris,


2016-03-29 16:53 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> Hi,
>
> I'm answering to this one, but I already saw your v2.
>
> On Sat, 26 Mar 2016 13:27:50 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
>> 2016-03-25 23:45 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
>> > On Thu, 24 Mar 2016 21:24:37 +0900
>> > Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>> >
>> >> Commit 271707b1d817 ("mtd: nand: denali: max_banks calculation
>> >> changed in revision 5.1") supported the new encoding of the "n_banks"
>> >> bits of the "features" register, but there is an unfortunate case
>> >> that is not covered by that commit.
>> >>
>> >> Panasonic (its System LSI division is now Socionext) bought several
>> >> versions of this IP.  The IP released for Panasonic around Feb. 2012
>> >> is revision 5 and uses the old encoding for n_banks (2 << n_banks).
>> >> While the one released around Nov. 2012 is also revision 5, but it
>> >> uses the new encoding (1 << n_banks).
>> >>
>> >> The revision register cannot distinguish these two incompatible
>> >> hardware.  I guess this IP series is not well-organized.  I could not
>> >> find any alternative but giving max_banks from DT property.
>> >
>> > Hm, shouldn't that be addressed with a new compatible instead of adding
>> > a extra property?
>
> You didn't answer to this suggestion. I see several advantages in this
> approach:
>
> 1/ You'll only break the DT once (to add your new compatible) even if
> you got your logic wrong. All you'll have to do in this case is patch
> your driver to change the compatible <-> capabilities association
>
> 2/ This may not be the only difference between the 2 revisions, and
> in this case, putting the compatible <-> capabilities association
> directly in your driver will allow you to easily tweak capabilities
> per-revision
>
>> >
>> >>
>> >> This commit works around the problem by allowing DT to set the
>> >> max_banks forcibly.  Of course, this DT property can be optional if
>> >> the auto detection based on the hardware registers works well.
>> >>
>> >> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> >> ---
>> >>
>> >>  Documentation/devicetree/bindings/mtd/denali-nand.txt | 4 ++++
>> >>  drivers/mtd/nand/denali.c                             | 3 ++-
>> >>  drivers/mtd/nand/denali_dt.c                          | 3 +++
>> >>  3 files changed, 9 insertions(+), 1 deletion(-)
>> >>
>> >> diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt b/Documentation/devicetree/bindings/mtd/denali-nand.txt
>> >> index 785b825..78c250d 100644
>> >> --- a/Documentation/devicetree/bindings/mtd/denali-nand.txt
>> >> +++ b/Documentation/devicetree/bindings/mtd/denali-nand.txt
>> >> @@ -7,6 +7,10 @@ Required properties:
>> >>    - interrupts : The interrupt number.
>> >>    - dma-mask : DMA bit mask
>> >>
>> >> +Optional properties:
>> >> +  - max-banks : Maximum number of banks supported by hardware.  If not
>> >> +    specified, it is determined based on the "features" register of hardware.
>> >> +
>> >
>> > You might want to prefix that with "denali,".
>> >
>> >>  The device tree may optionally contain sub-nodes describing partitions of the
>> >>  address space. See partition.txt for more detail.
>>
>>
>> In which case, do we have to add a vendor prefix to DT properties?
>>
>> I do not know a clear rule about this.
>
> Usually you add a vendor prefix when the property only applies to a
> specific controller/IP. In the NAND specific case, most NAND
> controllers have a fixed number of banks which can be deduced from the
> IP revision/version. I'd like to keep it like that and avoid seeing
> other drivers use this max-banks property to deduce the number of
> available banks, hence my suggestion to, at least, prefix your property
> with "denali,". But I'd still prefer to see the max-banks value be
> associated to a new compatible.
>
> Thanks,
>
> Boris

I want to use this driver for ARM-based UniPhier SoCs.
Their DT files are located as follows:

arch/arm/boot/dts/uniphier-*
arch/arm64/boot/dts/socionext/uniphier-*


If we decided to add new DT compatible strings rather than DT property,
which string would you suggest?
Should it include "denali" or just SoC name "uniphier-*"?
How about the vendor prefix?  "denali," or "socionext," ?


like this?  I am not sure...


nand: nand@68000000 {
        compatible = "socionext,uniphier-pro5-nand", "denali,denali-nand-dt";
        reg-names = "nand_data", "denali_reg";
        reg = <0x68000000 0x20>, <0x68100000 0x1000>;
        interrupts = <0 65 4>;
        pinctrl-names = "default";
        pinctrl-0 = <&pinctrl_nand>;
        clocks = <&nandclk>;
};


At least, I need two DT compatible strings,
for old/new "n_banks" encoding.

The following part is also a problem for me because
platform-specific ECC bit is hard-coded in the driver.

The comment claims that Intel MRST supports 8bit and 15bit for ecc.strenth,
while the Denali IP on UniPhier SoCs supports 8bit, 16bit, and 24bit ECC.

I need to do something with it to proceed, but the code is crappy.


        /*
         * Denali Controller only support 15bit and 8bit ECC in MRST,
         * so just let controller do 15bit ECC for MLC and 8bit ECC for
         * SLC if possible.
         * */
        if (!nand_is_slc(&denali->nand) &&
                        (mtd->oobsize > (denali->bbtskipbytes +
                        ECC_15BITS * (mtd->writesize /
                        ECC_SECTOR_SIZE)))) {
                /* if MLC OOB size is large enough, use 15bit ECC*/
                denali->nand.ecc.strength = 15;
                denali->nand.ecc.layout = &nand_15bit_oob;
                denali->nand.ecc.bytes = ECC_15BITS;
                iowrite32(15, denali->flash_reg + ECC_CORRECTION);
        } else if (mtd->oobsize < (denali->bbtskipbytes +
                        ECC_8BITS * (mtd->writesize /
                        ECC_SECTOR_SIZE))) {
                pr_err("Your NAND chip OOB is not large enough to
contain 8bit ECC correction codes");
                goto failed_req_irq;
        } else {
                denali->nand.ecc.strength = 8;
                denali->nand.ecc.layout = &nand_8bit_oob;
                denali->nand.ecc.bytes = ECC_8BITS;
                iowrite32(8, denali->flash_reg + ECC_CORRECTION);
        }








-- 
Best Regards
Masahiro Yamada
