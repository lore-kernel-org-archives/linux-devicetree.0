From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 00/37] mtd: nand: denali: 2nd round of Denali NAND IP
 patch bomb
Date: Thu, 30 Mar 2017 18:38:05 +0200
Message-ID: <20170330183805.1c29504f@bbrezillon>
References: <1490856383-31560-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1490856383-31560-1-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Enrico Jorns <ejo-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Artem Bityutskiy <artem.bityutskiy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Dinh Nguyen <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Masami Hiramatsu <mhiramat-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chuanxiao Dong <chuanxiao.dong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 30 Mar 2017 15:45:46 +0900
Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org> wrote:

> This driver includes many problems.
> 
> One of the biggest one is a bunch of hard-coded parameters.  This IP
> has many parameters that can be customized when a delivery RTL is
> generated.  However, this driver was upstreamed by Intel, with
> Intel parameters hard-coded.  Later, Altera added denali_dt.c to use
> this driver for embedded boards, but they did not fix the code in
> denali.c  So, this driver has never worked.  Even some DT bindings
> actually turned out wrong.
> 
> There are more problems: [1] The driver just retrieves the OOB area as-is
> whereas the controller uses syndrome page layout. [2] Many NAND chip
> specific parameters are hard-coded in the driver. [3] ONFi devices are
> not working  [4] It can not read Bad Block Marker
> 
> This patch series intends to solve those problems.
> 
> Outstanding changes are:
> - Fix raw/oob callbacks for syndrome page layout
> - Implement setup_data_interface() callback
> - Fix/implement more commands for ONFi devices
> - Allow to skip the driver internal bounce buffer
> - Support PIO in case DMA is not supported
> - Switch from ->cmdfunc over to ->cmd_ctrl
> 
> 18 patches were merged at v2.
> Here is the rest of the series.
> 
> v1: https://lkml.org/lkml/2016/11/26/144
> v2: https://lkml.org/lkml/2017/3/22/804
> 
> 
> Masahiro Yamada (37):
>   mtd: nand: relax ecc.read_page() return value for uncorrectable ECC
>   mtd: nand: denali: allow to override mtd->name from label DT property
>   mtd: nand: denali: remove meaningless pipeline read-ahead operation
>   mtd: nand: denali: fix bitflips calculation in handle_ecc()
>   mtd: nand: denali: fix erased page checking
>   mtd: nand: denali: support HW_ECC_FIXUP capability
>   mtd: nand: denali_dt: enable HW_ECC_FIXUP for Altera SOCFPGA variant
>   mtd: nand: denali: support 64bit capable DMA engine
>   mtd: nand: denali_dt: remove dma-mask DT property
>   mtd: nand: denali_dt: use pdev instead of ofdev for platform_device
>   mtd: nand: denali: allow to override revision number

Applied patches 1 to 11.

>   mtd: nand: denali: support 1024 byte ECC step size
>   mtd: nand: denali: avoid hard-coding ecc.strength and ecc.bytes
>   mtd: nand: denali: support "nand-ecc-strength" DT property
>   mtd: nand: denali: remove Toshiba and Hynix specific fixup code
>   mtd: nand: denali_dt: add compatible strings for UniPhier SoC variants
>   mtd: nand: denali: set NAND_ECC_CUSTOM_PAGE_ACCESS
>   mtd: nand: denali: do not propagate NAND_STATUS_FAIL to waitfunc()
>   mtd: nand: denali: use BIT() and GENMASK() for register macros
>   mtd: nand: denali: remove unneeded find_valid_banks()
>   mtd: nand: denali: handle timing parameters by setup_data_interface()
>   mtd: nand: denali: rework interrupt handling
>   mtd: nand: denali: fix NAND_CMD_STATUS handling
>   mtd: nand: denali: fix NAND_CMD_PARAM handling
>   mtd: nand: denali: switch over to cmd_ctrl instead of cmdfunc
>   mtd: nand: denali: fix bank reset function
>   mtd: nand: denali: use interrupt instead of polling for bank reset
>   mtd: nand: denali: propagate page to helpers via function argument
>   mtd: nand: denali: merge struct nand_buf into struct denali_nand_info
>   mtd: nand: denali: use flag instead of register macro for direction
>   mtd: nand: denali: fix raw and oob accessors for syndrome page layout
>   mtd: nand: denali: support hardware-assisted erased page detection
>   mtd: nand: allocate aligned buffers if NAND_OWN_BUFFERS is unset
>   mtd: nand: allow drivers to request minimum alignment for passed
>     buffer
>   mtd: nand: denali: skip driver internal bounce buffer when possible
>   mtd: nand: denali: use non-managed kmalloc() for DMA buffer
>   mtd: nand: denali: enable bad block table scan

The rest looks almost good, except for a few comments I had on patch
14, 18, 25, 26 and 32.

I'll probably apply 33 and 34 soon.

> 
>  .../devicetree/bindings/mtd/denali-nand.txt        |   24 +-
>  drivers/mtd/nand/denali.c                          | 1971 ++++++++++----------
>  drivers/mtd/nand/denali.h                          |  308 +--
>  drivers/mtd/nand/denali_dt.c                       |   90 +-
>  drivers/mtd/nand/denali_pci.c                      |   10 +-
>  drivers/mtd/nand/nand_base.c                       |   49 +-
>  include/linux/mtd/nand.h                           |    4 +-
>  7 files changed, 1234 insertions(+), 1222 deletions(-)
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
