From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [RESEND PATCH v2 26/53] mtd: nand: denali: support 1024 byte
 ECC step size
Date: Thu, 23 Mar 2017 09:39:18 +0100
Message-ID: <20170323093918.1e65916c@bbrezillon>
References: <1490213273-8571-1-git-send-email-yamada.masahiro@socionext.com>
        <1490213273-8571-27-git-send-email-yamada.masahiro@socionext.com>
        <20170322223239.70a45053@bbrezillon>
        <CAK7LNARafOYZ54k2QZhTKgt-KLFs7Rz5X=GzDVkZkkXOchtGNQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK7LNARafOYZ54k2QZhTKgt-KLFs7Rz5X=GzDVkZkkXOchtGNQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Laurent Monat <laurent.monat@idquantique.com>, thorsten.christiansson@idquantique.com, Enrico Jorns <ejo@pengutronix.de>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, Dinh Nguyen <dinguyen@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Graham Moore <grmoore@opensource.altera.com>, David Woodhouse <dwmw2@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>, Chuanxiao Dong <chuanxiao.dong@intel.com>, Jassi Brar <jaswinder.singh@linaro.org>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Brian Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.>
List-Id: devicetree@vger.kernel.org

On Thu, 23 Mar 2017 15:53:14 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Hi Boris,
> 
> 2017-03-23 6:32 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> > On Thu, 23 Mar 2017 05:07:25 +0900
> > Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> >  
> >> This driver was originally written for the Intel MRST platform with
> >> several platform specific parameters hard-coded.  Another thing we
> >> need to fix is the hard-coded ECC step size.  Currently, it is
> >> defined as follows:
> >>
> >>   #define ECC_SECTOR_SIZE 512
> >>
> >> (somehow, it is defined in both denali.c and denali.h)
> >>
> >> This must be avoided because the Denali IP supports 1024B ECC size
> >> as well.  The Denali User's Guide also says supporting both 512B and
> >> 1024B ECC sectors is possible, though it would require instantiation
> >> of two different ECC circuits.  So, possible cases are:
> >>
> >>  [1] only 512B ECC size is supported
> >>  [2] only 1024B ECC size is supported
> >>  [3] both 512B and 1024B ECC sizes are supported
> >>
> >> For [3], the actually used ECC size is specified by some registers.
> >>
> >> Newer versions of this IP have the following registers:
> >>   CFG_DATA_BLOCK_SIZE       (0x6b0)
> >>   CFG_LAST_DATA_BLOCK_SIZE  (0x6c0)
> >>   CFG_NUM_DATA_BLOCKS       (0x6d0)
> >>
> >> For those versions, the software should set ecc.size and ecc.steps
> >> to these registers.  Old versions do not have such registers, but
> >> they are "reserved", so write accesses are safely ignored.
> >>
> >> This commit adds new flags DENALI_CAP_ECC_SIZE_{512,1024}.
> >>
> >> The DT property "nand-ecc-step-size" is still optional; a reasonable
> >> default will be chosen for [1] and [2].  For case [3], if exists, it
> >> is recommended to specify the desired ECC size explicitly.  
> >
> > Actually, the NAND chip gives some hints to help controller drivers
> > decide which ecc-block-size/strength is appropriate
> > (chip->ecc_strength_ds, chip->ecc_step_ds), so, in most cases
> > nand-ecc-step-size is unneeded (unless you want to force a specific
> > setting).  
> 
> 
> But, if we look at nand_flash_detect_onfi(),
> ->ecc_step_ds is almost a fixed value, 512, right?  
> 
> if (p->ecc_bits != 0xff) {
>         chip->ecc_strength_ds = p->ecc_bits;
>         chip->ecc_step_ds = 512;
> 

Nope, if the NAND requires a different ECC block size, you will have
0xff in this field and the real ECC requirements will be exposed in the
extended parameter page [1].

> 
> As far as I understood,
> ->ecc_step_ds is not a hint for drivers to decide ->ecc.size.  
> 
> Rather, ->ecc_step_ds just specifies the unit of ->ecc_strength_ds.

->ecc_xxx_ds are encoding the minimum ECC requirements as expressed by
the NAND chip, so yes, it is an hint for the ECC engine configuration.

It does not necessarily means it has to be exactly the same, but it
should be used to determine which setting is appropriate. For example,
if the NAND says it requires a minimum of 4bits/512bytes but your
controller only supports 16bits/1024bytes, then it's fine.



> 
> 
> 
> >>                       int offset;
> >>                       unsigned int flips_in_byte;
> >>
> >> -                     offset = (err_sector * ECC_SECTOR_SIZE + err_byte) *
> >> +                     offset = (err_sector * ecc_size + err_byte) *
> >>                                               denali->devnum + err_device;
> >>
> >>                       /* correct the ECC error */
> >> @@ -1579,22 +1578,37 @@ int denali_init(struct denali_nand_info *denali)
> >>       /* no subpage writes on denali */
> >>       chip->options |= NAND_NO_SUBPAGE_WRITE;
> >>
> >> +     if (!chip->ecc.size) {  
> >
> > You should set it to chip->ecc_step_ds and pick a default value only if
> > it's still 0 after that. Same goes for ecc.strength.  
> 
> Sorry, I still do not understand this.
> 
> ->ecc_strength_ds and ->ecc_step_ds  
> shows how often bit-flip occurs in this device.

It represents the minimum ECC requirements to ensure a 'reliable' setup.

> 
> So, nand_ecc_strength_good() is a typical usage of these.

nand_ecc_strength_good() is complaining if you choose an ECC setting
that is below the minimum requirements.

> 
> How many sectors the driver actually splits the device into
> is a different issue, I think.

The choice is left to the ECC controller, but it should take the
->ecc_strength_ds and ->ecc_step_ds information into account when
choosing the ECC settings.

> 
> 
> 
> >> +             if (denali->caps & DENALI_CAP_ECC_SIZE_512)
> >> +                     chip->ecc.size = 512;
> >> +             if (denali->caps & DENALI_CAP_ECC_SIZE_1024)
> >> +                     chip->ecc.size = 1024;
> >> +             if (WARN(!chip->ecc.size, "must support at least 512 or 1024 ECC size"))
> >> +                     goto failed_req_irq;
> >> +     }
> >> +
> >> +     if ((chip->ecc.size != 512 && chip->ecc.size != 1024) ||
> >> +         (chip->ecc.size == 512 && !(denali->caps & DENALI_CAP_ECC_SIZE_512)) ||
> >> +         (chip->ecc.size == 1024 && !(denali->caps & DENALI_CAP_ECC_SIZE_1024))) {
> >> +             dev_err(denali->dev, "specified ECC size %d in not supported",
> >> +                     chip->ecc.size);
> >> +             goto failed_req_irq;
> >> +     }
> >> +
> >>       /*
> >>        * Denali Controller only support 15bit and 8bit ECC in MRST,
> >>        * so just let controller do 15bit ECC for MLC and 8bit ECC for
> >>        * SLC if possible.  
> >
> > Usually the NAND chips expose the ECC requirements, so basing our
> > decision only on the type of NAND sounds a bit weird.  
> 
> 
> chip->ecc.size is one of the configuration of this controller IP.
> 
> SoC vendors choose 512, 1024, or both of them
> when they buy this IP.

Yes, and that's not a problem.

> 
> If both 512 and 1024 are supported, 1024 is usually a better choice
> because bigger ecc.size uses ECC more efficiently.

We agree.

> 
> 
> It is unrelated to the chips' requirements.

It is related to the chip requirements.
Say you have a chip that requires a minimum of 4bits/512bytes. If you
want to convert that to a 1024byte block setting it's perfectly fine,
but then you'll have to meet (2 * ->ecc_strength_ds) for the
ecc.strength parameter.

The nand-ecc-strength and nand-ecc-step DT properties are here to
override the chip requirements and force a specific setting. This is
for example needed when the bootloader hardcodes an ECC setting without
taking the NAND chip requirements into account, and since you want to
read/write from both the bootloader and linux, you'll have to force this
specific ECC setting, but this case should be the exception, not the
default behavior.

If you want an example on how to extrapolate ECC engine settings from
->ecc_xxx_ds info, you can look at the sunxi_nand driver [2].

[1]http://lxr.free-electrons.com/source/drivers/mtd/nand/nand_base.c#L3491
[2]http://lxr.free-electrons.com/source/drivers/mtd/nand/sunxi_nand.c#L1946
