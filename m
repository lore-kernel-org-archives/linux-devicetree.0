Return-Path: <SRS0=VnZl=7Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0BA6C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed,  3 Jun 2020 17:58:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 919CF2068D
	for <linux-devicetree@archiver.kernel.org>; Wed,  3 Jun 2020 17:58:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbgFCR6G (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 3 Jun 2020 13:58:06 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:37271 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726061AbgFCR6F (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 3 Jun 2020 13:58:05 -0400
Received: from localhost.localdomain (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id AB7EA24000A;
        Wed,  3 Jun 2020 17:58:00 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        <linux-mtd@lists.infradead.org>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Mason Yang <masonccyang@mxic.com.tw>,
        Julien Su <juliensu@mxic.com.tw>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <devicetree@vger.kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v10 00/20] Introduction of the generic ECC framework
Date:   Wed,  3 Jun 2020 19:57:39 +0200
Message-Id: <20200603175759.19948-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

After discussing with Boris, he convinced me that the changes should
be done in another order. That's why first I update the nand_ecc_algo
enumeration in raw NAND, then I introduce the new bindings and the ECC
core itself. Only after that, I patch the raw NAND core (and slightly
SPI-NAND) to share the generic data with the NAND core/ECC framework.

Changes in v10:
* After reworking the entire series, I only kept 4 patches aside,
  resending all of them.
* Fixed typos, updated commit logs as proposed.
* Introduced nanddev_set_ecc_requirements().
* Used spaces instead of tabs in an array.
* Renamed the nand_ecc_is_strong_enough() helper.
* Dropped the use of the MAXIMIZE flag in denali.c.
* Renamed this flag MAXIMIZE_STRENGTH.
* Renamed the of_get_nand_ecc_config*() helpers.

Changes in v9:
* This time sending the additional patchs, not just the old ones with
  corrections. v8 should be ignored, sorry for the noise.

Changes in v8:
* Split "Convert generic NAND bits to ECC framework" into several peaces:
  > added two helpers
  > converted SPI-NAND then raw-NAND.
* Fixed a comment.
* Used the _ooblayout suffix instead of _layout.


Miquel Raynal (20):
  mtd: rawnand: Add a kernel doc to the ECC algorithm enumeration
  mtd: rawnand: Rename the ECC algorithm enumeration items
  mtd: rawnand: Move the nand_ecc_algo enum to the generic NAND layer
  mtd: nand: Add a NAND page I/O request type
  dt-bindings: mtd: Document nand-ecc-placement
  dt-bindings: mtd: Document nand-ecc-engine
  dt-bindings: mtd: Document boolean NAND ECC properties
  mtd: nand: Introduce the ECC engine framework
  mtd: rawnand: Separate the ECC engine type and the ECC byte placement
  mtd: rawnand: Use the new ECC engine type enumeration
  mtd: nand: Create a helper to extract the ECC configuration
  mtd: spinand: Use nanddev_get_ecc_conf() when relevant
  mtd: nand: Create helpers to set/extract the ECC requirements
  mtd: rawnand: Use nanddev_get/set_ecc_requirements() when relevant
  mtd: nand: Use the new generic ECC object
  mtd: rawnand: Make use of the ECC framework
  mtd: rawnand: Use the ECC framework OOB layouts
  mtd: rawnand: Use the ECC framework nand_ecc_is_strong_enough() helper
  mtd: rawnand: Use the ECC framework user input parsing bits
  mtd: rawnand: Use the NAND framework user_conf object for ECC flags

 .../bindings/mtd/nand-controller.yaml         |  28 +
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
 drivers/mtd/nand/Kconfig                      |   8 +
 drivers/mtd/nand/Makefile                     |   2 +
 drivers/mtd/nand/ecc.c                        | 484 +++++++++++++++
 drivers/mtd/nand/raw/Kconfig                  |   1 +
 drivers/mtd/nand/raw/ams-delta.c              |   4 +-
 drivers/mtd/nand/raw/arasan-nand-controller.c |  16 +-
 drivers/mtd/nand/raw/atmel/nand-controller.c  |  31 +-
 drivers/mtd/nand/raw/au1550nd.c               |   4 +-
 .../mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c  |   3 +-
 drivers/mtd/nand/raw/brcmnand/brcmnand.c      |  28 +-
 .../mtd/nand/raw/cadence-nand-controller.c    |   4 +-
 drivers/mtd/nand/raw/cafe_nand.c              |   3 +-
 drivers/mtd/nand/raw/cs553x_nand.c            |   2 +-
 drivers/mtd/nand/raw/davinci_nand.c           |  38 +-
 drivers/mtd/nand/raw/denali.c                 |   3 +-
 drivers/mtd/nand/raw/denali_pci.c             |   2 +-
 drivers/mtd/nand/raw/diskonchip.c             |   3 +-
 drivers/mtd/nand/raw/fsl_elbc_nand.c          |  20 +-
 drivers/mtd/nand/raw/fsl_ifc_nand.c           |  12 +-
 drivers/mtd/nand/raw/fsl_upm.c                |   4 +-
 drivers/mtd/nand/raw/fsmc_nand.c              |  14 +-
 drivers/mtd/nand/raw/gpio.c                   |   4 +-
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c    |  15 +-
 drivers/mtd/nand/raw/hisi504_nand.c           |   6 +-
 .../mtd/nand/raw/ingenic/ingenic_nand_drv.c   |  20 +-
 drivers/mtd/nand/raw/lpc32xx_mlc.c            |   2 +-
 drivers/mtd/nand/raw/lpc32xx_slc.c            |   3 +-
 drivers/mtd/nand/raw/marvell_nand.c           |  35 +-
 drivers/mtd/nand/raw/meson_nand.c             |   2 +-
 drivers/mtd/nand/raw/mpc5121_nfc.c            |   4 +-
 drivers/mtd/nand/raw/mtk_nand.c               |  12 +-
 drivers/mtd/nand/raw/mxc_nand.c               |  25 +-
 drivers/mtd/nand/raw/nand_base.c              | 565 +++++++-----------
 drivers/mtd/nand/raw/nand_esmt.c              |  15 +-
 drivers/mtd/nand/raw/nand_hynix.c             |  44 +-
 drivers/mtd/nand/raw/nand_jedec.c             |   9 +-
 drivers/mtd/nand/raw/nand_micron.c            |  23 +-
 drivers/mtd/nand/raw/nand_onfi.c              |  17 +-
 drivers/mtd/nand/raw/nand_samsung.c           |  22 +-
 drivers/mtd/nand/raw/nand_toshiba.c           |  19 +-
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
 drivers/mtd/nand/raw/sunxi_nand.c             |  27 +-
 drivers/mtd/nand/raw/tango_nand.c             |   4 +-
 drivers/mtd/nand/raw/tegra_nand.c             |  37 +-
 drivers/mtd/nand/raw/tmio_nand.c              |   2 +-
 drivers/mtd/nand/raw/txx9ndfmc.c              |   2 +-
 drivers/mtd/nand/raw/vf610_nfc.c              |   6 +-
 drivers/mtd/nand/raw/xway_nand.c              |   4 +-
 drivers/mtd/nand/spi/core.c                   |  12 +-
 drivers/mtd/nand/spi/macronix.c               |   7 +-
 drivers/mtd/nand/spi/toshiba.c                |   6 +-
 include/linux/mtd/nand.h                      | 188 +++++-
 include/linux/mtd/rawnand.h                   |  34 +-
 include/linux/platform_data/mtd-davinci.h     |   9 +-
 .../linux/platform_data/mtd-nand-s3c2410.h    |   2 +-
 93 files changed, 1315 insertions(+), 723 deletions(-)
 create mode 100644 drivers/mtd/nand/ecc.c

-- 
2.20.1

