From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [RESEND PATCH v2 26/53] mtd: nand: denali: support 1024 byte ECC
 step size
Date: Thu, 23 Mar 2017 15:53:14 +0900
Message-ID: <CAK7LNARafOYZ54k2QZhTKgt-KLFs7Rz5X=GzDVkZkkXOchtGNQ@mail.gmail.com>
References: <1490213273-8571-1-git-send-email-yamada.masahiro@socionext.com>
 <1490213273-8571-27-git-send-email-yamada.masahiro@socionext.com>
 <20170322223239.70a45053@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20170322223239.70a45053@bbrezillon>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Laurent Monat <laurent.monat@idquantique.com>, devicetree@vger.kernel.org, thorsten.christiansson@idquantique.com, Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Mark Rutland <mark.rutland@arm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Masami Hiramatsu <mhiramat@kernel.org>, Chuanxiao Dong <chuanxiao.dong@intel.com>, Jassi Brar <jaswinder.singh@linaro.org>, Brian Norris <computersforpeace@gmail.com>, Enrico Jorns <ejo@pengutronix.de>, David Woodhouse <dwmw2@infradead.org>, Graham Moore <grmoore@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

Hi Boris,

2017-03-23 6:32 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> On Thu, 23 Mar 2017 05:07:25 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
>> This driver was originally written for the Intel MRST platform with
>> several platform specific parameters hard-coded.  Another thing we
>> need to fix is the hard-coded ECC step size.  Currently, it is
>> defined as follows:
>>
>>   #define ECC_SECTOR_SIZE 512
>>
>> (somehow, it is defined in both denali.c and denali.h)
>>
>> This must be avoided because the Denali IP supports 1024B ECC size
>> as well.  The Denali User's Guide also says supporting both 512B and
>> 1024B ECC sectors is possible, though it would require instantiation
>> of two different ECC circuits.  So, possible cases are:
>>
>>  [1] only 512B ECC size is supported
>>  [2] only 1024B ECC size is supported
>>  [3] both 512B and 1024B ECC sizes are supported
>>
>> For [3], the actually used ECC size is specified by some registers.
>>
>> Newer versions of this IP have the following registers:
>>   CFG_DATA_BLOCK_SIZE       (0x6b0)
>>   CFG_LAST_DATA_BLOCK_SIZE  (0x6c0)
>>   CFG_NUM_DATA_BLOCKS       (0x6d0)
>>
>> For those versions, the software should set ecc.size and ecc.steps
>> to these registers.  Old versions do not have such registers, but
>> they are "reserved", so write accesses are safely ignored.
>>
>> This commit adds new flags DENALI_CAP_ECC_SIZE_{512,1024}.
>>
>> The DT property "nand-ecc-step-size" is still optional; a reasonable
>> default will be chosen for [1] and [2].  For case [3], if exists, it
>> is recommended to specify the desired ECC size explicitly.
>
> Actually, the NAND chip gives some hints to help controller drivers
> decide which ecc-block-size/strength is appropriate
> (chip->ecc_strength_ds, chip->ecc_step_ds), so, in most cases
> nand-ecc-step-size is unneeded (unless you want to force a specific
> setting).


But, if we look at nand_flash_detect_onfi(),
->ecc_step_ds is almost a fixed value, 512, right?

if (p->ecc_bits != 0xff) {
        chip->ecc_strength_ds = p->ecc_bits;
        chip->ecc_step_ds = 512;


As far as I understood,
->ecc_step_ds is not a hint for drivers to decide ->ecc.size.

Rather, ->ecc_step_ds just specifies the unit of ->ecc_strength_ds.



>>                       int offset;
>>                       unsigned int flips_in_byte;
>>
>> -                     offset = (err_sector * ECC_SECTOR_SIZE + err_byte) *
>> +                     offset = (err_sector * ecc_size + err_byte) *
>>                                               denali->devnum + err_device;
>>
>>                       /* correct the ECC error */
>> @@ -1579,22 +1578,37 @@ int denali_init(struct denali_nand_info *denali)
>>       /* no subpage writes on denali */
>>       chip->options |= NAND_NO_SUBPAGE_WRITE;
>>
>> +     if (!chip->ecc.size) {
>
> You should set it to chip->ecc_step_ds and pick a default value only if
> it's still 0 after that. Same goes for ecc.strength.

Sorry, I still do not understand this.

->ecc_strength_ds and ->ecc_step_ds
shows how often bit-flip occurs in this device.

So, nand_ecc_strength_good() is a typical usage of these.

How many sectors the driver actually splits the device into
is a different issue, I think.



>> +             if (denali->caps & DENALI_CAP_ECC_SIZE_512)
>> +                     chip->ecc.size = 512;
>> +             if (denali->caps & DENALI_CAP_ECC_SIZE_1024)
>> +                     chip->ecc.size = 1024;
>> +             if (WARN(!chip->ecc.size, "must support at least 512 or 1024 ECC size"))
>> +                     goto failed_req_irq;
>> +     }
>> +
>> +     if ((chip->ecc.size != 512 && chip->ecc.size != 1024) ||
>> +         (chip->ecc.size == 512 && !(denali->caps & DENALI_CAP_ECC_SIZE_512)) ||
>> +         (chip->ecc.size == 1024 && !(denali->caps & DENALI_CAP_ECC_SIZE_1024))) {
>> +             dev_err(denali->dev, "specified ECC size %d in not supported",
>> +                     chip->ecc.size);
>> +             goto failed_req_irq;
>> +     }
>> +
>>       /*
>>        * Denali Controller only support 15bit and 8bit ECC in MRST,
>>        * so just let controller do 15bit ECC for MLC and 8bit ECC for
>>        * SLC if possible.
>
> Usually the NAND chips expose the ECC requirements, so basing our
> decision only on the type of NAND sounds a bit weird.


chip->ecc.size is one of the configuration of this controller IP.

SoC vendors choose 512, 1024, or both of them
when they buy this IP.

If both 512 and 1024 are supported, 1024 is usually a better choice
because bigger ecc.size uses ECC more efficiently.


It is unrelated to the chips' requirements.



-- 
Best Regards
Masahiro Yamada

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
