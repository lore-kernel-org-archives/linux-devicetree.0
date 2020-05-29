Return-Path: <SRS0=jZdE=7L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0692BC433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 May 2020 00:25:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D469D208DB
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 May 2020 00:25:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437929AbgE2AZ1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 May 2020 20:25:27 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:51521 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437659AbgE2AZ0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 May 2020 20:25:26 -0400
Received: from localhost.localdomain (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 60654200002;
        Fri, 29 May 2020 00:25:18 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <devicetree@vger.kernel.org>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Chuanhong Guo <gch981213@gmail.com>,
        Weijie Gao <weijie.gao@mediatek.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Mason Yang <masonccyang@mxic.com.tw>,
        Julien Su <juliensu@mxic.com.tw>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v7 00/20] Introduce the generic ECC engine abstraction
Date:   Fri, 29 May 2020 02:24:57 +0200
Message-Id: <20200529002517.3546-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

As of today, only raw NAND controllers used to feature an integrated
ECC engine and so controller drivers always embedded some code to
enable/disable the correction.

This statement is no longer correct as SPI-NAND devices might not
embed an on-die ECC engine and must make use of an external ECC
engine. We figured there are three possible situations for (generic)
NAND devices: either the engine is 'on-die' (most of the SPI-NANDs, a
few raw NANDs), or the engine is part of the host controller (most raw
NANDs), or the engine may be external (SPI controllers might feature
an hardware ECC engine, otherwise software correction can also be
used).

To solve this situation, I already proposed the creation of an ECC
engine abstraction (still work in progress) and this is the first step
for that.

The logic in this series is:
1/ Use the generic NAND core for all NAND devices (raw and SPI).
2/ Create the ECC engine interface in drivers/mtd/nand/ecc.c
3/ Move code in driver/mtd/nand/ecc.c

Later, I will repost:
4/ Make both software engines (Hamming and BCH) generic, move them in
   the ecc/ directory, clean them a bit and instantiate ECC
   engines. Write raw NAND helpers to use these two new engines.
