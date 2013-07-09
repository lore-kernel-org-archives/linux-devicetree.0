From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v7 04/22] ARM: mv78xx0: Move to ID based window creation
Date: Tue,  9 Jul 2013 13:41:06 -0300
Message-ID: <1373388084-29520-5-git-send-email-ezequiel.garcia@free-electrons.com>
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
 arch/arm/mach-mv78xx0/pcie.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/arch/arm/mach-mv78xx0/pcie.c b/arch/arm/mach-mv78xx0/pcie.c
index dc26a65..397afde 100644
--- a/arch/arm/mach-mv78xx0/pcie.c
+++ b/arch/arm/mach-mv78xx0/pcie.c
@@ -18,6 +18,11 @@
 #include <mach/mv78xx0.h>
 #include "common.h"
 
+#define MV78XX0_MBUS_PCIE_MEM_TARGET(port,lane) ((port) ? 8 : 4)
+#define MV78XX0_MBUS_PCIE_MEM_ATTR(port,lane)   (0xf8 & ~(0x10 << (lane)))
+#define MV78XX0_MBUS_PCIE_IO_TARGET(port,lane)  ((port) ? 8 : 4)
+#define MV78XX0_MBUS_PCIE_IO_ATTR(port,lane)    (0xf0 & ~(0x10 << (lane)))
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
