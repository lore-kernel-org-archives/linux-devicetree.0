From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v7 03/22] ARM: kirkwood: Move to ID based MBus window creation
Date: Tue,  9 Jul 2013 13:41:05 -0300
Message-ID: <1373388084-29520-4-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1373388084-29520-1-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1373388084-29520-1-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

With the introduction of the ID based MBus API, it's better
to switch to use it instead of the current name based scheme.

This will allow to deprecate the name based API, once every
user is removed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
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
