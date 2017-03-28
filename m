From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [RESEND PATCH v2 00/53] mtd: nand: denali: 2nd round of Denali
 NAND IP patch bomb
Date: Tue, 28 Mar 2017 22:14:25 +0200
Message-ID: <20170328221425.322ae44a@bbrezillon>
References: <1490213273-8571-1-git-send-email-yamada.masahiro@socionext.com>
        <20170324211330.0e463621@bbrezillon>
        <CAK7LNARNUhyFpVRKYwmadkTGpR-aAjUNs2WgwYn3ao5Y+zTH1w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK7LNARNUhyFpVRKYwmadkTGpR-aAjUNs2WgwYn3ao5Y+zTH1w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Laurent Monat <laurent.monat@idquantique.com>, thorsten.christiansson@idquantique.com, Enrico Jorns <ejo@pengutronix.de>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, Dinh Nguyen <dinguyen@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Graham Moore <grmoore@opensource.altera.com>, David Woodhouse <dwmw2@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>, Chuanxiao Dong <chuanxiao.dong@intel.com>, Jassi Brar <jaswinder.singh@linaro.org>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Brian Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.>
List-Id: devicetree@vger.kernel.org

On Sat, 25 Mar 2017 23:40:38 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Hi Boris,
> 
> 
> 
> 2017-03-25 5:13 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> 
> >>
> >> Masahiro Yamada (53):
> >>   mtd: nand: allow to set only one of ECC size and ECC strength from DT
> >>   mtd: nand: use read_oob() instead of cmdfunc() for bad block check
> >>   mtd: nand: denali: remove unused CONFIG option and macros
> >>   mtd: nand: denali: remove redundant define of BANK(x)
> >>   mtd: nand: denali: remove more unused struct members
> >>   mtd: nand: denali: fix comment of denali_nand_info::flash_mem
> >>   mtd: nand: denali: consolidate INTR_STATUS__* and INTR_EN__* macros
> >>   mtd: nand: denali: introduce capability flag
> >>   mtd: nand: denali: use int where no reason to use fixed width variable
> >>   mtd: nand: denali: fix erased page checking
> >>   mtd: nand: denali: fix bitflips calculation in handle_ecc()
> >>   mtd: nand: denali: support HW_ECC_FIXUP capability
> >>   mtd: nand: denali_dt: enable HW_ECC_FIXUP for Altera SOCFPGA variant
> >>   mtd: nand: denali: support 64bit capable DMA engine
> >>   mtd: nand: denali_dt: remove dma-mask DT property
> >>   mtd: nand: denali_dt: use pdev instead of ofdev for platform_device
> >>   mtd: nand: denali: allow to override revision number
> >>   mtd: nand: denali: use nand_chip to hold frequently accessed data
> >>   mtd: nand: denali: call nand_set_flash_node() to set DT node
> >>   mtd: nand: denali: do not set mtd->name
> >>   mtd: nand: denali: move multi device fixup code to a helper function
> >>   mtd: nand: denali: simplify multi device fixup code
> >>   mtd: nand: denali: set DEVICES_CONNECTED 1 if not set
> >>   mtd: nand: denali: remove meaningless writes to read-only registers
> >>   mtd: nand: denali: remove unnecessary writes to ECC_CORRECTION
> >>   mtd: nand: denali: support 1024 byte ECC step size
> >>   mtd: nand: denali: avoid hard-coding ecc.strength and ecc.bytes
> >>   mtd: nand: denali: support "nand-ecc-strength" DT property
> >>   mtd: nand: denali: remove Toshiba and Hynix specific fixup code
> >>   mtd: nand: denali_dt: add compatible strings for UniPhier SoC variants
> >>   mtd: nand: denali: set NAND_ECC_CUSTOM_PAGE_ACCESS
> >>   mtd: nand: denali: do not propagate NAND_STATUS_FAIL to waitfunc()
> >>   mtd: nand: denali: use BIT() and GENMASK() for register macros
> >>   mtd: nand: denali: remove unneeded find_valid_banks()
> >>   mtd: nand: denali: handle timing parameters by setup_data_interface()
> >>   mtd: nand: denali: remove meaningless pipeline read-ahead operation
> >>   mtd: nand: denali: rework interrupt handling
> >>   mtd: nand: denali: fix NAND_CMD_STATUS handling
> >>   mtd: nand: denali: fix NAND_CMD_PARAM handling
> >>   mtd: nand: do not check R/B# for CMD_READID in nand_command(_lp)
> >>   mtd: nand: do not check R/B# for CMD_SET_FEATURES in nand_command(_lp)
> >>   mtd: nand: denali: switch over to cmd_ctrl instead of cmdfunc
> >>   mtd: nand: denali: fix bank reset function
> >>   mtd: nand: denali: use interrupt instead of polling for bank reset
> >>   mtd: nand: denali: propagate page to helpers via function argument
> >>   mtd: nand: denali: merge struct nand_buf into struct denali_nand_info
> >>   mtd: nand: denali: use flag instead of register macro for direction
> >>   mtd: nand: denali: fix raw and oob accessors for syndrome page layout
> >>   mtd: nand: denali: support hardware-assisted erased page detection
> >>   mtd: nand: allocate aligned buffers if NAND_OWN_BUFFERS is unset
> >>   mtd: nand: denali: skip driver internal bounce buffer when possible
> >>   mtd: nand: denali: use non-managed kmalloc() for DMA buffer
> >>   mtd: nand: denali: enable bad block table scan  
> >
> > Applied patch 1 to 9, 40 and 41. I'll see what else I can apply so that
> > you don't have to re-post the remaining 42 patches, but I fear some of
> > them won't apply correctly without patch 10 on which I had comments.  
> 
> Thanks!
> 
> This will be very helpful when sending the next version.
> 
> If you like, you can also apply the following 9 patches cleanly in this order.
> 
> 18/53 mtd: nand: denali: use nand_chip to hold frequently accessed data
> 19/53 mtd: nand: denali: call nand_set_flash_node() to set DT node
> 20/53 mtd: nand: denali: do not set mtd->name
> 21/53 mtd: nand: denali: move multi device fixup code to a helper function
> 22/53 mtd: nand: denali: simplify multi device fixup code
> 23/53 mtd: nand: denali: set DEVICES_CONNECTED 1 if not set
> 24/53 mtd: nand: denali: remove meaningless writes to read-only registers
> 25/53 mtd: nand: denali: remove unnecessary writes to ECC_CORRECTION

Applied all the above patches.

> 36/53 mtd: nand: denali: remove meaningless pipeline read-ahead operation

Still need to review this one.

> 
> These are less controversial, and have no dependency on 10/53-17/53.
> 
> 
> 
> 
> 50/53 "mtd: nand: allocate aligned buffers if NAND_OWN_BUFFERS is unset"
> is a change to the NAND framework.  (used as a pre-requisite for 51/53)

Had a comment on the commit message (not the patch content). I find it
too alarmist: you seem to imply that all controller drivers doing DMA
on nand buffers allocated by the core are broken, which I think is not
the case.
I don't deny the theoretical risk of using non-cache aligned buffers,
but in practice, given the workflow we have in the NAND framework, I
don't think cache management operations can trigger data corruptions (I
might be wrong, though).
