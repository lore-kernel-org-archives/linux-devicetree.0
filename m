From: Ravi Shankar Jonnalagadda <venkata.ravi.jonnalagadda@xilinx.com>
Subject: [PATCH v2 2/5] PCI:xilinx-nwl: Correcting Styling checks
Date: Fri, 8 Sep 2017 17:53:04 +0530
Message-ID: <1504873388-29195-3-git-send-email-vjonnal@xilinx.com>
References: <1504873388-29195-1-git-send-email-vjonnal@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1504873388-29195-1-git-send-email-vjonnal@xilinx.com>
Sender: linux-pci-owner@vger.kernel.org
To: vinod.koul@intel.com, robh+dt@kernel.org, mark.rutland@arm.com, michal.simek@xilinx.com, soren.brinkmann@xilinx.com, dan.j.williams@intel.com, bhelgaas@google.com, vjonnal@xilinx.com, lorenzo.pieralisi@arm.com, bharat.kumar.gogada@xilinx.com, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, rgummal@xilinx.com
List-Id: devicetree@vger.kernel.org

Correcting Style checks thrown by checkpatch scripts

Signed-off-by: Ravi Shankar Jonnalagadda <vjonnal@xilinx.com>
Signed-off-by: RaviKiran Gummaluri <rgummal@xilinx.com>
---
 drivers/pci/host/pcie-xilinx-nwl.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/host/pcie-xilinx-nwl.c b/drivers/pci/host/pcie-xilinx-nwl.c
index 5766582..3c62e3d 100644
--- a/drivers/pci/host/pcie-xilinx-nwl.c
+++ b/drivers/pci/host/pcie-xilinx-nwl.c
@@ -506,15 +506,15 @@ static int nwl_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
 
 	for (i = 0; i < nr_irqs; i++) {
 		irq_domain_set_info(domain, virq + i, bit + i, &nwl_irq_chip,
-				domain->host_data, handle_simple_irq,
-				NULL, NULL);
+				    domain->host_data, handle_simple_irq,
+				    NULL, NULL);
 	}
 	mutex_unlock(&msi->lock);
 	return 0;
 }
 
 static void nwl_irq_domain_free(struct irq_domain *domain, unsigned int virq,
-					unsigned int nr_irqs)
+				unsigned int nr_irqs)
 {
 	struct irq_data *data = irq_domain_get_irq_data(domain, virq);
 	struct nwl_pcie *pcie = irq_data_get_irq_chip_data(data);
@@ -767,7 +767,6 @@ static int nwl_pcie_bridge_init(struct nwl_pcie *pcie)
 	/* Enable all misc interrupts */
 	nwl_bridge_writel(pcie, MSGF_MISC_SR_MASKALL, MSGF_MISC_MASK);
 
-
 	/* Disable all legacy interrupts */
 	nwl_bridge_writel(pcie, (u32)~MSGF_LEG_SR_MASKALL, MSGF_LEG_MASK);
 
@@ -932,4 +931,5 @@ static struct platform_driver nwl_pcie_driver = {
 	},
 	.probe = nwl_pcie_probe,
 };
+
 builtin_platform_driver(nwl_pcie_driver);
-- 
2.7.4
