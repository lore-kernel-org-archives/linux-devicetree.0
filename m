From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Subject: [PATCHv3 4/5] PCI: dwc: fix 4GiB outbound window size truncated to
 zero issue
Date: Tue, 18 Dec 2018 04:19:43 +0000
Message-ID: <20181218041956.41809-5-Zhiqiang.Hou@nxp.com>
References: <20181218041956.41809-1-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181218041956.41809-1-Zhiqiang.Hou@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>, Leo Li <leoyang.li@nxp.com>
Cc: Roy Zang <roy.zang@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>, "Z.q. Hou" <zhiqiang.hou@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>

The current type of mem_size is 'u32', so when resource_size()
return 4G it will be truncated to zero. This patch fix it by
changing its type to 'u64'.

Fixes: 340cba6092c2 ("pci: Add PCIe driver for Samsung Exynos")
Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Acked-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
---
V3:
 - No change=20

 drivers/pci/controller/dwc/pcie-designware.c | 4 ++--
 drivers/pci/controller/dwc/pcie-designware.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/con=
troller/dwc/pcie-designware.c
index 2153956a0b20..7ac5989c23ef 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -106,7 +106,7 @@ static void dw_pcie_writel_ob_unroll(struct dw_pcie *pc=
i, u32 index, u32 reg,
=20
 static void dw_pcie_prog_outbound_atu_unroll(struct dw_pcie *pci, int inde=
x,
 					     int type, u64 cpu_addr,
-					     u64 pci_addr, u32 size)
+					     u64 pci_addr, u64 size)
 {
 	u32 retries, val;
=20
@@ -141,7 +141,7 @@ static void dw_pcie_prog_outbound_atu_unroll(struct dw_=
pcie *pci, int index,
 }
=20
 void dw_pcie_prog_outbound_atu(struct dw_pcie *pci, int index, int type,
-			       u64 cpu_addr, u64 pci_addr, u32 size)
+			       u64 cpu_addr, u64 pci_addr, u64 size)
 {
 	u32 retries, val;
=20
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/con=
troller/dwc/pcie-designware.h
index 0989d880ac46..25604387d13e 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -157,7 +157,7 @@ struct pcie_port {
 	u32			io_size;
 	u64			mem_base;
 	phys_addr_t		mem_bus_addr;
-	u32			mem_size;
+	u64			mem_size;
 	struct resource		*cfg;
 	struct resource		*io;
 	struct resource		*mem;
@@ -242,7 +242,7 @@ int dw_pcie_link_up(struct dw_pcie *pci);
 int dw_pcie_wait_for_link(struct dw_pcie *pci);
 void dw_pcie_prog_outbound_atu(struct dw_pcie *pci, int index,
 			       int type, u64 cpu_addr, u64 pci_addr,
-			       u32 size);
+			       u64 size);
 int dw_pcie_prog_inbound_atu(struct dw_pcie *pci, int index, int bar,
 			     u64 cpu_addr, enum dw_pcie_as_type as_type);
 void dw_pcie_disable_atu(struct dw_pcie *pci, int index,
--=20
2.17.1
