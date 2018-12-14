From: Christophe Kerello <christophe.kerello@st.com>
Subject: [PATCH v4 0/3] mtd: rawnand: add STM32 FMC2 NAND flash controller driver
Date: Fri, 14 Dec 2018 10:58:05 +0100
Message-ID: <1544781488-18723-1-git-send-email-christophe.kerello@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: boris.brezillon@bootlin.com, miquel.raynal@bootlin.com, richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, Christophe Kerello <christophe.kerello@st.com>
List-Id: devicetree@vger.kernel.org

This patchset adds the support for the STMicroelectronics FMC2 NAND flash
controller found on STM32MP SOCs.

This patchset supports:
  - the command sequencer feature, a hardware accelerator for read/write
    within a page
  - the manual mode feature, useful for debug purpose
  - a maximum 8k page size
  - following ECC strength and step size
	- nand-ecc-strength = <8>, nand-ecc-step-size = <512> (BCH8)
	- nand-ecc-strength = <4>, nand-ecc-step-size = <512> (BCH4)
	- nand-ecc-strength = <1>, nand-ecc-step-size = <512> (Extended
	  ecc based on HAMMING)
    
This patchset has been tested on Micron MT29F8G08ABACAH4 (8-bit SLC NAND)
and MT29F8G16ABACAH4 (16-bit SLC NAND)

Changes v4:
 - rebase on nand/next
 - replace "manual mode" by "polling mode"

Changes v3:
 - modify clocks property description
 - add NAND reg property description
 - stm32_fmc2_nfc inherits from nand_controller structure
 - rewrite stm32_fmc2_read_data/stm32_fmc2_write_data functions
   to handle aligned and not aligned buffers
 - replace uint8_t by u8
 - use of NAND_ROW_ADDR_3 option

Changes v2:
 - separate the controller structure and the NAND chip structure
 - remove timings description from the device tree
 - fix typo issues
 - fix kbuildrobot issues

Christophe Kerello (3):
  dt-bindings: mtd: stm32_fmc2: add STM32 FMC2 NAND controller
    documentation
  mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND flash controller driver
  mtd: rawnand: stm32_fmc2: add polling mode

 .../devicetree/bindings/mtd/stm32-fmc2-nand.txt    |   61 +
 drivers/mtd/nand/raw/Kconfig                       |    9 +
 drivers/mtd/nand/raw/Makefile                      |    1 +
 drivers/mtd/nand/raw/stm32_fmc2_nand.c             | 2073 ++++++++++++++++++++
 4 files changed, 2144 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/stm32-fmc2-nand.txt
 create mode 100644 drivers/mtd/nand/raw/stm32_fmc2_nand.c

-- 
1.9.1
