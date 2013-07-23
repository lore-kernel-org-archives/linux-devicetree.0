From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: [PATCH v8 04/28] ARM: mv78xx0: Move to ID based window creation
Date: Tue, 23 Jul 2013 10:31:08 -0300
Message-ID: <1374586292-4941-5-git-send-email-ezequiel.garcia@free-electrons.com>
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
 arch/arm/mach-mv78xx0/pcie.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/arch/arm/mach-mv78xx0/pcie.c b/arch/arm/mach-mv78xx0/pcie.c
index dc26a65..397afde 100644
--- a/arch/arm/mach-mv78xx0/pcie.c
+++ b/arch/arm/mach-mv78xx0/pcie.c
@@ -18,6 +18,11 @@
 #include <mach/mv78xx0.h>
 #include "common.h"
 
+#define MV78XX0_MBUS_PCIE_MEM_TARGET(port, lane) ((port) ? 8 : 4)
+#define MV78XX0_MBUS_PCIE_MEM_ATTR(port, lane)   (0xf8 & ~(0x10 << (lane)))
+#define MV78XX0_MBUS_PCIE_IO_TARGET(port, lane)  ((port) ? 8 : 4)
+#define MV78XX0_MBUS_PCIE_IO_ATTR(port, lane)    (0xf0 & ~(0x10 << (lane)))
+
 struct pcie_port {
 	u8			maj;
 	u8			min;
@@ -71,7 +76,6 @@ static void __init mv78xx0_pcie_preinit(void)
 	start = MV78XX0_PCIE_MEM_PHYS_BASE;
 	for (i = 0; i < num_pcie_ports; i++) {
 		struct pcie_port *pp = pcie_port + i;
-		char winname[MVEBU_MBUS_MAX_WINNAME_SZ];
 
 		snprintf(pp->mem_space_name, sizeof(pp->mem_space_name),
 			"PCIe %d.%d MEM", pp->maj, pp->min);
@@ -85,17 +89,12 @@ static void __init mv78xx0_pcie_preinit(void)
 		if (request_resource(&iomem_resource, &pp->res))
 			panic("can't allocate PCIe MEM sub-space");
 
-		snprintf(winname, sizeof(winname), "pcie%d.%d",
-			 pp->maj, pp->min);
-
-		mvebu_mbus_add_window_remap_flags(winname,
-						  pp->res.start,
-						  resource_size(&pp->res),
-						  MVEBU_MBUS_NO_REMAP,
-						  MVEBU_MBUS_PCI_MEM);
-		mvebu_mbus_add_window_remap_flags(winname,
-						  i * SZ_64K, SZ_64K,
-						  0, MVEBU_MBUS_PCI_IO);
+		mvebu_mbus_add_window_by_id(MV78XX0_MBUS_PCIE_MEM_TARGET(pp->maj, pp->min),
+					    MV78XX0_MBUS_PCIE_MEM_ATTR(pp->maj, pp->min),
+					    pp->res.start, resource_size(&pp->res));
+		mvebu_mbus_add_window_remap_by_id(MV78XX0_MBUS_PCIE_IO_TARGET(pp->maj, pp->min),
+						  MV78XX0_MBUS_PCIE_IO_ATTR(pp->maj, pp->min),
+						  i * SZ_64K, SZ_64K, 0);
 	}
 }
 
-- 
1.8.1.5