5/ Isolate SPI-NAND on-die ECC engine in its own driver.
6/ Make use from the SPI-NAND layer of all the ECC engines listed
   above (on user request, people can now make use of soft BCH if they
   don't have an ECC-engine).
7/ Extend the logic to hardware external engines. A proposal of a
   driver for Macronix external ECC engine will follow in another
   series.

This work is now almost ready, the next steps will be:
1/ Migrate the raw NAND core to make a proper use of these ECC
   engines.
2/ Deprecate in the raw NAND subsystem the interfaces used until now
   (I expect we should get rid of a lot of boilerplate).

Thanks,
Miquèl

Changes in v7
=============
* Collected tags.
* Fixed subjects s/OOB placement/ECC bytes placement/.
* Moved a tab change into space to the appropriate patch.
* Moved the removal of the nand_ecc_mode public enumumeration to the
  right patch.
* Created helpers to retrieve the OOB layouts.
* Moved the "flags" entry of nand_ecc_props to the commit using it.
* Changed the select MTD_NAND_CORE into a depends on and moved it to
  the right patch too.
* Split the patch moving raw NAND bits into the ECC framework.
* Dropped an extra helper: nanddev_get_flash_node().
* Updated all the ECC framework introductory comment, following Boris'
  suggestions.

Changes in v6
=============
* Rebased on top of nand/next.
* Dropped the new nand-ecc-provider property. Instead, we will use
  nand-ecc-engine and boolean properties like nand-no-ecc-engine /
  nand-use-soft-ecc-engine (will be added in another series).
* Moved most of the bindings to the next series.
* Used platform_dev_put() instead of of_dev_put() on Rob's advice.
* Renamed objects: ondie -> on_die_hw.
* Renamed objects: hw -> on_host_hw.
* Used engine_type everywhere instead of provider.
* Created a rawnand compatibility layer to avoid moving deprecated
  code due to the rawnand core history in the generic (and clean) NAND
  layer.
* Enhanced the nand_ecc_algo enumeration.

Changes in v5
=============
* Rebased on top of nand/next
* Avoided a fallthrough situation in commit:
  mtd: rawnand: Separate the ECC engine type and the OOB placement
* Fixed an of_dev_put() build issue due to a missing dummy helper.
* Extracted a patch that deserved to be merged quickly.
* Fixed a few issues reported by robots.

Changes in v4
=============
* Rebased on top of a recent kernel version.
* Added Boris' reviewed-by.
* Added Maxime's Acked-by tag.
* Added the missing of_device.h header to ecc.c.
* Corrected a 'minimum' comparison by using min_t.
 * Updated the new Macronix raw NAND controller driver by using the new
  (ECC related) function names.
* Fixed a function call in ndfc.c.
* Update brcmnand.c file to fit new enumerations and structures (due
  to recent Kamal's changes).
* Force sm_ftl to depends on the Hamming engine, because by just
  selecting it the ECC code would be embedded in the NAND core and the
  NAND core might not be compiled in with sm_ftl.
* Fixed a structure field name that I previously added in davinci
  platform data.
* Moved the oob_first placement scheme to Davinci driver. Removed any
  occurence of it out of the driver (unused).
* Simplify structure names as proposed by Boris.
* Change enumeration/string names about ECC engine
  providers/placements.
* Change the logic in the of_get_nand_ecc_* helpers to ensure backward
  compatibility.
* Use enums intead of unsigned integers in the core when referring to
  ECC engine type, placement and algorithm.
* Add nand-ecc-placement DT property.
* Deprecate hw_syndrome.
* Deprecate nand-ecc-mode in favor of nand-ecc-provider.

* Fixed a typo in the Macronix ECC driver, where I made a copy/paste
  error which I haven't spotted because it is located in a macro only
  compiled when building the driver as a module (name of the of_ids
  was prefixed marvell_nfc instead of mxic_ecc).
* Simplified the ECC engine API by dropping the useless oobbuf
  parameter. Instead, ECC engine drivers are supposed to provide a
  spare OOB buffer if none is provided. Updated the three existing
  engines.
* Fixed BCH software engine with the help of Mason from Macronix.
* Added a mechanism called "tweaking req" to change the SPI-NAND
  requests and ensure they always contain the right amount of data/OOB
  needed for the ECC engine to work properly.

Changes in v3
=============
* Added Boris' Reviewed-by tags.
* Added a kernel doc header on the nand_page_io_req enumeration.
* Added support for HW engines.
* Droped the patch clarifying the value of the first entry in
  enumerations (which is always 0).
* Rename the nand_ecc_conf structure as nand_ecc_props because the
  _conf suffix implies that it is possible to edit it, while in some
  cases (eg. on-die ECC) there is nothing to tweak.
* Smoother introduction of the ECC engine abstraction.
* Renamed the ECC engine module nand_ecc_engine.ko.
* Moved all the ECC files into drivers/mtd/nand/. Forgot the ecc/
  subdirectory.
* Added a new series to drop the ECC mode enumeration wich mixes the
  provider (none, hw, sw, on-die) and the OOB placement (first,
  syndrome).
* Various typos fixed.
* Added a few patches to fix bugs found in SPI-NAND/mtdchar.c.
* Introduced the external hardware ECC engine boilerplate.

Changes in v2
=============
* SPDX license identifiers for soft BCH and Hamming: the license macro
  was right, "GPL" means "GPLv2 or higher", so do not change this
  portion. Also update the commit messages to fit the actual change.
* Do not compile-in the NAND core by default, do it only for raw
  NAND. Remove the dependencies on CONFIG_MTD in a different
  patch. Also, keep an extra level of hierarchy in Kconfig for the
  NAND bits by adding a menu instead of a config.
* Moved the standard OOB layouts in the ecc/engine.c driver instead of
  in the NAND core.
* Used the nand_ecc_ prefix in most of the engines functions instead
  of just ecc_, which is now reserved for bare helpers. Get rid of the
  __ecc prefix.
* In the sunxi NAND controller driver: moved the ECC structure from
  sunxi_nfc to sunxi_nand_chip as the ECC engine is per-chip and not
  per controller.
* Software Hamming ECC engine is only enabled by default if raw NAND
  is also enabled. NDFC now selects the software Hamming ECC engine
  (instead of depending on it).
* Mention in software BCH and Hamming Kconfig entries that booting
  from NAND is very likely to fail if the user selects these symbols
  as modules.
* Added Boris Reviewed-by tag on the SPI-NAND typo fixing patch.
* Renamed the "mode" into a "provider" entry in the ECC configuration
  structures.
* Moved the "total" entry of the ECC configuration directly in the
  context structure (should probably not be public but let's keep it
  as is for now).
* Split the generic ECC engine introduction into smaller patches to do
  some renaming aside.
* Drop the "maximize" entry in the ECC engine configuration structure,
  keep using a flag like before.
* Canceled the move of the SPI-NAND specific ECC engine out of the
  core file.
* Amended the root ECC structures to have three nand_ecc_conf
  structures: one for the defaults, one for the chip requirements, one
  for the user desires.
* Created a *ondie_engine pointer in the nand_ecc structure to save
  the on-die ECC engine, if any. For instance, saving a reference to
  this engine is done by the SPI-NAND core.
* Dropped the SPI-NAND flag that was used to distinguish between NAND
  flavors from the NAND core, it should not be needed anymore.
* Added an helper in the NAND core to put a reference on an ECC
  engine. This will be used by the hardware engines only.
* Renamed the files ecc/sw-{bch,hamming}.c and their headers
  include/linux/mtd/nand-ecc-sw-{bch,hamming}-engine.h.
* Created a MTD_NAND_ECC invisible Kconfig symbol.
* Added plenty of missing EXPORT_SYMBOL{,_GPL}().
* Minor modifications so that everything still compiles even when
  modules and built-in drivers are mixed in Kconfig in the whole NAND
  directory.


Miquel Raynal (20):
  dt-bindings: mtd: Document nand-ecc-placement
  mtd: rawnand: Create a new enumeration to describe ECC bytes placement
  mtd: rawnand: Separate the ECC engine type and the ECC byte placement
  mtd: rawnand: Create a helper to retrieve the ECC placement
  mtd: rawnand: Add a kernel doc to the ECC algorithm enumeration
  mtd: rawnand: Rename the ECC algorithm enumeration items
  mtd: rawnand: Create a new enumeration to describe properly ECC types
  mtd: rawnand: Use the new ECC engine type enumeration
  mtd: nand: Move nand_device forward declaration to the top
  mtd: nand: Add an extra level in the Kconfig hierarchy
  mtd: nand: Drop useless 'depends on' in Kconfig
  mtd: nand: Add a NAND page I/O request type
  mtd: nand: Rename a core structure
  mtd: nand: Add more parameters to the nand_ecc_props structure
  mtd: nand: Introduce the ECC engine abstraction
  mtd: nand: Convert generic NAND bits to use the ECC framework
  mtd: rawnand: Hide the generic OOB layout objects behind helpers
  mtd: rawnand: Write a compatibility layer
  mtd: rawnand: Move generic OOB layouts to the ECC framework
  mtd: rawnand: Move the user input parsing bits to the ECC framework

 .../bindings/mtd/nand-controller.yaml         |  10 +
 arch/arm/mach-davinci/board-da830-evm.c       |   2 +-
 arch/arm/mach-davinci/board-da850-evm.c       |   2 +-
 arch/arm/mach-davinci/board-dm355-evm.c       |   2 +-
 arch/arm/mach-davinci/board-dm355-leopard.c   |   3 +-
 arch/arm/mach-davinci/board-dm365-evm.c       |   2 +-
 arch/arm/mach-davinci/board-dm644x-evm.c      |   2 +-
 arch/arm/mach-davinci/board-dm646x-evm.c      |   2 +-
 arch/arm/mach-davinci/board-mityomapl138.c    |   2 +-
 arch/arm/mach-davinci/board-neuros-osd2.c     |   2 +-
 arch/arm/mach-davinci/board-omapl138-hawk.c   |   2 +-
 arch/arm/mach-s3c24xx/common-smdk.c           |   2 +-
 arch/arm/mach-s3c24xx/mach-anubis.c           |   2 +-
 arch/arm/mach-s3c24xx/mach-at2440evb.c        |   2 +-
 arch/arm/mach-s3c24xx/mach-bast.c             |   2 +-
 arch/arm/mach-s3c24xx/mach-gta02.c            |   2 +-
 arch/arm/mach-s3c24xx/mach-jive.c             |   2 +-
 arch/arm/mach-s3c24xx/mach-mini2440.c         |   2 +-
 arch/arm/mach-s3c24xx/mach-osiris.c           |   2 +-
 arch/arm/mach-s3c24xx/mach-qt2410.c           |   2 +-
 arch/arm/mach-s3c24xx/mach-rx1950.c           |   2 +-
 arch/arm/mach-s3c24xx/mach-rx3715.c           |   2 +-
 arch/arm/mach-s3c24xx/mach-vstms.c            |   2 +-
 arch/arm/mach-s3c64xx/mach-hmt.c              |   2 +-
 arch/arm/mach-s3c64xx/mach-mini6410.c         |   2 +-
 arch/arm/mach-s3c64xx/mach-real6410.c         |   2 +-
 drivers/mtd/nand/Kconfig                      |  13 +
 drivers/mtd/nand/Makefile                     |   2 +
 drivers/mtd/nand/ecc.c                        | 471 +++++++++++++++
 drivers/mtd/nand/onenand/Kconfig              |   1 -
 drivers/mtd/nand/raw/Kconfig                  |   2 +-
 drivers/mtd/nand/raw/ams-delta.c              |   4 +-
 drivers/mtd/nand/raw/arasan-nand-controller.c |  16 +-
 drivers/mtd/nand/raw/atmel/nand-controller.c  |  30 +-
 drivers/mtd/nand/raw/au1550nd.c               |   4 +-
 .../mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c  |   3 +-
 drivers/mtd/nand/raw/brcmnand/brcmnand.c      |  27 +-
 .../mtd/nand/raw/cadence-nand-controller.c    |   4 +-
 drivers/mtd/nand/raw/cafe_nand.c              |   3 +-
 drivers/mtd/nand/raw/cs553x_nand.c            |   2 +-
 drivers/mtd/nand/raw/davinci_nand.c           |  38 +-
 drivers/mtd/nand/raw/denali.c                 |   6 +-
 drivers/mtd/nand/raw/diskonchip.c             |   3 +-
 drivers/mtd/nand/raw/fsl_elbc_nand.c          |  20 +-
 drivers/mtd/nand/raw/fsl_ifc_nand.c           |  12 +-
 drivers/mtd/nand/raw/fsl_upm.c                |   4 +-
 drivers/mtd/nand/raw/fsmc_nand.c              |  14 +-
 drivers/mtd/nand/raw/gpio.c                   |   4 +-
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c    |  14 +-
 drivers/mtd/nand/raw/hisi504_nand.c           |   6 +-
 .../mtd/nand/raw/ingenic/ingenic_nand_drv.c   |  20 +-
 drivers/mtd/nand/raw/lpc32xx_mlc.c            |   2 +-
 drivers/mtd/nand/raw/lpc32xx_slc.c            |   3 +-
 drivers/mtd/nand/raw/marvell_nand.c           |  34 +-
 drivers/mtd/nand/raw/meson_nand.c             |   2 +-
 drivers/mtd/nand/raw/mpc5121_nfc.c            |   4 +-
 drivers/mtd/nand/raw/mtk_nand.c               |  10 +-
 drivers/mtd/nand/raw/mxc_nand.c               |  25 +-
 drivers/mtd/nand/raw/nand_base.c              | 565 +++++++-----------
 drivers/mtd/nand/raw/nand_esmt.c              |  11 +-
 drivers/mtd/nand/raw/nand_hynix.c             |  41 +-
 drivers/mtd/nand/raw/nand_jedec.c             |   4 +-
 drivers/mtd/nand/raw/nand_micron.c            |  20 +-
 drivers/mtd/nand/raw/nand_onfi.c              |   8 +-
 drivers/mtd/nand/raw/nand_samsung.c           |  19 +-
 drivers/mtd/nand/raw/nand_toshiba.c           |  16 +-
 drivers/mtd/nand/raw/nandsim.c                |   8 +-
 drivers/mtd/nand/raw/ndfc.c                   |   2 +-
 drivers/mtd/nand/raw/omap2.c                  |  22 +-
 drivers/mtd/nand/raw/orion_nand.c             |   4 +-
 drivers/mtd/nand/raw/pasemi_nand.c            |   4 +-
 drivers/mtd/nand/raw/plat_nand.c              |   4 +-
 drivers/mtd/nand/raw/qcom_nandc.c             |   2 +-
 drivers/mtd/nand/raw/r852.c                   |   3 +-
 drivers/mtd/nand/raw/s3c2410.c                |  20 +-
 drivers/mtd/nand/raw/sh_flctl.c               |   6 +-
 drivers/mtd/nand/raw/sharpsl.c                |   2 +-
 drivers/mtd/nand/raw/socrates_nand.c          |   5 +-
 drivers/mtd/nand/raw/stm32_fmc2_nand.c        |   9 +-
 drivers/mtd/nand/raw/sunxi_nand.c             |  26 +-
 drivers/mtd/nand/raw/tango_nand.c             |   4 +-
 drivers/mtd/nand/raw/tegra_nand.c             |  34 +-
 drivers/mtd/nand/raw/tmio_nand.c              |   2 +-
 drivers/mtd/nand/raw/txx9ndfmc.c              |   2 +-
 drivers/mtd/nand/raw/vf610_nfc.c              |   6 +-
 drivers/mtd/nand/raw/xway_nand.c              |   4 +-
 drivers/mtd/nand/spi/core.c                   |  12 +-
 drivers/mtd/nand/spi/macronix.c               |   6 +-
 drivers/mtd/nand/spi/toshiba.c                |   6 +-
 include/linux/mtd/nand.h                      | 164 ++++-
 include/linux/mtd/rawnand.h                   |  34 +-
 include/linux/mtd/spinand.h                   |   2 +-
 include/linux/platform_data/mtd-davinci.h     |   9 +-
 .../linux/platform_data/mtd-nand-s3c2410.h    |   2 +-
 94 files changed, 1221 insertions(+), 731 deletions(-)
 create mode 100644 drivers/mtd/nand/ecc.c

-- 
2.20.1

