From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Subject: [PATCHv6 15/28] PCI: mobiveil: Revise the MEM/IO outbound window initialization
Date: Fri,  5 Jul 2019 17:56:43 +0800
Message-ID: <20190705095656.19191-16-Zhiqiang.Hou@nxp.com>
References: <20190705095656.19191-1-Zhiqiang.Hou@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190705095656.19191-1-Zhiqiang.Hou@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, l.subrahmanya@mobiveil.co.in, shawnguo@kernel.org, leoyang.li@nxp.com, lorenzo.pieralisi@arm.com, catalin.marinas@arm.com, will.deacon@arm.com
Cc: Mingkai.Hu@nxp.com, Minghuan.Lian@nxp.com, Xiaowei.Bao@nxp.com, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
List-Id: devicetree@vger.kernel.org

Move the resource type check into a if..else block, and only
set up outbound window for MEM and IO resource. No functional
change.

Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Reviewed-by: Minghuan Lian <Minghuan.Lian@nxp.com>
---
V6:
 - Splited from #2 of v5 patches, no functional change.

 drivers/pci/controller/pcie-mobiveil.c |   20 ++++++++++----------
 1 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/pci/controller/pcie-mobiveil.c b/drivers/pci/controller/pcie-mobiveil.c
index 906299b..965f89a 100644
--- a/drivers/pci/controller/pcie-mobiveil.c
+++ b/drivers/pci/controller/pcie-mobiveil.c
@@ -565,7 +565,7 @@ static void mobiveil_pcie_enable_msi(struct mobiveil_pcie *pcie)
 
 static int mobiveil_host_init(struct mobiveil_pcie *pcie)
 {
-	u32 value, pab_ctrl, type = 0;
+	u32 value, pab_ctrl, type;
 	struct resource_entry *win;
 
 	/* setup bus numbers */
@@ -617,18 +617,18 @@ static int mobiveil_host_init(struct mobiveil_pcie *pcie)
 
 	/* Get the I/O and memory ranges from DT */
 	resource_list_for_each_entry(win, &pcie->resources) {
-		type = 0;
 		if (resource_type(win->res) == IORESOURCE_MEM)
 			type = MEM_WINDOW_TYPE;
-		if (resource_type(win->res) == IORESOURCE_IO)
+		else if (resource_type(win->res) == IORESOURCE_IO)
 			type = IO_WINDOW_TYPE;
-		if (type) {
-			/* configure outbound translation window */
-			program_ob_windows(pcie, pcie->ob_wins_configured,
-					   win->res->start,
-					   win->res->start - win->offset,
-					   type, resource_size(win->res));
-		}
+		else
+			continue;
+
+		/* configure outbound translation window */
+		program_ob_windows(pcie, pcie->ob_wins_configured,
+				   win->res->start,
+				   win->res->start - win->offset,
+				   type, resource_size(win->res));
 	}
 
 	/* fixup for PCIe class register */
-- 
1.7.1
