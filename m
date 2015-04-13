From: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
Subject: [PATCH v6 3/3] Documentation: nand: pl353: Add documentation for controller and driver
Date: Mon, 13 Apr 2015 21:42:30 +0530
Message-ID: <544594f9-4b4f-4efd-89f8-e2a21f853433@BL2FFO11OLC015.protection.gbl>
References: <1428941550-4620-1-git-send-email-punnaia@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1428941550-4620-1-git-send-email-punnaia@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net, michal.simek@xilinx.com, grant.likely@linaro.org, gregkh@linuxfoundation.org, jason@lakedaemon.net, ezequiel.garcia@free-electrons.com, arnd@arndb.de, dwmw2@infradead.org, computersforpeace@gmail.com, artem.bityutskiy@linux.intel.com, jussi.kivilinna@iki.fi, acourbot@nvidia.com, ivan.khoronzhuk@ti.com, joern@logfs.org
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, kpc528@gmail.com, kalluripunnaiahchoudary@gmail.com, Punnaiah Choudary Kalluri <punnaia@xilinx.com>
List-Id: devicetree@vger.kernel.org

Added notes about the controller and driver

Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
---
Changes in v6:
- None
Changes in v5:
- Fixed the review comments
Changes in v4:
- None
---
 Documentation/mtd/nand/pl353-nand.txt |   92 +++++++++++++++++++++++++++++++++
 1 files changed, 92 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/mtd/nand/pl353-nand.txt

diff --git a/Documentation/mtd/nand/pl353-nand.txt b/Documentation/mtd/nand/pl353-nand.txt
new file mode 100644
index 0000000..d91ad62
--- /dev/null
+++ b/Documentation/mtd/nand/pl353-nand.txt
@@ -0,0 +1,92 @@
+This documents provides some notes about the ARM pl353 smc controller used in
+Zynq SOC and confined to NAND specific details.
+
+Overview of the controller
+==========================
+	The SMC (PL353) supports two memory interfaces:
+	Interface 0 type SRAM.
+	Interface 1 type NAND.
+	This configuration supports the following configurable options:
+	   . 32-bit or 64-bit AXI data width
+	   . 8-bit, 16-bit, or 32-bit memory data width for interface 0
+	   . 8-bit, or 16-bit memory data width for interface 1
+	   . 1-4 chip selects on each interface
+	   . SLC ECC block for interface 1
+
+For more information, refer the below link for TRM
+http://infocenter.arm.com/help/topic/com.arm.doc.ddi0380g/
+DDI0380G_smc_pl350_series_r2p1_trm.pdf
+
+NAND memory accesses
+====================
+	. Two phase NAND accesses
+	. NAND command phase transfers
+	. NAND data phase transfers
+
+Two phase NAND accesses
+	The SMC defines two phases of commands when transferring data to or from
+NAND flash.
+
+Command phase
+	Commands and optional address information are written to the NAND flash.
+The command and address can be associated with either a data phase operation to
+write to or read from the array, or a status/ID register transfer.
+
+Data phase
+ Data is either written to or read from the NAND flash. This data can be either
+data transferred to or from the array, or status/ID register information.
+
+NAND AXI address setup
+       AXI address      Command phase      Data phase
+	[31:24]         Chip address       Chip address
+	[23]            NoOfAddCycles_2    Reserved
+	[22]            NoOfAddCycles_1    Reserved
+	[21]            NoOfAddCycles_0    ClearCS
+	[20]            End command valid  End command valid
+	[19]            0                  1
+	[18:11]         End command        End command
+	[10:3]          Start command      [10] ECC Last
+					   [9:3] Reserved
+	[2:0]           Reserved           Reserved
+
+ECC
+===
+    It operates on a number of 512 byte blocks of NAND memory and can be
+programmed to store the ECC codes after the data in memory. For writes,
+the ECC is written to the spare area of the page. For reads, the result of
+a block ECC check are made available to the device driver.
+
+------------------------------------------------------------------------
+|               n * 512 blocks                  | extra  | ecc    |     |
+|                                               | block  | codes  |     |
+------------------------------------------------------------------------
+
+The ECC calculation uses a simple Hamming code, using 1-bit correction 2-bit
+detection. It starts when a valid read or write command with a 512 byte aligned
+address is detected on the memory interface.
+
+Driver details
+==============
+	The NAND driver has dependency with the pl353_smc memory controller
+driver for intializing the nand timing parameters, bus width, ECC modes,
+control and status information.
+
+Since the controller expects that the chipselect bit should be cleared for the
+last data transfer i.e last 4 data bytes, the existing nandbase page
+read/write routines for soft ecc and ecc none modes will not work. So, inorder
+to make this driver work, it always updates the ecc mode as HW ECC and
+implemented the page read/write functions for supporting the SW ECC.
+
+HW ECC mode:
+	Upto 2K page size is supported and beyond that it retuns
+-ENOSUPPORT error. If the flsh has ONDIE ecc controller then the
+priority has given to the ONDIE ecc controller. Also the current
+implementation has support for upto 64 byte oob area
+
+SW ECC mode:
+	It supports all the pgae sizes. But since, zynq soc bootrom uses
+HW ECC for the devices that have pgae size <=2K so, to avoid any ecc related
+issues during boot, prefer HW ECC over SW ECC.
+
+For devicetree binding information please refer the below dt binding file
+Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
-- 
1.7.4
