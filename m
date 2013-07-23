From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: [PATCH v8 03/28] ARM: kirkwood: Move to ID based MBus window creation
Date: Tue, 23 Jul 2013 10:31:07 -0300
Message-ID: <1374586292-4941-4-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1374586292-4941-1-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1374586292-4941-1-git-send-email-ezequiel.garcia@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, valentin.longchamp@keymile.com, Grant Likely <grant.likely@secretlab.ca>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Maen Suleiman <maen@marvell.com>, Lior Amsalem <alior@marvell.com>, gerlando.falauto@keymile.com, Gregory Clement <gregory.clement@free-electrons.com>, Bjorn Helgaas <bhelgaas@google.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

With the introduction of the ID based MBus API, it's better
to switch to use it instead of the current name based scheme.

This will allow to deprecate the name based API, once every
user is removed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/arm/mach-kirkwood/common.c | 18 ++++++++++++++----
 arch/arm/mach-kirkwood/pcie.c   | 40 ++++++++++++++++++++++++----------------
 2 files changed, 38 insertions(+), 20 deletions(-)

diff --git a/arch/arm/mach-kirkwood/common.c b/arch/arm/mach-kirkwood/common.c
index e9238b5..165e751 100644
--- a/arch/arm/mach-kirkwood/common.c
+++ b/arch/arm/mach-kirkwood/common.c
@@ -37,6 +37,12 @@
 #include <linux/platform_data/dma-mv_xor.h>
 #include "common.h"
 
+/* These can go away once Kirkwood uses the mvebu-mbus DT binding */
+#define KIRKWOOD_MBUS_NAND_TARGET 0x01
+#define KIRKWOOD_MBUS_NAND_ATTR   0x2f
+#define KIRKWOOD_MBUS_SRAM_TARGET 0x03
+#define KIRKWOOD_MBUS_SRAM_ATTR   0x01
+
 /*****************************************************************************
  * I/O Address Mapping
  ****************************************************************************/
@@ -672,10 +678,14 @@ char * __init kirkwood_id(void)
 
 void __init kirkwood_setup_wins(void)
 {
-	mvebu_mbus_add_window("nand", KIRKWOOD_NAND_MEM_PHYS_BASE,
-			      KIRKWOOD_NAND_MEM_SIZE);
-	mvebu_mbus_add_window("sram", KIRKWOOD_SRAM_PHYS_BASE,
-			      KIRKWOOD_SRAM_SIZE);
+	mvebu_mbus_add_window_by_id(KIRKWOOD_MBUS_NAND_TARGET,
+				    KIRKWOOD_MBUS_NAND_ATTR,
+				    KIRKWOOD_NAND_MEM_PHYS_BASE,
+				    KIRKWOOD_NAND_MEM_SIZE);
+	mvebu_mbus_add_window_by_id(KIRKWOOD_MBUS_SRAM_TARGET,
+				    KIRKWOOD_MBUS_SRAM_ATTR,
+				    KIRKWOOD_SRAM_PHYS_BASE,
+				    KIRKWOOD_SRAM_SIZE);
 }
 
 void __init kirkwood_l2_init(void)
diff --git a/arch/arm/mach-kirkwood/pcie.c b/arch/arm/mach-kirkwood/pcie.c
index ddcb09f..12d86f3 100644
--- a/arch/arm/mach-kirkwood/pcie.c
+++ b/arch/arm/mach-kirkwood/pcie.c
@@ -20,6 +20,16 @@
 #include <mach/bridge-regs.h>
 #include "common.h"
 
+/* These can go away once Kirkwood uses the mvebu-mbus DT binding */
+#define KIRKWOOD_MBUS_PCIE0_MEM_TARGET    0x4
+#define KIRKWOOD_MBUS_PCIE0_MEM_ATTR      0xe8
+#define KIRKWOOD_MBUS_PCIE0_IO_TARGET     0x4
+#define KIRKWOOD_MBUS_PCIE0_IO_ATTR       0xe0
+#define KIRKWOOD_MBUS_PCIE1_MEM_TARGET    0x4
+#define KIRKWOOD_MBUS_PCIE1_MEM_ATTR      0xd8
+#define KIRKWOOD_MBUS_PCIE1_IO_TARGET     0x4
+#define KIRKWOOD_MBUS_PCIE1_IO_ATTR       0xd0
+
 static void kirkwood_enable_pcie_clk(const char *port)
 {
 	struct clk *clk;
@@ -254,26 +264,24 @@ static void __init add_pcie_port(int index, void __iomem *base)
 
 void __init kirkwood_pcie_init(unsigned int portmask)
 {
-	mvebu_mbus_add_window_remap_flags("pcie0.0",
+	mvebu_mbus_add_window_remap_by_id(KIRKWOOD_MBUS_PCIE0_IO_TARGET,
+					  KIRKWOOD_MBUS_PCIE0_IO_ATTR,
 					  KIRKWOOD_PCIE_IO_PHYS_BASE,
 					  KIRKWOOD_PCIE_IO_SIZE,
-					  KIRKWOOD_PCIE_IO_BUS_BASE,
-					  MVEBU_MBUS_PCI_IO);
-	mvebu_mbus_add_window_remap_flags("pcie0.0",
-					  KIRKWOOD_PCIE_MEM_PHYS_BASE,
-					  KIRKWOOD_PCIE_MEM_SIZE,
-					  MVEBU_MBUS_NO_REMAP,
-					  MVEBU_MBUS_PCI_MEM);
-	mvebu_mbus_add_window_remap_flags("pcie1.0",
+					  KIRKWOOD_PCIE_IO_BUS_BASE);
+	mvebu_mbus_add_window_by_id(KIRKWOOD_MBUS_PCIE0_MEM_TARGET,
+				    KIRKWOOD_MBUS_PCIE0_MEM_ATTR,
+				    KIRKWOOD_PCIE_MEM_PHYS_BASE,
+				    KIRKWOOD_PCIE_MEM_SIZE);
+	mvebu_mbus_add_window_remap_by_id(KIRKWOOD_MBUS_PCIE1_IO_TARGET,
+					  KIRKWOOD_MBUS_PCIE1_IO_ATTR,
 					  KIRKWOOD_PCIE1_IO_PHYS_BASE,
 					  KIRKWOOD_PCIE1_IO_SIZE,
-					  KIRKWOOD_PCIE1_IO_BUS_BASE,
-					  MVEBU_MBUS_PCI_IO);
-	mvebu_mbus_add_window_remap_flags("pcie1.0",
-					  KIRKWOOD_PCIE1_MEM_PHYS_BASE,
-					  KIRKWOOD_PCIE1_MEM_SIZE,
-					  MVEBU_MBUS_NO_REMAP,
-					  MVEBU_MBUS_PCI_MEM);
+					  KIRKWOOD_PCIE1_IO_BUS_BASE);
+	mvebu_mbus_add_window_by_id(KIRKWOOD_MBUS_PCIE1_MEM_TARGET,
+				    KIRKWOOD_MBUS_PCIE1_MEM_ATTR,
+				    KIRKWOOD_PCIE1_MEM_PHYS_BASE,
+				    KIRKWOOD_PCIE1_MEM_SIZE);
 
 	vga_base = KIRKWOOD_PCIE_MEM_PHYS_BASE;
 
-- 
1.8.1.5
