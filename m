From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v7 06/22] ARM: dove: Move to ID based window creation
Date: Tue,  9 Jul 2013 13:41:08 -0300
Message-ID: <1373388084-29520-7-git-send-email-ezequiel.garcia@free-electrons.com>
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
 arch/arm/mach-dove/common.c | 68 ++++++++++++++++++++++++++++++---------------
 1 file changed, 45 insertions(+), 23 deletions(-)

diff --git a/arch/arm/mach-dove/common.c b/arch/arm/mach-dove/common.c
index 00247c7..bc22056 100644
--- a/arch/arm/mach-dove/common.c
+++ b/arch/arm/mach-dove/common.c
@@ -27,6 +27,22 @@
 #include <plat/time.h>
 #include "common.h"
 
+/* These can go away once Dove uses the mvebu-mbus DT binding */
+#define DOVE_MBUS_PCIE0_MEM_TARGET    0x4
+#define DOVE_MBUS_PCIE0_MEM_ATTR      0xe8
+#define DOVE_MBUS_PCIE0_IO_TARGET     0x4
+#define DOVE_MBUS_PCIE0_IO_ATTR       0xe0
+#define DOVE_MBUS_PCIE1_MEM_TARGET    0x8
+#define DOVE_MBUS_PCIE1_MEM_ATTR      0xe8
+#define DOVE_MBUS_PCIE1_IO_TARGET     0x8
+#define DOVE_MBUS_PCIE1_IO_ATTR       0xe0
+#define DOVE_MBUS_CESA_TARGET         0x3
+#define DOVE_MBUS_CESA_ATTR           0x1
+#define DOVE_MBUS_BOOTROM_TARGET      0x1
+#define DOVE_MBUS_BOOTROM_ATTR        0xfd
+#define DOVE_MBUS_SCRATCHPAD_TARGET   0xd
+#define DOVE_MBUS_SCRATCHPAD_ATTR     0x0
+
 /*****************************************************************************
  * I/O Address Mapping
  ****************************************************************************/
@@ -332,34 +348,40 @@ void __init dove_setup_cpu_wins(void)
 {
 	/*
 	 * The PCIe windows will no longer be statically allocated
-	 * here once Dove is migrated to the pci-mvebu driver.
+	 * here once Dove is migrated to the pci-mvebu driver. The
+	 * non-PCIe windows will no longer be created here once Dove
+	 * fully moves to DT.
 	 */
-	mvebu_mbus_add_window_remap_flags("pcie0.0",
+	mvebu_mbus_add_window_remap_by_id(DOVE_MBUS_PCIE0_IO_TARGET,
+					  DOVE_MBUS_PCIE0_IO_ATTR,
 					  DOVE_PCIE0_IO_PHYS_BASE,
 					  DOVE_PCIE0_IO_SIZE,
-					  DOVE_PCIE0_IO_BUS_BASE,
-					  MVEBU_MBUS_PCI_IO);
-	mvebu_mbus_add_window_remap_flags("pcie1.0",
+					  DOVE_PCIE0_IO_BUS_BASE);
+	mvebu_mbus_add_window_remap_by_id(DOVE_MBUS_PCIE1_IO_TARGET,
+					  DOVE_MBUS_PCIE1_IO_ATTR,
 					  DOVE_PCIE1_IO_PHYS_BASE,
 					  DOVE_PCIE1_IO_SIZE,
-					  DOVE_PCIE1_IO_BUS_BASE,
-					  MVEBU_MBUS_PCI_IO);
-	mvebu_mbus_add_window_remap_flags("pcie0.0",
-					  DOVE_PCIE0_MEM_PHYS_BASE,
-					  DOVE_PCIE0_MEM_SIZE,
-					  MVEBU_MBUS_NO_REMAP,
-					  MVEBU_MBUS_PCI_MEM);
-	mvebu_mbus_add_window_remap_flags("pcie1.0",
-					  DOVE_PCIE1_MEM_PHYS_BASE,
-					  DOVE_PCIE1_MEM_SIZE,
-					  MVEBU_MBUS_NO_REMAP,
-					  MVEBU_MBUS_PCI_MEM);
-	mvebu_mbus_add_window("cesa", DOVE_CESA_PHYS_BASE,
-			      DOVE_CESA_SIZE);
-	mvebu_mbus_add_window("bootrom", DOVE_BOOTROM_PHYS_BASE,
-			      DOVE_BOOTROM_SIZE);
-	mvebu_mbus_add_window("scratchpad", DOVE_SCRATCHPAD_PHYS_BASE,
-			      DOVE_SCRATCHPAD_SIZE);
+					  DOVE_PCIE1_IO_BUS_BASE);
+	mvebu_mbus_add_window_by_id(DOVE_MBUS_PCIE0_MEM_TARGET,
+				    DOVE_MBUS_PCIE0_MEM_ATTR,
+				    DOVE_PCIE0_MEM_PHYS_BASE,
+				    DOVE_PCIE0_MEM_SIZE);
+	mvebu_mbus_add_window_by_id(DOVE_MBUS_PCIE1_MEM_TARGET,
+				    DOVE_MBUS_PCIE1_MEM_ATTR,
+				    DOVE_PCIE1_MEM_PHYS_BASE,
+				    DOVE_PCIE1_MEM_SIZE);
+	mvebu_mbus_add_window_by_id(DOVE_MBUS_CESA_TARGET,
+				    DOVE_MBUS_CESA_ATTR,
+				    DOVE_CESA_PHYS_BASE,
+				    DOVE_CESA_SIZE);
+	mvebu_mbus_add_window_by_id(DOVE_MBUS_BOOTROM_TARGET,
+				    DOVE_MBUS_BOOTROM_ATTR,
+				    DOVE_BOOTROM_PHYS_BASE,
+				    DOVE_BOOTROM_SIZE);
+	mvebu_mbus_add_window_by_id(DOVE_MBUS_SCRATCHPAD_TARGET,
+				    DOVE_MBUS_SCRATCHPAD_ATTR,
+				    DOVE_SCRATCHPAD_PHYS_BASE,
+				    DOVE_SCRATCHPAD_SIZE);
 }
 
 void __init dove_init(void)
-- 
1.8.1.5
