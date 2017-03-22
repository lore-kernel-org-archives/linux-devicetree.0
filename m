From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: [RESEND PATCH v2 00/53] mtd: nand: denali: 2nd round of Denali NAND IP patch bomb
Date: Thu, 23 Mar 2017 05:06:59 +0900
Message-ID: <1490213273-8571-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: laurent.monat-1zQW0WpQGTYgLlGVC3PcNw@public.gmane.org, thorsten.christiansson-1zQW0WpQGTYgLlGVC3PcNw@public.gmane.org, Enrico Jorns <ejo-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Artem Bityutskiy <artem.bityutskiy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Dinh Nguyen <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Masami Hiramatsu <mhiramat-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chuanxiao Dong <chuanxiao.dong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


It took a couple months to update this series, but finally here is v2.
(v1: https://lkml.org/lkml/2016/11/26/144 )

This driver includes many problems.

One of the biggest one is a bunch of hard-coded parameters.  This IP
has many parameters that can be customized when a delivery RTL is
generated.  However, this driver was upstreamed by Intel, with
Intel parameters hard-coded.  Later, Altera added denali_dt.c to use
this driver for embedded boards, but they did not fix the code in
denali.c  So, this driver has never worked.  Even some DT bindings
actually turned out wrong.

There are more problems: [1] The driver just retrieves the OOB area as-is
whereas the controller uses syndrome page layout. [2] Many NAND chip
specific parameters are hard-coded in the driver. [3] ONFi devices are
not working  [4] It can not read Bad Block Marker

This patch series intends to solve those problems.

Since v1, here are more fixes/improvements:
 - Fix raw/oob callbacks for syndrome page layout
 - Implement setup_data_interface() callback
 - Fix/implement more commands for ONFi devices
 - Allow to skip the driver internal bounce buffer
 - Support PIO in case DMA is not supported
 - Switch from ->cmdfunc over to ->cmd_ctrl


Masahiro Yamada (53):
  mtd: nand: allow to set only one of ECC size and ECC strength from DT
  mtd: nand: use read_oob() instead of cmdfunc() for bad block check
  mtd: nand: denali: remove unused CONFIG option and macros
  mtd: nand: denali: remove redundant define of BANK(x)
  mtd: nand: denali: remove more unused struct members
  mtd: nand: denali: fix comment of denali_nand_info::flash_mem
  mtd: nand: denali: consolidate INTR_STATUS__* and INTR_EN__* macros
  mtd: nand: denali: introduce capability flag
  mtd: nand: denali: use int where no reason to use fixed width variable
  mtd: nand: denali: fix erased page checking
  mtd: nand: denali: fix bitflips calculation in handle_ecc()
  mtd: nand: denali: support HW_ECC_FIXUP capability
  mtd: nand: denali_dt: enable HW_ECC_FIXUP for Altera SOCFPGA variant
  mtd: nand: denali: support 64bit capable DMA engine
  mtd: nand: denali_dt: remove dma-mask DT property
  mtd: nand: denali_dt: use pdev instead of ofdev for platform_device
  mtd: nand: denali: allow to override revision number
  mtd: nand: denali: use nand_chip to hold frequently accessed data
  mtd: nand: denali: call nand_set_flash_node() to set DT node
  mtd: nand: denali: do not set mtd->name
  mtd: nand: denali: move multi device fixup code to a helper function
  mtd: nand: denali: simplify multi device fixup code
  mtd: nand: denali: set DEVICES_CONNECTED 1 if not set
  mtd: nand: denali: remove meaningless writes to read-only registers
  mtd: nand: denali: remove unnecessary writes to ECC_CORRECTION
  mtd: nand: denali: support 1024 byte ECC step size
  mtd: nand: denali: avoid hard-coding ecc.strength and ecc.bytes
  mtd: nand: denali: support "nand-ecc-strength" DT property
  mtd: nand: denali: remove Toshiba and Hynix specific fixup code
  mtd: nand: denali_dt: add compatible strings for UniPhier SoC variants
  mtd: nand: denali: set NAND_ECC_CUSTOM_PAGE_ACCESS
  mtd: nand: denali: do not propagate NAND_STATUS_FAIL to waitfunc()
  mtd: nand: denali: use BIT() and GENMASK() for register macros
  mtd: nand: denali: remove unneeded find_valid_banks()
  mtd: nand: denali: handle timing parameters by setup_data_interface()
  mtd: nand: denali: remove meaningless pipeline read-ahead operation
  mtd: nand: denali: rework interrupt handling
  mtd: nand: denali: fix NAND_CMD_STATUS handling
  mtd: nand: denali: fix NAND_CMD_PARAM handling
  mtd: nand: do not check R/B# for CMD_READID in nand_command(_lp)
  mtd: nand: do not check R/B# for CMD_SET_FEATURES in nand_command(_lp)
  mtd: nand: denali: switch over to cmd_ctrl instead of cmdfunc
  mtd: nand: denali: fix bank reset function
  mtd: nand: denali: use interrupt instead of polling for bank reset
  mtd: nand: denali: propagate page to helpers via function argument
  mtd: nand: denali: merge struct nand_buf into struct denali_nand_info
  mtd: nand: denali: use flag instead of register macro for direction
  mtd: nand: denali: fix raw and oob accessors for syndrome page layout
  mtd: nand: denali: support hardware-assisted erased page detection
  mtd: nand: allocate aligned buffers if NAND_OWN_BUFFERS is unset
  mtd: nand: denali: skip driver internal bounce buffer when possible
  mtd: nand: denali: use non-managed kmalloc() for DMA buffer
  mtd: nand: denali: enable bad block table scan

 .../devicetree/bindings/mtd/denali-nand.txt        |   24 +-
 drivers/mtd/nand/Kconfig                           |   11 -
 drivers/mtd/nand/denali.c                          | 2073 +++++++++-----------
 drivers/mtd/nand/denali.h                          |  453 ++---
 drivers/mtd/nand/denali_dt.c                       |  104 +-
 drivers/mtd/nand/denali_pci.c                      |   10 +-
 drivers/mtd/nand/nand_base.c                       |   78 +-
 7 files changed, 1278 insertions(+), 1475 deletions(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
