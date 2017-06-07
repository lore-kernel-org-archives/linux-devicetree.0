From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v5 00/23] mtd: nand: denali: Denali NAND IP patch bomb
Date: Wed,  7 Jun 2017 20:52:09 +0900
Message-ID: <1496836352-8016-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mtd@lists.infradead.org
Cc: Enrico Jorns <ejo@pengutronix.de>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, Dinh Nguyen <dinguyen@kernel.org>, Boris Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>, Chuanxiao Dong <chuanxiao.dong@intel.com>, Jassi Brar <jaswinder.singh@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

This patch series intends to solve various problems.

[1] The driver just retrieves the OOB area as-is
    whereas the controller uses syndrome page layout.
[2] Many NAND chip specific parameters are hard-coded in the driver.
[3] ONFi devices are not working
[4] It can not read Bad Block Marker

Outstanding changes are:
- Fix raw/oob callbacks for syndrome page layout
- Implement setup_data_interface() callback
- Fix/implement more commands for ONFi devices
- Allow to skip the driver internal bounce buffer
- Support PIO in case DMA is not supported
- Switch from ->cmdfunc over to ->cmd_ctrl

18 patches were merged at v2.
11 patches were merged at v3.
2 patches were merged at 4.
Here is the rest of the series.

v1: https://lkml.org/lkml/2016/11/26/144
v2: https://lkml.org/lkml/2017/3/22/804
v3: https://lkml.org/lkml/2017/3/30/90


Masahiro Yamada (23):
  mtd: nand: add generic helpers to check, match, maximize ECC settings
  mtd: nand: add a shorthand to generate nand_ecc_caps structure
  mtd: nand: denali: avoid hard-coding ECC step, strength, bytes
  mtd: nand: denali: remove Toshiba and Hynix specific fixup code
  mtd: nand: denali_dt: add compatible strings for UniPhier SoC variants
  mtd: nand: denali: set NAND_ECC_CUSTOM_PAGE_ACCESS
  mtd: nand: denali: do not propagate NAND_STATUS_FAIL to waitfunc()
  mtd: nand: denali: remove unneeded find_valid_banks()
  mtd: nand: denali: handle timing parameters by setup_data_interface()
  mtd: nand: denali: rework interrupt handling
  mtd: nand: denali: fix NAND_CMD_STATUS handling
  mtd: nand: denali: fix NAND_CMD_PARAM handling
  mtd: nand: denali: switch over to cmd_ctrl instead of cmdfunc
  mtd: nand: denali: fix bank reset function to detect the number of
    chips
  mtd: nand: denali: use interrupt instead of polling for bank reset
  mtd: nand: denali: propagate page to helpers via function argument
  mtd: nand: denali: merge struct nand_buf into struct denali_nand_info
  mtd: nand: denali: use flag instead of register macro for direction
  mtd: nand: denali: fix raw and oob accessors for syndrome page layout
  mtd: nand: denali: support hardware-assisted erased page detection
  mtd: nand: denali: skip driver internal bounce buffer when possible
  mtd: nand: denali: use non-managed kmalloc() for DMA buffer
  mtd: nand: denali: enable bad block table scan

 .../devicetree/bindings/mtd/denali-nand.txt        |   13 +
 drivers/mtd/nand/denali.c                          | 1686 +++++++++-----------
 drivers/mtd/nand/denali.h                          |   60 +-
 drivers/mtd/nand/denali_dt.c                       |   33 +-
 drivers/mtd/nand/denali_pci.c                      |   10 +-
 drivers/mtd/nand/nand_base.c                       |  220 +++
 include/linux/mtd/nand.h                           |   47 +
 7 files changed, 1103 insertions(+), 966 deletions(-)

-- 
2.7.4
