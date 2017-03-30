From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v3 00/37] mtd: nand: denali: 2nd round of Denali NAND IP patch
 bomb
Date: Thu, 30 Mar 2017 15:45:46 +0900
Message-ID: <1490856383-31560-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: linux-mtd@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>, Dinh Nguyen <dinguyen@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Chuanxiao Dong <chuanxiao.dong@intel.com>, Jassi Brar <jaswinder.singh@linaro.org>, Brian Norris <computersforpeace@gmail.com>, Enrico Jorns <ejo@pengutronix.de>, David Woodhouse <dwmw2@infradead.org>, Graham Moore <grmoore@opensource.altera.com>
List-Id: devicetree@vger.kernel.org


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

Outstanding changes are:
- Fix raw/oob callbacks for syndrome page layout
- Implement setup_data_interface() callback
- Fix/implement more commands for ONFi devices
- Allow to skip the driver internal bounce buffer
- Support PIO in case DMA is not supported
- Switch from ->cmdfunc over to ->cmd_ctrl

18 patches were merged at v2.
Here is the rest of the series.

v1: https://lkml.org/lkml/2016/11/26/144
v2: https://lkml.org/lkml/2017/3/22/804


Masahiro Yamada (37):
  mtd: nand: relax ecc.read_page() return value for uncorrectable ECC
  mtd: nand: denali: allow to override mtd->name from label DT property
  mtd: nand: denali: remove meaningless pipeline read-ahead operation
  mtd: nand: denali: fix bitflips calculation in handle_ecc()
  mtd: nand: denali: fix erased page checking
  mtd: nand: denali: support HW_ECC_FIXUP capability
  mtd: nand: denali_dt: enable HW_ECC_FIXUP for Altera SOCFPGA variant
  mtd: nand: denali: support 64bit capable DMA engine
  mtd: nand: denali_dt: remove dma-mask DT property
  mtd: nand: denali_dt: use pdev instead of ofdev for platform_device
  mtd: nand: denali: allow to override revision number
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
  mtd: nand: denali: rework interrupt handling
  mtd: nand: denali: fix NAND_CMD_STATUS handling
  mtd: nand: denali: fix NAND_CMD_PARAM handling
  mtd: nand: denali: switch over to cmd_ctrl instead of cmdfunc
  mtd: nand: denali: fix bank reset function
  mtd: nand: denali: use interrupt instead of polling for bank reset
  mtd: nand: denali: propagate page to helpers via function argument
  mtd: nand: denali: merge struct nand_buf into struct denali_nand_info
  mtd: nand: denali: use flag instead of register macro for direction
  mtd: nand: denali: fix raw and oob accessors for syndrome page layout
  mtd: nand: denali: support hardware-assisted erased page detection
  mtd: nand: allocate aligned buffers if NAND_OWN_BUFFERS is unset
  mtd: nand: allow drivers to request minimum alignment for passed
    buffer
  mtd: nand: denali: skip driver internal bounce buffer when possible
  mtd: nand: denali: use non-managed kmalloc() for DMA buffer
  mtd: nand: denali: enable bad block table scan

 .../devicetree/bindings/mtd/denali-nand.txt        |   24 +-
 drivers/mtd/nand/denali.c                          | 1971 ++++++++++----------
 drivers/mtd/nand/denali.h                          |  308 +--
 drivers/mtd/nand/denali_dt.c                       |   90 +-
 drivers/mtd/nand/denali_pci.c                      |   10 +-
 drivers/mtd/nand/nand_base.c                       |   49 +-
 include/linux/mtd/nand.h                           |    4 +-
 7 files changed, 1234 insertions(+), 1222 deletions(-)

-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
